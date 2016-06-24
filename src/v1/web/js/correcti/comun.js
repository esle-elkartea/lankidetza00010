 function comun() {
    valorCheckbox();
    var elementos = new comprueba();
    elementos.addElemento(new elemento("cofechaaceptacion","es_fecha","","La fecha no es correcta"));     
    elementos.addElemento(new elemento("cofechacierre","es_fecha","","La fecha no es correcta"));     
    elementos.addElemento(new elemento("cofechafacturacion","es_fecha","","La fecha no es correcta"));     
    elementos.addElemento(new elemento("cofechaaceptacion","no_es_vacia","","la fecha es obligatoria"));
    elementos.addElemento(new elemento("coIncidencia","no_es_vacia","","la incidencia es obligatoria"));
    elementos.addElemento(new elemento("coHoras","es_numero","normalizar","Las horas no son correctas, el formato debería ser hh.hh"));     
    elementos.addElemento(new elemento("coKm","es_numero","normalizar","Los kilometros no son correctos, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("coImporte","es_numero","normalizar","El importe no es correcto, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("coDescuento","es_numero","normalizar","El descuento no es correcto, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("coDisposicionServicio","es_numero","normalizar","La Disposicion de Servicio no es correcta, el formato debería ser hh.hh"));
    objElemH = new elemento("coHoras","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemK = new elemento("coKm","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemI = new elemento("coImporte","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemD = new elemento("coDescuento","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemDS = new elemento("coDisposicionServicio","es_parte_entera","","La parte entera debe tener menos de 8 digitos");
    objElemH.setMax(7);
    objElemK.setMax(7);
    objElemI.setMax(7);
    objElemD.setMax(7);
    objElemDS.setMax(7);
    elementos.addElemento(objElemH);
    elementos.addElemento(objElemK);
    elementos.addElemento(objElemI);
    elementos.addElemento(objElemD);
    elementos.addElemento(objElemDS);

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

 function cargarPerfiles(){
	url = "XmlGetPerfilesServlet"
	var selectId = "coidperfil";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Perfil");
	clearSelect(selectId);
	var selectedIndex = document.formulario.coperfilid.value;
	buildTopicList(options,selectId,"Penombre","IdValorPerfilParsed", selectedIndex);
	//document.formulario.coperfilid.value = document.formulario.coidperfil[document.formulario.coidperfil.selectedIndex].value;
	calculoImportePerfil();
}
function calculoImportePerfil(){
	document.formulario.coperfilid.value = document.formulario.coidperfil[document.formulario.coidperfil.selectedIndex].value;
	var strIdValor = document.formulario.coidperfil[document.formulario.coidperfil.selectedIndex].value;
	var strValor = strIdValor.substr(strIdValor.indexOf('_')+1,strIdValor.length);
	var nValor = parseFloat(strValor);
	var nHoras = parseFloat(document.formulario.coHoras.value);
	var res = Math.round(nValor*nHoras*100)/100;
	document.getElementById("coHorasImporte").innerHTML=res.toFixed(2);
}

 function cargarKilometrajes(){
	url = "XmlGetKilometrajesServlet"
	var selectId = "coidkm";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Kilometraje");
	clearSelect(selectId);
	var selectedIndex = document.formulario.cokmid.value;
	buildTopicList(options,selectId,"Kmnombre","IdValorKmParsed", selectedIndex);
	//document.formulario.cokmid.value = document.formulario.coidkm[document.formulario.coidkm.selectedIndex].value;
	calculoImporteKm();
}

function calculoImporteKm(){
	document.formulario.cokmid.value = document.formulario.coidkm[document.formulario.coidkm.selectedIndex].value;
	var strIdValor = document.formulario.coidkm[document.formulario.coidkm.selectedIndex].value;
	var strValor = strIdValor.substr(strIdValor.indexOf('_')+1,strIdValor.length);
	var nValor = parseFloat(strValor);
	var nKm = parseFloat(document.formulario.coKm.value);
	var res = Math.round(nValor*nKm*100)/100;
	document.getElementById("coKmImporte").innerHTML=res.toFixed(2);
}

function cargarMateriales(){
	var fMateriales = parseFloat(document.getElementById("coMaterialesImporte").innerHTML);
	fMateriales = isNaN(fMateriales)?0:fMateriales;
	document.getElementById("coMaterialesImporte").innerHTML = fMateriales.toFixed(2) + "";
}

function calculoImporteTotal(){
	var fMateriales = parseFloat(document.getElementById("coMaterialesImporte").innerHTML);
	fMateriales = isNaN(fMateriales)?0:fMateriales;
	var fHoras = parseFloat(document.getElementById("coHorasImporte").innerHTML);
	var fKm = parseFloat(document.getElementById("coKmImporte").innerHTML);
	var dto = parseFloat(document.getElementById("coDescuento").value);
	var dispServ = parseFloat(document.getElementById("coDisposicionServicio").value);
	var res = Math.round((fMateriales + fHoras + fKm + dispServ - dto)*100)/100;
	document.getElementById("coImporte").value = res.toFixed(2);
}
 

