 function comun() {
    valorCheckbox();
    var elementos = new comprueba();
    elementos.addElemento(new elemento("mmfechaNueva","es_fecha","","La fecha no es correcta"));     
    elementos.addElemento(new elemento("mmfechaNueva","no_es_vacia","","la fecha es obligatoria"));
    elementos.addElemento(new elemento("mmHoras","es_numero","normalizar","Las horas no son correctas, el formato debería ser hh.hh"));     
    elementos.addElemento(new elemento("mmKm","es_numero","normalizar","Los kilometros no son correctos, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("mmImporte","es_numero","normalizar","El importe no es correcto, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("mmDescuento","es_numero","normalizar","El descuento no es correcto, el formato debería ser hh.hh"));
    objElemH = new elemento("mmHoras","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemK = new elemento("mmKm","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemI = new elemento("mmImporte","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemD = new elemento("mmDescuento","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemH.setMax(7);
    objElemK.setMax(7);
    objElemI.setMax(7);
    objElemD.setMax(7);
    elementos.addElemento(objElemH);
    elementos.addElemento(objElemK);
    elementos.addElemento(objElemI);
    elementos.addElemento(objElemD);

    if(elementos.test()){
      elementos.transformar();
      enviar();
    }
 }

 function comunTXT() {
    valorCheckbox();
    var elementos = new comprueba();
    elementos.addElemento(new elemento("mmfechaNueva","es_fecha","","La fecha no es correcta"));     
    elementos.addElemento(new elemento("mmfechaNueva","no_es_vacia","","la fecha es obligatoria"));
    elementos.addElemento(new elemento("mmHoras","es_numero","normalizar","Las horas no son correctas, el formato debería ser hh.hh"));         
    elementos.addElemento(new elemento("mmKm","es_numero","normalizar","Los kilometros no son correctos, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("mmImporte","es_numero","normalizar","El importe no es correcto, el formato debería ser hh.hh"));
    objElemH = new elemento("mmHoras","es_parte_entera","","La parte entera debe tener menos de 4 digitos");
    objElemK = new elemento("mmKm","es_parte_entera","","La parte entera debe tener menos de 5 digitos");
    objElemI = new elemento("mmImporte","es_parte_entera","","La parte entera debe tener menos de 5 digitos");
    objElemH.setMax(3);
    objElemK.setMax(4);
    objElemI.setMax(4);
    elementos.addElemento(objElemH);
    elementos.addElemento(objElemK);
    elementos.addElemento(objElemI);

    if(elementos.test()){
      elementos.transformar();
      enviarTXT();
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
	document.getElementById("prm_" + idCampo).value = valorCampoAnt;
    }   	
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

 function cargarProtocoloMantenimientoss(protId, frecuencia){
	url = "XmlGetProtocoloMantenimientossServlet?protId="+protId+"&frecuencia="+frecuencia;
	var req = getResponseXml(url);
	var pcs = req.responseXML.getElementsByTagName("ProtocoloMantenimientos");
	var str="<table cellpadding='0' cellspacing='0' style='width:96%'>";
	var tam,tipoInput;
	var idPm,pmTipo,pmNombre;		
	for (i=0;i<pcs.length;i++){
		idPm = pcs[i].getElementsByTagName("Pmidprotocolomantenimientos")[0].childNodes[0].nodeValue;
		pmTipo = pcs[i].getElementsByTagName("Pmtipo")[0].childNodes[0].nodeValue;
		pmNombre = pcs[i].getElementsByTagName("Pmnombre")[0].childNodes[0].nodeValue;
		tam = tamanio(pmTipo);
		tipoInput = claseInput(pmTipo);			
		str = str  + "<tr><td>" + pmNombre + "</td><td style='text-align:right;'><input type='"+ tipoInput + "' class='caja' size='"+ tam + "' id='prm_" + idPm + "' name='prm_" + idPm + "' value='' onBlur='javascript:compruebaValor(\"" + pmNombre + "\"," + idPm + ",this.value,\"\"," + pmTipo + ");'></td></tr>";
	}
	str = str  + "</table>" ;
	document.getElementById("divPM").innerHTML = str;
}

 function cargarPerfiles(){
	url = "XmlGetPerfilesServlet"
	var selectId = "mmidperfil";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Perfil");
	clearSelect(selectId);
	var selectedIndex = document.formulario.mmperfilid.value;
	buildTopicList(options,selectId,"Penombre","IdValorPerfilParsed", selectedIndex);
	//document.formulario.mmperfilid.value = document.formulario.mmidperfil[document.formulario.mmidperfil.selectedIndex].value;
	calculoImportePerfil();
}
function calculoImportePerfil(){
	document.formulario.mmperfilid.value = document.formulario.mmidperfil[document.formulario.mmidperfil.selectedIndex].value;
	var strIdValor = document.formulario.mmidperfil[document.formulario.mmidperfil.selectedIndex].value;
	var strValor = strIdValor.substr(strIdValor.indexOf('_')+1,strIdValor.length);
	var nValor = parseFloat(strValor);
	var nHoras = parseFloat(document.formulario.mmHoras.value);
	var res = Math.round(nValor*nHoras*100)/100;	
	document.getElementById("mmHorasImporte").innerHTML=res.toFixed(2);
}

 function cargarKilometrajes(){
	url = "XmlGetKilometrajesServlet"
	var selectId = "mmidkm";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Kilometraje");
	clearSelect(selectId);
	var selectedIndex = document.formulario.mmkmid.value;
	buildTopicList(options,selectId,"Kmnombre","IdValorKmParsed", selectedIndex);
	//document.formulario.mmkmid.value = document.formulario.mmidkm[document.formulario.mmidkm.selectedIndex].value;
	calculoImporteKm();
}

function calculoImporteKm(){
	document.formulario.mmkmid.value = document.formulario.mmidkm[document.formulario.mmidkm.selectedIndex].value;
	var strIdValor = document.formulario.mmidkm[document.formulario.mmidkm.selectedIndex].value;
	var strValor = strIdValor.substr(strIdValor.indexOf('_')+1,strIdValor.length);
	var nValor = parseFloat(strValor);
	var nKm = parseFloat(document.formulario.mmKm.value);
	var res = Math.round(nValor*nKm*100)/100;	
	document.getElementById("mmKmImporte").innerHTML=res.toFixed(2);
}

function calculoImporteTotal(){
	var fHoras = parseFloat(document.getElementById("mmHorasImporte").innerHTML);
	var fKm = parseFloat(document.getElementById("mmKmImporte").innerHTML);
	var dto = document.getElementById("mmDescuento").value;
	var res = Math.round((fHoras + fKm - dto)*100)/100;	
	document.getElementById("mmImporte").value = res.toFixed(2);
}


function estiloCoste(){
	if (document.getElementById('divCoste').style.display=='block')
	{
		document.getElementById('divCoste').style.display='none';
		document.getElementById('divPM').style.height='260px';
	}
	else	
	{
		document.getElementById('divCoste').style.display='block';
		document.getElementById('divPM').style.height='170px';
	}	
}