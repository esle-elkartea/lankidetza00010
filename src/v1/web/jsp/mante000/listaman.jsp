<jsp:useBean id="Pendientes" scope="request" class="net.idtoki.amicyf.utils.MantenimientosPendientesGroupBean"/>
<%@page import="java.util.ResourceBundle, java.util.List, java.util.Calendar, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.Maquina,net.idtoki.amicyf.torque.data.Instalacion,net.idtoki.amicyf.torque.data.Cliente,net.idtoki.amicyf.torque.data.Protocolo, net.idtoki.amicyf.utils.MantenimientosPendientes"%>
<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">
function ejecutar()
{
  document.formulario.target ="_top";
  document.formulario.action = 'ListaMantenimientosPendientesServlet';
  document.formulario.pagina.value = "";
  document.formulario.submit();
}

function ver(elemento,protocolo,idinstalacion,idcliente,instalacion,cliente) {
  window.open('', 'maquina_' + elemento, '');
  document.formulario.target = 'maquina_' + elemento;
  document.formulario.action = 'MaquinaActualizarServlet';
  document.formulario.maqid.value = elemento;
  document.formulario.proid.value = protocolo;
  document.formulario.insid.value = idinstalacion;
  document.formulario.cliid.value = idcliente;
  document.formulario.innombre.value = instalacion;
  document.formulario.clinombre.value = cliente;
  document.formulario.submit();
}

function imprimirPdf(elemento,protocolo,idinstalacion,idcliente,instalacion,cliente,nFrecuencia) {
  window.open('', 'maquina_' + elemento, '');
  document.formulario.target = 'maquina_' + elemento;
  document.formulario.action = 'PdfInformePendientesServlet';
  document.formulario.maqid.value = elemento;
  document.formulario.proid.value = protocolo;
  document.formulario.insid.value = idinstalacion;
  document.formulario.cliid.value = idcliente;
  document.formulario.innombre.value = instalacion;
  document.formulario.clinombre.value = cliente;
  document.formulario.nFrecuencia.value = nFrecuencia;
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
					<div class="tituloInPos">Listado de Mantenimientos Pendientes</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario" action="ListaMantenimientosPendientes.jsp">
					<div class="link05">
						<SELECT NAME="anio" onchange="ejecutar();">
						<OPTION value="todos">Todos</OPTION>
						<%
							Calendar cl= Calendar.getInstance();
							long anios;
							long anioParam=0;
							if ((request.getParameter("anio")!=null) && (request.getParameter("anio").compareTo("todos")!=0))
								anioParam=Long.parseLong(request.getParameter("anio"));

							for (anios=cl.get(Calendar.YEAR);anios>=cl.get(Calendar.YEAR)-5;anios--)
							{
							%>
							<OPTION value="<%=anios%>" <%=((anios==anioParam)?"SELECTED":"")%>><%=anios%></OPTION>
							<%
							}
						%>
						</SELECT>
						&nbsp;&nbsp;<%@include file="/jsp/inc/print.jsp"%> &nbsp;
						<a href="IndexServlet" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Inicio</a>
					</div>
					<div style="position:absolute;top:50px;left:50px;">
					<div class="cabeceraMoz">&nbsp;</div>
					<div class="contenedora">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
						<tr class="noScroll" style="width:100%;">
							<td><span>&nbsp;</span></td>
                                                	<td><span>Máquina</span></td>
                                                        <td><span>Instalación</span></td>
                                                        <td><span>Cliente</span></td>
                                                        <td><span>Frecuencia</span></td>
                                                        <td><span>Pendientes</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
							<%
							while (Pendientes.next()){
								MantenimientosPendientes mp;
								mp = (MantenimientosPendientes) Pendientes.getMantenimientosPendientes();
								Maquina maq = mp.getMaquina();
								Instalacion ins = maq.getInstalacion();
								Cliente cli = ins.getCliente();
								Protocolo pro = maq.getProtocolo();
						%>
							<tr>
								<td><a href="#" class="menu" onclick="imprimirPdf('<%=maq.getMaidmaquina()+""%>','<%=pro.getPridprotocolo()%>','<%=ins.getInidinstalacion()%>','<%=ins.getInidcliente()%>','<%=ins.getInnombre()%>','<%=cli.getClnombre()%>','<%=mp.getPMFrecuencia()%>')"><img src="<%=alias%>/img/pdf.gif" align="middle" border="0"></a></td>
								<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=maq.getMaidmaquina()+""%>','<%=pro.getPridprotocolo()%>','<%=ins.getInidinstalacion()%>','<%=ins.getInidcliente()%>','<%=ins.getInnombre()%>','<%=cli.getClnombre()%>')"><%=maq.getManombre()%></a></td>
								<td class="listaTexto"><%=ins.getInnombre()%></td>
								<td class="listaTexto"><%=cli.getClnombre()%></td>
								<td class="listaTexto"><%=mp.getLiteralFrecuencia()%></td>
								<td class="listaTexto"><%=mp.getMantPendientes()%></td>
							</tr>
						<%}
						%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= Pendientes.getPaginaActual()+"";
					String paginaUltima = Pendientes.getPaginaUltima()+"";
					String urlPost = "ListaMantenimientosPendientesServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
	  			  <input TYPE="hidden" id="pagina" name="pagina" value=""/>
                                  <input TYPE="hidden" id="nDias" name="nDias" value="<%=request.getParameter("nDias")%>"/>
 				  <input type="hidden" name="maqid" id="maqid" value=""/>
				  <input type="hidden" name="proid" id="proid" value=""/>
				<input type="hidden" name="cliid" id="cliid" value=""/>
				<input type="hidden" name="insid" id="insid" value=""/>
				<input type="hidden" id="clinombre" name="clinombre" value=""/>
				<input type="hidden" id="innombre" name="innombre" value=""/>
				<input type="hidden" id="nFrecuencia" name="nFrecuencia" value=""/>
				</form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>