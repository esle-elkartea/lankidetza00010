<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="bMantenimientosPendientes" scope="request" class="java.lang.String"/>
<jsp:useBean id="bCorPend" scope="request" class="java.lang.String"/>
<jsp:useBean id="bInstalacionesContrato" scope="request" class="java.lang.String"/>
<jsp:useBean id="nDiasVista" scope="request" class="java.lang.String"/>
<jsp:useBean id="nTipoCorrectivo" scope="request" class="java.lang.String"/>
<jsp:useBean id="nDiasVistaContrato" scope="request" class="java.lang.String"/>
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.utils.Elemento"%>
<html>
<head>
<title>AMICYF</title>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function importarTxt(){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlImportarTxtServlet";
  var req = getResponseXml(url);
  if(isOk(req)){
	 alert("Se han importado correctamente todos mantenimientos");
  }else{
  	alert("No se han importado correctamente todos mantenimientos");
  }
}

function confProtocolos(){
  window.open('', 'protocolo_actualizar', '');
  document.formulario.target = 'protocolo_actualizar';
  document.formulario.action = 'protocoloActualizarServlet';
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "IndexServlet";
  document.formulario.submit();
}

//-->
</script>
</head>

<body>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="latSupIn"></div>
				<div class="tituloIn">
					<div class="tituloInPos">Mantenimiento de Instalaciones de Climatización</div>
				</div>
				<div class="TextoIn">
					<form action="IndexServlet" method="post" name="formulario">
					<div class="spanAlineado" style='width:380px;padding-top:30px;'>
					<div style='padding-bottom:50px;border:dashed 2px #A69583;width:300px;position:relative;left:30px;background-color:#FBF4E6;'>
					<span class='tituloPos' style='position:relative;top:30px;left:20px;font-size:18px;'>Gestión</span>
					<ul>
					<li class="menu01"><a href="ListaClienteServlet" class="menu"><img src="<%=alias%>/img/indexClientes.gif" align="middle" border="0"> Listado de Clientes</a>
					<li class="menu01"><a href="ListaInstalacionServlet" class="menu"><img src="<%=alias%>/img/indexInstalaciones.gif" align="middle" border="0"> Instalaciones</a>
					<li class="menu01"><a href="#" onclick="confProtocolos()" class="menu"> <img src="<%=alias%>/img/protocolo.gif" align="middle" border="0"> Configuración</a>
					<li class="menu01"><a href="#" onclick="importarTxt()" class="menu"> <img src="<%=alias%>/img/importarTXT.gif" align="middle" border="0"> Importar</a>
					</ul>
					</div>
					</div>
					<div class="spanAlineado" style='padding-top:50px;'>
					<div style='width:380px;border:dashed 2px #A69583;padding-bottom:50px;background-color:#F7E7C8;'>
					<span class='tituloPos' style='position:relative;top:30px;left:20px;font-size:19px;'>Planning</span>
					<ul>
					<li class="menu01"><a href="ListaInstalacionesContratoServlet?nDiasContrato=<%=nDiasVistaContrato%>" class="menu"> <img src="<%=alias%>/img/<%=(bInstalacionesContrato.compareTo("si")==0)?"indexMantenPend.gif":"mantico.gif"%>" align="middle" border="0"> Contratos expirados (<%=nDiasVistaContrato%> dias vista)</a>
					<li class="menu01"><a href="ListaMantenimientosPendientesServlet?nDias=<%=nDiasVista%>" class="menu"> <img src="<%=alias%>/img/<%=(bMantenimientosPendientes.compareTo("si")==0)?"indexMantenPend.gif":"mantico.gif"%>" align="middle" border="0"> Preventivos (<%=nDiasVista%> dias vista)</a>
					<%int nTC = Integer.parseInt(nTipoCorrectivo);%>
					<li class="menu01"><a href="ListaCorrectivosPendientesServlet?tipoCorrectivo=<%=nTC%>" class="menu"> <img src="<%=alias%>/img/<%=(bCorPend.compareTo("si")==0)?"indexMantenPend.gif":"mantico.gif"%>" align="middle" border="0"> Correctivos (<%=((nTC==0)?"Todos":(nTC==1)?"Abiertos":(nTC==2)?"Cerrados":(nTC==3)?"Facturados":(nTC==4)?"No facturados":"")%>)</a>
					</ul>
					</div>
					<div style='width:300px;border:dashed 2px #A69583;position:relative;left:50px;top:10px;background-color:#F7E7C8;'>
					<ul>
					<li class="menu01" style='position:relative;top:15px;left:-20px;'><a href="ListaMaquinaBuscarServlet" class="menu"><img src="<%=alias%>/img/lupa.gif" align="middle" border="0"> Buscar ...</a>
					</ul>
					</div>
					</div>
					</form>
				</div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</body>
</html>
