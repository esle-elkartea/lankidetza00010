<?php
	require_once("Correctivo.php");
	require_once("bd.php");
   	session_start();
   if (!isset($_SESSION['idTecnico'])) {
				header("Location:index.php");
               exit();
   }

   $link=conectar(leerHost());
   
   if ($_POST['volver']=="Volver")
   {
   		header("Location:agenda_nuevo.php");
   }
    
    if ($_POST['maquinas']=="Máquinas")
   {
   		$_SESSION['correctivo'] = new Correctivo();
		$_SESSION['correctivo'] -> numCorrectivo = $_SESSION['idCorrectivo'];
		$filaCorrectivo=obtenerCorrectivo($_SESSION['idCorrectivo']);
		$_SESSION['correctivo'] -> fecha = fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo']);
		$_SESSION['correctivo'] -> contactoCorrectivo = $filaCorrectivo['contactoCorrectivo'];;
		$_SESSION['correctivo'] -> incidenciaCorrectivo = $_POST['incidencia'];
		$_SESSION['correctivo'] -> solucionCorrectivo = $_POST['solucion'];   
		$_SESSION['correctivo'] -> tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		if ($_POST['dispSalida']!=0) $sal = 1;
		else $sal = 0;
		$_SESSION['correctivo'] -> salida = $sal;
		$_SESSION['correctivo'] -> costeSalida = $_POST['dispSalida'];
		$_SESSION['correctivo'] -> importeMateriales = $_POST['impMateriales'];
		$_SESSION['correctivo'] -> numHoras = $_POST['horas'];
		$_SESSION['correctivo'] -> numKilometros = $_POST['km'];
		$_SESSION['correctivo'] -> importeHoras = $_POST['impHoras'];
		$_SESSION['correctivo'] -> importeKm = $_POST['importeKm'];
		$_SESSION['correctivo'] -> descuento = $_POST['descuento'];
		$_SESSION['correctivo'] -> importeTotal = $_POST['baseinmpo'];
		$_SESSION['correctivo'] -> horaEntrada = $_POST['horaEntrada'];
		$_SESSION['correctivo'] -> horaSalida = $_POST['horaSalida'];

		
   		header("Location:modifi_maquinas.php?origen=vercorrectivo&vueltaorigen=".$_SESSION['origen']."&idCorrectivo=".$_SESSION['idCorrectivo']);
   }
   if ($_POST['materiales']=="Materiales")
   {
   		$_SESSION['correctivo'] = new Correctivo();
		$_SESSION['correctivo'] -> numCorrectivo = $_SESSION['idCorrectivo'];
		$filaCorrectivo=obtenerCorrectivo($_SESSION['idCorrectivo']);
		$_SESSION['correctivo'] -> fecha = fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo']);
		$_SESSION['correctivo'] -> contactoCorrectivo = $filaCorrectivo['contactoCorrectivo'];
		$_SESSION['correctivo'] -> incidenciaCorrectivo = $_POST['incidencia'];
		$_SESSION['correctivo'] -> solucionCorrectivo = $_POST['solucion'];   
		$_SESSION['correctivo'] -> tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		if ($_POST['dispSalida']!=0) $sal = 1;
		else $sal = 0;
		$_SESSION['correctivo'] -> salida = $sal;
		$_SESSION['correctivo'] -> costeSalida = $_POST['dispSalida'];
		$_SESSION['correctivo'] -> importeMateriales = $_POST['impMateriales'];
		$_SESSION['correctivo'] -> numHoras = $_POST['horas'];;
		$_SESSION['correctivo'] -> numKilometros = $_POST['km'];;
		$_SESSION['correctivo'] -> importeHoras = $_POST['impHoras'];;
		$_SESSION['correctivo'] -> importeKm = $_POST['importeKm'];;
		$_SESSION['correctivo'] -> descuento = $_POST['descuento'];
		$_SESSION['correctivo'] -> importeTotal = $_POST['baseinmpo'];
		$_SESSION['correctivo'] -> horaEntrada = $_POST['horaEntrada'];
		$_SESSION['correctivo'] -> horaSalida = $_POST['horaSalida'];

   		header("Location:materiales.php?origen=vercorrectivo&vueltaorigen=".$_SESSION['origen']."&idCorrectivo=".$_SESSION['idCorrectivo']);
   }
   
   
   
   
   
   if (isset($_GET['idCorrectivo'])) {
               $_SESSION['idCorrectivo'] = $_GET['idCorrectivo'];
			   $_SESSION['origen'] = $_GET['origen'];
   }
   $filaCorrectivo=obtenerCorrectivo($_SESSION['idCorrectivo']);
   $numCorrectivo=$filaCorrectivo['idCorrectivo'];
   $contactoCorrectivo=$filaCorrectivo['contactoCorrectivo'];
   $incidenciaCorrectivo=$filaCorrectivo['incidenciaCorrectivo'];
   $solucionCorrectivo=$filaCorrectivo['solucionCorrectivo'];   
   $tiempoEstimadoCorrectivo = $filaCorrectivo['tiempoEstimadoCorrectvio'];
   if ($filaCorrectivo['salida']) {$costeSalida = obtenerCosteSalida();}
   else {$costeSalida = 0;}
   if ($filaCorrectivo['salida']=="1")$salida=1;
              else $salida = 0;
   $importeMateriales = obtenerImporteMaterialesCorrectivo($_SESSION['idCorrectivo']);
   $numHoras=$filaCorrectivo['horasCorrectivo'];
   $numKilometros=$filaCorrectivo['kmCorrectivo'];
   $importeHoras = obtenerCosteHoras($numHoras,$_POST['perfileshoras']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$_POST['perfileskm']);
   $descuento=$filaCorrectivo['descuentoCorrectivo'];
   $importeTotal=$filaCorrectivo['importeCorrectivo'];
   $horaEntrada=$filaCorrectivo['horaEntrada'];
   $horaEntrada=substr($horaEntrada,0,5);
   $horaSalida=$filaCorrectivo['horaSalida'];
   $horaSalida=substr($horaSalida,0,5);
   if (fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo'])!="01/01/1911") $fecha = fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo']); else $fecha = "";
   
   if ($_POST['salida']=="Salida")
   {
   		$incidenciaCorrectivo = $_POST['incidencia'];
		$solucionCorrectivo = $_POST['solucion'];
   		$tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		$numHoras=$_POST['horas'];
   		$numKilometros=$_POST['km'];
   		$descuento=$_POST['descuento'];
		$importeTotal=$_POST['baseinmpo'];
		$horaEntrada=$_POST['horaEntrada'];
		$horaSalida=$_POST['horaSalida'];
   		$importeHoras = obtenerCosteHoras($numHoras,$filaCorrectivo['idPerfil']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$filaCorrectivo['idKilometraje']);
		$costeSalida = obtenerCosteSalida();
		$importeTotal=$costeSalida+$_POST['impMateriales']+$importeHoras+$importeKm-$descuento;
		$salida = 1;
		$costeSalida = obtenerCosteSalida();

   }
   
   if ($_POST['nosalida']=="No Salida")
   {
   		$incidenciaCorrectivo = $_POST['incidencia'];
		$solucionCorrectivo = $_POST['solucion'];
   		$tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		$numHoras=$_POST['horas'];
   		$numKilometros=$_POST['km'];
   		$descuento=$_POST['descuento'];
		$importeTotal=$_POST['baseinmpo'];
		$horaEntrada=$_POST['horaEntrada'];
		$horaSalida=$_POST['horaSalida'];
   		$importeHoras = obtenerCosteHoras($numHoras,$filaCorrectivo['idPerfil']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$filaCorrectivo['idKilometraje']);
		$importeTotal=$_POST['impMateriales']+$importeHoras+$importeKm-$descuento;
		$salida = 0;
		$costeSalida = 0;
   }
   
   if ($_POST['recalcular']=="Recalcular")
   {
   		$incidenciaCorrectivo = $_POST['incidencia'];
		$solucionCorrectivo = $_POST['solucion'];
   		$tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		$numHoras=$_POST['horas'];
   		$numKilometros=$_POST['km'];
   		$descuento=$_POST['descuento'];
		$importeTotal=$_POST['baseinmpo'];
		$horaEntrada=$_POST['horaEntrada'];
		$horaSalida=$_POST['horaSalida'];
   		$importeHoras = obtenerCosteHoras($numHoras,$filaCorrectivo['idPerfil']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$filaCorrectivo['idKilometraje']);
		
		if ($_POST['dispSalida']==0)
		{
			$salida = 0;
			$costeSalida = 0;
		} else {
			$salida = 1;
			$costeSalida = obtenerCosteSalida();
		}
		
		$importeTotal=$costeSalida+$_POST['impMateriales']+$importeHoras+$importeKm-$descuento;
   }
   
   if ($_POST['modificar']=="Modificar")
   {
		//$fechaCierre=date("Y-m-d",time());
   		$incidenciaCorrectivo = $_POST['incidencia'];
		$solucionCorrectivo = $_POST['solucion'];
   		$tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		$numHoras=$_POST['horas'];
   		$numKilometros=$_POST['km'];
   		$descuento=$_POST['descuento'];
		$importeTotal=$_POST['baseinmpo'];
		$horaEntrada=$_POST['horaEntrada'];
		$horaSalida=$_POST['horaSalida'];
		
		 if ($_POST['dispSalida']==0||$_POST['dispSalida']=="")
		{
			$salida = 'false';
			$costeSalida = 0;
		} else {
			$salida = 'true';
			$costeSalida = obtenerCosteSalida();
		}
		$sql1 = "update correctivo set idKilometraje = ".$_SESSION['pk'].", idPerfil=".$_SESSION['ph'].",importeCorrectivo = ".$importeTotal.", incidenciaCorrectivo = '".$incidenciaCorrectivo."', solucionCorrectivo='".$solucionCorrectivo."', tiempoEstimadoCorrectvio = ".$tiempoEstimadoCorrectivo.", horasCorrectivo=".$numHoras.", kmCorrectivo=".$numKilometros.", descuentoCorrectivo=".$descuento.", horaEntrada='".$horaEntrada.":00', horaSalida='".$horaSalida.":00', salida=".$salida." where idCorrectivo=".$_SESSION['idCorrectivo']."";
	
		if (mysql_query($sql1,$link)){
		header("Location:ver_parteCorrectivo.php?origen=vercorrectivo&vueltaorigen=".$_SESSION['origen']."&idCorrectivo=".$_SESSION['idCorrectivo']);

   }
   }
