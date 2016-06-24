<?php
   session_start();
   if (!isset($_SESSION['idAdmin'])) {
				header("Location:index.php");
               exit();
   }
   require_once("../bd.php");
   $link=conectar(leerHost());

   $filaConfiguracion=obtenerDatosConfiguracion();
	$cif=$filaConfiguracion['cif'];	
	$nombre=$filaConfiguracion['nombre'];
	$direccion=$filaConfiguracion['direccion'];
	$cp=$filaConfiguracion['cp'];
	$localidad=$filaConfiguracion['localidad'];
	$provincia=$filaConfiguracion['provincia'];
	$telefono=$filaConfiguracion['telefono'];
	$fax=$filaConfiguracion['fax'];
	$email=$filaConfiguracion['email'];
	$logo=$filaConfiguracion['logo'];
	
	if ($_POST['Modificar']=="Modificar")
	{
	$cif=$_POST['cif'];
	$nombre=$_POST['nombre'];
	$direccion=$_POST['direccion'];
	$cp=$_POST['cp'];
	$localidad=$_POST['localidad'];
	$provincia=$_POST['provincia'];
	$telefono=$_POST['telefono'];
	$fax=$_POST['fax'];
	$email=$_POST['email'];
	$logo=$_FILES["logo"]["name"];
	if ($_FILES["logo"]["name"]!=""){
			$sql1 = "update datosconfiguracionweb set cif='".$cif."',nombre='".$nombre."',direccion='".$direccion."',cp='".$cp."',localidad='".$localidad."',provincia='".$provincia."',telefono='".$telefono."',fax='".$fax."',email='".$email."',logo='".$_FILES["logo"]["name"]."'";
		 	$subir = true;
	} else
	{
			$sql1 = "update datosconfiguracionweb set cif='".$cif."',nombre='".$nombre."',direccion='".$direccion."',cp='".$cp."',localidad='".$localidad."',provincia='".$provincia."',telefono='".$telefono."',fax='".$fax."',email='".$email."'";
	}
	if (@mysql_query($sql1)){
			if ($subir){
				      	exec("rm -frR /movilidad/".$_FILES["logo"]["name"]);
					 	$nombre_archivo = $HTTP_POST_FILES['logo']['name'];
		 				$tipo_archivo = $HTTP_POST_FILES['logo']['type'];
		 				$tamano_archivo = $HTTP_POST_FILES['logo']['size'];
						if (@is_uploaded_file($_FILES["logo"]["tmp_name"])) {
							copy($_FILES["logo"]["tmp_name"], "/movilidad/".$_FILES["logo"]["name"]);
						}
			}
	}
	else{
	}
	}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Documento sin t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form method="post" action="config.php" enctype="multipart/form-data">
<table width="220" class="contenedor" cellpadding="0" cellspacing="0">
  <tr>
    <td width="46" class="texto1">CIF</td>
    <td colspan="3"><input type="text" name="cif" class="textarea" value="<?php echo $cif;?>"></td>
  </tr>
  <tr>
    <td class="texto1">Nombre</td>
    <td colspan="3"><input type="text" name="nombre" class="textarea" value="<?php echo $nombre;?>"></td>
  </tr>
  <tr>
    <td class="texto1">Direcci&oacute;n</td>
    <td colspan="3"><input type="text" name="direccion" class="textarea" value="<?php echo $direccion;?>"></td>
  </tr>
  <tr>
    <td class="texto1">CP</td>
    <td width="23"><input type="text" name="cp" class="textarea" size="5" value="<?php echo $cp;?>"></td>
    <td width="46" class="texto1">Localidad</td>
    <td width="100"><input type="text" name="localidad" class="textarea" value="<?php echo $localidad;?>"></td>
  </tr>
  <tr>
    <td class="texto1">Provincia</td>
    <td colspan="3"><input type="text" name="provincia" class="textarea" value="<?php echo $provincia;?>"></td>
  </tr>
  <tr>
    <td class="texto1">Tel&eacute;fono</td>
    <td colspan="3"><input type="text" name="telefono" class="textarea" value="<?php echo $telefono;?>"></td>
  </tr>
  <tr>
    <td class="texto1">FAX</td>
    <td colspan="3"><input type="text" name="fax" class="textarea" value="<?php echo $fax;?>"></td>
  </tr>
  <tr>
    <td class="texto1">E-Mail</td>
    <td colspan="3"><input type="text" name="email" class="textarea" value="<?php echo $email;?>"></td>
  </tr>
  <tr>
    <td class="texto1">Logo</td>
    <td colspan="3" class="textizqsin"><input name="logo" type="file"> <?php echo $logo;?></td>
  </tr>
  <tr>   
    <td colspan="4" align="right"><input name="Modificar" type="submit" class="botones" value="Modificar">
    <input type="button" value="Salir" onclick="self.close()" class="botones"></td></tr>
</table>
</form>
</body>
</html>
