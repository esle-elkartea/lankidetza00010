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
      }

require('class.phpmailer.php'); 
require ('class.smtp.php'); 
require_once("class.fpdf_table.php");
require_once("table_def.inc");

$filaDatosConfiguracion=obtenerDatosConfiguracion();

if (isset($_GET['idCorrectivo'])) {
               $_SESSION['idCorrectivo'] = $_GET['idCorrectivo'];
			   }

$filaCorrectivo=obtenerCorrectivo($_SESSION['idCorrectivo']);

   $numCorrectivo=$filaCorrectivo['idCorrectivo'];
   $contactoCorrectivo=$filaCorrectivo['contactoCorrectivo'];
   $incidenciaCorrectivo=$filaCorrectivo['incidenciaCorrectivo'];
   $solucionCorrectivo=$filaCorrectivo['solucionCorrectivo'];   
   $tiempoEstimadoCorrectivo = $filaCorrectivo['tiempoEstimadoCorrectvio'];
   if ($filaCorrectivo['salida']) {$costeSalida = obtenerCosteSalida();}
   else {$costeSalida = 0;}
   $importeMateriales = obtenerImporteMaterialesCorrectivo($_SESSION['idCorrectivo']);
   $numHoras=$filaCorrectivo['horasCorrectivo'];
   $numKilometros=$filaCorrectivo['kmCorrectivo'];
   $importeHoras = obtenerCosteHoras($numHoras,$filaCorrectivo['idPerfil']);
   $importeKm=obtenerCosteKilometros($numKilometros,$filaCorrectivo['idKilometraje']);
   $descuento=$filaCorrectivo['descuentoCorrectivo'];
   $importeTotal=$filaCorrectivo['importeCorrectivo'];
   $horaEntrada=$filaCorrectivo['horaEntrada'];
   $horaSalida=$filaCorrectivo['horaSalida'];
   $fechaCierre=date("Y-m-d",time());
   
   $filaInstalacion = obtenerInstalacion($filaCorrectivo['idInstalacion']);
   $mailAdministrativo = $filaInstalacion['emailAdministrativo'];
   $filaCliente = obtenerCliente($filaInstalacion['idCliente']);
   $nombreCliente = $filaCliente['nombreCliente'];
   $nifCliente = $filaCliente['nifCliente'];
   $direccionCliente = $filaCliente['direccionCliente'];
   $cpCliente = $filaCliente['cpCliente'];
   $filaLocalidad = obtenerLocalidad($filaCliente['idLocalidad']);
   $localidadCliente = $filaLocalidad['nombreLocalidad'];
   $filaProvincia = obtenerProvincia($filaLocalidad['idProvincia']);
   $provinciaCliente = $filaProvincia['nombreProvincia'];
   $telefonoCliente = $filaCliente['telefonoCliente'];

$pdf=new FPDF_TABLE();
$pdf->SetAutoPageBreak(true, 20);
$pdf->SetTopMargin(30);
$pdf->AddPage();

$columns = 4;