if (isset($_GET['objeto']))
{

   $filaCorrectivo=$_SESSION['correctivo'];
   $numCorrectivo=$filaCorrectivo -> numCorrectivo;
   $contactoCorrectivo=$filaCorrectivo -> contactoCorrectivo;
   $incidenciaCorrectivo=$filaCorrectivo -> incidenciaCorrectivo;
   $solucionCorrectivo=$filaCorrectivo -> solucionCorrectivo;
   $tiempoEstimadoCorrectivo = $filaCorrectivo -> tiempoEstimadoCorrectivo;
   $salida = $filaCorrectivo -> salida;
   $costeSalida = $filaCorrectivo -> costeSalida;
   $importeMateriales = obtenerImporteMaterialesCorrectivo($_SESSION['idCorrectivo']);
   $numHoras=$filaCorrectivo -> numHoras;
   $numKilometros=$filaCorrectivo -> numKilometros;
   $importeHoras = $filaCorrectivo -> importeHoras;
   $importeKm=$filaCorrectivo -> importeKm;
   $descuento=$filaCorrectivo -> descuento;
   $importeTotal=$costeSalida+$importeMateriales+$importeHoras+$importeKm-$descuento;
   $horaEntrada=$filaCorrectivo -> horaEntrada;
   $horaSalida=$filaCorrectivo -> horaSalida;
   $fecha = $filaCorrectivo -> fecha;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ver Correctivo</title>
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <form action="vercorrectivoincidencia.php" method="post">
  <tr>
    <td width="115" class="texto1">N&uacute;mero:<br />    </td>
    <td width="115" class="textizqsin"><?php echo $numCorrectivo; ?></td>
  </tr>
  <tr>
    <td class="texto1">Contacto:<br />    </td>
    <td class="textizqsin"><?php echo $contactoCorrectivo; ?></td>
  </tr>
  <tr>
    <td class="texto1">Fecha de Apertura: </td>
    <td class="textizqsin"><?php echo $fecha; ?></td>
  </tr>
  <tr>
  <td class="texto1">Hora Entrada</td>
  <td><input name="horaEntrada" type="text" class="textarea" id="horaEntrada" size="15" maxlength="20" value="<?php echo $horaEntrada ?>" ></td>
  </tr>
    <tr>
  <td class="texto1">Hora Salida</td>
  <td><input name="horaSalida" type="text" class="textarea" id="horaSalida" size="15" maxlength="20" value="<?php echo $horaSalida ?>" ></td>
  </tr>

  <tr>
    <td colspan="2" class="texto1">Incidencia:</td>
  </tr>
  <tr>
    <td colspan="2" class="centrar"><textarea name="incidencia" cols="20" rows="4" class="centrar" id="incidencia"><?php echo $incidenciaCorrectivo; ?></textarea></td>
  </tr>
  <tr>
    <td colspan="2" class="texto1">Soluci&oacute;n:</td>
  </tr>
  <tr>
    <td colspan="2" class="centrar"><textarea name="solucion" cols="20" rows="4" class="centrar" id="solucion"><?php echo $solucionCorrectivo; ?></textarea></td>
  </tr>
  <tr>
    <td class="texto1">Tiempo Estimado: </td>
    <td><input name="tiempoEstimado" type="text" class="textarea" size="10"  value ="<?php echo $tiempoEstimadoCorrectivo; ?>"></td>
  </tr>
  <tr>
  <td class="texto1">Disposición de salida</td>
  <td class="texto1"><input name="dispSalida" type="text" size="10" value="<?php echo $costeSalida ; ?>" class="textarea"  />€ <?php if ($salida) { echo "<input class='botones' type='submit' name='nosalida' value='No Salida' />"; } else { echo "<input class='botones' type='submit' name='salida' value='Salida' />";} ?></td>
  </tr>
  <tr>
    <td class="texto1">Materiales:</td>
    <td class="texto1"><input name="impMateriales" type="text" size="10" value="<?php echo $importeMateriales; ?>" class="textarea"  />€</td>
  </tr>
   <tr>
    <td class="texto1"><input name="horas" type="text" class="textarea" id="horas" size="8" value="<?php echo $numHoras; ?>"> 
    h. 
     
      <select name="perfileshoras" id="perfileshoras" class="textarea">
                <option value="0">Escoja perfil:</option>
				          <?php 
						  $link=conectar(leerHost());
			$sql = "SELECT * from perfil";
			$r = mysql_query($sql);
					while($perfil=mysql_fetch_array($r,MYSQL_ASSOC))
					{
						  ?>
						  <option value="<?php echo $perfil['idPerfil'] ?>"><?php echo $perfil['nombrePerfil'] ?></option>
						  <?php
					} 
				?>

      </select>  <label for="perfileshoras">perfil</label>     </td>
    <td class="texto1"><input name="impHoras" type="text" size="10" value="<?php echo $importeHoras;?>" class="textarea"  />€</td>
  </tr>
  <tr>
    <td class="texto1">
      <input name="km" type="text" class="textarea" id="km2" size="8" value="<?php echo $numKilometros; ?>">
      km.    <select name="perfileskm" id="perfileskm" class="textarea">
        <option value="0">Escoja perfil:</option>
				          <?php 
						  $link=conectar(leerHost());
			$sql = "SELECT * from kilometraje";
			$r = mysql_query($sql);
					while($perfil=mysql_fetch_array($r,MYSQL_ASSOC))
					{
						  ?>
						  <option value="<?php echo $perfil['idKilometraje'] ?>"><?php echo $perfil['nombreKilometraje'] ?></option>
						  <?php
					} 
				?>
      </select>  <label for="perfileskm">perfil</label>
      </td>
    <td class="texto1"><input name="importeKm" type="text" size="10" value="<?php echo $importeKm;?>" class="textarea"  />€</td>
  </tr>
  <tr>
    <td class="texto1">Descuento:</td>
    <td class="texto1"><input name="descuento" type="text" class="textarea" id="descuento" size="10" maxlength="20" value="<?php echo $descuento; ?>">&euro;</td>
  </tr>
  <tr>
    <td class="texto1">Base Imponible: </td>
    <td class="texto1"><input name="baseinmpo" type="text" class="textarea" id="baseinmpo" size="10" maxlength="20" value="<?php echo $importeTotal; ?>"/>&euro;</td>
  </tr>
  <tr>
    <td colspan="2" class="botones">
    <input name="maquinas" type="submit" class="botones" id="maquinas" value="Máquinas"/>
      <input name="materiales" type="submit" class="botones" id="materiales" value="Materiales" />
      <input name="recalcular" type="submit" class="botones" id="recalcular" value="Recalcular" />      
      <input name="modificar" type="submit" class="botones" id="modificar" value="Modificar" />
	  <input name="volver" type="submit" class="botones" id="volver" value="Volver" /></td>
  </tr></form>
</table>
</body>
</html>
