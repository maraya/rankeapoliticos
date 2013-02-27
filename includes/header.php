<!DOCTYPE html>
<html lang="es">
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<meta property="og:title" content="Rankea políticos!" />
	<meta property="og:type" content="cause" />
	<meta property="og:image" content="http://rankeapoliticos.cl/img/fb-icon.png" /> 
	<meta property="og:url" content="http://rankeapoliticos.cl" /> 
	<meta property="fb:admins" content="1185063875"/>
	<meta property="fb:app_id" content="123861350968148"/>
	<title>Rankea políticos!</title>
	<link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="/css/style.css" type="text/css" rel="stylesheet">
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<script src="/js/jquery.min.js" type="text/javascript"></script>
	<script src="/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/js/global.js" type="text/javascript"></script>
</head>

<body>
	<div class="container-narrow">
		<div class="masthead">
			<ul class="nav nav-pills pull-right">
				<li <?php if (!isset($_GET['__sec'])) { echo "class='active'"; } ?>><a href="/">Home</a></li>
				<li <?php if (isset($_GET['__sec']) && $_GET['__sec'] == "ranking") { echo "class='active'"; } ?>><a href="/ranking">Ranking</a></li>
				<li <?php if (isset($_GET['__sec']) && $_GET['__sec'] == "faq") { echo "class='active'"; } ?>><a href="/faq">FAQ</a></li>
				<li <?php if (isset($_GET['__sec']) && $_GET['__sec'] == "contacto") { echo "class='active'"; } ?>><a href="/contacto">Contacto</a></li>
			</ul>
			<h3 class="muted">Rankea Políticos!</h3>
		</div>
	<hr />