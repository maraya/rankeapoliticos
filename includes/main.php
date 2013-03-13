<?php
	require_once dirname(dirname(__FILE__))."/config/config.php";
	require_once dirname(dirname(__FILE__))."/class/DB.php";
	require_once dirname(dirname(__FILE__))."/class/Main.php";
	require_once dirname(dirname(__FILE__))."/class/Rank.php";
	require_once dirname(dirname(__FILE__))."/class/MemcacheClient.php";
	require_once dirname(dirname(__FILE__))."/includes/functions.php";
	require_once dirname(dirname(__FILE__))."/includes/session.php";
	
	// Inicio
	$lugar = isset($_GET['__lugar'])? htmlentities($_GET['__lugar']): null;
	$main = new Main();
	$rank = new Rank();
	
	if (isset($_GET['__fecha']) && isset($_GET['__hora'])) {
		$fecha = $_GET['__fecha'];
		$hora = $_GET['__hora'];
		
		$date = DateTime::createFromFormat("d-m-Y H:i:s", $fecha." ".$hora.":00");
		list ($init_fecha, $end_fecha) = getRangos($date->format("Y-m-d H:i:s"));
		
		$index_info = $main->getIndexInfo($init_fecha, $lugar);
		$lateral_info = $main->getLateralInfo($init_fecha);
		$rank_notas = $rank->getRankNotas($init_fecha);
		$rank_resumen = $rank->getRankResumen(5);
		
	} else {
		list ($init_fecha, $end_fecha) = getRangos(date("Y-m-d H:i:s"));
		
		$memcache = new MemcacheClient();
		$index_info = $memcache->getIndexInfo("index_info", $lugar);
		$lateral_info = $memcache->get("info_lateral");
		$memcache->close();
		
		$rank_notas = $rank->getRankNotas($init_fecha);
		$rank_resumen = $rank->getRankResumen(5);
	}
	
	if (!is_array($index_info)) {
		header("Location: /nada");
		exit;
	}
	
	$titulares = $index_info['titulares'];
	$poli_nombre = ucwords($index_info['poli_nombre']);
	$proc_id = $index_info['proc_id'];
	$poli_id = $index_info['poli_id'];
?>

<div id="fb-root"></div>

<div class="ganador">
	<h2>Para el día <?php echo date("d-m-Y", strtotime($init_fecha)); ?> (entre las <?php echo date("H:i", strtotime($init_fecha)); ?> y las <?php echo date("H:i", strtotime($end_fecha)); ?>)</h2>
	<?php
		if ($lugar == null || $lugar == 1) {
			$gtext = "ganador";
		} else if ($lugar == 2) {
			$gtext = "2do lugar";
		} else if ($lugar == 3) {
			$gtext = "3er lugar";
		}
	?>
	
	<h2>El <?php echo $gtext; ?> es:</h2>
	<h1><?php echo $poli_nombre; ?></h1>
	
	<?php
		$_2do_lugar = ucwords($lateral_info[1]['poli_nombre']);
		$_3er_lugar = ucwords($lateral_info[2]['poli_nombre']);
	?>
	
	<p><a class="btn btn-primary" href="/2"><i class="icon-flag icon-white"></i> <strong><?php echo $_2do_lugar; ?> (2do lugar)</strong></a> <a class="btn btn-primary" href="/3"><i class="icon-flag icon-white"></i> <strong><?php echo $_3er_lugar; ?> (3er lugar)</strong></a></p>
</div>