$pdf->SetStyle("p","times","",10,"130,0,30");
$pdf->SetStyle("pb","times","B",11,"130,0,30");
$pdf->SetStyle("t1","arial","",11,"254,252,222");
$pdf->SetStyle("t1","arial","",11,"0,151,200");
$pdf->SetStyle("t2","arial","",11,"0,151,200");
$pdf->SetStyle("t3","times","B",14,"203,0,48");
$pdf->SetStyle("t4","arial","BI",11,"0,151,200");
$pdf->SetStyle("hh","times","B",11,"255,189,12");
$pdf->SetStyle("font","helvetica","",10,"0,0,255");
$pdf->SetStyle("style","helvetica","BI",10,"0,0,220");
$pdf->SetStyle("size","times","BI",13,"0,0,120");
$pdf->SetStyle("color","times","BI",13,"0,255,255");
$pdf->SetStyle("ss","arial","",7,"203,0,48");     
    
	$pdf->Table_Init($columns, true, true);

	$table_subtype = $table_default_table_type;
	$pdf->Set_Table_Type($table_subtype);
	
	$header_subtype = $table_default_header_type;
	for($i=0; $i<$columns; $i++) $header_type[$i] = $table_default_header_type;

	$header_type[0]['WIDTH'] = 40;
	$header_type[1]['WIDTH'] = 30;
	$header_type[2]['WIDTH'] = 30;
	$header_type[3]['WIDTH'] = 40;
	
	$header_type[0]['TEXT'] = "**** RESUMEN DEL PARTE ****";
	$header_type[1]['TEXT'] = "";
	$header_type[2]['TEXT'] = "";
	$header_type[3]['TEXT'] = "";
	
	$header_type[0]['COLSPAN'] = "4";

	$pdf->Set_Header_Type($header_type);
	
	$pdf->Draw_Header();
	
	$data_subtype = $table_default_data_type;
	
	$data_type = Array();
	for ($i=0; $i<$columns; $i++) $data_type[$i] = $data_subtype;

	$pdf->Set_Data_Type($data_type);
	
	$fsize = 5;
	$colspan = 1;
	$rr = 255;

	for ($l=0; $l<6; $l++)
	{
		$data2 = Array();
		if ($l==0){
			$data2[0]['TEXT'] = $filaDatosConfiguracion['cif'];
			$data2[0]['T_ALIGN'] = "L";
			$data2[0]['T_TYPE'] = "B";
			$data2[0]['COLSPAN'] = "2";
			$data2[2]['TEXT'] = $nifCliente;
			$data2[2]['T_ALIGN'] = "L";
			$data2[2]['T_TYPE'] = "B";
			$data2[2]['COLSPAN'] = "2";
		}

		if ($l==1){
			$data2[0]['TEXT'] = $filaDatosConfiguracion['nombre'];
			$data2[0]['T_ALIGN'] = "L";
			$data2[0]['T_TYPE'] = "B";
			$data2[0]['COLSPAN'] = "2";
			$data2[2]['TEXT'] = $nombreCliente;
			$data2[2]['T_ALIGN'] = "L";
			$data2[2]['T_TYPE'] = "B";
			$data2[2]['COLSPAN'] = "2";
		}
		
		if ($l==2){
			$data2[0]['TEXT'] = $filaDatosConfiguracion['direccion'];
			$data2[0]['T_ALIGN'] = "L";
			$data2[0]['T_TYPE'] = "";
			$data2[0]['COLSPAN'] = "2";
			$data2[2]['TEXT'] = $direccionCliente;
			$data2[2]['T_ALIGN'] = "L";
			$data2[2]['T_TYPE'] = "";
			$data2[2]['COLSPAN'] = "2";
		}
		if ($l==3){
			$data2[0]['TEXT'] = $filaDatosConfiguracion['cp'];
			$data2[0]['T_ALIGN'] = "L";
			$data2[0]['T_TYPE'] = "";
			$data2[1]['TEXT'] = $filaDatosConfiguracion['localidad'];
			$data2[1]['T_ALIGN'] = "L";
			$data2[1]['T_TYPE'] = "";
			$data2[2]['TEXT'] = $cpCliente;
			$data2[2]['T_ALIGN'] = "L";
			$data2[2]['T_TYPE'] = "";
			$data2[3]['TEXT'] = $localidadCliente;
			$data2[3]['T_ALIGN'] = "L";
			$data2[3]['T_TYPE'] = "";
		}
		if ($l==4){
			$data2[0]['TEXT'] = $filaDatosConfiguracion['provincia'];
			$data2[0]['T_ALIGN'] = "L";
			$data2[0]['T_TYPE'] = "";
			$data2[0]['COLSPAN'] = "2";
			$data2[2]['TEXT'] = $provinciaCliente;
			$data2[2]['T_ALIGN'] = "L";
			$data2[2]['T_TYPE'] = "";
			$data2[2]['COLSPAN'] = "2";
		}
		if ($l==5){
			$data2[0]['TEXT'] = $filaDatosConfiguracion['telefono'];
			$data2[0]['T_ALIGN'] = "L";
			$data2[0]['T_TYPE'] = "";
			$data2[0]['COLSPAN'] = "2";
			$data2[2]['TEXT'] = $telefonoCliente;
			$data2[2]['T_ALIGN'] = "L";
			$data2[2]['T_TYPE'] = "";
			$data2[2]['COLSPAN'] = "2";
		}
		$pdf->Draw_Data($data2);
	}

	for ($j=8; $j<25; $j++)
	{
		$data = Array();
	
		if ($j==8){
			$data[0]['TEXT'] = "Fecha de apertura";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			if (fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo'])!="01/01/1911") $fechaApertura = fechaAqui($filaCorrectivo['fechaAceptacionCorrectivo']); else $fechaApertura="";
			$data[1]['TEXT'] = $fechaApertura;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==9){
			$data[0]['TEXT'] = "Fecha de cierre";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = fechaAqui($fechaCierre);
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==10){
			$data[0]['TEXT'] = "Incidencia";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[1]['TEXT'] = $incidenciaCorrectivo;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==11){
			$data[0]['TEXT'] = "Solución";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[1]['TEXT'] = $solucionCorrectivo;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==12){
			$data[0]['TEXT'] = "Tiempo estimado";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $tiempoEstimadoCorrectivo;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==13){
			$data[0]['TEXT'] = "Material";
			$data[0]['T_ALIGN'] = "C";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(80,150,180);
			$data[1]['TEXT'] = "Precio";
			$data[1]['T_ALIGN'] = "C";
			$data[1]['T_TYPE'] = "B";
			$data[1]['BG_COLOR'] = array(80,150,180);
			$data[2]['TEXT'] = "Unidades";
			$data[2]['T_ALIGN'] = "C";
			$data[2]['T_TYPE'] = "B";
			$data[2]['BG_COLOR'] = array(80,150,180);
			$data[3]['TEXT'] = "Total";
			$data[3]['T_ALIGN'] = "C";
			$data[3]['T_TYPE'] = "B";
			$data[3]['BG_COLOR'] = array(80,150,180);
			
		}
		if ($j==14){
			$data[0]['TEXT'] = "Ticket-Factura";
			$data[0]['T_ALIGN'] = "C";
			$data[0]['COLSPAN'] = "4";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(80,150,180);	
			 $sql ="select * from correctivo_has_material where idCorrectivo = ".$_SESSION['idCorrectivo'] ." order by idMaterial DESC";
	  $rCol = mysql_query($sql);
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  		$filaMaterial=obtenerMaterial($filaCol['idMaterial']);		
				$data1[0]['TEXT'] = $filaMaterial['conceptoMaterial'];
				$data1[0]['T_ALIGN'] = "L";
				$data1[0]['T_TYPE'] = "";
				$data1[0]['BG_COLOR'] = array(255,255,255);
				$data1[1]['TEXT'] = $filaMaterial['importeMaterial'];
				$data1[1]['T_ALIGN'] = "R";
				$data1[1]['T_TYPE'] = "";
				$data1[1]['BG_COLOR'] = array(255,255,255);
				$data1[2]['TEXT'] = $filaCol['unidades'];
				$data1[2]['T_ALIGN'] = "R";
				$data1[2]['T_TYPE'] = "";
				$data1[2]['BG_COLOR'] = array(255,255,255);
				$data1[3]['TEXT'] = $filaMaterial['importeMaterial']*$filaCol['unidades'];
				$data1[3]['T_ALIGN'] = "R";
				$data1[3]['T_TYPE'] = "";
				$data1[3]['BG_COLOR'] = array(255,255,255);
				$pdf->Draw_Data($data1);
			}
		}
		if ($j==15){
			$data[0]['TEXT'] = "Salida";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $costeSalida;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
		if ($j==16){
			$data[0]['TEXT'] = "Materiales";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $importeMateriales;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
		if ($j==17){
			$data[0]['TEXT'] = "Horas Técnico";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $importeHoras;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
		if ($j==18){
			$data[0]['TEXT'] = "Kilometros";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $importeKm;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
		if ($j==19){
			$data[0]['TEXT'] = "Descuento";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[1]['TEXT'] = "- ".$descuento;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
		if ($j==20){
			$data[0]['TEXT'] = "";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['COLSPAN'] = "4";
		}
	if ($j==21){
			$data[0]['TEXT'] = "Base Imponible";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[1]['TEXT'] = $importeTotal;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
if ($j==22){
			$data[0]['TEXT'] = "IVA (18%)";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_ALIGN'] = "L";
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $importeTotal*0.18;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
if ($j==23){
			$data[0]['TEXT'] = "Total";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $importeTotal*1.18;
			$data[1]['T_ALIGN'] = "R";
			$data[1]['COLSPAN'] = "2";
			$data[3]['TEXT'] = "€";
			$data[3]['T_ALIGN'] = "L";
		}
		if ($j==24){
			$data[0]['TEXT'] = "[x] Acuerdo del cliente";
   			$data[0]['T_TYPE'] = "B";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['COLSPAN'] = "4";
		}

		
		$rr -= 25;
		if ($rr<100) $rr = 255;
		$pdf->Draw_Data($data);
		
	}
	$pdf->Draw_Table_Border();
	$nombreFichero = "Correctivo_". $_SESSION['idCorrectivo']. "_" . fechaNombreFichero($fechaCierre).".pdf";
	$pdf->Output("PDF/".$nombreFichero);
//	$pdf->Output();

$mail=new phpmailer(); 
$mail->Mailer = "smtp"; 
$mail->Host = "127.0.0.1"; 
$mail->FromName=$filaDatosConfiguracion['nombre'];
$mail->From = $filaDatosConfiguracion['email'];; 
$destino=$mailAdministrativo;
$mail->AddAddress($destino); 
$mail->Subject = "Correctivo ". $_SESSION['idCorrectivo']. " " . fechaNombreFichero($fechaCierre).""; 
$mail->Body = "Se adjunta el Resumen del Parte del Mantenimiento Correctivo nº ".$_SESSION['idCorrectivo']." realizado en su instalación ".$filaInstalacion['nombreInstalacion']; 
$mail->AltBody = ""; 
$mail->AddAttachment($nombreFichero,$nombreFichero);
$exito = $mail->Send(); 
$intentos=1; 
while ((!$exito) && ($intentos < 5)) { 
	sleep(5); 
	$exito = $mail->Send(); 
	$intentos=$intentos+1; 
} 

if(!$exito) 
{ 
	if (file_exists($nombreFichero)) unlink($nombreFichero);
	header("Location:correctivos.php");
} 
else 
{ 
	if (file_exists($nombreFichero)) unlink($nombreFichero);
	header("Location:correctivos.php");
} 


?> 