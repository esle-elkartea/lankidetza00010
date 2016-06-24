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
		if (isset($_GET['idCorrectivo'])) {
               $_SESSION['idCorrectivo'] = $_GET['idCorrectivo'];
			   $_SESSION['origen'] = $_GET['origen'];
   }
      }
	  
	  $sql2 = "select * from material";
	  $rCol2 = mysql_query($sql2);
	  while($filaCol2=mysql_fetch_array($rCol2,MYSQL_ASSOC))
          {
		  		$filaMaterial2=obtenerMaterial($filaCol2['idMaterial']);
	  $referencias[]=$filaMaterial2['referenciaMaterial'];
	  }
	  
	  $sql ="select * from correctivo_has_material where idCorrectivo = ".$_SESSION['idCorrectivo'] ." order by idMaterial DESC";
	  $rCol = mysql_query($sql);
	  /*if (isset($_POST['referencias']))
	  {
	  	$referenciaSeleccionada=$_POST['referencias'];
	  }*/
	 //if ($_POST['buscar']=="Buscar")
	 //{
	 
	  if (isset($_POST['referencias'])&&$_POST['referencias'][0]!="Elija un material:")
	  {
	  
	  	$referenciaSeleccionada=$_POST['referencias'];
	  //}
	 //buscar el material
	  $sql ="select * from material where referenciaMaterial = ".$referenciaSeleccionada[0];
	  $filasMaterial = mysql_query($sql);
	  $filaMaterialBuscar=mysql_fetch_array($filasMaterial,MYSQL_ASSOC);
	  }
	  $importeTotal = 0;
	  $unidades = 0;
	  if ($_POST['recalcular']=="Recalcular")
	 {
	if($_POST['referencias'][0]!="Elija un material:"){
	 	$importeTotal = $_POST['unidades']*$filaMaterialBuscar['importeMaterial'];
		$unidades = $_POST['unidades'];
		}
	 }
	 
	 if ($_POST['alta']=="Alta")
	 {
	  $sql = "insert into correctivo_has_material (idMaterial,idCorrectivo,unidades) values(".$filaMaterialBuscar['idMaterial'].",".$_SESSION['idCorrectivo'].",".$_POST['unidades'].")";
      if (@mysql_query($sql)){
			$sql1 = "update correctivo set importeCorrectivo = importeCorrectivo + ".$_POST['importe']." where idCorrectivo=".$_SESSION['idCorrectivo'];
		if (@mysql_query($sql1)){
			header("Location:vercorrectivo.php?origen=correctivos&idCorrectivo=".$_SESSION['idCorrectivo']."&objeto=correctivo");
			}else{
			
			}
		}else{
		}
	 }
	 
	 if ($_POST['volver']=="Volver")
	 {
	 header("Location:vercorrectivo.php?origen=correctivos&idCorrectivo=".$_SESSION['idCorrectivo']."&objeto=correctivo");
	 }
	 
	 if(($_GET['accion']=="borrar")){
			$sqlMaterial = "select * from correctivo_has_material where idCorrectivo_has_Material=".$_GET['refMat'];
			$filasMaterialBorrar = mysql_query($sqlMaterial);
	  		$filaMaterialBorrar=mysql_fetch_array($filasMaterialBorrar,MYSQL_ASSOC);
			$unidadesrestar= $filaMaterialBorrar['unidades'];
			
			$sql = "select * from material where idMaterial = ".$filaMaterialBorrar['idMaterial'];
			$filasMaterialBo = mysql_query($sql);
	  		$filaMaterialBo=mysql_fetch_array($filasMaterialBo,MYSQL_ASSOC);
			$importerestar=$filaMaterialBo['importeMaterial'];
			
			$totalRestar = $unidadesrestar*$importerestar;
			
            $sql = "DELETE FROM correctivo_has_material WHERE idCorrectivo_has_Material=".$_GET['refMat'];
                if (@mysql_query($sql))
                {
                 $sql1 = "update correctivo set importeCorrectivo = importeCorrectivo - ".$totalRestar." where idCorrectivo=".$_SESSION['idCorrectivo'];
		if (@mysql_query($sql1)){
			header("Location:vercorrectivo.php?origen=correctivos&idCorrectivo=".$_SESSION['idCorrectivo']);
			}else{
			
			}
                }
                else
                {
                 
                }
	}
	 
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="estilos.css" rel="stylesheet" type="text/css" />
<title>Materiales</title>
</head>

