<?
session_start();
session_unset();
session_destroy();
?>
<html>
<head>
<title>Cerrar sesi�n</title>
<link href="/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<br>
<div id="ficha"> 
  <table class="textizq" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td>Ha cerrado correctamente su sesi�n.<br>
        <hr></td>
    </tr>
    <tr> 
      <td class="textizq"><a href="index.php">Formulario de autentificaci�n</a> Session: <?php if(isset($_SESSION["idTecnico"])) echo $_SESSION["idTecnico"].""; ?> </td>
    </tr>
  </table>
</div>
</body>
</html>