<jsp:useBean id="maquinaGroupBean" scope="request" class="net.idtoki.amicyf.torque.data.group.MaquinaGroupBean"/>
<jsp:useBean id="buscarTipo" scope="request" class="java.lang.String"/>
<jsp:useBean id="tipoBuscar" scope="request" class="java.lang.String"/>
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


function buscarT(tipo){
  document.formulario.target="_top";
  document.formulario.action = "ListaMaquinaBuscarServlet";
  document.formulario.tipo.value = tipo;
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
						<div class="link05">
						<input type="text" id="buscar" class="cajas" name="buscar" size="16" value="<%=buscarTipo%>">
						<input type="hidden" id="tipo" class="cajas" name="tipo" value="<%=tipoBuscar%>">
						<a href="#" onclick="buscarT(1)" class="menu"><img src="<%=alias%>/img/lupa.gif" align="middle" border="0">Fabricante</a>
						<a href="#" onclick="buscarT(2)" class="menu"><img src="<%=alias%>/img/lupa.gif" align="middle" border="0">Modelo</a>
						<a href="#" onclick="buscarT(3)" class="menu"><img src="<%=alias%>/img/lupa.gif" align="middle" border="0">Técnico</a>
						<%@include file="/jsp/inc/print.jsp"%>
						<a href="IndexServlet" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Inicio</a>
						</div>
					</div>
					<div style="position:absolute;top:50px;left:50px;">
					<div class="cabeceraMoz">&nbsp;</div>
					<div class="contenedora">
						<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
						<tr class="noScroll" style="width:100%;">
							<td>
							 <span>
 							 <a class="tableheader" href="#" onclick="simple_order('<%=MaquinaPeer.MANOMBRE%>')">Máquina</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=MaquinaPeer.MANOMBRE%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 <a class="tableheader" href="#" onclick="simple_order('<%=MaquinaPeer.MAIDINSTALACION%>')">Instalación</a>
							 <a class="tableheader" href="#" onDblclick="complex_order('<%=MaquinaPeer.MAIDINSTALACION%>')">+</a>
                                                         </span>
							</td>
							<td>
							 <span>
							 Cliente
                                                         </span>
							</td>
						</tr>
						<tr class="noScroll" style="background-color:#000;"><td></td></tr>
					<%Maquina maquina = null;
						boolean bColor=true;
						while (maquinaGroupBean.next()){
							maquina = (Maquina) maquinaGroupBean.getMaquina();
							bColor = !bColor;
					%>
						<tr style="background-color:<%=(bColor?"#F7E7C8":"#FFF8EA")%>"  width="100%">
							<td class="linkCliente"><a href="#" class="menu" onclick="ver('<%=maquina.getMaidmaquina()+""%>','<%=maquina.getProtocolo().getPridprotocolo()%>','<%=maquina.getInstalacion().getInidinstalacion()%>','<%=maquina.getInstalacion().getCliente().getClidcliente()%>','<%=maquina.getInstalacion().getInnombre()%>','<%=maquina.getInstalacion().getCliente().getClnombre()%>')"><%=maquina.getManombre()%></a></td>
							<td class="listaTexto"><%=maquina.getInstalacion().getInnombre()%></td>
							<td class="listaTexto"><%=maquina.getInstalacion().getCliente().getClnombre()%></td>
						</tr>
					<%}%>
						</table>
					</div>
					</div>
					<%
					//para el paginado
					String paginaActual= maquinaGroupBean.getPaginaActual()+"";
					String paginaUltima = maquinaGroupBean.getPaginaUltima()+"";
					String urlPost = "ListaMaquinaBuscarServlet";
					%>
                    <%@include file="/jsp/inc/Paginacion.jsp"%>
		    	<input type="hidden" id="pagina" name="pagina" value="">
				<input type="hidden" name="maqid" id="maqid" value=""/>
				<input type="hidden" name="cliid" id="cliid" value=""/>
				<input type="hidden" name="insid" id="insid" value=""/>
                                <input type="hidden" name="proid" id="proid" value=""/>
				<input type="hidden" id="clinombre" name="clinombre" value="">
				<input type="hidden" id="innombre" name="innombre" value="">
				<%@include file="/jsp/inc/orderby.jsp"%>
			  </form>
			   </div>
				<div class="latInfIn"></div>
			</div>
		</div>
	</div>
</BODY>
</HTML>
