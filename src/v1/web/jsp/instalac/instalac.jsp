
<jsp:useBean id="instalacion" scope="request" class="net.idtoki.amicyf.torque.data.Instalacion"/>
<%@page import="	java.util.ResourceBundle,
					net.idtoki.amicyf.torque.data.Instalacion,
					net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/instalacion/comun.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar-setup.js"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar-lang/calendar-es.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>

<script language="javaScript" type="text/javascript">

function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "InstalacionProcesarServlet";
	document.formulario.submit();
}

function maquinas(){
	document.formulario.target = '_self';
	document.formulario.action = "ListaMaquinaServlet";
	document.formulario.submit();
}

function correctivos(){
	document.formulario.target = '_self';
	document.formulario.action = "ListaCorrectivoServlet";
	document.formulario.submit();
}

</script>
</HEAD>
<BODY onload="cargarImportePreventivos();cargarImporteCorrectivos();">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">

				<div class="tituloInPos">Modificación de Instalación</div>

			</div>
			<div class="TextoIn">
			<!-- ETIQUETA INSTALACIONES (Modificación Clientes) Si se pone es mejor cambiar la css en top atodas las #altas-->
			<form action="" method="post" name="formulario">
			<div>
				<div class="link04"><%=instalacion.clienteNombreParsed(instalacion.getInidinstalacion(),Util.getIntParam(request, "cliid"),Util.getStrParam(request, "clinombre"))%>
				</div>
				<div class="link05" >
				<input type="hidden" id="tipoCorrectivo" name="tipoCorrectivo" value="0">
				<a href="javascript:correctivos();" class="menu"><img src="<%=alias%>/img/mantico.gif" align="middle" border="0"> Correctivos</a>&nbsp;
				<a href="javascript:maquinas();" class="menu"><img src="<%=alias%>/img/instalaciones.gif" align="middle" border="0"> Máquinas</a>
				<%@include file="/jsp/inc/print.jsp"%>&nbsp;<%@include file="/jsp/inc/printInforme.jsp"%>&nbsp;<%@include file="/jsp/inc/printCorrectivosInforme.jsp"%>
				</div>
			</div>

<%@include file="inc/InstalacionForm.jsp"%>
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