<jsp:useBean id="listaMantenimientos" scope="request" class="net.idtoki.amicyf.torque.data.group.MantenimientoGroupBean"/>
<jsp:useBean id="listaFrecuencias" scope="request" class="java.util.ArrayList" type="java.util.List" />
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.torque.data.Mantenimiento, net.idtoki.amicyf.torque.data.MantenimientoPeer, net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.torque.data.group.BaseGroupBean,net.idtoki.amicyf.torque.data.group.MantenimientoGroupBean"%>

<HTML>
<HEAD>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="javascript" type="text/javascript" src="<%=alias%>/js/paginado.js"></script>
<script language="javascript" type="text/javascript">

function ver(manid,frecuencia) {
  window.open('', 'mantenimiento_' + manid , '');
  document.formulario.target = 'mantenimiento_' + manid;
  document.formulario.action = 'MantenimientoActualizarServlet';
  document.formulario.manid.value = manid;
  document.formulario.frecuencia.value = frecuencia;
  document.formulario.submit();
}

function borrar(manid){
  //aqui primero lanzamos la comprobación dinámica de si se puede o no borrar
  url = "XmlMantenimientoBorrarProcesarServlet?manid="+manid;
  var req = getResponseXml(url);
  if (confirm("¿Desea eliminar este mantenimiento?"))
  if(isOk(req)){
	 alert("Se ha eliminado correctamente el mantenimiento");
	 recargar();
  }else{
  	alert("No se ha podido eliminar el mantenimiento");
  }
}

function nuevo(frecuencia) {
  window.open('', 'mantenimiento_nuevo', '');
  document.formulario.target = 'mantenimiento_nuevo';
  document.formulario.action = 'MantenimientoNuevoServlet';
  document.formulario.frecuencia.value = frecuencia;
  document.formulario.submit();
}

function recargar(){
  document.formulario.target="_top";
  document.formulario.action = "ListaMantenimientoServlet";
  document.formulario.submit();
}

function maquina(elemento,protocolo,instalacion) {
  document.formulario.target="_top";
  document.formulario.action = 'MaquinaActualizarServlet';
  document.formulario.maqid.value = elemento;
  document.formulario.proid.value = protocolo;
  document.formulario.insid.value = instalacion;
  document.formulario.submit();
}

function csv(){
  document.formulario.target="_top";
  document.formulario.action = "CsvListaMantenimientoServlet";
  document.formulario.submit();
}

</script>
</HEAD>
<BODY>
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Listado de Mantenimientos</div>
				</div>
				<div class="TextoIn">
				<form action="" method="post" name="formulario">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%>/<a href="#" class="menu" onclick="maquina(<%=request.getParameter("maqid")%>,<%=request.getParameter("proid")%>,<%=request.getParameter("insid")%>)"><%=request.getParameter("manombre")%></a></div>
						<div class="link05">
      						<%for (int i=0; i< listaFrecuencias.size(); i++){
							String[] aM= listaFrecuencias.get(i).toString().split(",");
							int num= Integer.parseInt(aM[0].split("'")[1]);
						%>
							<a href="#" onclick="nuevo(<%=num%>)" class="menu1"><img src="<%=alias%>/img/<%=num%>.gif" align="middle" border="0" alt="Nuevo mantenimiento <%=((num==5)?"Bianual":(num==4)?"Anual":(num==3)?"Semestral":(num==2)?"Trimestral":(num==1)?"Mensual":"Quincenal")%>"></a>&nbsp;
      						<%}%>
						<a href="#" onclick="csv()" class="menu"><img src="<%=alias%>/img/csv.gif" align="middle" border="0"> Exportar</a>&nbsp; &nbsp; &nbsp;
						<%@include file="/jsp/inc/search.jsp"%>
						&nbsp; &nbsp; &nbsp;
						<%@include file="/jsp/inc/print.jsp"%>
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
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MantenimientoPeer.MNFECHA%>')">Fecha</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MantenimientoPeer.MNFECHA%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MantenimientoPeer.MNFRECUENCIA%>')">Frecuencia</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MantenimientoPeer.MNFRECUENCIA%>')">+</a>
                                                         </span>
							</td>
							<td style="text-align:right;">
							 <span>
 						  <a class="tableheader" href="#" onclick="simple_order('<%=MantenimientoPeer.MNIMPORTE%>')">Importe</a>
						  <a class="tableheader" href="#" onDblclick="complex_order('<%=MantenimientoPeer.MNIMPORTE%>')">+</a>
                                                         </span>
							</td>
							<td><span>&nbsp;</span></td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%
                                        Mantenimiento man = new Mantenimiento();
                                        while (listaMantenimientos.next()){
						man=(Mantenimiento)listaMantenimientos.getMantenimiento();
						int f = man.getMnfrecuencia();
					%>
						<tr style="background-color:<%=((f==5)?"#F7E7C8":(f==4)?"#FFF8EA":(f==3)?"#ffdab9":(f==2)?"#ffdead":(f==1)?"#ffe4b5":"#ffe4c4")%>"  width="100%">
							<td><span>&nbsp;</span></td>
							<td class="listaTexto"><a href="#" class="menu" onclick="ver('<%=man.getMnidmantenimiento()+""%>','<%=man.getMnfrecuencia()+""%>')"><%=man.getMnfechaParsed()%></a></td>
							<td class="listaTexto"><%=man.getNombreFrecuencia()%></td>
							<td class="listaTexto" style="text-align:right;"><%=man.getMnimporte()%></td>
							<td class="listaElim"><a href="#" class="elim" onclick="borrar('<%=man.getMnidmantenimiento()+""%>')"></a></td>
						</tr>
					<%
                                        }
					%>
						</table>
					</div>

					<%
					//para el paginado
					String paginaActual= listaMantenimientos.getPaginaActual()+"";
					String paginaUltima = listaMantenimientos.getPaginaUltima()+"";
					String urlPost = "ListaMantenimientoServlet";
					%>
					<%@include file="/jsp/inc/Paginacion.jsp"%>
					<input type="hidden" id="pagina" name="pagina" value="">
					<input type="hidden" name="maqid" id="maqid" value="<%=request.getParameter("maqid")%>"/>
					<input type="hidden" name="fecha" id="fecha" value=""/>
					<input type="hidden" name="frecuencia" id="frecuencia" value=""/>
					<input type="hidden" name="manid" id="manid" value=""/>
					<input type="hidden" name="proid" id="proid" value="<%=request.getParameter("proid")%>"/>
					<input type="hidden" name="insid" id="insid" value="<%=request.getParameter("insid")%>"/>
					<input type="hidden" id="clinombre" name="clinombre" value="<%=request.getParameter("clinombre")%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=request.getParameter("innombre")%>">
					<input type="hidden" id="manombre" name="manombre" value="<%=request.getParameter("manombre")%>">
					<%@include file="/jsp/inc/orderby.jsp"%>
                                  </form>
			   </div>
                           </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>