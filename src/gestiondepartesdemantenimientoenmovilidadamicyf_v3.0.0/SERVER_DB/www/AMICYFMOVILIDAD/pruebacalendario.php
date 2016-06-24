<?
///////////////////////////////////////////////////////////////////////////////////////////////
//Libreria para mostrar un calendario y obtener una fecha
//
//La página que llame a esta libreria debe contener un formulario con tres campos donde se introducirá el día el mes y el año que se desee
//Para que este calendario pueda actualizar los campos de formulario correctos debe recibir varios datos (por GET)
//formulario (con el nombre del formulario donde estan los campos
//dia (con el nombre del campo donde se colocará el día)
//mes (con el nombre del campo donde se colocará el mes)
//ano (con el nombre del campo donde se colocará el año)
///////////////////////////////////////////////////////////////////////////////////////////////
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Calendario PHP</title>
	<link rel="STYLESHEET" type="text/css" href="calendario/estilo.css">
 <script language="JavaScript" type="text/JavaScript">
		function devuelveFecha(dia,mes,ano){
			//Se encarga de escribir en el formulario adecuado los valores seleccionados
			//también debe cerrar la ventana del calendario
			var formulario_destino = 'prueba'
			
			var campo_destino = 'fecha'
					
			//meto el dia
			eval ("this.document." + formulario_destino + "." + campo_destino + ".value='" + dia + "/" + mes + "/" + ano + "'")
			
		}
	</script>
</head>

<body>
<form action="pruebacalendario" method="post" id="prueba" name="prueba">
<div align="center">
<?

function aHttps($s)
{
 $t="";
   $t= str_replace( "&","&amp;",$s);
   
  
  return $t;
}
//TOMO LOS DATOS QUE RECIBO POR LA url Y LOS COMPONGO PARA PASARLOS EN SUCESIVAS EJECUCIONES DEL CALENDARIO
$parametros_formulario = aHttps("formulario=" . $_GET["formulario"] . "&nomcampo=" . $_GET["nomcampo"]);
?>


<?
require ("calendario/calendario.php");
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

<input name="fecha" type="text">
</div>
</form>
</body>
</html>