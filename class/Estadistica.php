<?php

class Estadistica {
	private $db;
	
	public function __construct() {
		if (!$this->db instanceof DB) {
			$this->db = new DB();
		}
	}
	
	public function titularesPorPolitico() {
		$sql = "select poli.poli_nombre
					  ,coalesce(sum(esta.esta_cant_titulares), 0) as total
				from politicos as poli
				left join estadisticas as esta using (poli_id)
				group by poli.poli_nombre
				order by total desc, poli.poli_nombre asc";
		$stmt = $this->db->prepare($sql);
		$stmt->execute();
		$res = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
		return $res;
	}
}

?>