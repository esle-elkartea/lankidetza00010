<?php
   session_start();
   if (!isset($_SESSION['idTecnico'])) {
                header("Location:index.php");
               exit();
   }
   if ($_POST['volver']=="Volver")
   {
   		header("Location:".$_SESSION['origen'].".php");
   }
   require_once("bd.php");
   $link=conectar(leerHost());
   
   if (isset($_GET['idInstalacion'])) {
               $_SESSION['idInstalacion'] = $_GET['idInstalacion'];
			   $_SESSION['origen'] = $_GET['origen'];
   }
   $sql="select * from instalacion where idInstalacion='".$_SESSION['idInstalacion']."'";
   $r=mysql_query($sql);
   $filaInstalacion=mysql_fetch_array($r,MYSQL_ASSOC);
   if ($filaInstalacion['proyectoInstalacion']=="1")$tpm=1;
              else $tpm = 0;
	$filaCliente=obtenerCliente($filaInstalacion['idCliente']);
	$filaLocalidad=obtenerLocalidad($filaInstalacion['idLocalidad']);
	$filaProvincia=obtenerProvincia($filaLocalidad['idProvincia']);
	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ver Instalaci&oacute;n</title>
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="230px"><tr><td align="right"><a href="salir.php">Salir</a></td></tr></table>
<table width="220px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <form action="verinstalacion.php" method="post">
  <tr>
    <td width="115"><span class="texto1">Proyecto:<br />
    </span></td>
    <td width="125">
                        <?php if ($tpm) {?>
                        <input type="checkbox" name="proyecto" value="on" disabled checked> 
                        <?php } else { ?>
                        <input type="checkbox" name="proyecto" value="off" disabled> 
                        <?php }?></td>
  </tr>
  <tr>
    <td><span class="texto1">N&uacute;mero Registro:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['numeroRegistroInstalacion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Fecha Alta:<br />
    </span></td>
    <td class="textizqsin"><?php if (fechaAqui($filaInstalacion['fechaAltaInstalacion'])!="01/01/1911") echo fechaAqui($filaInstalacion['fechaAltaInstalacion']); else echo ("");?></td>
  </tr>
  <tr>
    <td><span class="texto1">Nombre:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['nombreInstalacion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Cliente:<br />
    </span></td>
    <td class="textizqsin"><?php echo  $filaCliente['nombreCliente']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Contacto:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['contactoInstalacion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Tel&eacute;fono:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['telefonoContactoInstalacion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Administrador:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['administradorInstalacion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Tel&eacute;fono:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['telefonoAdministradorInstalacion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">C.P.:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['cp']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Direcci&oacute;n:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaInstalacion['direccion']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Provincia:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaProvincia['nombreProvincia']; ?></td>
  </tr>
  <tr>
    <td><span class="texto1">Localidad:<br />
    </span></td>
    <td class="textizqsin"><?php echo $filaLocalidad['nombreLocalidad']; ?></td>
  </tr>
  <tr>
    <td class="texto1">Observaciones:</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="textizqsin"><?php echo $filaInstalacion['observaciones']; ?></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td class="botones"><span class="texto1">
      <input name="volver" type="submit" class="botones" id="volver" value="Volver" />
    </span></td>
  </tr>
</form>
</table>
<p class="texto1">&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
