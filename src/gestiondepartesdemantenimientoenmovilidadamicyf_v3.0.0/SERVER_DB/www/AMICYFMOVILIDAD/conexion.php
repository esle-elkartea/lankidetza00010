<?php
	function leerHost($ruta="")
	{
	$fd=fopen($ruta."datos.inc","r");

  	if ($fd) {
		while(!feof($fd)){ 
    	    	$kli=fgets($fd,4096);
		}
    }
	$host=$kli;
	fclose ($fd);
	return $host;
	}
	
	function escribirHost($host)
	{
  	$fd=fopen("datos.inc","w");
  	if ($fd) {
    	fwrite($fd,$host);
  	}
  	fclose ($fd);
	}
		
	function conectar($host)
	{
	$link=mysql_connect($host,'root','') or die("Imposible conectar a la base de datos");
	mysql_select_db('amicyf',$link) or die(mysql_error($link) );
	return $link;
	}
?>
