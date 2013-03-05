<?php
	
	// DB
	$dbhost = "localhost";
	$dbport = 5432;
	$dbuser = "maraya";
	$dbpass = "maraya";
	$dbname = "rankea_devel";
	
	// Memcache
	$memcache_host = "localhost";
	$memcache_port = 11211;
	$memcache_expire = 18000;
	
	// Rangos
	$rangos = array(
		array('min' => '00:00:00', 'max' => '03:59:59'),
		array('min' => '04:00:00', 'max' => '07:59:59'),
		array('min' => '08:00:00', 'max' => '11:59:59'),
		array('min' => '12:00:00', 'max' => '15:59:59'),
		array('min' => '16:00:00', 'max' => '19:59:59'),
		array('min' => '20:00:00', 'max' => '23:59:59')
	);
?>