<?php

class Politico {
	private $db;
	private $rows;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function getPoliticos() {
		$sql = "select * from politicos";
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$this->rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $this->rows;
	}
	
	public function getPoliId($poli_nombre) {
		foreach ($this->rows as $row) {
			if ($row['poli_nombre'] == $poli_nombre) {
				return $row['poli_id'];
			}
		}
	}
}