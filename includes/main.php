<?php
	require_once dirname(dirname(__FILE__))."/config/config.php";
	require_once dirname(dirname(__FILE__))."/class/DB.php";
	require_once dirname(dirname(__FILE__))."/class/Main.php";
	require_once dirname(dirname(__FILE__))."/class/MemcacheClient.php";
	require_once dirname(dirname(__FILE__))."/includes/functions.php";
	require_once dirname(dirname(__FILE__))."/includes/session.php";
	
	// Inicio
	$lugar = isset($_GET['__lugar'])? htmlentities($_GET['__lugar']): null;
	
	if (isset($_GET['__fecha']) && isset($_GET['__hora'])) {
		$fecha = $_GET['__fecha'];
		$hora = $_GET['__hora'];
		
		$date = DateTime::createFromFormat("d-m-Y H:i:s", $fecha." ".$hora.":00");
		list ($init_fecha, $end_fecha) = getRangos($date->format("Y-m-d H:i:s"));
		
		$main = new Main();
		$index_info = $main->getIndexInfo($init_fecha, $lugar);
	} else {
		list ($init_fecha, $end_fecha) = getRangos(date("Y-m-d H:i:s"));
		
		$memcache = new MemcacheClient();
		$index_info = $memcache->get("index_info", $lugar);
		$memcache->close();
	}
	
	if (!is_array($index_info)) {
		header("Location: /nada");
		exit;
	}
	
	$titulares = $index_info['titulares'];
	$poli_nombre = ucfirst($index_info['poli_nombre']);
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
	
	<p><a class="btn btn-primary" href="/2"><i class="icon-flag icon-white"></i> 2do Lugar</a> <a class="btn btn-primary" href="/3"><i class="icon-flag icon-white"></i> 3er Lugar</a></p>
</div>

<div class="row-fluid main_content">

	<div class="span12 well sidebar-nav">
		<h3>Titulares</h3>
		<ul>
		<?php
			foreach ($titulares as $row) {
				echo "<li><a href=\"".$row['link']."\" target=\"_blank\">".$row['title']."</a></li>\n";
			}
		?>
		</ul>
	</div>

	<div class="row-fluid">
		<div class="span4">
			<h4>Rankea a <?php echo $poli_nombre; ?></h4>
	
			<span class="rank_stars">
				<form>
				<?php
					for ($i=1; $i<=7; $i++) {
						echo "<a href=\"javascript:;\" rel=\"".$i."\"><i title=\"".$i."\" class=\"icon-star\"></i></a>";
					}
				?>
					<input type="hidden" id="session_id" value="<?php echo $_SESSION['session_id']; ?>" />
					<input type="hidden" id="proc_id" value="<?php echo $proc_id; ?>" />
					<input type="hidden" id="poli_id" value="<?php echo $poli_id; ?>" />
				</form>
				<p></p>
			</span>
		
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