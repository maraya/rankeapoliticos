<?php

class Main {
	private $db;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function getIndexInfo($fecha, $lugar) {
		if ($lugar == null) {
			$lugar = 1;
		}
	
		$sql = "select *
				from procesos as proc
				left join lugares as luga using (proc_id)
				left join titulares as titu using (proc_id, poli_id)
				left join politicos as poli using (poli_id)
				left join fuentes as fuen using (fuen_id)
				where proc.proc_desde = '".$fecha."'
				and   luga.luga_lugar = ".$lugar."
				order by titu.titu_id asc";
		
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		if (sizeof($res) == 0) {
			return false;
		}
	
		$titulares = array();
		foreach ($res as $row) {
			$titulares[] = array(
				'title'      => $row['titu_titulo'],
				'link'       => $row['titu_link'],
				'fuen_desc'  => $row['fuen_desc']
			);
		}
		
		$info_array = array(
			'proc_id'     => $res[0]['proc_id'],
			'poli_id'     => $res[0]['poli_id'],
			'poli_nombre' => $res[0]['poli_nombre'],
			'titulares'   => $titulares
		);
		
		return $info_array;
	}
	
	public function getLateralInfo($init_fecha) {
		$sql = "select poli.poli_id
					  ,poli.poli_nombre
					  ,proc.proc_id
			    from lugares as luga
			    join procesos as proc using (proc_id)
			    join politicos as poli using (poli_id)
			    where proc.proc_desde = '".$init_fecha."'
			    order by luga.luga_lugar
			    limit 3";
		
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $res;
	}
}

?>