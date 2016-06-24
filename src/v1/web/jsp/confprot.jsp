<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="configuracion" scope="request" class="net.idtoki.amicyf.torque.data.Configuracion"/>
<%@page import="java.util.ResourceBundle, net.idtoki.amicyf.utils.Elemento"%>
<html>
<head>
<title>CONFIGURACIÓN</title>
<%@include file="/jsp/inc/General.jsp"%>
<%@include file="/jsp/inc/validacionjs.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=alias%>/css/estilo01.css">
<script language="JavaScript" type="text/JavaScript">
<!--

 function cargarConfProtocolos(){
	url = "XmlGetProtocolosConfServlet";
	var req = getResponseXml(url);
	var pcs = req.responseXML.getElementsByTagName("Protocolo");
	var str="<table cellpadding='0' cellspacing='0' style='width:96%'>";
	var idPr,prVisible,prNombre;
	var strCheck = "";
	var strCheckValor = "";
	for (i=0;i<pcs.length;i++){
		idPr = pcs[i].getElementsByTagName("Pridprotocolo")[0].childNodes[0].nodeValue;
		prNombre = pcs[i].getElementsByTagName("Prnombre")[0].childNodes[0].nodeValue;
		prVisible = pcs[i].getElementsByTagName("Prvisible")[0].childNodes[0].nodeValue;
		strCheck= ((prVisible == "1")?"checked":"");
		strCheckValor= ((prVisible == "1")?"1":"0");
		str = str + "<tr><td>" + prNombre + "</td><td style='text-align:right;'><input type='checkbox' class='caja' id='pr_" + idPr + "' name='pr_" + idPr + "' value='" + strCheckValor + "' " + strCheck + " ></td></tr>";
	}
	str = str  + "</table>";
	document.getElementById("divPr").innerHTML = str;
}

function enviar(){
	valorCheckbox();
	var elementos = new comprueba();
	elementos.addElemento(new elemento("numDiasVista","es_numero","normalizar","debe ser un nº entero"));
	if(elementos.test()){
		document.formulario.target = '_top';
		document.formulario.action = "protocoloActualizarProcesarServlet";
		document.formulario.submit();
	}
}

 function valorCheckbox(){
 	for(i=0;i<document.getElementsByTagName("input").length;i++){
 		if(document.getElementsByTagName("input")[i].type == "checkbox"){
 			if(document.getElementsByTagName("input")[i].checked == true)
 				document.getElementsByTagName("input")[i].value = "1";
			else
				document.getElementsByTagName("input")[i].value = "0";
 		}
 	}
}

function perfil(){
  document.formulario.target="_top";
  document.formulario.action = "ListaPerfilServlet";
  document.formulario.submit();
}

function kilometraje(){
  document.formulario.target="_top";
  document.formulario.action = "ListaKilometrajeServlet";
  document.formulario.submit();
}

//-->
</script>
</head>

<body onload="cargarConfProtocolos()">
	<div class="main">
		<div class="activoIn">
			<div class="activoSupIn">
				<div class="tituloIn">
					<div class="tituloInPos">Configuración</div>
				</div>
				<div class="TextoIn">
					<form action="" method="post" name="formulario">
					<div><div style='text-align:right;width:100%;'>
                                        	<span class="form01_3" style="width:5px;">&nbsp;</span>
                                        	<span class="form01_3" style="width:55px;color:#880000;">Alarmas:</span>
						<a href="#" onclick="perfil()" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Perfil&nbsp;&nbsp;&nbsp;</a>
						<a href="#" onclick="kilometraje()" class="menu"><img src="<%=alias%>/img/volver.gif" align="middle" border="0"> Kilometraje&nbsp;&nbsp;&nbsp;</a>
					</div><div>&nbsp;</div></div>
					<div style="height:10px;"></div>
					<div style="height:30px;">
                                        	<span class="form01_3" style="width:30px;">&nbsp;</span>
                                        	<span class="form01_3" style="width:230px;">Contrato: <input class="caja" size="5" type="text" id="numDiasVistaContrato" name="numDiasVistaContrato" value="<%=configuracion.getCncontrato()%>"> (días vista)</span>
						<span class="form01_3" style="width:10px;">&nbsp;</span>
						<span class="form01_3" style="width:250px;">Preventivos: <input class="caja" size="5" type="text" id="numDiasVista" name="numDiasVista" value="<%=configuracion.getCnvalor()%>"> (días vista)</span>
						<span class="form01_3" style="width:10px;"></span>
                                        	<span class="form01_3" style="width:240px;">Correctivos: <select style="font-size:14px;" id="numTipoCorrectivo" name="numTipoCorrectivo"><option value="0" <%=((configuracion.getCntipocorrectivo()==0)?"selected":"")%>>Todos</option><option value="1" <%=((configuracion.getCntipocorrectivo()==1)?"selected":"")%>>Abiertos</option><option value="2" <%=((configuracion.getCntipocorrectivo()==2)?"selected":"")%>>Cerrados</option><option value="3" <%=((configuracion.getCntipocorrectivo()==3)?"selected":"")%>>Facturados</option><option value="4" <%=((configuracion.getCntipocorrectivo()==4)?"selected":"")%>>No Facturados</option></select></span>
					</div>
					<div style="height:10px;"></div>
					<div class="tituloProtocolo">Protocolos</div>
					<div class="contenedora1" id="divPr" name="divPr">

					</div>
					<div class="altas11">
						<a href="javascript:enviar();" class="menu"><img src="<%=alias%>/img/aceptar.gif" align="middle" border="0"> Aceptar</a>&nbsp; &nbsp; &nbsp;
						<a href="javascript:window.close();" class="menu">Cancelar <img src="<%=alias%>/img/cancelar.gif" align="middle" border="0"></a>
					</div>
					</form>
				</div>
				<div class="latInfIn">
				</div>
			</div>
		</div>
	</div>
</body>
</html>
