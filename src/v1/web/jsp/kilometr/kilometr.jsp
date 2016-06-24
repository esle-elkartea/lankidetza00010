

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/prototype.js"></script>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/scriptaculous.js"></script>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" src="<%=alias%>/js/kilometraje/comun.js" type="text/javascript"></script>
<script language="javaScript" type="text/javascript">

function enviar(){
	document.formulario.target = '_top';
	document.formulario.action = "KilometrajeProcesarServlet";
	document.formulario.submit();
}

</script>
</HEAD>
<BODY>
<div class="main">
	<div class="activoIn">
		<div class="activoSupIn">
			<div class="tituloIn">
				<div class="tituloInPos">Modificación de Kilometraje</div>
			</div>
			<div class="TextoIn">
				<form action="" method="post" name="formulario">

					<%@include file="inc/KilometrajeForm.jsp"%>
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