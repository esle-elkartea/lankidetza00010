<jsp:useBean id="instalacionesContrato" scope="request" class="net.idtoki.amicyf.torque.data.group.InstalacionGroupBean"/>
<%@page import="java.util.ResourceBundle, java.util.List, java.util.Calendar, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.Instalacion,net.idtoki.amicyf.torque.data.Cliente"%>
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(insid,innombre,clinombre) {
  window.open('', 'instalacion_' + insid , '');
  document.formulario.target = 'instalacion_' + insid;
  document.formulario.action = 'InstalacionActualizarServlet';
  document.formulario.insid.value = insid;
  document.formulario.innombre.value = innombre;
  document.formulario.clinombre.value = clinombre;
  document.formulario.submit();
}

function imprimirPdf(insid,innombre,clinombre) {
  window.open('', 'instalacion_' + insid , '');
  document.formulario.target = 'instalacion_' + insid;
  document.formulario.action = 'PdfInstalacionActualizarServlet';
  document.formulario.insid.value = insid;
  document.formulario.innombre.value = innombre;
  document.formulario.clinombre.value = clinombre;
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaInstalacionesContratoServlet";
  document.formulario.submit();
}


</SCRIPT>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Instalaciones con contrato expirado</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div class="link05">
						<%@include file="/jsp/inc/print.jsp"%> &nbsp;
						<a href="IndexServlet" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Inicio</a>
					</div>
					<div class="lista001">
						<table cellpadding="0" cellspacing="0" width="100%">
						<tr style="background-color:#bbc2c6" width="100%">

						</tr></table>
					</div>
					<div style="position:absolute;top:50px;left:50px;">
					<div class="cabeceraMoz">&nbsp;</div>
					<div class="contenedora">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
						<tr class="noScroll" style="width:100%;">
							<td><span>&nbsp;</span></td>
                                                        <td><span>Instalación</span></td>
                                                        <td><span>Cliente</span></td>
                                                	<td><span>Alta</span></td>
                                                	<td><span>Contrato</span></td>
                                                	<td><span>Vigencia</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
							<%
                                        		Instalacion ins = new Instalacion();
                                        		while (instalacionesContrato.next()){
								ins=(Instalacion)instalacionesContrato.getInstalacion();
								Cliente cli = ins.getCliente();
							%>
							<tr width="100%">
								<td><a href="#" class="menu" onclick="imprimirPdf('<%=ins.getInidinstalacion()+""%>','<%=ins.getInnombre()+""%>','<%=cli.getClnombre()+""%>')"><img src="<%=alias%>/img/pdf.gif" align="middle" border="0"></a></td>
								<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=ins.getInidinstalacion()+""%>','<%=ins.getInnombre()+""%>','<%=cli.getClnombre()+""%>')"><%=ins.getInnombre()%></a></td>
								<td class="listaTexto"><%=cli.getClnombre()%></td>
								<td class="listaTexto"><%=ins.getInfechaaltaParsed()%></td>
								<td class="listaTexto"><%=ins.getInfechacontratoParsed()%></td>
								<td class="listaTexto"><%=ins.getAniosVigenciaParsed()%></td>
							</tr>
						<%}
						%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= instalacionesContrato.getPaginaActual()+"";
					String paginaUltima = instalacionesContrato.getPaginaUltima()+"";
					String urlPost = "ListaInstalacionesContratoServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
	  			  <input TYPE="hidden" id="pagina" name="pagina" value=""/>
				<input type="hidden" name="cliid" id="cliid" value=""/>
				<input type="hidden" name="insid" id="insid" value=""/>
				<input type="hidden" id="clinombre" name="clinombre" value=""/>
				<input type="hidden" id="innombre" name="innombre" value=""/>
				<input TYPE="hidden" id="nDiasContrato" name="nDiasContrato" value="<%=request.getParameter("nDiasContrato")%>"/>
				</form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>