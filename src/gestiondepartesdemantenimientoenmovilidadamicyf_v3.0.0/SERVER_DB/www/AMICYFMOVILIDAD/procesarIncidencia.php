<?php
session_start();

if (!isset($_SESSION['idTecnico'])) 
{
	header("Location:index.php");
	exit();
}
else
{
	include('bd.php');
	$link=conectar(leerHost());
	if (tieneAccesoAPlanificador($_SESSION['idTecnico'],leerHost())==1)
	{
		include ("calendario/calendario.php");
	}
	else
	{
		header("Location:correctivos.php");
	}
}

if (isset($_GET['idIncidencia']))
{
	$arrayMant = obtenerPreventivosIncidencia($_GET['idIncidencia']);
	//echo '<pre>';
	//print_r($arrayMant); 
	//echo '</pre>';
	$arrayCorr = obtenerCorrectivosIncidencia($_GET['idIncidencia']); 
	//echo '<pre>';
	//print_r($arrayCorr); 
	//echo '</pre>';
	
	if(isset($arrayMant) && isset($arrayCorr)){
		$_SESSION["Prev"] = $arrayMant;
		$_SESSION["Corr"] = $arrayCorr;
		header("Location:incidenciasconjuntas.php?Prevent=1&Correct=1");
	}
	
	elseif(isset($arrayMant) && !isset($arrayCorr)){
		$_SESSION["Prev"] = $arrayMant;
		header("Location:incidenciasconjuntas.php?Prevent=1&Correct=0");
	}
	else{
		$_SESSION["Corr"] = $arrayCorr;
		header("Location:incidenciasconjuntas.php?Prevent=0&Correct=1");
	}
}
	/*if ($incidencia['preventivo']==1) 
	{
		header("Location:vermantenimientoincidencia.php?idMantenimiento=".$incidencia['idMantenimiento']);
	}
	else 
	{
		header("Location:vercorrectivoincidencia.php?idCorrectivo=".$incidencia['idMantenimiento']);
	}*/
?>