<?php

class Rank {
	private $db;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function putNota($nota, $proc_id) {
		$nota_fecha = date("Y-m-d H:i:s");
		$sql = "insert
				into notas
					(nota_id, proc_id, nota_nota, nota_fecha)
				values
					((select coalesce(max(nota_id),0)+1 as id from notas), ".$proc_id.", ".$nota.", '".$nota_fecha."')";
					
		$stmt = $this->db->prepare($sql);
		
		if (!$stmt->execute()) {
			return false;	
		}
		
		return true;
	}
	
	public function getRanking() {
		$sql = "select poli.poli_nombre
					  ,coalesce(avg(nota.nota_nota), 0) as promedio_nota
				from politicos as poli
				left join procesos as proc using (poli_id)
				left join notas as nota using (proc_id)
				group by poli.poli_nombre
				order by poli.poli_nombre asc";
				
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $res;
	}
}

?>
