<?php
	session_start();
	require("bd.php");
	/*if(esMovil()){
 		header( 'location: http://212.142.138.177/soinus/AMICYFMOVILIDAD/versionmovil/index.php' );
 		exit();
	}*/
	$error = false;
	if (isset($_SESSION['idTecnico'])) 
	{
			header("Location: correctivos.php");
			exit();
	}
	if (isset($_POST['aceptar']) && $_POST['aceptar']=="Aceptar") {
			$host = $_POST['direccion'];
			escribirHost($host);
			$idU=comprobarUsuario($_POST['nombre'],$_POST['contrasena'],$host);
 			if ($idU!=-1)
 			{
					$_SESSION['idTecnico']=$idU;
					$_SESSION['loggin']=$_POST['nombre'];
					header("Location:correctivos.php");
					exit();
			}
			else {
					$error = true;
			}
	} 
	else 
	{
			$error = true;
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Inicio</title>
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>

 
<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
<form method="post" action="index.php">
  <tr>
    <td class="centrar"><p class="texto1">Nombre Usuario:</p>
        <p class="texto1">
          <input name="nombre" type="text" class="textarea" id="nombre" size="20" maxlength="30"  value=<?php echo $error?$_POST['nombre']:""; ?>>
        </p>
        <p class="texto1">
        Password:       
        <p class="texto1">
          <input name="contrasena" type="password" class="textarea" id="contrasena" size="20" maxlength="30" />
        </p>
        <p class="texto1">
          Direcci&oacute;n Servidor:        </p>
        <p class="texto1">
          <input name="direccion" type="text" class="textarea" id="direccion" size="20" maxlength="30" value=<?php echo leerHost(""); ?>>
        </p></td>
  </tr>
  <tr>
    <td class="login"><input name="aceptar" type="submit" class="botones" id="aceptar" value="Aceptar" />
    <input name="cancelar" type="submit" class="botones" id="cancelar" value="Cancelar" /></td></tr>
	</form>
</table>




</body>
</html>
