<?php
require("conexion.php");
include("funciones.php");
//---------------- USER -----------------------//


	function comprobarUsuario($nombre,$clave,$host)
	{
	
		$link=conectar($host);
		$sql = "select idTecnico from tecnico where nombreUsuarioTecnico like('".$nombre."') and passwordTecnico like('".$clave."')";
				$r = mysql_query($sql);
				if ($filaUsuario = mysql_fetch_array($r,MYSQL_ASSOC)) 
				{
					return $filaUsuario['idTecnico'];
				}else return -1;
	
		
	}
	function comprobarAdministrador($nombre,$clave,$host)
	{
	
		$link=conectar($host);
		$sql = "select idAdminweb from adminweb where usuario like('".$nombre."') and clave like('".$clave."')";
				$r = mysql_query($sql);
				if ($filaUsuario = mysql_fetch_array($r,MYSQL_ASSOC)) 
				{
					return $filaUsuario['idAdminweb'];
				}else return -1;
	
		
	}
	//-----------------------------------------Tecnico-------------------------------------------//
	function obtenerTecnico($idTecnico,$host)
	{
	
		$link=conectar($host);
		$sql = "select * from tecnico where idTecnico = ".$idTecnico;
				$r = mysql_query($sql);
				if ($filaUsuario = mysql_fetch_array($r,MYSQL_ASSOC)) 
				{
					return $filaUsuario;
				}else return -1;
	
		
	}
	
	function tieneAccesoAPlanificador($idTecnico,$host)
	{
	
	$link=conectar($host);
		$sql = "select * from tecnico where idTecnico = ".$idTecnico;
		
				$r = mysql_query($sql);
				
				if ($filaUsuario = mysql_fetch_array($r,MYSQL_ASSOC)) 
				{
	
					return $filaUsuario['moduloAccesoPlanificadorWeb'];
					
				}else return false;
	}
	
	function obtenerHorasTecnico($codigo, $fech, $host)
    {
        $resultado=0;
        $link=conectar($host);
        $sql= "SELECT tiempoEstimadoIncidencia FROM incidencia where Tecnico_idTecnico= ".$codigo." and fechaEntrada='".fechamysql($fech)."'";   
		          
            $r = mysql_query($sql);
			
            while($filaIncidencia = mysql_fetch_array($r,MYSQL_ASSOC))
            {
                $tmp=$filaIncidencia['tiempoEstimadoIncidencia'];
                $inicio=explode(":",$tmp); 
                $resultado=$resultado+$inicio[0]*60;
                $resultado=$resultado+$inicio[1];
            }
           
        $resultado=$resultado/60;
        return $resultado;
    }
	//-----------------------------------------Configuracion-------------------------------------//
	function obtenerCosteSalida()
	{
	$link=conectar($host);
		$sql = "select * from configuracion";
				$r = mysql_query($sql);
				if ($filaUsuario = mysql_fetch_array($r,MYSQL_ASSOC)) 
				{
					return $filaUsuario['costeSalida'];
				}else return 0;
	}
	
	function obtenerDatosConfiguracion()
	{
		$link=conectar($host);
		$sql = "select * from datosconfiguracionweb";
				$r = mysql_query($sql);
				if ($filaUsuario = mysql_fetch_array($r,MYSQL_ASSOC)) 
				{
					return $filaUsuario;
				}else return 0;
	}
//--------------------------Clientes-----------------------------------------//
function obtenerCliente($idCliente)
{
		$link=conectar(leerHost());
		$sql = "select * from cliente where idCliente =".$idCliente."";
		$r = mysql_query($sql);
		if ($filaCliente = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaCliente;
		}else return null;
}
//-------------------------Instalaciones---------------------------------------//
function obtenerInstalacion($idInstalacion)
{
		$link=conectar(leerHost());
		$sql = "select * from instalacion where idInstalacion =".$idInstalacion."";
		$r = mysql_query($sql);
		if ($filaInstalacion = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaInstalacion;
		}else return null;
}

