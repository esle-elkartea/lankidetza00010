 function comun() {
    valorCheckbox(); 	
    var elementos = new comprueba();
    var objElemT;
    elementos.addElemento(new elemento("manombre","no_es_vacia","","El nombre es obligatorio"));
    elementos.addElemento(new elemento("mafechaalta","es_fecha","","La fecha de alta no es correcta"));
    elementos.addElemento(new elemento("mafechaalta","no_es_vacia","","La fecha de alta es obligatoria"));    
 
    objElemT = new elemento("manombre","es_max","","El nombre es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);


    if(elementos.test()){
      elementos.transformar();
      enviar();
    }
 }
 
 function valorCheckbox(){
 	for(i=0;i<document.getElementsByTagName("input").length;i++){
 		if(document.getElementsByTagName("input")[i].type == "checkbox"){
 			if(document.getElementsByTagName("input")[i].checked == true)
 				document.getElementsByTagName("input")[i].value = "1";
 		}
 	}
} 
 
 function compruebaValor(campo,idCampo,valorCampoNuevo,valorCampoAnt,tipo){
 	//alert("campo:"+campo+" valorant:"+valorCampoAnt+" nuevo:"+valorCampoNuevo + " tipo:" + tipo);
    if ((tipo != 2) && (!es_numero(valorCampoNuevo))){
	alert("El valor de '" + campo + "' no es un número");
	document.getElementById("prc_" + idCampo).value = valorCampoAnt;
    }   	
}
 
 function cargarInstalaciones(cliid){
	url = "XmlGetInstalacionesServlet?cliid="+cliid;
	var selectId = "maidinstalacion";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Instalacion");
	var selectedIndex = document.formulario.insid.value;
	clearSelect(selectId);
	buildTopicList(options,selectId,"Innombre","Inidinstalacion", selectedIndex);
}

 function cargarProtocolos(proId){
	url = "XmlGetProtocolosServlet";
	var selectId = "maidprotocolo";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Protocolo");
	var selectedIndex = document.formulario.proid.value;
	clearSelect(selectId);
	buildTopicList(options,selectId,"Prnombre","Pridprotocolo", selectedIndex);
}

 function tamanio (tipo){
 	var tam = "10";
	switch (tipo){
		case '1':
			tam = "15";
			break;
		case '2':
			tam = "30";
			break;														
	} 
	return tam;	
 }
 
 function claseInput (tipo){
 	var tipoInput = "text";
 	if (tipo == '3'){
 		tipoInput = "checkbox";
 	}
 	return tipoInput;
 }

 function cargarProtocoloCaracteristicass(protId){
	url = "XmlGetProtocoloCaracteristicassServlet?protId="+protId;
	var req = getResponseXml(url);
	var pcs = req.responseXML.getElementsByTagName("ProtocoloCaracteristicas");
	var str="<table cellpadding='0' cellspacing='0' style='width:96%'>";
	var tam,tipoInput;
	var idPc,pcTipo,pcNombre;
	for (i=0;i<pcs.length;i++){
		idPc = pcs[i].getElementsByTagName("Pcidprotocolocaracteristicas")[0].childNodes[0].nodeValue;
		pcTipo = pcs[i].getElementsByTagName("Pctipo")[0].childNodes[0].nodeValue;
		pcNombre = pcs[i].getElementsByTagName("Pcnombre")[0].childNodes[0].nodeValue;
		tam = tamanio(pcTipo);
		tipoInput = claseInput(pcTipo);
		str = str + "<tr><td>" + pcNombre + "</td><td style='text-align:right;'><input type='"+ tipoInput + "' class='caja' size='"+ tam + "' id='prc_" + idPc + "' name='prc_" + idPc + "' value='' onBlur='javascript:compruebaValor(\"" + pcNombre + "\"," + idPc + ",this.value,\"\"," + pcTipo + ");'></td></tr>";
	}
	str = str  + "</table>";
	document.getElementById("divPC").innerHTML = str;
}