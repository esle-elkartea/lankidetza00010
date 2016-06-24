<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/maquina/comun.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar-setup.js"></script>
<script type="text/javascript" src="<%=alias%>/js/calendar-lang/calendar-es.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>
<script language="javaScript" type="text/javascript">

function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "MaquinaNuevoProcesarServlet";
	document.formulario.submit();
}
</script>
</HEAD>
<BODY onload="cargarProtocolos();cargarProtocoloCaracteristicass(document.formulario.maidprotocolo.value);">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Alta de Máquina</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%></div>
					</div>
					<%@include file="inc/MaquinaForm.jsp"%>

					<div id ="divPC" class="capaMaquinaCaracteristicas" style="height:230px">
					</div>

					<div class="altas11">
						<a href="javascript:comun();" class="menu"><img src="<%=alias%>/img/aceptar.gif" align="middle" border="0"> Aceptar</a>&nbsp; &nbsp; &nbsp;
						<a href="javascript:window.close();" class="menu">Cancelar <img src="<%=alias%>/img/cancelar.gif" align="middle" border="0"></a>
					</div>

				</form>
			</div>
			<div class="latInfIn"></div>
		</div>
	</div>
</div>
</BODY>
</HTML>