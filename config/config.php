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

	// RSS
	$rss_url = array(
		'http://www.latercera.com/feed/manager?type=rss&sc=TEFURVJDRVJB&citId=9&categoryId=680',
		'http://www.latercera.com/feed/manager?type=rss&sc=TEFURVJDRVJB&citId=9&categoryId=674',
		'http://rss.emol.com/rss.asp?canal=1',
		'http://www.lanacion.cl/noticias/site/tax/port/all/rss____1.xml',
		'http://www.lacuarta.com/feed/manager?type=rss&sc=TEFDVUFSVEE=',
		'http://www.cnnchile.com/rss',
		'http://foros.lasegunda.com/feed',
		'http://www.publimetro.cl/rss.xml',
		'http://www.pulso.cl/feed/manager?type=rss&sc=UFVMU08='
	);
	
	// Politicos
	$politicos = array(
		'allamand',
		'meo',
		'piñera',
		'golborne',
		'bachellet',
		'pinochet',
		'orrego',
		'ossandon',
		'chadwick',
		'vallejo',
		'jackson',
		'enriquez-ominami',
		'parisi',
		'velasco',
		'frei',
		'lagos',
		'escalona',
		'matthei',
		'lavín',
		'longueira',
		'cruz-coke',
		'hinzpeter'
	);
?>