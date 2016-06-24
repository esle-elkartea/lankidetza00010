<?php
session_start();

if (!isset($_SESSION['idTecnico'])) 
{
	header("Location:index.php");
	exit();
}
else
{
	include('bd.php');
	$link=conectar(leerHost());
	if (tieneAccesoAPlanificador($_SESSION['idTecnico'],leerHost())==1)
	{
		include ("calendario/calendario.php");
	}
	else
	{
		header("Location:correctivos.php");
	}
}

if (isset($_GET['Prevent']) && isset($_GET['Correct']))
{
	if($_GET['Prevent']==1 && $_GET['Correct']==1){
			$Prev = $_SESSION["Prev"];
			$tablaPreventivos = tablaPrev($Prev);
			$Corr = $_SESSION["Corr"];
			$tablaCorrectivos = tablaCorr($Corr);
	}
	elseif($_GET['Prevent']==1 && $_GET['Correct']==0){
		if(isset($_SESSION["Prev"]) && count($_SESSION["Prev"])>1){
			$Prev = $_SESSION["Prev"];
			$tablaPreventivos = tablaPrev($Prev);
		}
		else{
			$Prev = $_SESSION["Prev"];
			header("Location:vermantenimientoincidencia.php?idMantenimiento=".$Prev[0]["idMantenimiento"]);
		}
	}
	elseif($_GET['Prevent']==0 && $_GET['Correct']==1){
		if(isset($_SESSION["Corr"]) && count($_SESSION["Corr"])>1){	
			$Corr = $_SESSION["Corr"];
			$tablaCorrectivos = tablaCorr($Corr);	
		}
		else{
			$Corr = $_SESSION["Corr"];
			header("Location:vercorrectivoincidencia.php?idCorrectivo=".$Corr[0]['idCorrectivo']);
		}
	}
	else{
	echo "Se ha producido un error";
	}
	
?>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript" src="calendario/javascripts.js">
<!--
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
-->
</script>
<title>Planificador - Técnicos</title>
</head>

<body>
<form action="agenda_nuevo.php" name="agenda" method="post">
<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <tr>
    <td><span class="textopeq"><a href="instalaciones.php">Instalaciones</a> &nbsp;</span><span class="textopeq"><a href="preventivos.php">Preventivos</a> &nbsp;</span><span class="textopeq"><a href="correctivos.php">Correctivos</a>&nbsp;</span><span class="textopeqneg">Planificador&nbsp;</span>
	<a href="salir2.php">Salir</a>
	<br />
    <br /></td>
  </tr>
  <tr>
    <td align="center" valign="middle" class="textizqnegrita">
	 Detalle Consulta | Fecha: <?php echo $_SESSION['fecha'];?>	| Técnico: <?php echo $filaTecnico['nombreTecnico'];?></td>
  </tr>
  
  <tr>
    <td><span class="textopeq"><a href="#">Calendario</a> &nbsp;</span><span class="textopeq"><a href="#.php">Técnicos</a>&nbsp;</span><span class="textopeqneg">Agenda</span><a href="planificador.php">Limpiar</a></td>
  </tr>
  	<td>
<?php 
if(isset($tablaPreventivos)){
	echo $tablaPreventivos;
}
if(isset($tablaCorrectivos)){
	echo $tablaCorrectivos;
}
?>
</table>
</form>
</body>
</html>
<?php
}
else{
	header("Location:correctivos.php");
}
?>