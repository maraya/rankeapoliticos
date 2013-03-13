<?php

class Rank {
	private $db;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function putNota($nota, $proc_id, $poli_id) {
		$nota_fecha = date("Y-m-d H:i:s");
		$sql = "insert
				into notas
					(nota_id, proc_id, poli_id, nota_nota, nota_fecha)
				values
					((select coalesce(max(nota_id),0)+1 as id from notas), ".$proc_id.", ".$poli_id.", ".$nota.", '".$nota_fecha."')";
					
		$stmt = $this->db->prepare($sql);
		
		if (!$stmt->execute()) {
			return false;	
		}
		
		return true;
	}
	
	public function getRankNotas($init_fecha) {
		$sql = "select poli.poli_nombre
					  ,coalesce(avg(nota.nota_nota), 0) as promedio
					  ,count(nota.nota_id) as total_notas
				from lugares as luga
				join procesos as proc using (proc_id)
				left join notas as nota using (proc_id, poli_id)
				join politicos as poli using (poli_id)
				where proc.proc_desde = '".$init_fecha."'
				and   luga.luga_lugar in (1, 2, 3)
				group by poli.poli_nombre
				order by promedio desc";
				
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $res;
	}
	
	public function getRankResumen($cantidad = null) {
		$filtro = "";
		$limit = "";
		
		if ($cantidad != null) {
			$filtro = "where luga.luga_lugar <= ".$cantidad;
			$limit = "limit ".$cantidad;
		}
	
		$sql = "select poli.poli_nombre
					  ,coalesce(avg(nota.nota_nota), 0) as promedio
					  ,count(nota.nota_id) as total_notas
				from lugares as luga
				join procesos as proc using (proc_id)
				left join notas as nota using (proc_id, poli_id)
				join politicos as poli using (poli_id)
				".$filtro."
				group by poli.poli_nombre
				order by promedio desc, poli.poli_nombre asc
				".$limit;
				
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $res;
	}
}

?>
