<?php
	
	include_once dirname(dirname(__FILE__))."/includes/header.php";
	
	if (!isset($_GET['__sec'])) {
		include_once dirname(dirname(__FILE__))."/includes/main.php";
	} elseif ($_GET['__sec'] == "ranking") {
		include_once dirname(dirname(__FILE__))."/includes/ranking.php";
	} elseif ($_GET['__sec'] == "nada") {
		include_once dirname(dirname(__FILE__))."/includes/nada.php";
	} elseif ($_GET['__sec'] == "faq") {
		include_once dirname(dirname(__FILE__))."/includes/faq.php";
	} elseif ($_GET['__sec'] == "contacto") {
		include_once dirname(dirname(__FILE__))."/includes/contacto.php";
	} elseif ($_GET['__sec'] == "estadisticas") {
		include_once dirname(dirname(__FILE__))."/includes/estadisticas.php";
	} else {
		// 404
		include_once dirname(dirname(__FILE__))."/includes/404.php";
	}

	include_once dirname(dirname(__FILE__))."/includes/footer.php";
?>	
	