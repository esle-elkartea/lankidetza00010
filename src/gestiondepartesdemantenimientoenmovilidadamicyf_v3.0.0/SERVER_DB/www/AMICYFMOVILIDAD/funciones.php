<?php
 function esMovil(){
    $es_movil=FALSE; //Aquí se declara la variable falso o verdadero XD
    $usuario = $_SERVER['HTTP_USER_AGENT']; //Con esta leemos la info de su navegador
 
    $usuarios_moviles = "Android, AvantGo, Blackberry, Blazer, Cellphone, Danger, DoCoMo, EPOC, EudoraWeb, Handspring, HTC, Kyocera, LG, MMEF20, MMP, MOT-V, Mot, Motorola, NetFront, Newt, Nokia, Opera Mini, Palm, Palm, PalmOS, PlayStation Portable, ProxiNet, Proxinet, SHARP-TQ-GX10, Samsung, Small, Smartphone, SonyEricsson, SonyEricsson, Symbian, SymbianOS, TS21i-10, UP.Browser, UP.Link, WAP, webOS, Windows CE, hiptop, iPhone, iPod, portalmmm, Elaine/3.0, OPWV"; //En esta cadena podemos quitar o agregar navegadores de dispositivos moviles, te recomiendo que hagas un echo $_SERVER['HTTP_USER_AGENT']; en otra pagina de prueba y veas la info que arroja para que despues agregues el navegador que quieras detectar
 
    $navegador_usuario = explode(',',$usuarios_moviles);
	
	foreach($navegador_usuario AS $navegador){ //Este ciclo es el que se encarga de detectar el navegador y devolver un TRUE si encuentra la cadena
      if(eregi(trim($navegador),$usuario)){
         $es_movil=TRUE;
      }
   	}
	return $es_movil; 
 }

 function  validar($texto)
 {
   $t="";
   $t= str_replace( "á","a",$texto);
   $t= str_replace( "Á","A",$t);
   $t= str_replace( "é","e",$t);
   $t= str_replace( "É","E",$t);
   $t= str_replace( "í","i",$t);
   $t= str_replace( "Í","I",$t);
   $t= str_replace( "ó","o",$t);
   $t= str_replace( "Ó","O",$t);
   $t= str_replace( "ú","u",$t);
   $t= str_replace( "Ú","U",$t);
   return $t;
}
 
 function fechaAqui($s)
{
$tok = strtok ($s,"-");
 $ai=$tok;
    $tok = strtok ("-");
    $mi=$tok;
    $tok = strtok ("-");
    $di=$tok;
    return "".$di."/".$mi."/".$ai;
}

function fechaNombreFichero($s)
{
$tok = strtok ($s,"-");
 $ai=$tok;
    $tok = strtok ("-");
    $mi=$tok;
    $tok = strtok ("-");
    $di=$tok;
    return "".$di.$mi.$ai;
}

function fechamysql($s)
{
$tok = strtok ($s,"/");
 $di=$tok;
    $tok = strtok ("/");
    $mi=$tok;
    $tok = strtok ("/");
    $ai=$tok;
    return "".$ai."-".$mi."-".$di;
}
 
/* if (compara_fechas($f1,$f2) <0) "$f1 es menor que $f2"
   if (compara_fechas($f1,$f2) >0) "$f1 es mayor que $f2"
   if (compara_fechas($f1,$f2)==0) "$f1 es igual  que $f2"
   fecha en format dd/mm/aa o dd-mm-aa
   */
function compara_fechas($fecha1,$fecha2)
{
      if (preg_match("/[0-9]{1,2}\/[0-9]{1,2}\/([0-9][0-9]){1,2}/",$fecha1))
              list($dia1,$mes1,$año1)=split("/",$fecha1);
      if (preg_match("/[0-9]{1,2}-[0-9]{1,2}-([0-9][0-9]){1,2}/",$fecha1))
              list($dia1,$mes1,$año1)=split("-",$fecha1);
        if (preg_match("/[0-9]{1,2}\/[0-9]{1,2}\/([0-9][0-9]){1,2}/",$fecha2))
              list($dia2,$mes2,$año2)=split("/",$fecha2);
      if (preg_match("/[0-9]{1,2}-[0-9]{1,2}-([0-9][0-9]){1,2}/",$fecha2))
              list($dia2,$mes2,$año2)=split("-",$fecha2);
        $dif = mktime(0,0,0,$mes1,$dia1,$año1) - mktime(0,0,0, $mes2,$dia2,$año2);
        return ($dif);                         
}

