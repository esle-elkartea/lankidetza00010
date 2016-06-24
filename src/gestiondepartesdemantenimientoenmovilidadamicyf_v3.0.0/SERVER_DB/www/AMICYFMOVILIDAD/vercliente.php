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
   
   if (isset($_GET['idCliente'])) {
               $_SESSION['idCliente'] = $_GET['idCliente'];
			   $_SESSION['origen'] = $_GET['origen'];
			   
   }
	$filaCliente=obtenerCliente($_SESSION['idCliente']);
	$filaLocalidad=obtenerLocalidad($filaCliente['idLocalidad']);
	$filaProvincia=obtenerProvincia($filaLocalidad['idProvincia']);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ver Cliente</title>
<link href="estilos.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="230px"><tr><td align="right"><a href="salir.php">Salir</a></td></tr></table>
<table width="220px" border="0" cellpadding="0" cellspacing="0" class="contenedor"><form action="vercliente.php" method="post">
  <tr>
    <td colspan="2" class="texto1">        <p>Detalles Cliente:</p>
      <p>&nbsp;</p></td>
    </tr>
  <tr>
    <td width="115"><span class="texto1">Fecha de Alta: <br />
    </span></td>
    <td width="125"><input name="fecha alta" type="text" class="textarea" id="fecha alta" size="15" maxlength="20" value=<?php if (fechaAqui($filaCliente['fechaAltaCliente'])!="01/01/1911") echo fechaAqui($filaCliente['fechaAltaCliente']); else echo (""); ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">Nombre (Raz&oacute;n Social): <br />
    </span></td>
    <td><input name="razon social" type="text" class="textarea" id="razon social" size="15" maxlength="30" value=<?php echo $filaCliente['nombreCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">N.I.F.:<br />
    </span></td>
    <td><input name="NIF" type="text" class="textarea" id="NIF" size="15" maxlength="30" value=<?php echo $filaCliente['nifCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">Direcci&oacute;n:<br />
    </span></td>
    <td><input name="direccion" type="text" class="textarea" id="direccion" size="15" maxlength="40" value=<?php echo $filaCliente['direccionCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">C.P.:<br />
    </span></td>
    <td><input name="CP" type="text" class="textarea" id="CP" size="15" maxlength="30" value=<?php echo $filaCliente['cpCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">Provincia:<br />
    </span></td>
    <td><input name="provincia" type="text" class="textarea" id="provincia" size="15" maxlength="30" value=<?php echo $filaProvincia['nombreProvincia']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">Localidad:<br />
    </span></td>
    <td><input name="localidad" type="text" class="textarea" id="localidad" size="15" maxlength="30" value=<?php echo $filaLocalidad['nombreLocalidad']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">Tel&eacute;fono:<br />
    </span></td>
    <td><input name="telefono" type="text" class="textarea" id="telefono" size="15" maxlength="30" value=<?php echo $filaCliente['telefonoCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">M&oacute;vil:<br />
    </span></td>
    <td><input name="movil" type="text" class="textarea" id="movil" size="15" maxlength="30" value=<?php echo $filaCliente['movilCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">E-mail:<br />
    </span></td>
    <td><input name="email" type="text" class="textarea" id="email" size="15" maxlength="30" value=<?php echo $filaCliente['mailCliente']; ?>></td>
  </tr>
  <tr>
    <td><span class="texto1">Fax:<br />
    </span></td>
    <td><input name="fax" type="text" class="textarea" id="fax" size="15" maxlength="30" value=<?php echo $filaCliente['faxCliente']; ?>></td>
  </tr>
  <tr>
    <td class="texto1">N&ordm; Cuenta: </td>
    <td><input name="cuenta" type="text" class="textarea" id="cuenta" size="15" maxlength="30" value=<?php echo $filaCliente['numCuentaCliente']; ?>></td>
  </tr>
  <tr>
    <td class="texto1">Observaciones:</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" class="centrar"><textarea name="observaciones" cols="50" rows="4" class="textarea" id="observaciones"><?php echo $filaCliente['observaciones']; ?></textarea></td>
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
