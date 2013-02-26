<?php

	require_once dirname(dirname(__FILE__))."/class/DB.php";
	require_once dirname(dirname(__FILE__))."/class/Rank.php";
	require_once dirname(dirname(__FILE__))."/includes/session.php";
	
	if (sizeof($_POST) > 0 && isset($_POST['session_id']) && isset($_POST['nota']) && isset($_POST['proc_id']) && $_SESSION['session_id'] = $_POST['session_id']) {
		
		if ($_SESSION['voto'] == false) {		
			$nota = $_POST['nota'];
			$proc_id = $_POST['proc_id'];
			
			$rank = new Rank();
			
			if ($rank->putNota($nota, $proc_id)) {
				$_SESSION['voto'] = true;
				$ret = "ok";
			} else {
				$ret = "error";	
			}
		} else {
			$ret = "votado";
		}
		
		echo json_encode(array("ret" => $ret));
	}
?>