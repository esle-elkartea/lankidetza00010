 function comun() {
    valorCheckbox();
    var elementos = new comprueba();
    var objElemT;
    elementos.addElemento(new elemento("innombre","no_es_vacia","","El nombre es obligatorio"));
    elementos.addElemento(new elemento("infechaalta","no_es_vacia","","La fecha de alta es obligatoria"));
    elementos.addElemento(new elemento("infechaalta","es_fecha","","La fecha de alta no es correcta"));
    elementos.addElemento(new elemento("infechacontrato","es_fecha","","La fecha de contrato no es correcta"));
    elementos.addElemento(new elemento("inimporte","es_numero","normalizar","El importe no es correcto, el formato debería ser hh.hh"));
    if (document.getElementById("inproyecto").value == "1")
    	elementos.addElemento(new elemento("innumeroregistro","no_es_vacia","","El número de registro es obligatorio"));
 
    objElemT = new elemento("innombre","es_max","","El nombre es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);
    objElemT = new elemento("incontacto","es_max","","El contacto es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);
    objElemT = new elemento("incontactotelefono","es_max","","El contacto(teléfono) es demasiado largo");
    objElemT.setMax(10);
    elementos.addElemento(objElemT);
    objElemT = new elemento("intecnico","es_max","","El técnico es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);
    objElemT = new elemento("intecnicotelefono","es_max","","El técnico(teléfono) es demasiado largo");
    objElemT.setMax(10);
    elementos.addElemento(objElemT);
    objElemT = new elemento("inadministrador","es_max","","El administrador es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);
    objElemT = new elemento("inadministradortelefono","es_max","","El administrador(teléfono) es demasiado largo");
    objElemT.setMax(10);
    elementos.addElemento(objElemT);
    objElemT = new elemento("innumeroregistro","es_max","","El número de registro es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);   
    
    objElemI = new elemento("inimporte","es_parte_entera","","La parte entera debe tener menos de 8 digitos"); 
    objElemI.setMax(7);
    elementos.addElemento(objElemI);

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
 
 function cargarClientes(){
	url = "XmlGetClientesServlet";
	var selectId = "inidcliente";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Cliente");
	var selectedIndex = document.formulario.cliid.value;
	clearSelect(selectId);
	buildTopicList(options,selectId,"Clnombre","Clidcliente", selectedIndex);
	//document.formulario.cliid.value = document.formulario.clidlocalidad[document.formulario.inidcliente.selectedIndex].value;
}

function cargarImportePreventivos(){
	var fPreventivos = parseFloat(document.getElementById("inPreventivosImporte").innerHTML);
	document.getElementById("inPreventivosImporte").innerHTML = isNaN(fPreventivos)?"":fPreventivos.toFixed(2) + "";
}

function cargarImporteCorrectivos(){
	var fCorrectivos = parseFloat(document.getElementById("inCorrectivosImporte").innerHTML);
	document.getElementById("inCorrectivosImporte").innerHTML = isNaN(fCorrectivos)?"":fCorrectivos.toFixed(2) + "";
}
