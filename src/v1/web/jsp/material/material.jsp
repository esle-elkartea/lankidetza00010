

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/prototype.js"></script>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/scriptaculous.js"></script>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/material/comun.js" type="text/javascript"></script>
<script language="javaScript" type="text/javascript">

function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "MaterialProcesarServlet";
	document.formulario.submit();
}

</script>
</HEAD>
<BODY onload="AutoCompletar('mtConcepto','divConcepto','HtmlMaterialServlet');">
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Modificación de Material</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">

					<div class="link05"><%@include file="/jsp/inc/print.jsp"%></div>
					<%@include file="inc/MaterialForm.jsp"%>
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