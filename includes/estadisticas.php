<?php
	include_once dirname(dirname(__FILE__))."/config/config.php";
	include_once dirname(dirname(__FILE__))."/class/DB.php";
	include_once dirname(dirname(__FILE__))."/class/Estadistica.php";

	$esta = new Estadistica();
?>

<script type="text/javascript">

$(document).ready(function() {

	Highcharts.visualize = function(table, options) {
		// the categories
		options.xAxis.categories = [];
		$('tbody tr .x', table).each(function(i) {
			options.xAxis.categories.push(this.innerHTML);
		});

		// the data series
		options.series = [{
			name: 'Titulares',
			data: []
		}];
		
		var total = 0;
		$('tbody tr .y', table).each(function(i) {
			var y = parseInt(this.innerHTML);
			options.series[0].data.push(y);
			total += y;
		});
		var chart = new Highcharts.Chart(options);
	}
    
	options = {
		chart: {
			renderTo: 'container',
			type: 'column'
		},
		title: {
			text: 'Titulares por Político'
		},
		xAxis: {
			labels: {
				rotation: -90,
				align: 'right',
				style: {
					fontSize: '13px',
					fontFamily: 'Verdana, sans-serif'
				}
			}
		},
		yAxis: {
			title: {
				text: 'Cantidad'
			}
		},
		tooltip: {
			formatter: function() {
				return '<b>'+ this.x +'</b><br/>Total: '+ this.y;
			}
		},
        exporting: {
			enabled: false
        }
	};

	var table = document.getElementById('titulares_x_politico');
	Highcharts.visualize(table, options);
   
});
</script>

<?php
	$info = $esta->titularesPorPolitico();
?>
<h3>Titulares por Político</h3>
<br />
<div class="row-fluid">
    <div class="span4">
		<table class="table table-striped table-bordered" id="titulares_x_politico">
			<thead>
				<tr>
					<th>Político</th>
					<th>Total Titulares</th>
				</tr>
			</thead>
			<tbody>
			<?php
				foreach ($info as $row) {
					echo "<tr>
						      <td class=\"x\">".ucwords($row['poli_nombre'])."</td>
							  <td class=\"y\">".$row['total']."</td>
						  </tr>\n";
				}
			?>
			</tbody>
		</table>
	</div>
    <div class="span8">
		<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	</div>
</div>

<h3>Titulares por Político</h3>
<br />
<div class="row-fluid">
    <div class="span4">
		<table class="table table-striped table-bordered" id="titulares_x_politico">
			<thead>
				<tr>
					<th>Político</th>
					<th>Total Titulares</th>
				</tr>
			</thead>
			<tbody>
			<?php
				foreach ($info as $row) {
					echo "<tr>
						      <td class=\"x\">".ucwords($row['poli_nombre'])."</td>
							  <td class=\"y\">".$row['total']."</td>
						  </tr>\n";
				}
			?>
			</tbody>
		</table>
	</div>
    <div class="span8">
		<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	</div>
</div>

