<?php
   session_start();
   require_once("bd.php");
   if (!isset($_SESSION['idTecnico'])) {
		header("Location:index.php");
        exit();
   }
   if ($_POST['volver1']=="Volver")
   {
   		header("Location:".$_SESSION['origen'].".php?origen=".$_SESSION['vueltaorigen']."&objeto=correctivo");
   }
   //Se ejecuta cuando pulsas Aceptar
   if ($_POST['Aceptar']=="Aceptar")
   {
   		if (isset($_SESSION['maquinasCorrectivoInicial'])) {
			$maquinasCorrectivoInicial=$_SESSION['maquinasCorrectivoInicial'];//$_GET['maquinasCorrectivoInicial'];
		}

		for($i=0;$i<count($maquinasCorrectivoInicial);$i++)
		{
			$box = $maquinasCorrectivoInicial[$i];
			if ($_POST[$box]=="on")
			{
				$maquinasCorrectivo[] = $maquinasCorrectivoInicial[$i];
			}
		}
		actualizarMaquinasCorrectivo($maquinasCorrectivo,$maquinasCorrectivoInicial,$_SESSION['idCorrectivo']);
		header("Location:".$_SESSION['origen'].".php?origen=".$_SESSION['vueltaorigen']."&objeto=correctivo");
   }
   
   //require_once("bd.php");
   $link=conectar(leerHost());
   
   if (isset($_GET['idCorrectivo'])) {
               $_SESSION['idCorrectivo'] = $_GET['idCorrectivo'];
			   $_SESSION['origen'] = $_GET['origen'];
			   $_SESSION['vueltaorigen'] = $_GET['vueltaorigen'];
   }
   		$filaMaquinasInstalacion=obtenerMaquinasInstalacion($_SESSION['idCorrectivo']);
		$filaMaquinasCorrectivo=obtenerMaquinasCorrectivo($_SESSION['idCorrectivo']);
		while ($filaC=mysql_fetch_array($filaMaquinasCorrectivo,MYSQL_ASSOC))
		{
		$idsMaquinasCorrectivo[]=$filaC['idMaquina'];
		}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<title>Modificar M&aacute;quinas</title>
</head>

<body><table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
 <form action="modifi_maquinas.php" method="post">
 <tr><td align="right"><a href="salir.php">Salir</a></td></tr>

   <tr>
    <td width="184" align="center" valign="middle">
      <table width="90%" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td width="65%" class="textizqnegrita">M&aacute;quinas Instalaci&oacute;n</td>
        <td width="35%" class="textizqnegrita">M&aacute;quinas Correctivo </td>
      </tr>
	    <?php 
		while($filaCol=mysql_fetch_array($filaMaquinasInstalacion,MYSQL_ASSOC))
   {
   		
   ?>
      <tr>
        <td  class="textizq"><?php echo $filaCol['nombreMaquina']?></td>
        <td  class="textopeq">
		
		<input name="<?php echo $filaCol['idMaquina']?>" type="checkbox" id="<?php echo $filaCol['idMaquina']?>" value="on" 
		
		<?php 
		$checked = false;
		for ($i=0;$i<count($idsMaquinasCorrectivo);$i++)
		{
				if ($filaCol['idMaquina']==$idsMaquinasCorrectivo[$i]) $checked=true;
		}
		
		if ($checked) echo "checked='checked'";
		?>
/>		
		</td>
      </tr>
	  <?php 
	  $maquinasCorrectivoInicial[]= $filaCol['idMaquina'];
	  
	  } $_SESSION['maquinasCorrectivoInicial']=$maquinasCorrectivoInicial;/*=array_envia($maquinasCorrectivoInicial);*/
	  ?>
    </table></td>
    </tr>
  <tr>
    <input name="maquinasCorrectivoInicial" type="hidden" value="$maquinasCorrectivoInicial"><td class="botones">
      <input name="Aceptar" type="submit" class="botones" id="Aceptar" value="Aceptar" /><input name="volver1" type="submit" class="botones" id="volver1" value="Volver" /></td>
  </tr>
  </form>
</table>
</body>
</html>
