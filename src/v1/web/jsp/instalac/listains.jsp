<jsp:useBean id="instalacionGroupBean" scope="request" class="net.idtoki.amicyf.torque.data.group.InstalacionGroupBean"/>
<%@page import="java.util.ResourceBundle,
				net.idtoki.amicyf.torque.data.Instalacion,
				net.idtoki.amicyf.torque.data.InstalacionPeer,
				net.idtoki.amicyf.utils.Elemento"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(elemento) {
  window.open('', 'instalacion_' + elemento, '');
  document.formulario.target = 'instalacion_' + elemento;
  document.formulario.action = 'InstalacionActualizarServlet';
  document.formulario.insid.value = elemento;
  document.formulario.submit();
}

function borrar(elemento){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlInstalacionBorrarProcesarServlet?insid="+elemento;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar esta instalación?"))
  if(isOk(req)){
	 alert("Se ha eliminado la instalación");
	 recargar();
  }else{
  	alert("No se puede eliminar la instalación porque tiene máquinas ó correctivos asociados");
  }
}

function nuevo() {
  window.open('', 'instalacion_nuevo', '');
  document.formulario.target = 'instalacion_nuevo';
  document.formulario.action = 'InstalacionNuevoServlet';
  document.formulario.insid.value = "";
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaInstalacionServlet";
  document.formulario.submit();
}

function cliente(elemento) {
  document.formulario.target="_top";
  document.formulario.action = 'ClienteActualizarServlet';
  document.formulario.cliid.value = elemento;
  document.formulario.submit();
}

function inicio(){
  document.formulario.target="_top";
  document.formulario.action = "IndexServlet";
  document.formulario.submit();
}

function csv(){
  document.formulario.target="_top";
  document.formulario.action = "CsvListaInstalacionServlet";
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Instalaciones</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link04">
						<%if ((request.getParameter("cliid") != null) && (request.getParameter("cliid").compareTo("null") != 0)){%>
						<a href="#" class="menu" onclick="cliente(<%=request.getParameter("cliid")%>)"><%=request.getParameter("clinombre")%></a>
						<%}%>
						</div><div class="link05">
						<a href="#" onclick="csv()" class="menu"><img src="<%=alias%>/img/csv.gif" align="middle" border="0"> Exportar</a>&nbsp; &nbsp; &nbsp;
						<%@include file="/jsp/inc/search.jsp"%>
						&nbsp;&nbsp;<%@include file="/jsp/inc/print.jsp"%> &nbsp;
						<a href="#" onclick="nuevo()" class="menu"><img src="<%=alias%>/img/nuevo.gif" align="middle" border="0"> Nuevo</a>&nbsp; &nbsp; &nbsp;
						<a href="#" onclick="inicio()" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Inicio</a>
						</div>
					</div>
					<div style="position:absolute;top:50px;left:50px;">
					<div class="cabeceraMoz">&nbsp;</div>
					<div class="contenedora">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
						<tr class="noScroll" style="width:100%;">
							<td><span>&nbsp;</span></td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=InstalacionPeer.INNOMBRE%>')">Instalación</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=InstalacionPeer.INNOMBRE%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 							 <a class="tableheader" href="#" onclick="simple_order('<%=InstalacionPeer.INIDCLIENTE%>')">Cliente</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=InstalacionPeer.INIDCLIENTE%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
  							 <a class="tableheader" href="#" onclick="simple_order('<%=InstalacionPeer.INFECHAALTA%>')">Fecha de alta</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=InstalacionPeer.INFECHAALTA%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%Instalacion instalacion = null;
						boolean bColor=true;
						while (instalacionGroupBean.next()){
							bColor = !bColor;
							instalacion = (Instalacion) instalacionGroupBean.getInstalacion();
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>"  width="100%">
							<td><span>&nbsp;</span></td>
							<td class="linkCliente"><a href="#" class="menu" onclick="ver('<%=instalacion.getInidinstalacion()+""%>')"><%=instalacion.getInnombre()%></td>
							<td class="listaTexto"><%=instalacion.getCliente().getClnombre()%></td>
							<td class="listaTexto"><%=instalacion.getInfechaaltaParsed()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=instalacion.getInidinstalacion()+""%>')"></a></td>
						</tr>
					<%}%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= instalacionGroupBean.getPaginaActual()+"";
					String paginaUltima = instalacionGroupBean.getPaginaUltima()+"";
					String urlPost = "ListaInstalacionServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
		    	<input type="hidden" id="pagina" name="pagina" value="">
		    	<input type="hidden" name="insid" id="insid" value=""/>
				<input type="hidden" name="cliid" id="cliid" value="<%=request.getParameter("cliid")%>"/>
				<input type="hidden" id="clinombre" name="clinombre" value="<%=request.getParameter("clinombre")%>">
				<%@include file="/jsp/inc/orderby.jsp"%>
			  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>
