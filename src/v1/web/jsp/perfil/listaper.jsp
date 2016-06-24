<jsp:useBean id="listaPerfils" scope="request" class="net.idtoki.amicyf.torque.data.group.PerfilGroupBean"/>
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.torque.data.Perfil, net.idtoki.amicyf.torque.data.PerfilPeer, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.group.BaseGroupBean,net.idtoki.amicyf.torque.data.group.PerfilGroupBean"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(peid) {
  window.open('', 'perfil_' + peid , '');
  document.formulario.target = 'perfil_' + peid;
  document.formulario.action = 'PerfilActualizarServlet';
  document.formulario.peid.value = peid;
  document.formulario.submit();
}

function borrar(peid){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlPerfilBorrarProcesarServlet?peid="+peid;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar este Perfil?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente el Perfil");
	 recargar();
  }else{
  	alert("No se ha podido eliminar el Perfil");
  }
}

function nuevo() {
  window.open('', 'perfil_nuevo', '');
  document.formulario.target = 'perfil_nuevo';
  document.formulario.action = 'PerfilNuevoServlet';
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaPerfilServlet";
  document.formulario.submit();
}

function confProtocolos(){
  window.open('', 'protocolo_actualizar', '');
  document.formulario.target = 'protocolo_actualizar';
  document.formulario.action = 'protocoloActualizarServlet';
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Perfiles</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link05">
						<%@include file="/jsp/inc/search.jsp"%>
						<a href="#" onclick="nuevo()" class="menu"><img src="<%=alias%>/img/nuevo.gif" align="middle" border="0"> Nuevo</a>&nbsp; &nbsp; &nbsp;
						<a href="#" onclick="confProtocolos()" class="menu"><img src="<%=alias%>/img/protocolo.gif" align="middle" border="0"> Configuración</a>
						</div>
					</div>
					<div style="position:absolute;top:50px;left:50px;">
					<span class="cabeceraMoz">&nbsp;</span>
					<div class="contenedora">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
						<tr class="noScroll" style="width:100%;">
							<td><span>&nbsp;</span></td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=PerfilPeer.PEIDPERFIL%>')">Referencia</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=PerfilPeer.PEIDPERFIL%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=PerfilPeer.PENOMBRE%>')">Nombre</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=PerfilPeer.PENOMBRE%>')">+</a>
                                                         </span>
							</td>
							<td style="text-align:right">
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=PerfilPeer.PEVALOR%>')">Valor</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=PerfilPeer.PEVALOR%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%
					boolean bColor=true;
                                        Perfil pe = new Perfil();
                                        while (listaPerfils.next()){
						pe=(Perfil)listaPerfils.getPerfil();
						bColor = !bColor;
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>" width="100%">
							<td><span>&nbsp;</span></td>
							<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=pe.getPeidperfil()+""%>')"><%=pe.getPeidperfil()%></a></td>
							<td class="listaTexto"><%=pe.getPenombre()%></td>
							<td class="listaTexto" style="text-align:right"><%=pe.getPevalor()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=pe.getPeidperfil()+""%>')"></a></td>
						</tr>
					<%
                                        }
					%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= listaPerfils.getPaginaActual()+"";
					String paginaUltima = listaPerfils.getPaginaUltima()+"";
					String urlPost = "ListaPerfilServlet";
					%>
					<%@include file="/jsp/inc/Paginacion.jsp"%>
					<input type="hidden" id="pagina" name="pagina" value="">
					<input type="hidden" name="peid" id="peid" value=""/>
					<%@include file="/jsp/inc/orderby.jsp"%>
                                  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>