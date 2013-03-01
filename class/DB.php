<?php

class DB extends PDO {
	private $dsn;
	
	public function __construct() {
		global $dbhost, $dbport, $dbname, $dbuser, $dbpass;
		$this->dsn = "pgsql:host=".$dbhost.";port=".$dbport.";dbname=".$dbname.";user=".$dbuser.";password=".$dbpass;
		
		parent::__construct($this->dsn);
	}
}

?>