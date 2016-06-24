<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ResourceBundle,
					net.idtoki.amicyf.torque.data.Maquina,net.idtoki.amicyf.torque.data.Instalacion,net.idtoki.amicyf.torque.data.Protocolo,
					net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<jsp:useBean id="mantenimiento" scope="request" class="net.idtoki.amicyf.torque.data.Mantenimiento"/>
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/mantenimiento/comun.js" type="text/javascript"></script>
<script language="javaScript" type="text/javascript">


function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "MantenimientoNuevoProcesarServlet";
	document.formulario.submit();
}
function enviarTXT(){
	document.formulario.target = '_top';
	document.formulario.action = "MantenimientoNuevoProcesarYExportarServlet";
	document.formulario.submit();
}
</script>
</HEAD>
<BODY onload="cargarProtocoloMantenimientoss(document.formulario.proid.value,document.formulario.frecuencia.value);cargarPerfiles();cargarKilometrajes();">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Alta de Mantenimiento</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<input type="hidden" name="manid" id="manid" value="<%=mantenimiento.getMnidmantenimiento()%>"/>
					<input type="hidden" name="maqid" id="maqid" value="<%=request.getParameter("maqid")%>"/>
					<input type="hidden" id="proid" name="proid" value="<%=request.getParameter("proid")%>">
					<input type="hidden" id="frecuencia" name="frecuencia" value="<%=Util.getIntParam(request,"frecuencia")%>">
					<input type="hidden" name="mmperfilid" id="mmperfilid" value="<%=mantenimiento.cogeIdValorPerfilParsed(mantenimiento.getMnidmantenimiento())%>"/>
					<input type="hidden" name="mmkmid" id="mmkmid" value="<%=mantenimiento.cogeIdValorKmParsed(mantenimiento.getMnidmantenimiento())%>"/>
					<%@include file="inc/MantenimientoForm.jsp"%>

					<div id ="divPM" class="capaMaquinaCaracteristicas" style="height:260px">
                                        </div>

					<div class="altas11">
						<a href="javascript:comun();" class="menu"><img src="<%=alias%>/img/aceptar.gif" align="middle" border="0"> Aceptar</a>&nbsp; &nbsp; &nbsp;
						<a href="javascript:comunTXT();" class="menu"><img src="<%=alias%>/img/exportarTXT.gif" align="middle" border="0"> Exportar</a>&nbsp; &nbsp; &nbsp;
						<a href="javascript:window.close();" class="menu">Cancelar <img src="<%=alias%>/img/cancelar.gif" align="middle" border="0"></a>
					</div>

				</form>
			</div>
			<div class="latInfIn">
			</div>
		</div>
	</div>
</div>
</BODY>
</HTML>