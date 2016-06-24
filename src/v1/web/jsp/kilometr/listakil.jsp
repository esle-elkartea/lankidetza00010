<jsp:useBean id="listaKilometrajes" scope="request" class="net.idtoki.amicyf.torque.data.group.KilometrajeGroupBean"/>
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.torque.data.Kilometraje, net.idtoki.amicyf.torque.data.KilometrajePeer, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.group.BaseGroupBean,net.idtoki.amicyf.torque.data.group.KilometrajeGroupBean"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(kmid) {
  window.open('', 'kilometraje_' + kmid , '');
  document.formulario.target = 'kilometraje_' + kmid;
  document.formulario.action = 'KilometrajeActualizarServlet';
  document.formulario.kmid.value = kmid;
  document.formulario.submit();
}

function borrar(kmid){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlKilometrajeBorrarProcesarServlet?kmid="+kmid;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar este Kilometraje?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente el Kilometraje");
	 recargar();
  }else{
  	alert("No se ha podido eliminar el Kilometraje");
  }
}

function nuevo() {
  window.open('', 'kilometraje_nuevo', '');
  document.formulario.target = 'kilometraje_nuevo';
  document.formulario.action = 'KilometrajeNuevoServlet';
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaKilometrajeServlet";
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
					<div class="tituloInPos">Listado de Kilometrajes</div>
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
 						  <a class="tableheader" href="#" onclick="simple_order('<%=KilometrajePeer.KMIDKILOMETRAJE%>')">Referencia</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=KilometrajePeer.KMIDKILOMETRAJE%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=KilometrajePeer.KMNOMBRE%>')">Nombre</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=KilometrajePeer.KMNOMBRE%>')">+</a>
                                                         </span>
							</td>
							<td style="text-align:right;">
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=KilometrajePeer.KMVALOR%>')">Valor</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=KilometrajePeer.KMVALOR%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%
					boolean bColor=true;
                                        Kilometraje km = new Kilometraje();
                                        while (listaKilometrajes.next()){
						km=(Kilometraje)listaKilometrajes.getKilometraje();
						bColor = !bColor;
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>" width="100%">
							<td><span>&nbsp;</span></td>
							<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=km.getKmidkilometraje()+""%>')"><%=km.getKmidkilometraje()%></a></td>
							<td class="listaTexto"><%=km.getKmnombre()%></td>
							<td class="listaTexto" style="text-align:right;"><%=km.getKmvalor()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=km.getKmidkilometraje()+""%>')"></a></td>
						</tr>
					<%
                                        }
					%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= listaKilometrajes.getPaginaActual()+"";
					String paginaUltima = listaKilometrajes.getPaginaUltima()+"";
					String urlPost = "ListaKilometrajeServlet";
					%>
					<%@include file="/jsp/inc/Paginacion.jsp"%>
					<input type="hidden" id="pagina" name="pagina" value="">
					<input type="hidden" name="kmid" id="kmid" value=""/>
					<%@include file="/jsp/inc/orderby.jsp"%>
                                  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>