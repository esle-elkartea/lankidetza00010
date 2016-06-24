<jsp:useBean id="listaMateriales" scope="request" class="net.idtoki.amicyf.torque.data.group.MaterialGroupBean"/>
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.torque.data.Material, net.idtoki.amicyf.torque.data.MaterialPeer, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.group.BaseGroupBean,net.idtoki.amicyf.torque.data.group.MaterialGroupBean"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(mtid) {
  window.open('', 'material_' + mtid , '');
  document.formulario.target = 'material_' + mtid;
  document.formulario.action = 'MaterialActualizarServlet';
  document.formulario.mtid.value = mtid;
  document.formulario.submit();
}

function borrar(mtid){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlMaterialBorrarProcesarServlet?mtid="+mtid;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar este material?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente el material");
	 recargar();
  }else{
  	alert("No se ha podido eliminar el material");
  }
}

function nuevo() {
  window.open('', 'material_nuevo', '');
  document.formulario.target = 'material_nuevo';
  document.formulario.action = 'MaterialNuevoServlet';
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaMaterialServlet";
  document.formulario.submit();
}

function correctivo(correctivo) {
  document.formulario.target="_top";
  document.formulario.action = 'CorrectivoActualizarServlet';
  document.formulario.coid.value = correctivo;
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Materiales</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%>/<a href="#" class="menu" onclick="correctivo(<%=request.getParameter("coid")%>)"><%=request.getParameter("coid")%></a>
						</div>
						<div class="link05">
						<%@include file="/jsp/inc/search.jsp"%>
						&nbsp; &nbsp; &nbsp;
						<%@include file="/jsp/inc/print.jsp"%>
						<a href="#" onclick="nuevo()" class="menu"><img src="<%=alias%>/img/nuevo.gif" align="middle" border="0"> Nuevo</a>&nbsp; &nbsp; &nbsp;
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
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MaterialPeer.MTIDMATERIAL%>')">Referencia</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MaterialPeer.MTIDMATERIAL%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MaterialPeer.MTCONCEPTO%>')">Concepto</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MaterialPeer.MTCONCEPTO%>')">+</a>
                                                         </span>
							</td>
							<td style="text-align:right;">
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MaterialPeer.MTUNIDADES%>')">Unidades</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MaterialPeer.MTUNIDADES%>')">+</a>
                                                         </span>
							</td>
							<td style="text-align:right;">
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MaterialPeer.MTIMPORTE%>')">Importe</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MaterialPeer.MTIMPORTE%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%
					boolean bColor=true;
                                        Material mat = new Material();
                                        while (listaMateriales.next()){
						mat=(Material)listaMateriales.getMaterial();
						bColor = !bColor;
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>" width="100%">
							<td><span>&nbsp;</span></td>
							<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=mat.getMtidmaterial()+""%>')"><%=mat.getMtidmaterial()%></a></td>
							<td class="listaTexto"><%=mat.getMtconcepto()%></td>
							<td class="listaTexto" style="text-align:right;"><%=mat.getMtunidades()%></td>
							<td class="listaTexto" style="text-align:right;"><%=mat.getMtimporte()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=mat.getMtidmaterial()+""%>')"></a></td>
						</tr>
					<%
                                        }
					%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= listaMateriales.getPaginaActual()+"";
					String paginaUltima = listaMateriales.getPaginaUltima()+"";
					String urlPost = "ListaMaterialServlet";
					%>
					<%@include file="/jsp/inc/Paginacion.jsp"%>
					<input type="hidden" id="pagina" name="pagina" value="">
					<input type="hidden" name="mtid" id="mtid" value=""/>
					<input type="hidden" name="coid" id="coid" value="<%=request.getParameter("coid")%>"/>
					<input type="hidden" name="insid" id="insid" value="<%=request.getParameter("insid")%>"/>
					<input type="hidden" id="clinombre" name="clinombre" value="<%=request.getParameter("clinombre")%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=request.getParameter("innombre")%>">
					<%@include file="/jsp/inc/orderby.jsp"%>
                                  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>