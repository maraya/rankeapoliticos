<?php
	session_start();
	
	if (!isset($_SESSION['session_id']) && (!isset($_SESSION['voto']))) {
		$_SESSION['session_id'] = session_id();
		$_SESSION['voto'] = false;
	} 
?>
