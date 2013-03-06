<?php

class MemcacheClient {
	private $mc;

	public function __construct() {
		global $memcache_host, $memcache_port;
	
		$this->mc = new Memcache();
		$this->mc->connect($memcache_host, $memcache_port);
	}

	public function get($key, $lugar) {
		if ($lugar == null) {
			$lugar = 1;
		}
		
		return $this->mc->get($key."_".$lugar);
	}
	
	public function close() {
		$this->mc->close();
	}
	
	public function set($key, $value, $const, $expire) {
		return $this->mc->set($key, $value, $const, $expire);
	}
}