<!DOCTYPE html>
<html lang="es">
<head>
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
	<title>Rankea políticos!</title>
	<link href="/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<link href="/css/style.css" type="text/css" rel="stylesheet">
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
			</ul>
			<h3 class="muted">Rankea Políticos!</h3>
		</div>
	<hr />