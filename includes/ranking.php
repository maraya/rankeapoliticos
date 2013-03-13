<?php
	include_once dirname(dirname(__FILE__))."/config/config.php";
	include_once dirname(dirname(__FILE__))."/class/DB.php";
	include_once dirname(dirname(__FILE__))."/class/Rank.php";

	$rank = new Rank();
	$info = $rank->getRankResumen();
?>

<div class="row-fluid">
	<h3>Ranking General</h3>
	<br />
	<div class="span12">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Político</th>
					<th>Promedio</th>
					<th>Total Calificaciones</th>
				</tr>
			</thead>
			<tbody>
				<?php
					foreach ($info as $row) {
				?>
				<tr>
					<td width="25%"><strong><?php echo ucwords($row['poli_nombre']); ?></strong></td>
					<td><?php echo number_format($row['promedio'], 1); ?></td>
					<td><?php echo $row['total_notas']; ?></td>
				</tr>
				<?php
					}
				?>
			</tbody>
		</table>
	</div>
</div>

