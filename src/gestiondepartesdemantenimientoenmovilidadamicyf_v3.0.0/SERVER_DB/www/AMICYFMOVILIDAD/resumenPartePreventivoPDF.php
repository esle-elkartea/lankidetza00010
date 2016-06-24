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

if (isset($_GET['idMantenimiento'])) {
               $_SESSION['idMantenimiento'] = $_GET['idMantenimiento'];
			   }

   $filaMantenimiento=obtenerPreventivo($_SESSION['idMantenimiento']);
   $numMantenimiento=$filaMantenimiento['idMantenimiento'];
   $fechaMantenimiento=$filaMantenimiento['fechaMantenimiento'];
   $tiempoEstimadoMantenimiento = $filaMantenimiento['tiempoEstimado'];
   $frecuencia = $filaMantenimiento['frecuenciaMantenimiento'];
   $filaMaquina = obtenerMaquina($filaMantenimiento['idMaquina']);
   $filaInstalacion = obtenerInstalacion($filaMaquina['idInstalacion']);
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
   $filaTecnico = obtenerTecnico($_SESSION['idTecnico'],leerHost());
   $tecnico = $filaTecnico['nombreTecnico'];

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

	for ($j=8; $j<15; $j++)
	{
		$data = Array();
	
		if ($j==8){
			$data[0]['TEXT'] = "Fecha mantenimiento";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = fechaAqui($fechaMantenimiento);
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==9){
			$data[0]['TEXT'] = "Frecuencia";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $frecuencia;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==10){
			$data[0]['TEXT'] = "Tecnico";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $tecnico;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		
		if ($j==11){
			$data[0]['TEXT'] = "Tiempo estimado";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['BG_COLOR'] = array(200,200,200);
			$data[0]['T_TYPE'] = "B";
			$data[1]['TEXT'] = $tiempoEstimadoMantenimiento;
			$data[1]['T_ALIGN'] = "L";
			$data[1]['COLSPAN'] = "3";
		}
		if ($j==12){
			$data[0]['TEXT'] = "Captura Datos";
			$data[0]['T_ALIGN'] = "C";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(80,150,180);
			$data[0]['COLSPAN'] = "4";
		}
		if ($j==13){
			$data[0]['TEXT'] = "Mantenimiento";
			$data[0]['T_ALIGN'] = "C";
			$data[0]['T_TYPE'] = "B";
			$data[0]['BG_COLOR'] = array(80,150,180);
			$data[0]['COLSPAN'] = "2";
			$data[2]['TEXT'] = "Valor";
			$data[2]['T_ALIGN'] = "C";
			$data[2]['T_TYPE'] = "B";
			$data[2]['BG_COLOR'] = array(80,150,180);
			$data[2]['COLSPAN'] = "2";
			
		}
		if ($j==14){
			$data[0]['TEXT'] = "[x] Acuerdo del cliente";
   			$data[0]['T_TYPE'] = "B";
			$data[0]['T_ALIGN'] = "L";
			$data[0]['COLSPAN'] = "4";
			$data1=Array();
			$sql ="SELECT * FROM mantenimiento m, maquina mq, protocolo_mantenimientos p WHERE m.idMantenimiento = ".$_SESSION['idMantenimiento']." and mq.idMaquina=m.idMaquina and mq.idProtocolo = p.idProtocolo and p.frecuenciaProtocolo_Mantenimientos = ".$frecuencia;
	$rCol = mysql_query($sql);
	  while($filaCol=mysql_fetch_array($rCol,MYSQL_ASSOC))
          {
		  		$name = $filaCol['nombreProtocolo_Mantenimientos'];
				$id = $filaCol['idProtocolo_Mantenimientos'];
				$sql1 = "SELECT * FROM maquina_mantenimientos m where idProtocolo_Mantenimientos=".$id." and idMantenimiento = ".$_SESSION['idMantenimiento'];
				$rCol1 = mysql_query($sql1);
				$filaCol1=mysql_fetch_array($rCol1,MYSQL_ASSOC);
				
		  			
				$data1[0]['TEXT'] = $name;
				$data1[0]['T_ALIGN'] = "L";
				$data1[0]['T_TYPE'] = "";
				$data1[0]['BG_COLOR'] = array(255,255,255);
				$data1[0]['COLSPAN'] = "2";
				
				$data1[2]['TEXT'] = $filaCol1['valorMaquina_Mantenimientos'];
				$data1[2]['T_ALIGN'] = "R";
				$data1[2]['T_TYPE'] = "";
				$data1[2]['COLSPAN'] = "2";
				$pdf->Draw_Data($data1);
			}
		}
		$rr -= 25;
		if ($rr<100) $rr = 255;
		$pdf->Draw_Data($data);
		
	}
	$pdf->Draw_Table_Border();
	$nombreFichero = "Preventivo". $_SESSION['idMantenimiento']. "_" . fechaNombreFichero($fechaMantenimiento).".pdf";
	$pdf->Output("PDF/".$nombreFichero);
//	$pdf->Output();

$mail=new phpmailer(); 
$mail->Mailer = "smtp"; 
$mail->Host = "127.0.0.1"; 
$mail->FromName=$filaDatosConfiguracion['nombre'];
$mail->From = $filaDatosConfiguracion['email'];; 
$destino=$mailAdministrativo;
$mail->AddAddress($destino); 
$mail->Subject = "Preventivo ". $_SESSION['idMantenimiento']. " " . fechaNombreFichero($fechaMantenimiento).""; 
$mail->Body = "Se adjunta el Resumen del Parte del Mantenimiento Preventivo nº ".$_SESSION['idMantenimiento']." realizado en su instalación ".$filaInstalacion['nombreInstalacion']; 
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
	header("Location:preventivos.php");
} 
else 
{ 
	if (file_exists($nombreFichero)) unlink($nombreFichero);
	header("Location:preventivos.php");
} 


?> 