//----------------------------Material-----------------------------------//
function obtenerMaterial($idMaterial)
{
		$link=conectar(leerHost());
		$sql = "select * from material where idMaterial =".$idMaterial."";
		$r = mysql_query($sql);
		if ($filaMaterial = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaMaterial;
		}else return null;
}
//-------------------------Correctivos---------------------------------------//
function obtenerCorrectivo($idCorrectivo)
{
		$link=conectar(leerHost());
		$sql = "select * from correctivo where idCorrectivo =".$idCorrectivo."";
		$r = mysql_query($sql);
		if ($filaCorrectivo = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaCorrectivo;
		}
		else {
			return null;
		}
}

function obtenerImporteMaterialesCorrectivo($idCorrectivo) {

        $link=conectar(leerHost());
        $sql = "Select * from correctivo_has_material where idCorrectivo = ".$idCorrectivo;
		$filas = mysql_query($sql);
		$v=0;
        while($fila=mysql_fetch_array($filas,MYSQL_ASSOC))
        {
                $sql1 = "select * from material where idMaterial =".$fila['idMaterial'];
                $filasMaterial = mysql_query($sql1);
				$filaMaterial=mysql_fetch_array($filasMaterial,MYSQL_ASSOC);
                $importe = $filaMaterial['importeMaterial']*$fila['unidades'];
                $v+=$importe;
         }
         return $v;
}

function obtenerCosteHoras($numHoras, $idPerfil)
{
$link=conectar(leerHost());
if ($idPerfil!=0){
$sql="select * from perfil where idPerfil=".$idPerfil;
$filasMaterial = mysql_query($sql);
$filaMaterial=mysql_fetch_array($filasMaterial,MYSQL_ASSOC);
return $numHoras*$filaMaterial['valorPerfil'];}else return 0;
}

function obtenerCosteKilometros($numKm, $idKm)
{
if ($idKm!=0){
$link=conectar(leerHost());
$sql="select * from kilometraje where idKilometraje=".$idKm;
$filasMaterial = mysql_query($sql);
$filaMaterial=mysql_fetch_array($filasMaterial,MYSQL_ASSOC);
return $numKm*$filaMaterial['valorKilometraje'];}else return 0;


}
//-------------------------Maquinas------------------------------------------//
function obtenerMaquina($idMaquina)
{
		$link=conectar(leerHost());
		$sql = "select * from maquina where idMaquina =".$idMaquina."";
		$r = mysql_query($sql);
		if ($filaMaquina = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaMaquina;
		}else return null;
}
function obtenerMaquinasInstalacion($idCorrectivo)
{
			$link=conectar(leerHost());
			$sql = "SELECT m.*, c.idCorrectivo FROM correctivo c, instalacion i, maquina m WHERE i.idInstalacion=c.idInstalacion AND i.idInstalacion=m.idInstalacion AND c.idCorrectivo=".$idCorrectivo;
			$r = mysql_query($sql);
			return $r;
}
function obtenerMaquinasCorrectivo($idCorrectivo)
{
			$link=conectar(leerHost());
			$sql = "SELECT * FROM maquina_has_correctivo where idCorrectivo=".$idCorrectivo;
			$r = mysql_query($sql);
			return $r;
}


