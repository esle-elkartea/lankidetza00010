<jsp:useBean id="correctivosPendientes" scope="request" class="net.idtoki.amicyf.torque.data.group.CorrectivoGroupBean"/>
<%@page import="java.util.ResourceBundle, java.util.List, java.util.Calendar, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.Instalacion,net.idtoki.amicyf.torque.data.Cliente,net.idtoki.amicyf.torque.data.Protocolo, net.idtoki.amicyf.torque.data.Correctivo"%>
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(coid,insid,innombre,clinombre) {
  window.open('', 'correctivo_' + coid , '');
  document.formulario.target = 'correctivo_' + coid;
  document.formulario.action = 'CorrectivoActualizarServlet';
  document.formulario.coid.value = coid;
  document.formulario.insid.value = insid;
  document.formulario.innombre.value = innombre;
  document.formulario.clinombre.value = clinombre;
  document.formulario.submit();
}

function imprimirPdf(coid,insid,innombre,clinombre) {
  window.open('', 'correctivo_' + coid , '');
  document.formulario.target = 'correctivo_' + coid;
  document.formulario.action = 'PdfCorrectivoActualizarServlet';
  document.formulario.coid.value = coid;
  document.formulario.insid.value = insid;
  document.formulario.innombre.value = innombre;
  document.formulario.clinombre.value = clinombre;
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaCorrectivosPendientesServlet";
  document.formulario.submit();
}

function tipo(tipoCorrectivo){
  document.formulario.tipoCorrectivo.value = tipoCorrectivo;
  recargar();
}

</SCRIPT>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Correctivos Pendientes</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario" action="ListaCorrectivosPendientes.jsp">
					<div class="link05">
						<a href="#" class="menu1" onclick="tipo(0)"><img src="<%=alias%>/img/corT.gif" align="middle" border="0" alt="Ver Todos"></a>
						<a href="#" class="menu1" onclick="tipo(1)"><img src="<%=alias%>/img/corA.gif" align="middle" border="0" alt="Ver Abiertos"></a>
						<a href="#" class="menu1" onclick="tipo(2)"><img src="<%=alias%>/img/corC.gif" align="middle" border="0" alt="Ver Cerrados"></a>
						<a href="#" class="menu1" onclick="tipo(3)"><img src="<%=alias%>/img/corF.gif" align="middle" border="0" alt="Ver Facturados"></a>
						&nbsp;&nbsp;<%@include file="/jsp/inc/print.jsp"%> &nbsp;
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
							<td><span>&nbsp;Nº&nbsp;</span></td>
                                                	<td><span>Fecha Apertura</span></td>
                                                        <td><span>Instalación</span></td>
                                                        <td><span>Cliente</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
							<%
                                        		Correctivo cor = new Correctivo();
                                        		while (correctivosPendientes.next()){
								cor=(Correctivo)correctivosPendientes.getCorrectivo();
								Instalacion ins = cor.getInstalacion();
								Cliente cli = ins.getCliente();
							%>
							<tr width="100%" style="background-color:<%=cor.getBgColor()%>">
								<td><a href="#" class="menu" onclick="imprimirPdf('<%=cor.getCoidcorrectivo()+""%>','<%=ins.getInidinstalacion()+""%>','<%=ins.getInnombre()+""%>','<%=cli.getClnombre()+""%>')"><img src="<%=alias%>/img/pdf.gif" align="middle" border="0"></a></td>
								<td class="listaTexto"><%=cor.getCoidcorrectivo()%></td>
								<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=cor.getCoidcorrectivo()+""%>','<%=ins.getInidinstalacion()+""%>','<%=ins.getInnombre()+""%>','<%=cli.getClnombre()+""%>')"><%=cor.getCofechaaceptacionParsed()%></a></td>
								<td class="listaTexto"><%=ins.getInnombre()%></td>
								<td class="listaTexto"><%=cli.getClnombre()%></td>
							</tr>
						<%}
						%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= correctivosPendientes.getPaginaActual()+"";
					String paginaUltima = correctivosPendientes.getPaginaUltima()+"";
					String urlPost = "ListaCorrectivosPendientesServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
	  			  <input TYPE="hidden" id="pagina" name="pagina" value=""/>
	  			  <input type="hidden" name="coid" id="coid" value=""/>
				<input type="hidden" name="cliid" id="cliid" value=""/>
				<input type="hidden" name="insid" id="insid" value=""/>
				<input type="hidden" id="clinombre" name="clinombre" value=""/>
				<input type="hidden" id="innombre" name="innombre" value=""/>
				<input type="hidden" id="tipoCorrectivo" name="tipoCorrectivo" value="<%=request.getParameter("tipoCorrectivo")%>">
				</form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>