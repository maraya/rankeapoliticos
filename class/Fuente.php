<?php

class Fuente {
	private $db;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function getFuentes() {
		$sql = "select * from fuentes where fuen_activa is true";
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		
		return $stmt->fetchAll(PDO::FETCH_ASSOC);
	}
}