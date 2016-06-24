<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="maquinaCaracteristicasGroupBean" scope="request" class="net.idtoki.amicyf.torque.data.group.MaquinaCaracteristicasGroupBean"/>
<%@page import="net.idtoki.amicyf.torque.data.MaquinaCaracteristicas"%>
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
	document.formulario.action = "MaquinaActualizarProcesarServlet";
	document.formulario.submit();
}

function mantenimientos(){
	document.formulario.target = '_self';
	document.formulario.action = "ListaMantenimientoServlet";
	document.formulario.submit();
}

 function compruebaValorMac(campo,idCampo,valorCampoNuevo,valorCampoAnt,tipo){
    if ((tipo != 2) && (!es_numero(valorCampoNuevo))){
	alert("El valor de '" + campo + "' no es un número");
	document.getElementById("mac_" + idCampo).value = valorCampoAnt;
    }
}

</script>
</HEAD>
<BODY>
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Modificación de Máquina</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">
				<div>
				<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%></div>
				<div class="link05">
					<a href="javascript:mantenimientos();" class="menu"><img src="<%=alias%>/img/mantico.gif" align="middle" border="0"> Mantenimientos</a>&nbsp;
					<%@include file="/jsp/inc/print.jsp"%>&nbsp;
					<%@include file="/jsp/inc/printInforme.jsp"%></div>
				</div>
                                <%@include file="inc/MaquinaForm.jsp"%>

                                <div id ="divPC" class="capaMaquinaCaracteristicas" style="height:230px">
					<table cellpadding="0" cellspacing="0" style="width:96%">
					<%
					MaquinaCaracteristicas mac = null;
					int tam = 10;
					String tipoInput = "text";
					String strCheck = "";
					int idMac,pcTipo;
					String pcNombre,mcValor;
					while (maquinaCaracteristicasGroupBean.next()){
						mac = maquinaCaracteristicasGroupBean.getMaquinaCaracteristicas();
						idMac = mac.getMcidmaquinacaracteristicas();
						pcTipo = mac.getProtocoloCaracteristicas().getPctipo();
						pcNombre = mac.getProtocoloCaracteristicas().getPcnombre();
						mcValor = mac.getMcvalor();
						tam = mac.tamanio();
						tipoInput = mac.claseInput();
						strCheck = mac.estaChecked();
					%>
					<tr>
						<td>
						<%=pcNombre%>
						</td>
						<td style="text-align:right;">
							<input type="hidden" id="mac_id_<%=idMac%>" name="mac_id_<%=idMac%>" value="<%=idMac%>" >
							<input type="<%=tipoInput%>" class="caja" size="<%=tam%>" id="mac_<%=idMac%>" name="mac_<%=idMac%>" value="<%=mcValor%>" <%=strCheck%>
                                                        onBlur='javascript:compruebaValorMac(<%="\""+pcNombre+"\""%>,<%=idMac%>,this.value,<%="\""+mcValor+"\""%>,<%=pcTipo%>);'>
						</td>
					</tr>
					<%
					}
					%>
					</table>
				</div>
				<div class="altas11">
					<a href="javascript:comun();" class="menu"><img src="<%=alias%>/img/aceptar.gif" align="middle" border="0"> Aceptar</a>&nbsp; &nbsp; &nbsp;
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