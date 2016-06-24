<jsp:useBean id="maquinaGroupBean" scope="request" class="net.idtoki.amicyf.torque.data.group.MaquinaGroupBean"/>
<%@page import="java.util.ResourceBundle,
				net.idtoki.amicyf.torque.data.Maquina,
				net.idtoki.amicyf.torque.data.MaquinaPeer,
				net.idtoki.amicyf.utils.Elemento"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(elemento,protocolo,instalacion,cliente,inNombre,cliNombre) {
  window.open('', 'maquina_' + elemento, '');
  document.formulario.target = 'maquina_' + elemento;
  document.formulario.action = 'MaquinaActualizarServlet';
  document.formulario.maqid.value = elemento;
  document.formulario.proid.value = protocolo;
  document.formulario.insid.value = instalacion;
  document.formulario.cliid.value = cliente;
  document.formulario.innombre.value = inNombre;
  document.formulario.clinombre.value = cliNombre;
  document.formulario.submit();
}

function borrar(elemento){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlMaquinaBorrarProcesarServlet?maqid="+elemento;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar esta maquina?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente la maquina");
	 recargar();
  }else{
  	alert("No se puede eliminar la maquina porque tiene mantenimientos asociados");
  }
}
function nuevo() {
  window.open('', 'maquina_nuevo', '');
  document.formulario.target = 'maquina_nuevo';
  document.formulario.action = 'MaquinaNuevoServlet';
  document.formulario.maqid.value = "";
  document.formulario.proid.value = "";
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaMaquinaServlet";
  document.formulario.submit();
}

function instalacion(elemento) {
  document.formulario.target="_top";
  document.formulario.action = 'InstalacionActualizarServlet';
  document.formulario.insid.value = elemento;
  document.formulario.submit();
}

function csv(){
  document.formulario.target="_top";
  document.formulario.action = "CsvListaMaquinaServlet";
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Maquinas</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<a href="#" class="menu" onclick="instalacion(<%=request.getParameter("insid")%>)"><%=request.getParameter("innombre")%></a>
						</div><div class="link05">
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
 							 <a class="tableheader" href="#" onclick="simple_order('<%=MaquinaPeer.MANOMBRE%>')">Máquina</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=MaquinaPeer.MANOMBRE%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=MaquinaPeer.MAFECHAALTA%>')">Alta</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=MaquinaPeer.MAFECHAALTA%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=MaquinaPeer.MAFECHAGARANTIA%>')">Garantía</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=MaquinaPeer.MAFECHAGARANTIA%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=MaquinaPeer.MAIDPROTOCOLO%>')">Protocolo</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=MaquinaPeer.MAIDPROTOCOLO%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%Maquina maquina = null;
						boolean bColor=true;
						while (maquinaGroupBean.next()){
							maquina = (Maquina) maquinaGroupBean.getMaquina();
							bColor = !bColor;
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>"  width="100%">
							<td><span>&nbsp;</span></td>
							<td class="linkCliente"><a href="#" class="menu" onclick="ver('<%=maquina.getMaidmaquina()+""%>','<%=maquina.getProtocolo().getPridprotocolo()%>','<%=maquina.getInstalacion().getInidinstalacion()%>','<%=maquina.getInstalacion().getCliente().getClidcliente()%>','<%=maquina.getInstalacion().getInnombre()%>','<%=maquina.getInstalacion().getCliente().getClnombre()%>')"><%=maquina.getManombre()%></a></td>
							<td class="listaTexto">&nbsp;<%=maquina.getMafechaaltaParsed()%>&nbsp;</td>
							<td class="listaTexto"><img src="<%=alias%>/img/garantia<%=((maquina.tieneGarantia())?"Si":"No")%>.gif" align="middle" border="0"></td>
							<td class="listaTexto">&nbsp;<%=maquina.getMafechagarantiaParsed()%>&nbsp;</td>
							<td class="listaTexto"><%=maquina.getProtocolo().getPrnombre()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=maquina.getMaidmaquina()+""%>')"></a></td>
						</tr>
					<%}%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= maquinaGroupBean.getPaginaActual()+"";
					String paginaUltima = maquinaGroupBean.getPaginaUltima()+"";
					String urlPost = "ListaMaquinaServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
		    	<input type="hidden" id="pagina" name="pagina" value="">
				<input type="hidden" name="maqid" id="maqid" value=""/>
				<input type="hidden" name="cliid" id="cliid" value="<%=request.getParameter("cliid")%>"/>
				<input type="hidden" name="insid" id="insid" value="<%=request.getParameter("insid")%>"/>
                                <input type="hidden" name="proid" id="proid" value=""/>
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