function actualizarMaquinasCorrectivo($maquinasCorrectivo,$maquinasInstalacion,$idCorrectivo)
{
		$link=conectar(leerHost());
		if (count($maquinasCorrectivo)==0)
		{
		$sql = "DELETE FROM maquina_has_correctivo WHERE idCorrectivo = ".$idCorrectivo;
	                if (@mysql_query($sql)) {}
		}
		else
		{
		for ($i=0;$i<count($maquinasInstalacion);$i++)
		{
			 $s="SELECT * FROM maquina_has_correctivo where idMaquina = ".$maquinasInstalacion[$i]. " and idCorrectivo = ".$idCorrectivo;
            $raux=mysql_query($s);
           if (mysql_num_rows($raux)!=0)
           {
                //la maquina ya está en el correctivo si esta en maquinas correctivo no se hace nada , si no se quita
				if (in_array ($maquinasInstalacion[$i], $maquinasCorrectivo)){
					//esta en maquinas correctivo no se hace nada
				} else
				{
					//no esta en el correctivo asín que quitamos de la base de datos
					$sql = "DELETE FROM maquina_has_correctivo WHERE idCorrectivo = ".$idCorrectivo." and idMaquina = ".$maquinasInstalacion[$i];
	                if (@mysql_query($sql)) {}
				}
           } else{
		   		// la maquina no está en el correctivo si esta en maquinas correctvo se mete, si no no se hace nada
				if (in_array ($maquinasInstalacion[$i], $maquinasCorrectivo)){
					//esta en maquinas correctivo asín que hacemos el insert
					$sql = "insert into maquina_has_correctivo (idMaquina,idCorrectivo) values (".$maquinasInstalacion[$i].",".$idCorrectivo.")";
	                if (@mysql_query($sql)) {}
				} else
				{
					//no esta en el correctivo asín que no hacemos nada
				}
			}
		}
		}
}
//-------------------------Direcciones---------------------------------------//
function obtenerLocalidad($idLocalidad)
{
		$link=conectar(leerHost());
		$sql = "select * from localidad where idLocalidad =".$idLocalidad."";
		$r = mysql_query($sql);
		if ($filaLocalidad = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaLocalidad;
		}else return null;
}
function obtenerProvincia($idProvincia)
{
		$link=conectar(leerHost());
		$sql = "select * from provincia where idProvincia =".$idProvincia."";
		$r = mysql_query($sql);
		if ($filaProvincia = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaProvincia;
		}else return null;
}
//----------------------Preventivos-------------------------------------------------------------------//
function haSidoRellenado($idMantenimiento)
{
	$link=conectar(leerHost());
    $rellenado = false;
    $sql = "select * from maquina_mantenimientos where idMantenimiento=".$idMantenimiento;
	$filas = mysql_query($sql);
	while($fila=mysql_fetch_array($filas,MYSQL_ASSOC))
    {
    	if ($fila['valorMaquina_Mantenimientos']!="") $rellenado = true;                
    }
    return $rellenado;
}

function obtenerPreventivo($idMantenimiento)
{
		$link=conectar(leerHost());
		$sql = "select * from mantenimiento where idMantenimiento =".$idMantenimiento."";
		
		$r = mysql_query($sql);
		if ($filaMantenimiento = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaMantenimiento;
		}else return null;
}
//--------------------------------INCIDENCIA--------------------------------//
function obtenerIncidencia($idIncidencia)
{
		$link=conectar(leerHost());
		$sql = "select * from incidencia where idIncidencia =".$idIncidencia."";
		$r = mysql_query($sql);
		
		if ($filaIncidencia = mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			return $filaIncidencia;
		}else return null;
}

function obtenerPreventivosIncidencia($idIncidencia)
{
		$link=conectar(leerHost());
		$sql = "select * from mantenimiento where idIncidencia = ".$idIncidencia."";
		$r = mysql_query($sql);
		while($filaMantenimiento=mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			$arrayMantenimiento[]=$filaMantenimiento;
		}
		return $arrayMantenimiento;
}

function obtenerCorrectivosIncidencia($idIncidencia)
{
		$link=conectar(leerHost());
		$sql = "select * from correctivo where idIncidencia = ".$idIncidencia."";
		//Para que no aparezcan los correctivos cerrados en el planificador.
		//$sql = "select * from correctivo where idIncidencia = ".$idIncidencia." AND fechaCierreCorrectivo = '1911-01-01' ";
		$r = mysql_query($sql);
		//echo $sql;
		while($filaCorrectivo=mysql_fetch_array($r,MYSQL_ASSOC)) 
		{
			$arrayCorrectivo[] = $filaCorrectivo;
		}
		return $arrayCorrectivo;
}

?>