<?php

	// las actualizaciones son cada 4 hrs
	//error_reporting(0);
	set_time_limit(0);
	require_once "XML/RSS.php";
	require_once dirname(dirname(__FILE__))."/class/DB.php";
	require_once dirname(dirname(__FILE__))."/includes/functions.php";
		
	$regexp_politicos = "/".implode("|", $politicos)."/";	
	$info_rss = array();
	$total_titulares = 0;
	
	foreach ($rss_url as $rss) {
		$rss = new XML_RSS($rss);
		$rss->parse();
		
		foreach ($rss->getItems() as $item) {
			$title = strtolower($item['title']);
			$description = (isset($item['description']))? strtolower($item['description']): strtolower($item['title']);
			
			if (preg_match($regexp_politicos, $title . $description, $matches)) {
				$index = array_pop($matches);
				$item['nombre'] = $index;
				$item['description'] = $description;
				$info_rss[$index][] = $item;
			}
			$total_titulares++;
		}
	}
	
	// ordenamos segun cantidad de titulares de mayor a menor
	$count = array();
	foreach ($info_rss as $key => $val) {
		$count[$key] = sizeof($val);
	}
	arsort($count);
	$keys = array_keys($count);
	$nombre = $keys[0];
	
	// instancia clase DB
	$db = new DB();
	
	// guardamos politicos inexistentes
	$sql = "select * from politicos";
	$stmt = $db->prepare($sql);
	$stmt->execute();
	$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
	
	$politicos_db = array();
	foreach ($res as $row) {
		$politicos_db[$row['poli_nombre']] = array('id' => $row['poli_id'], 'nombre' => $row['poli_nombre']);
	}
	
	if (!in_array($nombre, array_keys($politicos_db))) {
		$sql = "select coalesce(max(poli_id), 0)+1 as id from politicos";
		$stmt = $db->prepare($sql);
		$stmt->execute();
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		$poli_id = $row['id'];
	
		$sql = "insert
				into politicos
					(poli_id, poli_nombre)
				values
					(".$poli_id.", '".$nombre."')";
		$stmt = $db->prepare($sql);
		$stmt->execute();
	} else {
		$poli_id = $politicos_db[$nombre]['id'];
	}
	
	// guardamos proceso
	$sql = "select coalesce(max(proc_id), 0)+1 as id from procesos";
	$stmt = $db->prepare($sql);
	$stmt->execute();
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
	$proc_id = $row['id'];
	
	list ($init_fecha, $end_fecha) = getRangos(date("Y-m-d H:i:s"));
	$sql = "insert
			into procesos 
				(proc_id, proc_desde, proc_hasta, poli_id, proc_total_titulares)
			values
				(".$proc_id.", '".$init_fecha."', '".$end_fecha."', ".$poli_id.", ".$total_titulares.")";
	$stmt = $db->prepare($sql);
	
	if (!$stmt->execute()) {
		print_r($stmt->errorInfo());
	}
	
	// guardamos titulares
	$values = array();
	$cron_date = date("Y-m-d H:i:s");
	$i = 1;
	foreach ($info_rss[$nombre] as $titu) {
		$max = "select coalesce(max(titu_id), 0)+".$i." as id from titulares";
		$titu['pubdate'] = date("Y-m-d H:i:s", strtotime($titu['pubdate']));
		$values[] =  "((".$max."), ".$proc_id.", '".addslashes($titu['title'])."', '".addslashes($titu['description'])."', '".$titu['link']."', '".$titu['pubdate']."', '".$cron_date."')";
		$i++;
	}
	
	$sql = "insert
			into titulares
				(titu_id, proc_id, titu_titulo, titu_contenido, titu_link, titu_post_fecha, titu_fecha)
			values
				".implode(", ", $values);
	$stmt = $db->prepare($sql);
	
	if (!$stmt->execute()) {
		print_r($stmt->errorInfo());
	}
	
	// array info
	$index_info = array(
		'info' => array(
			'proc_id' => $proc_id,
			'nombre'  => $nombre,
			'total_titulares' => $total_titulares
		),
		'titulares' => $info_rss[$nombre]
	);
	
	// guardamos en Memcache
	$memcache = new Memcache();
	$memcache->connect($memcache_host, $memcache_port);
	$memcache->set("index_info", $index_info, MEMCACHE_COMPRESSED, $memcache_expire);
	$memcache->close();
	
?>