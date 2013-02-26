<?php

class Main {
	private $db;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function getIndexInfo($fecha) {
		$sql = "select *
				from procesos as proc
				left join politicos as poli using (poli_id)
				left join titulares using (proc_id)
				where proc.proc_desde = '".$fecha."'";
				
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		if (sizeof($res) == 0) {
			return false;
		}
	
		$titulares = array();
		foreach ($res as $row) {
			$titulares[] = array(
				'title' => $row['titu_titulo'],
				'link'  => $row['titu_link']
			);
		}
		
		$info_array = array(
			'proc_id' => $res[0]['proc_id'],
			'nombre' => $res[0]['poli_nombre'],
			'total_titulares' => $res[0]['proc_total_titulares']
		);
		return array('info' => $info_array, 'titulares' => $titulares);
	}
}

?>