<div class="row-fluid main_content">
	<div class="span12">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Titular</th>
					<th>Fuente</th>
				</tr>
			</thead>
			<tbody>
				<?php
					foreach ($titulares as $row) {
						echo "<tr>";
						echo "	<td><a href=\"".$row['link']."\" target=\"_blank\">".$row['title']."</a></td>\n";
						echo "  <td>".$row['fuen_desc']."</td>";
						echo "</tr>";
					}	
				?>
			</tbody>
		</table>
	</div>
	
	<div class="row-fluid">
		<div class="span4">
			<h4>Ranking titulares</h4>
			<?php
				$row_count = 0;
				foreach ($lateral_info as $row) {
					if ($row_count == 0) { $lugar_label = "1er lugar"; }
					elseif ($row_count == 1) { $lugar_label = "2do lugar"; }
					elseif ($row_count == 2) { $lugar_label = "3er lugar"; }
			?>
				<h5><?php echo $lugar_label; ?>: <?php echo ucwords($row['poli_nombre']); ?></h5>
	
				<span class="rank_stars">
					<form>
						<p>Rankear: 
						<?php
							for ($i=1; $i<=7; $i++) {
								echo "<a href=\"javascript:;\" rel=\"".$i."\"><i title=\"".$i."\" class=\"icon-star\"></i></a>";
							}
						?>
							<span class="tooltip_msg" data-placement="right" title=""></span>
						</p>
						<input type="hidden" class="session_id" value="<?php echo $_SESSION['session_id']; ?>" />
						<input type="hidden" class="proc_id" value="<?php echo $row['proc_id']; ?>" />
						<input type="hidden" class="poli_id" value="<?php echo $row['poli_id']; ?>" />
					</form>
				</span>
			<?php
					$row_count++;
				}
			?>
			
			<hr />
			<h4>Ranking del periodo</h4>
			
			<?php
				$row_count = 0;
				foreach ($rank_notas as $row) {
					if ($row_count == 0) { $lugar_label = "1er lugar"; }
					elseif ($row_count == 1) { $lugar_label = "2do lugar"; }
					elseif ($row_count == 2) { $lugar_label = "3er lugar"; }
			?>
				<h5><?php echo $lugar_label; ?>: <?php echo ucwords($row['poli_nombre']); ?></h5>
				<span><?php echo number_format($row['promedio'], 1, ",", "."); ?> (<?php echo $row['total_notas']; ?> calificaciones)</span>
			<?php
					$row_count++;
				}
			?>
			
			<hr />
			<h4>Ranking general</h4>
			
			<?php
				$row_count = 0;
				foreach ($rank_resumen as $row) {
					if ($row_count == 0) { $lugar_label = "1er lugar"; }
					elseif ($row_count == 1) { $lugar_label = "2do lugar"; }
					elseif ($row_count == 2) { $lugar_label = "3er lugar"; }
					elseif ($row_count == 3) { $lugar_label = "4to lugar"; }
					elseif ($row_count == 4) { $lugar_label = "5to lugar"; }
			?>
				<h5><?php echo $lugar_label; ?>: <?php echo ucwords($row['poli_nombre']); ?></h5>
				<span><?php echo number_format($row['promedio'], 1, ",", "."); ?> (<?php echo $row['total_notas']; ?> calificaciones)</span>
			<?php
					$row_count++;
				}
			?>
			<br />
			<br />
			<a class="btn btn-mini btn-primary" href="/ranking"><i class="icon-plus-sign icon-white"></i><strong> Ver todos</strong></a> 
			<hr />
			<h4>Rankeados Anteriores</h4>
		
			<ul>
			<?php
				for ($i=4; $i<=28; $i=$i+4) {
					$time = strtotime($init_fecha." -".$i." hours");
					$fecha = date("d-m-Y", $time);
					$hora = date("H:00", $time);
					echo "<li><a href=\"/".$fecha."/".$hora."\">".$fecha." ".$hora."</a></li>\n";
				}
			?>
			</ul>
			
			<hr />
		
			<script>
				(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=123861350968148";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
			<div class="fb-like" data-href="http://rankeapoliticos.cl" data-send="true" data-width="280" data-show-faces="true"></div>
		</div>
	
		<div class="span8">
			<script>
				(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1&appId=123861350968148";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));
			</script>
		
			<h4>Comentarios</h4>
			<p>Sin asco, sin moderación.</p>
			<?php
				$date = DateTime::createFromFormat("Y-m-d H:i:s", $init_fecha);
				$fecha = $date->format("d-m-Y");
				$hora = $date->format("H:i");
				
				if ($lugar != null) {
					$fb_comment_url = "http://rankeapoliticos.cl/".$lugar."/".$fecha."/".$hora;
				} else {
					$fb_comment_url = "http://rankeapoliticos.cl/".$fecha."/".$hora;
				}
			?>
			<div class="fb-comments" data-href="<?php echo $fb_comment_url; ?>" data-width="562" data-num-posts="10"></div>			
		</div>
	</div>
</div>