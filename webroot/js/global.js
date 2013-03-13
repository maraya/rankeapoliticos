$(document).ready(function() {

	$(".rank_stars a").each(function() {
		$(this).on("click", function() {
			var t = $(this);
			var nota = $(t).attr('rel');
			var session_id = $(t).parent().parent().find(".session_id").val();
			var proc_id = $(t).parent().parent().find(".proc_id").val();
			var poli_id = $(t).parent().parent().find(".poli_id").val();
			var cookie_name = 'user_rank_'+ proc_id +'_'+ poli_id;
			var ret;
			
			$.ajax({
				type: "POST",
				url: "/rankear",
				data: "cookie_name="+ cookie_name +"&session_id="+ session_id +"&nota="+ nota +"&proc_id="+ proc_id +"&poli_id="+ poli_id,
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
					$(t).parent().parent().find(".tooltip_msg").tooltip('destroy');
					if (ret == "ok") {
						$(t).parent().parent().find(".tooltip_msg").removeAttr("title").attr("title", "Gracias por su calificación").tooltip('show');
					} else {
						$(t).parent().parent().find(".tooltip_msg").removeAttr("title").attr("title", "Usted ya ha calificado a este político").tooltip('show');
					}
				}
			});
		}).on('mouseover', function() {
			$(this).find("i").addClass("icon-white");
		}).on('mouseout', function() {
			$(this).find("i").removeClass("icon-white");
		});
	});
});