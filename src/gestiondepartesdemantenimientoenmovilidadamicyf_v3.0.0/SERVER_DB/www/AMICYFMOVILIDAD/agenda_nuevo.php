<?php
		session_start();
         if (!isset($_SESSION['idTecnico'])) {
                header("Location:index.php");
                exit();
        }
        else
       {
		include('bd.php');
		$link=conectar(leerHost());
	/*	if (tieneAccesoAPlanificador($_SESSION['idTecnico'],leerHost())==1)
		{
		include ("calendario/calendario.php");
		}else{
		header("Location:correctivos.php");
		}*/
		
      }
	  
	 
	  	
			$filaTecnico = obtenerTecnico($_SESSION['idTecnicoMostrar'],leerHost());
	 
	  
	  
	  
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
  <tr> 
            <td class="textizqsin"> Agenda:						   </td>
    </tr>
    <tr><td>
    
    <table width="240" border="1" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textopeqneg">Horario</td>
        <td width="50%" class="textopeqneg">Instalación</td>
        <td width="50%" class="textopeqneg">Dirección</td>
        <td width="50%" class="textopeqneg">Teléfono</td>        
      </tr>
<?php 
	   $link=conectar(leerHost());
	   $sql ="select * from incidencia where Tecnico_idTecnico = ".$_SESSION['idTecnicoMostrar']." and fechaEntrada = '".fechamysql($_SESSION['fecha'])."' order by horaIncidencia ASC";
	   $rCol = mysql_query($sql);
	   while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  	$instalacion = obtenerInstalacion($filaCol['Instalacion_idInstalacion']);
			/*if ($filaCol['preventivo']==1) {
			
			$filaPreventivo=obtenerPreventivo($filaCol['idMantenimiento']);
			if (haSidoRellenado($filaCol['idMantenimiento'])==true)
			$mostrar = false;
			else $mostrar = true;
			}
			else {
				$filaCorrectivo=obtenerCorrectivo($filaCol['idMantenimiento']);			
				if ($filaCorrectivo['solucionCorrectivo']=="")
					{
					$mostrar = true;
					}
			}*/
        	//if ($mostrar){
?>
     		 <tr bordercolor="#000000">
        		<td class="textopeq"><a href="procesarIncidencia.php?idIncidencia=<?php echo $filaCol['idIncidencia']?>"><?php echo $filaCol['horaIncidencia'];?></a></td>
				<td class="textopeq"><?php echo $instalacion['nombreInstalacion'];?></td>
				<td class="textopeq"><?php echo $instalacion['direccion'];?></td>
				<td class="textopeq"><?php echo $instalacion['telefonoContactoInstalacion'];?></td>
        
      		</tr>
<?php 
			//} 
		}
?>
    </table>
    
    </td></tr>
   


</table>
</form>
</body>
</html>
