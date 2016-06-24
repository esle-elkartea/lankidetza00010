<?php
   session_start();
   if (!isset($_SESSION['idTecnico'])) {
				header("Location:index.php");
               exit();
   }
   if (isset($_GET['idMantenimiento'])) {
               $_SESSION['idMantenimiento'] = $_GET['idMantenimiento'];
			   $_SESSION['origen'] = $_GET['origen'];
			   $_SESSION['vueltaorigen'] = $_GET['vueltaorigen'];
   }
      include("bd.php");
      $link=conectar(leerHost());
   if ($_POST['volver']=="Volver")
   {
   		header("Location:".$_SESSION['origen'].".php?origen=".$_SESSION['vueltaorigen']);
   }

if($_POST['completar']=="Completar Parte")
{
	if (isset($_POST['acuerdo']))
	{
		header("Location:resumenPartePreventivoPDF.php?idMantenimiento=".$_SESSION['idMantenimiento']);
	}else{
	}
}

   $filaPreventivo=obtenerPreventivo($_SESSION['idMantenimiento']);
   $numPreventivo=$filaPreventivo['idMantenimiento'];
   $tiempoEstimado = $filaPreventivo['tiempoEstimado'];
   $fechaMantenimiento=fechaAqui($filaPreventivo['fechaMantenimiento']);
   $filaTecnico = obtenerTecnico($_SESSION['idTecnico'],leerHost());
   $tecnico = $filaTecnico['nombreTecnico'];
   $frecuenciaMantenimiento=$filaPreventivo['frecuenciaMantenimiento'];
   
   		
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ver Parte Preventivo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="230px"><tr><td align="right"><a href="salir.php">Salir</a></td></tr></table>
<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <form action="ver_partePreventivo.php" method="post">
  <tr>
    <td class="texto1" colspan="2"><div align="center">***** RESUMEN DEL PARTE *****</div></td>
  </tr>
  <tr>
    <td class="texto1">Fecha Mantenimiento: </td>
    <td class="textizqsin"><?php echo $fechaMantenimiento; ?></td>
  </tr>
  <tr>
    <td class="texto1">Técnico: </td>
    <td class="textizqsin"><?php echo $tecnico; ?></td>
  </tr>
  <tr>
    <td class="texto1">Tiempo Estimado: </td>
    <td class="textizqsin"><?php echo $tiempoEstimado; ?></td>
  </tr>
  <tr><td colspan="2"><span class="texto1">Captura de datos:</span></td></tr>

  <?php 
     $sql ="SELECT * FROM mantenimiento m, maquina mq, protocolo_mantenimientos p WHERE m.idMantenimiento = ".$_SESSION['idMantenimiento']." and mq.idMaquina=m.idMaquina and mq.idProtocolo = p.idProtocolo and p.frecuenciaProtocolo_Mantenimientos = ".$frecuenciaMantenimiento;
	$rCol = mysql_query($sql);
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  		$name = $filaCol['nombreProtocolo_Mantenimientos'];
				$id = $filaCol['idProtocolo_Mantenimientos'];
				$sql1 = "SELECT * FROM maquina_mantenimientos m where idProtocolo_Mantenimientos=".$id." and idMantenimiento = ".$_SESSION['idMantenimiento'];
				
				$rCol1 = mysql_query($sql1);
				$filaCol1=mysql_fetch_array($rCol1,MYSQL_ASSOC)
  ?>
  <tr>
        <td class="textizqborde"><?php echo $name ?></td>
        <td class="textizqborde"><?php echo $filaCol1['valorMaquina_Mantenimientos']?> </td>
      </tr>
      <?php } ?>
    <tr><td colspan="2" class="textizqsin"><input name="acuerdo" type="checkbox" value=""> Acuerdo del cliente</td></tr>
    <tr><td colspan="2" class="botones">
      <input name="completar" type="submit" class="botones" id="modificar" value="Completar Parte" />  
	  <input name="volver" type="submit" class="botones" id="volver" value="Volver" /></td>
  </tr></form>
</table>
</body>
</html>