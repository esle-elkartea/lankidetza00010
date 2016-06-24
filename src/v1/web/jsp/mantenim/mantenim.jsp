<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.ResourceBundle,
					net.idtoki.amicyf.torque.data.Maquina,net.idtoki.amicyf.torque.data.Instalacion,net.idtoki.amicyf.torque.data.Protocolo,
					net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<%@page import="net.idtoki.amicyf.torque.data.MaquinaMantenimientos,net.idtoki.amicyf.torque.data.group.MaquinaMantenimientosGroupBean,net.idtoki.amicyf.torque.data.group.BaseGroupBean"%>
<jsp:useBean id="grupoMantenimiento" scope="request" class="net.idtoki.amicyf.torque.data.group.MaquinaMantenimientosGroupBean"/>
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
	document.formulario.action = "MantenimientoActualizarProcesarServlet";
	document.formulario.submit();
}

 function compruebaValorMam(campo,idCampo,valorCampoNuevo,valorCampoAnt,tipo){
    if ((tipo != 2) && (!es_numero(valorCampoNuevo))){
	alert("El valor de '" + campo + "' no es un número");
	document.getElementById("mam_" + idCampo).value = valorCampoAnt;
    }
}

</script>
</HEAD>
<BODY onload="cargarPerfiles();cargarKilometrajes();">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Modificación de Mantenimiento</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<input type="hidden" name="manid" id="manid" value="<%=mantenimiento.getMnidmantenimiento()%>"/>
					<input type="hidden" name="maqid" id="maqid" value="<%=request.getParameter("maqid")%>"/>
					<input type='hidden' id='mmfecha' name='mmfecha' value='<%=mantenimiento.getMnfecha()%>'>
					<input type="hidden" name="frecuencia" id="frecuencia" value="<%=Util.getIntParam(request,"frecuencia")%>"/>
					<input type="hidden" name="fecha" id="fecha" value="<%=mantenimiento.getMnfecha()%>"/>
					<input type="hidden" name="mmperfilid" id="mmperfilid" value="<%=mantenimiento.cogeIdValorPerfilParsed(mantenimiento.getMnidmantenimiento())%>"/>
					<input type="hidden" name="mmkmid" id="mmkmid" value="<%=mantenimiento.cogeIdValorKmParsed(mantenimiento.getMnidmantenimiento())%>"/>
					<div class="link05"><%@include file="/jsp/inc/print.jsp"%></div>
					<%@include file="inc/MantenimientoForm.jsp"%>
					<div id ="divPM" class="capaMaquinaCaracteristicas" style="height:260px">
						<table cellpadding="0" cellspacing="0" style="width:96%">
						<%
						MaquinaMantenimientosGroupBean mmgb = grupoMantenimiento;
						MaquinaMantenimientos mam = null;
						int tam = 10;
						String tipoInput = "text";
						String strCheck = "";
						int idMam,pmTipo;
						String pmNombre,mmValor;
						while (mmgb.next()){
							mam = mmgb.getMaquinaMantenimientos();
							idMam = mam.getMmidmaquinamantenimientos();
							pmTipo = mam.getProtocoloMantenimientos().getPmtipo();
							pmNombre = mam.getProtocoloMantenimientos().getPmnombre();
							mmValor = mam.getMmvalor();
							tam = mam.tamanio();
							tipoInput = mam.claseInput();
							strCheck = mam.estaChecked();
						%>
						<tr>
						<td>
						<%=pmNombre%>
						</td>
						<td style="text-align:right;">
						<input type="hidden" id="mam_id_<%=idMam%>" name="mam_id_<%=idMam%>" value="<%=idMam%>" >
						<input type="<%=tipoInput%>" class="caja" size="<%=tam%>" id="mam_<%=idMam%>" name="mam_<%=idMam%>" value="<%=mmValor%>" <%=strCheck%>
                                                        onBlur='javascript:compruebaValorMam(<%="\""+pmNombre+"\""%>,<%=idMam%>,this.value,<%="\""+mmValor+"\""%>,<%=pmTipo%>);'>
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