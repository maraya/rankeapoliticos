<?php

	require_once dirname(dirname(__FILE__))."/class/DB.php";
	require_once dirname(dirname(__FILE__))."/class/Rank.php";
	require_once dirname(dirname(__FILE__))."/includes/session.php";
	require_once dirname(dirname(__FILE__))."/includes/functions.php";
	
	if (sizeof($_POST) > 0 && isset($_POST['session_id']) && isset($_POST['nota']) && isset($_POST['proc_id']) && $_SESSION['session_id'] = $_POST['session_id']) {
		
		if (!isset($_COOKIE['user_rank'])) {		
			$nota = $_POST['nota'];
			$proc_id = $_POST['proc_id'];
			
			$rank = new Rank();
			
			if ($rank->putNota($nota, $proc_id)) {
				$ret = "ok";
				// almacenamos cookie y la hacemos expirar hasta el próximo proceso
				list ($init_fecha, $end_fecha) = getRangos(date("Y-m-d H:i:s"));
				setcookie("user_rank", true, strtotime($end_fecha));
			} else {
				$ret = "error";	
			}
		} else {
			$ret = "votado";
		}
		
		echo json_encode(array("ret" => $ret));
	}
?>