<body>
      <form id="form1" name="form1" method="post" action="materiales.php">
<table width="100%"border="0" cellpadding="0" cellspacing="0" class="contenedor">
<tr><td align="right"><a href="salir.php">Salir</a></td></tr>

  <tr>
    <td class="centrar" align="center"><table width="240" border="0" cellpadding="0" cellspacing="0" class="interior">
      <tr>
        <td class="textopeqneg">Referencia</td>
        <td class="textopeqneg">Concepto</td>
        <td class="textopeqneg">Unidades</td>
        <td class="textopeqneg">Importe</td>
		<td class="textopeqneg"> </td>
      </tr>
	  <?php 
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  		$filaMaterial=obtenerMaterial($filaCol['idMaterial']);
				
        ?>
      <tr>
        <td class="textopeq"><?php echo $filaMaterial['referenciaMaterial']; ?></td>
        <td class="textopeq"><?php echo $filaMaterial['conceptoMaterial'];?></td>
        <td class="textopeq"><?php echo $filaCol['unidades'];?></td>
        <td class="textopeq"><?php echo $filaMaterial['importeMaterial'];?></td>
		<td class="textopeq"><a href="materiales.php?accion=borrar&refMat=<?php echo $filaCol['idCorrectivo_has_Material']; ?>"><strong>[borrar]</strong></a></td>
      </tr>
      <?php } ?>
    </table>     
      </td>
  </tr>
  <tr>
    <td class="botones" colspan="5">&nbsp; </td>
  </tr>
  <tr>
    <td  class="textopeqneglinea" >Detalles Material:</td>
  </tr>
  <tr>
    <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="texto1">
          Referencia:</td>
        <td>
		<select id = "referencias" name="referencias[]">
		<option value="Elija un material:">Elija un material:</option>
                <?php 
					for ($i=0;$i<count($referencias);$i++)
					{
						
					  if ($referenciaSeleccionada[0] == $referencias[$i]){
                echo "<option value=\"".$referencias[$i]."\" selected>".$referencias[$i]."</option>\n";
            } else {
                echo "<option value=\"".$referencias[$i]."\">".$referencias[$i]."</option>\n";
            }
					   ?>
					   
                                <?php
					} 
				?>
				
              </select>
          <input class="botones" type="submit" name="buscar" value="Buscar" /></td>
      </tr>
      <tr>
        <td class="texto1">Concepto:</td>
        <td><input name="concepto" type="text" class="textarea" id="concepto" size="20" maxlength="30" value=<?php echo $filaMaterialBuscar['conceptoMaterial']?>></td>
      </tr>
      <tr>
        <td class="texto1">Unidades:</td>
        <td><input name="unidades" type="text" class="textarea" id="unidades" size="20" maxlength="30"   value=<?php echo $unidades; ?>></td>
      </tr>
      <tr>
        <td class="texto1">Importe Total: </td>
        <td><input name="importe" type="text" class="textarea" id="importe" size="20" maxlength="30" value=<?php echo $importeTotal; ?>>          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="botones" >
		<input class="botones" type="submit" name="recalcular" value="Recalcular" />
		<input name="alta" type="submit" class="botones" id="alta" value="Alta" />
		<input name="volver" type="submit" class="botones" id="volver" value="Volver" />	  </td>   
  </tr>
  
  
</table>
</form>
</body>
</html>
