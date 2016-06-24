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
	  $sql ="select * from mantenimiento where idTecnico = ".$_SESSION['idTecnico'] ." order by fechaMantenimiento DESC";
	  $rCol = mysql_query($sql);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<title>Preventivos</title>
</head>

<body><table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <tr>
    <td><span class="textopeq"><a href="instalaciones.php">Instalaciones</a> &nbsp;</span><span class="textopeqneg"> Preventivos</span> <span class="textopeq"><a href="correctivos.php">Correctivos</a>&nbsp;</span><span class="textopeq"><a href="planificador.php">Planificador</a>&nbsp;</span>
	<a href="salir2.php">Salir</a>
	<br />
    <br /></td>
  </tr>
  <tr>
    <td align="center" valign="middle" class="margen">
	 
	<table width="240" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textopeqneg">M&aacute;quina</td>
        <td width="50%" class="textopeqneg">Fecha</td>
        <td width="50%" class="textopeqneg">N&ordm;</td>
        <td width="50%" class="textopeqneg">Inst.</td>
<!--        <td width="50%" class="textopeqneg">Cliente</td> -->
      </tr>
	  <?php 
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  	if (!haSidoRellenado($filaCol['idMantenimiento']))
			{
				
		  		$filaMaquina=obtenerMaquina($filaCol['idMaquina']);
		  		$filaInstalacion=obtenerInstalacion($filaMaquina['idInstalacion']);
				$filaCliente=obtenerCliente($filaInstalacion['idCliente']);
        ?>
      <tr>
        <td class="textopeq"><?php echo $filaMaquina['nombreMaquina'];?></td>
        <td class="textopeq"><?php if (fechaAqui($filaCol['fechaMantenimiento'])!="01/01/1911") echo fechaAqui($filaCol['fechaMantenimiento']); else echo ("");?></td>
        <td class="textopeq"><a href="vermantenimiento.php?origen=preventivos&idMantenimiento=<?php echo $filaCol['idMantenimiento']?>"><?php echo $filaCol['idMantenimiento'] ?></a></td>
        <td class="textopeq"><a href="verinstalacion.php?origen=preventivos&amp;idInstalacion=<?php echo $filaInstalacion['idInstalacion']?>"><?php echo $filaInstalacion['nombreInstalacion'] ?></a></td>
<!--        <td class="textopeq"><a href="vercliente.php?origen=preventivos&amp;idCliente=<?php echo $filaCliente['idCliente']?>"><?php echo $filaCliente['nombreCliente']?></a></td> -->
      </tr>
	  	<?php } 
		}?>
    </table>
	</td>
  </tr>
</table>

</body>
</html>