function cargarMaquinas($maquinasBD)
{
   $maquinas=array();
   if ($maquinasBD!=NULL)
   {
   
   while($filaCol=mysql_fetch_array($maquinasBD,MYSQL_ASSOC))
   {
   		$maquinas[]=$filaCol['nombreMaquina'];
   }
   }
   return $maquinas;
}
function array_envia($array) {
    $tmp = serialize($array);
    $tmp = urlencode($tmp);
    return $tmp;
}

function array_recibe($url_array) {
    $tmp = stripslashes($url_array);
    $tmp = urldecode($tmp);
    $tmp = unserialize($tmp);
   return $tmp;
}

function tablaPrev($Prev_array){
	$Tabla="";
	$link=conectar(leerHost());
	$sql ="select * from incidencia where idIncidencia = ".$Prev_array[0]['idIncidencia']." order by horaIncidencia ASC";
	$rCol = mysql_query($sql);
	while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC)){
		$instalacion = obtenerInstalacion($filaCol['Instalacion_idInstalacion']);
	}
	$Tabla = '<table width="240" border="0" cellpadding="0" cellspacing="0">
			<tr> 
            	<td class="textizqsin"><br/>Mantenimientos Preventivos:<br/></td>
    		</tr>
			</table>
    		<table width="240" border="1" cellpadding="0" cellspacing="0" class="interior">
     		 <tr>
        		<td class="textopeqneg">IdMantenimiento</td>
        		<td width="50%" class="textopeqneg">Instalaci&oacute;n</td>
       	 		<td width="50%" class="textopeqneg">Direcci&oacute;n</td>
        		<td width="50%" class="textopeqneg">Tel&eacute;fono</td>        
      		</tr>';
	for($i=0; $i<count($Prev_array); $i++){
		   	$Tabla = $Tabla.'<tr>
        	<td class="textopeqneg"><a href="vermantenimientoincidencia.php?idMantenimiento='.$Prev_array[$i]['idMantenimiento'].'">'.$Prev_array[$i]['idMantenimiento'].'</a></td>
        	<td class="textopeq">'.$instalacion['nombreInstalacion'].'</td>
			<td class="textopeq">'.$instalacion['direccion'].'</td>
			<td class="textopeq">'.$instalacion['telefonoContactoInstalacion'].'</td>
      	 	</tr>';
	}
	return $Tabla;
}

function tablaCorr($Corr_array){
	$Tabla="";
	$link=conectar(leerHost());
	$sql ="select * from incidencia where idIncidencia = ".$Corr_array[0]['idIncidencia']." order by horaIncidencia ASC";
	$rCol = mysql_query($sql);
	while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC)){
		$instalacion = obtenerInstalacion($filaCol['Instalacion_idInstalacion']);
	}
	$Tabla = '<table width="240" border="0" cellpadding="0" cellspacing="0">
			<tr> 
            	<td class="textizqsin"><br/>Mantenimientos Correctivos:<br/></td>
    		</tr>
			</table>
    		<table width="240" border="1" cellpadding="0" cellspacing="0" class="interior">
     		 <tr>
        		<td class="textopeqneg">IdMantenimiento</td>
        		<td width="50%" class="textopeqneg">Instalaci&oacute;n</td>
       	 		<td width="50%" class="textopeqneg">Direcci&oacute;n</td>
        		<td width="50%" class="textopeqneg">Tel&eacute;fono</td>        
      		</tr>';
	for($i=0; $i<count($Corr_array); $i++){
		   	$Tabla = $Tabla.'<tr>
        	<td class="textopeqneg"><a href="vercorrectivoincidencia.php?idCorrectivo='.$Corr_array[$i]['idCorrectivo'].'">'.$Corr_array[$i]['idCorrectivo'].'</a></td>
        	<td class="textopeq">'.$instalacion['nombreInstalacion'].'</td>
			<td class="textopeq">'.$instalacion['direccion'].'</td>
			<td class="textopeq">'.$instalacion['telefonoContactoInstalacion'].'</td>
      	 	</tr>';
	}
	return $Tabla;
}
?>