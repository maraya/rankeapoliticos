$(document).ready(function() {
	$(".rank_stars a").each(function() {
		$(this).on("click", function() {
			var nota = $(this).attr('rel');
			var session_id = $("#session_id").val();
			var proc_id = $("#proc_id").val();
			var ret;

			$.ajax({
				type: "POST",
				url: "/rankear",
				data: "session_id="+ session_id +"&nota="+ nota +"&proc_id="+ proc_id,
				cache: false,
				dataType: "json",
				success: function(data) {
					if (data.ret == "error") {
						alert('Ha ocurrido un error al poner la nota!');	
					} else {
						ret = data.ret;	
					}
				},
				complete: function() {
					if (ret == "ok") {
						$(".rank_stars p").html("<strong>Gracias por su calificación</strong>");
					} else {
						$(".rank_stars p").html("<strong>Usted ya ha calificado a este político</strong>");
					}
				}
			});
		});
	});
});