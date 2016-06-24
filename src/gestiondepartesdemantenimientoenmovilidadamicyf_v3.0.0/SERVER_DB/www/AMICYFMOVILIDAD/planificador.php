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
		include ("calendario/calendario.php");
		if (tieneAccesoAPlanificador($_SESSION['idTecnico'],leerHost())==1)
		{
			//include ("calendario/calendario.php");
		}else{
			header("Location:correctivos.php");
		}
      }
	  
	  if ($_POST['siguiente']=="Siguiente")
	  {
	 
	  	if ($_POST['fecha']!="")
		{
			$_SESSION['fecha']=$_POST['fecha'];
			header("Location:tecnicos.php");
		}
		else 
		{
			header("Location:planificador.php");
		}
	  }
	  
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
<link rel="STYLESHEET" type="text/css" href="calendario/estilo.css">
 <script language="JavaScript" type="text/JavaScript">
		function devuelveFecha(dia,mes,ano){
			//Se encarga de escribir en el formulario adecuado los valores seleccionados
			//también debe cerrar la ventana del calendario
			var formulario_destino = 'planificador'
			
			var campo_destino = 'fecha'
					
			//meto el dia
			eval ("this.document." + formulario_destino + "." + campo_destino + ".value='" + dia + "/" + mes + "/" + ano + "'")
			
		}
	</script>
<title>Planificador - Calendario</title>
</head>

<body>

<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
<form action="planificador.php" name="planificador" method="post" id="planificador">
  <tr>
    <td><span class="textopeq"><a href="instalaciones.php">Instalaciones</a> &nbsp;</span><span class="textopeq"><a href="preventivos.php">Preventivos</a> &nbsp;</span><span class="textopeq"><a href="correctivos.php">Correctivos</a>&nbsp;</span><span class="textopeqneg">Planificador&nbsp;</span>
	<a href="salir2.php">Salir</a>
	<br />
    <br /></td>
  </tr>
  <tr>
    <td align="center" valign="middle" class="textizqnegrita">
	 Detalle Consulta	</td>
  </tr>
  
  <tr>
    <td><span class="textopeqneg">Calendario&nbsp;</span><span class="textopeq"><a href="#">Tecnicos</a> &nbsp;</span><span class="textopeq"><a href="#">Agenda</a>&nbsp;</span><a href="planificador.php">Limpiar</a></td>
  </tr>
  <tr> 
            <td class="textizqsin"> Fecha:
              <?php
								/*escribe_formulario_fecha_vacio("fecha","planificador");*/
								?>
						
      </td>
    </tr>
    <tr><td>
    
    <div align="center">
<?php

function aHttps($s)
{
 	$t="";
   	$t= str_replace( "&","&amp;",$s);
  	return $t;
}
//TOMO LOS DATOS QUE RECIBO POR LA url Y LOS COMPONGO PARA PASARLOS EN SUCESIVAS EJECUCIONES DEL CALENDARIO
$parametros_formulario = aHttps("formulario=" . $_GET["formulario"] . "&nomcampo=" . $_GET["nomcampo"]);
?>


<?php

$tiempo_actual = time();
$dia_solo_hoy = date("d",$tiempo_actual);
if (!$_POST && !isset($_GET["nuevo_mes"]) && !isset($_GET["nuevo_ano"])){
	$mes = date("n", $tiempo_actual);
	$ano = date("Y", $tiempo_actual);
}elseif ($_POST) {
	$mes = $_POST["nuevo_mes"];
	$ano = $_POST["nuevo_ano"];
}else{
	$mes = $_GET["nuevo_mes"];
	$ano = $_GET["nuevo_ano"];
}
	
mostrar_calendario($mes,$ano);



?>

<input name="fecha" type="text" class="textizqborde">
</div>
    
    </td></tr>
    <tr><td>
    <input class="botones" name="siguiente" type="submit" value="Siguiente" id="siguiente" />
    </td></tr>

</form>
</table>


</body>
</html>