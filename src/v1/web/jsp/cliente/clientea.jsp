<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/cliente/comun.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar-setup.js"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar-lang/calendar-es.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>
<script language="javaScript" type="text/javascript">

function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "ClienteProcesarServlet";
	document.formulario.submit();
}

function instalaciones(){
	document.formulario.target = '_self';
	document.formulario.action = "ListaInstalacionServlet";
	document.formulario.submit();
}

</script>
</HEAD>
<BODY onload="cargarProvincias(); cargarLocalidades(document.formulario.clprovid.value)">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Modificación de Clientes</div>
			</div>
			<div class="TextoIn">
			<!-- ETIQUETA INSTALACIONES (Modificación Clientes) Si se pone es mejor cambiar la css en top atodas las #altas-->
			<form action="" method="post" name="formulario">
			<div class="link05">
			<a href="javascript:instalaciones();" class="menu"><img src="<%=alias%>/img/instalaciones.gif" align="middle" border="0"> Instalaciones</a>&nbsp;
			<%@include file="/jsp/inc/print.jsp"%>&nbsp;
			<%@include file="/jsp/inc/printInforme.jsp"%>&nbsp;<%@include file="/jsp/inc/printCorrectivosInforme.jsp"%>
			</div>
<%@include file="inc/ClienteForm.jsp"%>
<div class="altas11"><a href="javascript:comun();" class="menu"><img src="<%=alias%>/img/aceptar.gif" align="middle" border="0"> Aceptar</a>&nbsp; &nbsp; &nbsp;
<a href="javascript:window.close();" class="menu">Cancelar <img src="<%=alias%>/img/cancelar.gif" align="middle" border="0"></a></div>
</form>
</div>
			<div class="latInfIn"></div>
		</div>
	</div>
</div>
</BODY>
</HTML>