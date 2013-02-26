<?php

	function getRangos($fecha) {
		global $rangos;
		
		$date = DateTime::createFromFormat("Y-m-d H:i:s", $fecha);
		$fecha = $date->format("Y-m-d");
		$hora = (int)preg_replace("/\:/", null, $date->format("H:i:s"));
		
		foreach ($rangos as $row) {
			$min = preg_replace("/\:/", null, $row['min']);
			$max = preg_replace("/\:/", null, $row['max']);
			
			if ($min <= $hora && $hora <= $max) {
				$hora_min = $min;
				$hora_max = $max;
				break;
			}
		}
		
		$date_min = DateTime::createFromFormat("Y-m-d His", $fecha." ".$hora_min);
		$date_max = DateTime::createFromFormat("Y-m-d His", $fecha." ".$hora_max);
		return array($date_min->format("Y-m-d H:i:s"), $date_max->format("Y-m-d H:i:s"));
	}
	
?>