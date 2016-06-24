<jsp:useBean id="clienteGroupBean" scope="request" class="net.idtoki.amicyf.torque.data.group.ClienteGroupBean"/>
<%@page import="java.util.ResourceBundle,
				net.idtoki.amicyf.torque.data.Cliente,
				net.idtoki.amicyf.torque.data.ClientePeer,
				net.idtoki.amicyf.torque.data.LocalidadPeer,
				net.idtoki.amicyf.utils.Elemento"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(elemento) {
  window.open('', 'cliente_' + elemento, '');
  document.formulario.target = 'cliente_' + elemento;
  document.formulario.action = 'ClienteActualizarServlet';
  document.formulario.cliid.value = elemento;
  document.formulario.submit();
}

function borrar(elemento){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlClienteBorrarProcesarServlet?cliid="+elemento;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar este cliente?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente el cliente");
	 recargar();
  }else{
  	alert("No se puede eliminar el cliente porque tiene instalaciones asociadas");
  }
}

function nuevo() {
  window.open('', 'cliente_nuevo', '');
  document.formulario.target = 'cliente_nuevo';
  document.formulario.action = 'ClienteNuevoServlet';
  document.formulario.cliid.value = "";
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaClienteServlet";
  document.formulario.submit();
}

function inicio(){
  document.formulario.target="_top";
  document.formulario.action = "IndexServlet";
  document.formulario.submit();
}

function csv(){
  document.formulario.target="_top";
  document.formulario.action = "CsvListaClienteServlet";
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Clientes</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div><div class="link04">&nbsp;</div><div class="link05">
						<a href="#" onclick="csv()" class="menu"><img src="<%=alias%>/img/csv.gif" align="middle" border="0"> Exportar</a>&nbsp; &nbsp; &nbsp;
					    	<%@include file="/jsp/inc/search.jsp"%>
						&nbsp; &nbsp; &nbsp;<%@include file="/jsp/inc/print.jsp"%> &nbsp; &nbsp; &nbsp;
						<a href="#" onclick="nuevo()" class="menu"><img src="<%=alias%>/img/nuevo.gif" align="middle" border="0"> Nuevo</a>&nbsp; &nbsp; &nbsp;
						<a href="#" onclick="inicio()" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Inicio</a>
					</div></div>
					<div style="position:absolute;top:50px;left:50px;">
					<div class="cabeceraMoz">&nbsp;</div>
					<div class="contenedora">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
						<tr class="noScroll" style="width:100%;">
							<td><span>&nbsp;</span></td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=ClientePeer.CLNOMBRE%>')">Cliente</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=ClientePeer.CLNOMBRE%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=ClientePeer.CLNIF%>')">NIF</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=ClientePeer.CLNIF%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=ClientePeer.CLIDLOCALIDAD%>')">Localidad</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=ClientePeer.CLIDLOCALIDAD%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 Provincia
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%Cliente cliente = null;
						boolean bColor=true;
						while (clienteGroupBean.next()){
						bColor = !bColor;
						cliente = (Cliente) clienteGroupBean.getCliente();
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>" width="100%">
							<td><span>&nbsp;</span></td>
							<td class="linkCliente"><a href="#" class="menu" onclick="ver('<%=cliente.getClidcliente()+""%>')"><%=cliente.getClnombre()%></a></td>
							<td class="listaTexto"><%=cliente.getClnif()%></td>
							<td class="listaTexto"><%=cliente.getLocalidad().getLonombre()%></td>
							<td class="listaTexto"><%=cliente.getLocalidad().getProvincia().getPvnombre()%></td>
							<td class="listaElim"> <a class="elim" href="#" onclick="borrar('<%=cliente.getClidcliente()+""%>')"></a></td>
						</tr>
					<%}%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= clienteGroupBean.getPaginaActual()+"";
					String paginaUltima = clienteGroupBean.getPaginaUltima()+"";
					String urlPost = "ListaClienteServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
			  <input type="hidden" name="cliid" id="cliid" value=""/>
			  <input type="hidden" id="pagina" name="pagina" value="">
              <%@include file="/jsp/inc/orderby.jsp"%>
			  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>
