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
       }
	  
	 
	  	if (isset($_GET['idTecnico']))
		{
		$_SESSION['idTecnicoMostrar']=$_GET['idTecnico'];
			header("Location:agenda_nuevo.php");
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
<title>Planificador - Técnicos</title>
</head>

<body>
<form action="tecnicos.php" name="tecnicos" method="post">
<table width="230px" border="0" cellpadding="0" cellspacing="0" class="contenedor">
  <tr>
    <td><span class="textopeq"><a href="instalaciones.php">Instalaciones</a> &nbsp;</span><span class="textopeq"><a href="preventivos.php">Preventivos</a> &nbsp;</span><span class="textopeq"><a href="correctivos.php">Correctivos</a>&nbsp;</span><span class="textopeqneg">Planificador&nbsp;</span>
	<a href="salir2.php">Salir</a>
	<br />
    <br /></td>
  </tr>
  <tr>
    <td align="center" valign="middle" class="textizqnegrita">
	 Detalle Consulta | Fecha: <?php echo $_SESSION['fecha'];?>	</td>
  </tr>
  
  <tr>
    <td><span class="textopeq"><a href="#">Calendario</a> &nbsp;</span><span class="textopeqneg">Técnicos</span><span class="textopeq"><a href="#.php">Agenda</a>&nbsp;</span><a href="planificador.php">Limpiar</a></td>
  </tr>
  <tr> 
            <td class="textizqsin"> Tecnicos:						   </td>
    </tr>
    <tr><td>
    
    <table width="240" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textopeqneg">Técnico</td>
        <td width="50%" class="textopeqneg">Horas Totales</td>
        <td width="50%" class="textopeqneg">Horas Asignadas</td>
      </tr>
	  <?php 
	  $link=conectar(leerHost());
	   
	   
	   if (tieneAccesoAPlanificador($_SESSION['idTecnico'],leerHost())==1)
		{
		$sql ="select * from tecnico";
		}else{
		$sql = "select * from tecnico where idTecnico = ".$_SESSION['idTecnico'];
		}
	   
	  $rCol = mysql_query($sql);
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  	
        ?>
      <tr>
        <td class="textopeq"><a href="tecnicos.php?idTecnico=<?php echo $filaCol['idTecnico']?>"><?php echo $filaCol['nombreTecnico'];?></a></td>
        <td class="textopeq"><?php echo $filaCol['Horas'];?></td>
        <td class="textopeq"><?php echo obtenerHorasTecnico($filaCol['idTecnico'], $_SESSION['fecha'],leerHost());?></td>
        
      </tr>
	  	<?php } 
		?>
    </table>
    
    </td></tr>
   


</table>
</form>
</body>
</html>

