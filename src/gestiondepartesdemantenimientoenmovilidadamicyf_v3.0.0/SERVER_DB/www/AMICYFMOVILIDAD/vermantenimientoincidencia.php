<?php
   session_start();
   if (!isset($_SESSION['idTecnico'])) {
				header("Location:index.php");
               exit();
   }
   if ($_POST['volver']=="Volver")
   {
   		header("Location:agenda_nuevo.php");
   }
   require_once("bd.php");
   $link=conectar(leerHost());
   if (isset($_GET['idMantenimiento'])) {
               $_SESSION['idMantenimiento'] = $_GET['idMantenimiento'];
			   $_SESSION['origen'] = $_GET['origen'];
   }
   $filaPreventivo=obtenerPreventivo($_SESSION['idMantenimiento']);

   $frecuenciaMantenimiento=$filaPreventivo['frecuenciaMantenimiento'];
   $fechaMantenimiento=fechaAqui($filaPreventivo['fechaMantenimiento']);
   $numHoras=$filaPreventivo['horasCorrectivo'];
   $numKilometros=$filaPreventivo['kmCorrectivo'];
  $importeHoras = obtenerCosteHoras($numHoras,$_POST['perfileshoras']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$_POST['perfileskm']);
//   $descuento=$filaPreventivo['descuentoCorrectivo'];
   //$importeTotal=$filaPreventivo['importeCorrectivo'];
   $horaEntrada=$filaPreventivo['horaEntrada'];
   $horaSalida=$filaPreventivo['horaSalida'];
   $horaEntrada=substr($horaEntrada,0,5);
   $horaSalida=substr($horaSalida,0,5);
   $tiempoEstimadoCorrectivo = $filaPreventivo['tiempoEstimado'];
   
   $sql ="SELECT * FROM mantenimiento m, maquina mq, protocolo_mantenimientos p WHERE m.idMantenimiento = ".$_SESSION['idMantenimiento']." and mq.idMaquina=m.idMaquina and mq.idProtocolo = p.idProtocolo and p.frecuenciaProtocolo_Mantenimientos = ".$frecuenciaMantenimiento;
	$rCol = mysql_query($sql);
   
   if ($_POST['recalcular']=="Recalcular")
   {
   		
   		$tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		$numHoras=$_POST['horas'];
   		$numKilometros=$_POST['km'];
   		//$descuento=$_POST['descuento'];
		//$importeTotal=$_POST['baseinmpo'];
		$horaEntrada=$_POST['horaEntrada'];
		$horaSalida=$_POST['horaSalida'];
   		$importeHoras = obtenerCosteHoras($numHoras,$_POST['perfileshoras']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$_POST['perfileskm']);
		//$importeTotal=$_POST['dispSalida']+$_POST['impMateriales']+$importeHoras+$importeKm-$descuento;
   }
			 
   if ($_POST['modificar']=="Modificar")
   {
   		$tiempoEstimadoCorrectivo = $_POST['tiempoEstimado'];
		$numHoras=$_POST['horas'];
   		$numKilometros=$_POST['km'];
   		//$descuento=$_POST['descuento'];
		//$importeTotal=$_POST['baseinmpo'];
		
		$horaEntrada=$_POST['horaEntrada'];
		$horaSalida=$_POST['horaSalida'];
   		$importeHoras = obtenerCosteHoras($numHoras,$_POST['perfileshoras']);
   		$importeKm=obtenerCosteKilometros($numKilometros,$_POST['perfileskm']);
		$importeTotal=$importeHoras+$importeKm;
		$sql1 = "update mantenimiento set importeMantenimiento = ".$importeTotal.", tiempoEstimado = ".$tiempoEstimadoCorrectivo.", horasMantenimiento=".$numHoras.", kmMantenimiento=".$numKilometros.", horaEntrada='".$horaEntrada."', horaSalida='".$horaSalida."' where idMantenimiento=".$_SESSION['idMantenimiento'];
		
		if (@mysql_query($sql1)){
   		while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
        {
				$traduccion = array(" " => "_");
		  		$post = strtr($filaCol['nombreProtocolo_Mantenimientos'], $traduccion);
				$sql = "update maquina_mantenimientos set valorMaquina_Mantenimientos ='".$_POST[$post]."' where idProtocolo_Mantenimientos = ".$filaCol['idProtocolo_Mantenimientos']." and idMantenimiento = ".$filaCol['idMantenimiento']."";
				
				if (@mysql_query($sql)){
				}else{
				}	 
		}
		
		header("Location:ver_partePreventivo.php?origen=vermantenimiento&vueltaorigen=".$_SESSION['origen']."&idMantenimiento=".$_SESSION['idMantenimiento']);
		}
		else{
		}
   }
			 
   
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ver Mantenimiento</title>
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>

