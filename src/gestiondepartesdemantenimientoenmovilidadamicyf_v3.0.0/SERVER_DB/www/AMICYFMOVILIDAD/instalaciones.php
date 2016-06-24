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
      }
	  if(isset($_GET["defecto"]) && $_GET["defecto"] == 1){
	  	$sql ="select * from instalacion where idTecnico = ".$_SESSION['idTecnico'] ." OR idTecnico = 3 order by idCliente, fechaAltaInstalacion";
	  }
	  else{
	  	$sql ="select * from instalacion where idTecnico = ".$_SESSION['idTecnico'] ." order by idCliente, fechaAltaInstalacion";
	  }
	  $rCol = mysql_query($sql);
	  $altcolor = 1;
	  ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<title>Instalaciones</title>
</head>

<body><table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <tr>
    <td><span class="textopeqneg">Instalaciones</span> <span class="textopeq"><a href="preventivos.php">Preventivos</a>&nbsp;</span> <span class="textopeq"><a href="correctivos.php">Correctivos</a>&nbsp;</span>
<span class="textopeq"><a href="planificador.php">Planificador</a>&nbsp;</span>	<a href="salir2.php">Salir</a>
    <br /></td>
	
  </tr>
  <tr>
    <td style="font-size:9px"><br/><span style="width:5px; height:5px; border:1px #000000 solid; background-color:#FFDFDF">&nbsp;&nbsp;&nbsp;&nbsp;</span><span> Sin tecnico asignado. </span> <?php echo !isset($_GET["defecto"])? '<a href="instalaciones.php?defecto=1">mostrar</a>':'<a href="instalaciones.php">ocultar</a>'; ?></td>
  </tr>
  <tr>
    <td class="centrar"><br />
      <table width="98%" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textopeqneg">Instalaci&oacute;n</td>
<!--	        <td class="textopeqneg">Cliente / Teléfono  </td> -->
        <td class="textopeqneg">Fecha Alta </td>
      </tr>
	  
	  <?php 
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
				$filaCliente=obtenerCliente($filaCol['idCliente']);
				$color = ($altcolor%2)?"background-color:#FFFFFFF":"background-color:#C6DFF2";
        ?>
              <tr>
        		<td class="textopeq" style=" <?php if($filaCol['idTecnico'] == 3) echo "background-color:#FFDFDF"; else echo $color;  ?>"><a href="verinstalacion.php?origen=instalaciones&idInstalacion=<?php echo $filaCol['idInstalacion'] ?>"><?php echo $filaCol['nombreInstalacion'] ?></a></td>
<!--		        <td class="textopeq"><a href="vercliente.php?origen=instalaciones&idCliente=<?php echo $filaCol['idCliente'] ?>"><?php echo $filaCliente['nombreCliente']; ?></a></td> -->
<!--					<td class="textopeq"><?php echo $filaCliente['nombreCliente']. " / " . $filaCliente['telefonoCliente']; ?></td>-->
		        <td class="textopeq" style=" <?php if($filaCol['idTecnico'] == 3) echo "background-color:#FFDFDF"; else echo $color;   ?>"><?php if (fechaAqui($filaCol['fechaAltaInstalacion'])!="01/01/1911") echo fechaAqui($filaCol['fechaAltaInstalacion']); else echo (""); ?></td>
		      </tr>
        <?php 
				$altcolor++;
		} ?>
	  
      
    </table></td>
  </tr>
  <tr>
    <td class="botones"></td>
  </tr>
  
</table>

</body>
</html>
