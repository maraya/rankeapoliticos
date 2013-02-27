<?php
	
	require_once dirname(dirname(__FILE__))."/includes/session.php";
	
	if (!empty($_POST)) {
		if (!empty($_POST['nombre']) && !empty($_POST['correo']) && !empty($_POST['asunto']) && !empty($_POST['mensaje'])) {
			$nombre = htmlentities($_POST['nombre']);
			$correo = htmlentities($_POST['correo']);
			$asunto = htmlentities($_POST['asunto']);
			$mensaje = htmlentities($_POST['mensaje']);
		
			$msg  = "Nombre: ".$nombre."\n";
			$msg .= "Correo: ".$correo."\n";
			$msg .= "Asunto: ".$asunto."\n";
			$msg .= "Msg   : ".$mensaje;
			$msg = nl2br($msg);
			
			$headers  = "MIME-Version: 1.0" . "\r\n";
			$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
			$headers .= "From: contacto@rankeapoliticos.cl" . "\r\n" .
						"X-Mailer: PHP/" . phpversion();
		
			if ($_SESSION['count_correos'] == 5) {
				$alert_msg = "Máximo 5 correos!";
				$class = "alert-error";
			} else {
				if (mail("marayag@gmail.com", $asunto, $msg, $headers)) {
					if (!isset($_SESSION['count_correos'])) {
						$_SESSION['count_correos'] = 0;
					}
					$_SESSION['count_correos']++;
					$alert_msg = "Correo enviado!";
					$class = "alert-success";
				}
			}
		} else {
			$alert_msg = "Por favor, complete todos los campos";
			$class = "alert-error";
		}
	}

	if (isset($alert_msg)) {
		echo "<div class=\"alert ".$class."\">".$alert_msg."</div>";
	}
?>

<h3>Contacto</h3>

<form method="POST" action="/contacto">
    <fieldset>
		<label>Nombre</label>
		<input name="nombre" type="text" class="input-xlarge" maxlength="250">
		<label>Correo Electrónico</label>
		<input name="correo" type="text" class="input-xlarge" maxlength="250">
		<label>Asunto</label>
		<select name="asunto" class="input-xlarge">
			<option value="Contacto">Contacto</option>
			<option value="Felicitaciones">Felicitaciones</option>
			<option value="Puteadas">Puteadas</option>
			<option value="Otros">Otros</option>
		</select>
		<label>Mensaje</label>
		<textarea name="mensaje" class="input-xxlarge"></textarea>
		<br />
		<br />
		<button type="submit" class="btn btn-primary">Enviar</button>
	</fieldset>
</form>