<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor"><form action="vermantenimientoincidencia.php" method="post">
  <tr>
    <td width="115"><span class="texto1">Frecuencia:<br />
    </span></td>
    <td width="125"><?php echo $frecuenciaMantenimiento; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Fecha:<br />
    </span></td>
    <td><input name="fecha" type="text" class="textarea" id="fecha" size="15" maxlength="30" value=<?php echo $fechaMantenimiento; ?>></td>
  </tr>
   <tr>
    <td class="texto1">Tiempo Estimado: </td>
    <td class="textizqsin"><input name="tiempoEstimado" type="text" class="textarea" size="10"  value ="<?php echo $tiempoEstimadoCorrectivo; ?>"></td>
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
    <td colspan="2" class="centrar"><br />
      <table height="65" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textizqnegrita">Mantenimi.</td>
        <td class="textizqnegrita">Valor</td>
		<td class="textizqnegrita">Puesta Marcha</td>
      </tr>
	  
      <?php 
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		   $traduccion = array(" " => "_");
    	   $name = strtr($filaCol['nombreProtocolo_Mantenimientos'], $traduccion);
		   $idMaquina = $filaCol['idMaquina'];
		   $idProtocoloMantenimiento = $filaCol['idProtocolo_Mantenimientos'];
		   $consulta = "SELECT * FROM protocolo_mantenimientos p, puestaenmarcha pu WHERE p.idProtocolo_Mantenimientos = ".$idProtocoloMantenimiento." and p.idProtocolo_Mantenimientos=pu.idProtocolo_Mantenimientos and p.frecuenciaProtocolo_Mantenimientos = ".$frecuenciaMantenimiento." and idMaquina = ".$idMaquina;
		   $filasPuestaEnMarcha = mysql_query($consulta);
		   $valorPuestaEnMarcha = "";
		   while ($filaPuestaEnMarcha=mysql_fetch_array($filasPuestaEnMarcha,MYSQL_ASSOC))
		   {
		   		if ($filaCol['nombreProtocolo_Mantenimientos']==$filaPuestaEnMarcha['nombreProtocolo_Mantenimientos'])
				{
					$valorPuestaEnMarcha = $filaPuestaEnMarcha['valorpuestaenmarcha'];
				}
		   }
        ?>
      <tr>
        <td class="textizqborde"><?php echo $filaCol['nombreProtocolo_Mantenimientos'] ?></td>
        <td class="textizqborde"><input name="<?php echo $name ?>" type="text" size = "10" value="<?php if (isset($_POST[$name])) {echo $_POST[$name];}else {echo "";}?>"/></td>
		<td class="textizqborde"><?php echo $valorPuestaEnMarcha; ?></td>
      </tr>
	  <?php } ?>
    </table></td>
  </tr>
  <tr>
    <td colspan="3" class="botones">
   <input type="submit" class="botones" name="modificar" value="Modificar" />
      <input name="recalcular" type="submit" class="botones" id="recalcular" value="Recalcular" />
    <input name="volver" type="submit" class="botones" id="volver" value="Volver" /></td>
  </tr>
</form>
</table>
<p class="texto1">&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>