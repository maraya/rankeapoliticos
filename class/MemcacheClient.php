<?php

class MemcacheClient {
	private $mc;

	public function __construct() {
		global $memcache_host, $memcache_port;
	
		$this->mc = new Memcache();
		$this->mc->pconnect($memcache_host, $memcache_port);
	}

	public function get($key, $lugar) {
		return $this->mc->get($key);
	}
	
	public function close() {
		$this->mc->close();
	}
}