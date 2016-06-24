<?php
    session_start();
	if (!isset($_SESSION['idTecnico'])) {
		header("Location:index.php");
		exit();
	}
    else{
		include('bd.php');
		$link=conectar(leerHost());
    }
	$sql ="select * from correctivo where idTecnico = ".$_SESSION['idTecnico'] ." and fechaCierrecorrectivo = '1911-01-01' and solucionCorrectivo = '' and importeCorrectivo = 0 order by fechaAceptacionCorrectivo DESC";
	$rCol = mysql_query($sql);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<title>Correctivos</title>
</head>

<body><table width="220px" border="0" cellpadding="0" cellspacing="0" class="contenedor">

  <tr>
    <td><span class="textopeq"><a href="instalaciones.php">Instalaciones</a>&nbsp;</span> <span class="textopeq"><a href="preventivos.php">Preventivos</a>&nbsp;</span><span class="textopeqneg">&nbsp;Correctivos </span><span class="textopeq"><a href="planificador.php">Planificador</a>&nbsp;</span>
	<a href="salir2.php">Salir</a>
	<br />
    <br /></td>
  </tr>
  <tr>
    <td align="center" valign="middle" class="margen"><table width="240" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textopeqneg">N&uacute;mero</td>
        <td class="textopeqneg">Fecha Apertura </td>
        <td class="textopeqneg">Instalaci&oacute;n</td>
<!--        <td class="textopeqneg">Cliente</td> -->
      </tr>
	   <?php 
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  		$filaInstalacion=obtenerInstalacion($filaCol['idInstalacion']);
				$filaCliente=obtenerCliente($filaInstalacion['idCliente']);
        ?>
      <tr>
        <td class="textopeq"><a href="vercorrectivo.php?origen=correctivos&idCorrectivo=<?php echo $filaCol['idCorrectivo']?>"><?php echo $filaCol['idCorrectivo'] ?></a></td>
        <td class="textopeq"><?php if (fechaAqui($filaCol['fechaAceptacionCorrectivo'])!="01/01/1911") echo fechaAqui($filaCol['fechaAceptacionCorrectivo']); else echo (""); ?></td>
        <td class="textopeq"><a href="verinstalacion.php?origen=correctivos&idInstalacion=<?php echo $filaCol['idInstalacion']?>"><?php echo $filaInstalacion['nombreInstalacion'] ?></a></td>
<!--        <td class="textopeq"><a href="vercliente.php?origen=correctivos&idCliente=<?php echo $filaCliente['idCliente']?>"><?php echo $filaCliente['nombreCliente']?></a></td> -->
      </tr>
	    <?php } ?>
    </table></td>
  </tr>
  
  
  
</table>

</body>
</html>
