<?php
	include_once dirname(dirname(__FILE__))."/class/DB.php";
	include_once dirname(dirname(__FILE__))."/class/Rank.php";

	$rank = new Rank();
	$info = $rank->getRanking();
?>

<div class="row-fluid">
	<h3>Ranking</h3>
	<div class="span12">
		<table class="table table-bordered">
			<?php
				foreach ($info as $row) {
			?>
			<tr>
				<td width="25%"><strong><?php echo ucfirst($row['poli_nombre']); ?></strong></td>
				<td><?php echo number_format($row['promedio_nota'], 2); ?></td>
			</tr>
			<?php
				}
			?>
		</table>
	</div>
</div>