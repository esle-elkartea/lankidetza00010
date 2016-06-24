<jsp:useBean id="listaCorrectivos" scope="request" class="net.idtoki.amicyf.torque.data.group.CorrectivoGroupBean"/>
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.torque.data.Correctivo, net.idtoki.amicyf.torque.data.CorrectivoPeer, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.group.BaseGroupBean,net.idtoki.amicyf.torque.data.group.CorrectivoGroupBean"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(coid) {
  window.open('', 'correctivo_' + coid , '');
  document.formulario.target = 'correctivo_' + coid;
  document.formulario.action = 'CorrectivoActualizarServlet';
  document.formulario.coid.value = coid;
  document.formulario.submit();
}

function borrar(coid){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlCorrectivoBorrarProcesarServlet?coid="+coid;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar este mantenimiento?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente el mantenimiento");
	 recargar();
  }else{
  	alert("No se ha podido eliminar el mantenimiento");
  }
}

function nuevo() {
  window.open('', 'correctivo_nuevo', '');
  document.formulario.target = 'correctivo_nuevo';
  document.formulario.action = 'CorrectivoNuevoServlet';
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaCorrectivoServlet";
  document.formulario.submit();
}

function tipo(tipoCorrectivo){
  document.formulario.tipoCorrectivo.value = tipoCorrectivo;
  recargar();
}

function instalacion(instalacion) {
  document.formulario.target="_top";
  document.formulario.action = 'InstalacionActualizarServlet';
  document.formulario.insid.value = instalacion;
  document.formulario.submit();
}

function csv(){
  document.formulario.target="_top";
  document.formulario.action = "CsvListaCorrectivoServlet";
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Correctivos</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<a href="#" class="menu" onclick="instalacion(<%=request.getParameter("insid")%>)"><%=request.getParameter("innombre")%></a>
						</div>
						<div class="link05">
						<a href="#" class="menu1" onclick="tipo(0)"><img src="<%=alias%>/img/corT.gif" align="middle" border="0" alt="Ver Todos"></a>
						<a href="#" class="menu1" onclick="tipo(1)"><img src="<%=alias%>/img/corA.gif" align="middle" border="0" alt="Ver Abiertos"></a>
						<a href="#" class="menu1" onclick="tipo(2)"><img src="<%=alias%>/img/corC.gif" align="middle" border="0" alt="Ver Cerrados"></a>
						<a href="#" class="menu1" onclick="tipo(3)"><img src="<%=alias%>/img/corF.gif" align="middle" border="0" alt="Ver Facturados"></a>
						<a href="#" onclick="csv()" class="menu"><img src="<%=alias%>/img/csv.gif" align="middle" border="0"> Exportar</a>&nbsp; &nbsp; &nbsp;
						<%@include file="/jsp/inc/search.jsp"%>
						&nbsp; &nbsp; &nbsp;
						<%@include file="/jsp/inc/print.jsp"%>
						<a href="#" onclick="nuevo()" class="menu"><img src="<%=alias%>/img/nuevo.gif" align="middle" border="0"> Nuevo</a>&nbsp; &nbsp; &nbsp;
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
 						  <a class="tableheader" href="#" onclick="simple_order('<%=CorrectivoPeer.COIDCORRECTIVO%>')">Nº</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=CorrectivoPeer.COIDCORRECTIVO%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=CorrectivoPeer.COFECHAACEPTACION%>')">Fecha Apertura</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=CorrectivoPeer.COFECHAACEPTACION%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=CorrectivoPeer.COTECNICO%>')">Técnico</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=CorrectivoPeer.COTECNICO%>')">+</a>
                                                         </span>
							</td>
							<td style="text-align:right;">
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=CorrectivoPeer.COIMPORTE%>')">Importe</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=CorrectivoPeer.COIMPORTE%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%
                                        Correctivo cor = new Correctivo();
                                        while (listaCorrectivos.next()){
						cor=(Correctivo)listaCorrectivos.getCorrectivo();
					%>
						<tr width="100%" style="background-color:<%=cor.getBgColor()%>">
							<td><span>&nbsp;</span></td>
							<td class="listaTexto"><%=cor.getCoidcorrectivo()%></td>
							<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=cor.getCoidcorrectivo()+""%>')"><%=cor.getCofechaaceptacionParsed()%></a></td>
							<td class="listaTexto"><%=cor.getCotecnico()%></td>
							<td class="listaTexto" style="text-align:right;"><%=cor.getCoimporte()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=cor.getCoidcorrectivo()+""%>')"></a></td>
						</tr>
					<%
                                        }
					%>
						</table>
					</div>
					</div>

					<%
					//para el paginado
					String paginaActual= listaCorrectivos.getPaginaActual()+"";
					String paginaUltima = listaCorrectivos.getPaginaUltima()+"";
					String urlPost = "ListaCorrectivoServlet";
					%>
					<%@include file="/jsp/inc/Paginacion.jsp"%>
					<input type="hidden" id="pagina" name="pagina" value="">
					<input type="hidden" name="coid" id="coid" value=""/>
					<input type="hidden" name="insid" id="insid" value="<%=request.getParameter("insid")%>"/>
					<input type="hidden" id="clinombre" name="clinombre" value="<%=request.getParameter("clinombre")%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=request.getParameter("innombre")%>">
					<input type="hidden" id="tipoCorrectivo" name="tipoCorrectivo" value="<%=request.getParameter("tipoCorrectivo")%>">
					<%@include file="/jsp/inc/orderby.jsp"%>
                                  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>