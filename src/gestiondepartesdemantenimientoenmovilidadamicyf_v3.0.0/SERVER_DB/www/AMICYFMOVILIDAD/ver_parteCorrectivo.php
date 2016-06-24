<?php
   session_start();
   if (!isset($_SESSION['idTecnico'])) {
				header("Location:index.php");
               exit();
   }
   if (isset($_GET['idCorrectivo'])) {
               $_SESSION['idCorrectivo'] = $_GET['idCorrectivo'];
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
		$fechaCierre=date("Y-m-d",time());
	$sql1 = "update correctivo set fechaCierreCorrectivo = '".$fechaCierre."' where idCorrectivo=".$_SESSION['idCorrectivo'];
		if (@mysql_query($sql1)){
		//mandar resumen en pdf
		header("Location:resumenPartePDF.php?idCorrectivo=".$_SESSION['idCorrectivo']);
		}else{
		
		}
	}
}

   $filaCorrectivo=obtenerCorrectivo($_SESSION['idCorrectivo']);
  
   $numCorrectivo=$filaCorrectivo['idCorrectivo'];
   $contactoCorrectivo=$filaCorrectivo['contactoCorrectivo'];
   $incidenciaCorrectivo=$filaCorrectivo['incidenciaCorrectivo'];
   $solucionCorrectivo=$filaCorrectivo['solucionCorrectivo'];   
   $tiempoEstimadoCorrectivo = $filaCorrectivo['tiempoEstimadoCorrectvio'];
   if ($filaCorrectivo['salida']) {$costeSalida = obtenerCosteSalida();}
   else {$costeSalida = 0;}
   $importeMateriales = obtenerImporteMaterialesCorrectivo($_SESSION['idCorrectivo']);
   $numHoras=$filaCorrectivo['horasCorrectivo'];
   $numKilometros=$filaCorrectivo['kmCorrectivo'];
   $importeHoras = obtenerCosteHoras($numHoras,$filaCorrectivo['idPerfil']);
   $importeKm=obtenerCosteKilometros($numKilometros,$filaCorrectivo['idKilometraje']);
   $descuento=$filaCorrectivo['descuentoCorrectivo'];
   $importeTotal=$filaCorrectivo['importeCorrectivo'];
   $horaEntrada=$filaCorrectivo['horaEntrada'];
   $horaSalida=$filaCorrectivo['horaSalida'];
   $fechaCierre=date("Y-m-d",time());
   
   		
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ver Parte Correctivo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="230px"><tr><td align="right"><a href="salir.php">Salir</a></td></tr></table>
<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <form action="ver_parteCorrectivo.php" method="post">


  <tr>
    <td class="texto1" colspan="2"><div align="center">***** RESUMEN DEL PARTE *****</div></td>
  </tr>
  <tr>
    <td class="texto1">Fecha de Apertura: </td>
    <td class="textizqsin"><?php if (fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo'])!="01/01/1911") echo fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo']); else echo(""); ?></td>
  </tr>
  <tr>
    <td class="texto1">Fecha de Cierre: </td>
    <td class="textizqsin"><?php echo fechaAqui($fechaCierre); ?></td>
  </tr>
  <tr>
    <td colspan="2" class="texto1">Incidencia:</td>
  </tr>
  <tr>
    <td colspan="2" class="textizqsin"><?php echo $incidenciaCorrectivo; ?></td>
  </tr>
  <tr>
    <td colspan="2" class="texto1">Soluci&oacute;n:</td>
  </tr>
  <tr>
    <td colspan="2" class="textizqsin"><?php echo $solucionCorrectivo; ?></td>
  </tr>
  <tr>
    <td class="texto1">Tiempo Estimado: </td>
    <td class="textizqsin"><?php echo $tiempoEstimadoCorrectivo; ?></td>
  </tr>
  <tr><td colspan="2"><span class="texto1">Materiales:</span></td></tr>
  <?php 
      $sql ="select * from correctivo_has_material where idCorrectivo = ".$_SESSION['idCorrectivo'] ." order by idMaterial DESC";
	  $rCol = mysql_query($sql);
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  		$filaMaterial=obtenerMaterial($filaCol['idMaterial']);
  ?>
  <tr>
        <td class="textizqsin"><?php echo $filaMaterial['conceptoMaterial'];?></td>
        <td class="textizqsin"><?php echo $filaCol['unidades'];?> uds. | <?php echo $filaMaterial['importeMaterial'];?> €</td>
      </tr>
      <?php } ?>
	   <tr>
  <td class="texto1" colspan="2">Ticket - Factura:</td>
  
  </tr>
  <tr>
  <td class="texto1">Salida</td>
  <td class="textizqsin" align="right"><?php echo $costeSalida ; ?> €</td>
  </tr>
  <tr>
    <td class="texto1">Materiales:</td>
    <td class="textizqsin" align="right"><?php echo $importeMateriales; ?> €</td>
  </tr>
  <tr>
    <td class="texto1"><?php /*echo $numHoras; */?> h. t&eacute;cnico </td>
    <td class="textizqsin" align="right"><?php echo $importeHoras;?> €</td>
  </tr>
  <tr>
    <td class="texto1">
      <?php /*echo $numKilometros;*/ ?> Kms.   </td>
    <td class="textizqsin" align="right"><?php echo $importeKm;?> €</td>
  </tr>
  <tr>
    <td class="texto1">Descuento:</td>
    <td class="textizqsin" align="right"><?php echo $descuento; ?> &euro;</td>
  </tr>
  <tr><td colspan="2"><hr></td></tr>
  <tr>
    <td class="texto1">Base Imponible: </td>
    <td class="textizqsin" align="right"><?php echo $importeTotal; ?> &euro;</td>
  </tr>
  <tr>
    <td class="texto1">IVA (18%): </td>
    <td class="textizqsin" align="right"><?php echo $importeTotal*0.18; ?> &euro;</td>
  </tr>
  <tr>
    <td class="texto1" >Total: </td>
    <td class="textizqsin" align="right"><?php echo $importeTotal*1.18; ?> &euro;</td>
  </tr>
  <tr>
  <tr><td colspan="2"><hr></td></tr>
    <tr><td colspan="2" class="textizqsin"><input name="acuerdo" type="checkbox" value=""> Acuerdo del cliente</td></tr>
    <tr><td colspan="2" class="botones">
      <input name="completar" type="submit" class="botones" id="modificar" value="Completar Parte" />  
	  <input name="volver" type="submit" class="botones" id="volver" value="Volver" /></td>
  </tr></form>
</table>
</body>
</html>
