<?php

	// las actualizaciones son cada 4 hrs
	//error_reporting(0);
	set_time_limit(0);
	require_once "XML/RSS.php";
	require_once dirname(dirname(__FILE__))."/config/config.php";
	require_once dirname(dirname(__FILE__))."/class/DB.php";
	require_once dirname(dirname(__FILE__))."/class/Politico.php";
	require_once dirname(dirname(__FILE__))."/class/Fuente.php";
	require_once dirname(dirname(__FILE__))."/class/MemcacheClient.php";
	require_once dirname(dirname(__FILE__))."/includes/functions.php";
	
	// constructores
	$db = new DB();
	$poli = new Politico();
	$fuen = new Fuente();
	
	// inicio transacción
	$db->beginTransaction();
	
	// guardamos proceso
	$sql = "select coalesce(max(proc_id), 0)+1 as id from procesos";
	$stmt = $db->prepare($sql);
	$stmt->execute();
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	$proc_id = $row['id'];
	
	list ($init_fecha, $end_fecha) = getRangos(date("Y-m-d H:i:s"));
	$sql = "insert
			into procesos 
				(proc_id, proc_desde, proc_hasta)
			values
				(".$proc_id.", '".$init_fecha."', '".$end_fecha."')";
				
	if (!$db->exec($sql)) {
		$db->rollback();
		print_r($stmt->errorInfo());
	}
	
	// sacamos los políticos de la BD
	$politicos = $poli->getPoliticos();
	
	foreach ($politicos as $row) {
		$poli_list[] = strtolower($row['poli_nombre']);
	}
	
	// regexp
	$regexp_politicos = "/".implode("|", $poli_list)."/";	
	$info_rss = array();
	
	// busqueda de los políticos en los titulares de las fuentes
	// generamos estadísticas y titulares también
	$fuentes = $fuen->getfuentes();
	$estadisticas = array();
	$titulares = array();
	
	foreach ($fuentes as $row) {
		$rss_url = $row['fuen_url'];
		$rss_fuente = $row['fuen_id'];
	
		$rss = new XML_RSS($rss_url);
		$rss->parse();
		
		foreach ($rss->getItems() as $item) {
			$title = strtolower($item['title']);
			$description = (isset($item['description']))? strtolower($item['description']): strtolower($item['title']);
			
			if (preg_match($regexp_politicos, $title . $description, $matches)) {
				$index = array_pop($matches);
				
				// datos de frecuencia
				$poli_id = $poli->getPoliId($index);
				if (!isset($estadisticas[$rss_fuente][$poli_id])) {
					$estadisticas[$rss_fuente][$poli_id] = 1;
				} else {
					$estadisticas[$rss_fuente][$poli_id] = $estadisticas[$rss_fuente][$poli_id]+1;
				}
				
				// armamos estructura
				$titulares[$poli_id]['poli_id'] = $poli_id;
				$titulares[$poli_id]['proc_id'] = $proc_id;
				$titulares[$poli_id]['fuen_id'] = $rss_fuente;
				$titulares[$poli_id]['poli_nombre'] = $index;
				$item['description'] = $description;
				$titulares[$poli_id]['titulares'][] = $item;
			}
		}
	}
	
	// guardamos estadísticas
	$sql = "insert into estadisticas (proc_id, poli_id, fuen_id, esta_cant_titulares) values ";
	$values = array();
	
	foreach ($estadisticas as $fuen_id => $info) {
		foreach ($info as $poli_id => $cant_titulares) {
			$values[] = sprintf("(%d, %d, %d, %d)", $proc_id, $poli_id, $fuen_id, $cant_titulares);
		}
	}
	$sql .= implode(", ", $values);
	
	if (!$db->exec($sql)) {
		$db->rollback();
		print_r($stmt->errorInfo());
	}
	
	// guardamos titulares
	$sql = "insert
			into titulares
				(titu_id, proc_id, fuen_id, titu_titulo, titu_contenido, titu_link, titu_post_fecha, poli_id)
			values ";
	
	$i = 1;
	$values = array();
	foreach ($titulares as $row) {
		$poli_id = $row['poli_id'];
		$fuen_id = $row['fuen_id'];
		
		foreach ($row['titulares'] as $titu) {
			$max = "select coalesce(max(titu_id), 0)+".$i." as id from titulares";
			
			//echo $titu['pubdate']."\n";
			
			$titu['pubdate'] = date("Y-m-d H:i:s", strtotime($titu['pubdate']));
			
			$values[] =  "((".$max."), ".$proc_id.", ".$fuen_id.", '".addslashes($titu['title'])."', '".addslashes($titu['description'])."', '".$titu['link']."', '".$titu['pubdate']."', ".$poli_id.")";
			$i++;
		}
	
	}
	
	$sql .= implode(", ", $values);
	
	if (!$db->exec($sql)) {
		print_r($stmt->errorInfo());
		$db->rollback();
	}
	
	// ordenamos segun cantidad de titulares de mayor a menor
	$order = array();
	foreach ($titulares as $row) {
		$order[$row['poli_id']] = sizeof($row['titulares']);
		
	}
	arsort($order);
	
	// sacamos lugares
	$keys = array_keys($order);
	
	// guardamos lugares
	$sql = "insert into lugares (proc_id, poli_id, luga_lugar) values ";
	$values = array();
	$lugar = 1;
	foreach ($keys as $poli_id) {
		$values[] = "(".$proc_id.", ".$poli_id.", ".$lugar.")";
		$lugar++;
	}
	
	$sql .= implode(", ", $values);
	
	if (!$db->exec($sql)) {
		print_r($stmt->errorInfo());
		$db->rollback();
	}
	
	// commit!
	$db->commit();
	
	// primer lugar
	$_1er_lugar = $titulares[$keys[0]];
	
	// segundo lugar
	$_2do_lugar = $titulares[$keys[1]];
	
	// tercer lugar
	$_3er_lugar = $titulares[$keys[2]];
	
	// guardamos en Memcache
	$mc = new MemcacheClient();
	$mc->set("index_info_1", $_1er_lugar, MEMCACHE_COMPRESSED, $memcache_expire);
	$mc->set("index_info_2", $_2do_lugar, MEMCACHE_COMPRESSED, $memcache_expire);
	$mc->set("index_info_3", $_3er_lugar, MEMCACHE_COMPRESSED, $memcache_expire);
	$mc->close();
	
?>