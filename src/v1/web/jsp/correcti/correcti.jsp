<jsp:useBean id="maquinaGroupBean" scope="request" class="net.idtoki.amicyf.torque.data.group.MaquinaGroupBean"/>
<%@page import="net.idtoki.amicyf.torque.data.Maquina"%>
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/correctivo/comun.js" type="text/javascript"></script>
<script language="javaScript" type="text/javascript">

function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "CorrectivoProcesarServlet";
	document.formulario.submit();
}

function materiales(){
	document.formulario.target = '_self';
	document.formulario.action = "ListaMaterialServlet";
	document.formulario.submit();
}

</script>
</HEAD>
<BODY onload="cargarPerfiles();cargarKilometrajes();cargarMateriales();">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Modificación de Correctivo</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">

					<div class="link05">
						<script language="javascript" type="text/javascript" src="<%=alias%>/js/prototype.js"></script>
						<script language="javascript" type="text/javascript" src="<%=alias%>/js/scriptaculous.js"></script>
						<a href="#" onclick="Effect.BlindDown('listaMaquinas');" class="menu" style="font-size:9pt;"><img src="<%=alias%>/img/instalaciones.gif" align="middle" border="0">&nbsp;Máquinas&nbsp;</a>
						<div id = "listaMaquinas" style="z-index:10;border:solid 1px;padding:10px;background-color:moccasin;position:absolute;top:-100px;left:580px;display:none">
						<%
						Maquina maquina = null;
						boolean bColor=true;
						while (maquinaGroupBean.next()){
							maquina = (Maquina) maquinaGroupBean.getMaquina();
						%>
						<div style='text-align:left;'>
						<img src="<%=alias%>/img/garantia<%=((maquina.tieneGarantia())?"Si":"No")%>.gif" align="middle" border="0">&nbsp;
						<%=maquina.getManombre()%>
						</div>
						<%
						}
						%>
						<div style="font-size:6px;">&nbsp;</div>
						<div>
						<a href="#" class="menu" style="font-size:11px;" onclick="Effect.BlindUp('listaMaquinas');">Aceptar&nbsp;<img src="<%=alias%>/img/aceptar.gif" align="middle" border="0"></a></div>
						</div>
						<a href="javascript:materiales();" class="menu"><img src="<%=alias%>/img/mantico.gif" align="middle" border="0"> Materiales</a>&nbsp;
						<%@include file="/jsp/inc/print.jsp"%>
					</div>
					<%@include file="inc/CorrectivoForm.jsp"%>
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