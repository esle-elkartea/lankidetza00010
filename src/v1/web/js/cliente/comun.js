 function comun() {
    var elementos = new comprueba();
    //var errores = new Array();
    var objElemT;
    elementos.addElemento(new elemento("clnombre","no_es_vacia","","El nombre es obligatorio"));
    elementos.addElemento(new elemento("clfechaalta","es_fecha","","La fecha de alta no es correcta"));
    elementos.addElemento(new elemento("clfechaalta","no_es_vacia","","La fecha de alta es obligatoria"));    
    //elementos.addElemento(new elemento("cllocalidad","no_es_vacia","","La localidad es obligatoria"));
    elementos.addElemento(new elemento("clnif","no_es_vacia","","El NIF es obligatorio"));

    objElemT = new elemento("clnombre","es_max","","El nombre es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);

    objElemT = new elemento("clnif","es_max","","El NIF es demasiado largo");
    objElemT.setMax(20);
    elementos.addElemento(objElemT);

    objElemT = new elemento("cldireccion","es_max","","La dirección es demasiado largo");
    objElemT.setMax(50);
    elementos.addElemento(objElemT);

    objElemT = new elemento("clcp","es_max","","El código postal es demasiado largo");
    objElemT.setMax(5);
    elementos.addElemento(objElemT);

    objElemT = new elemento("cltelefono","es_max","","El teléfono es demasiado largo");
    objElemT.setMax(10);
    elementos.addElemento(objElemT);

    objElemT = new elemento("clfax","es_max","","El fax es demasiado largo");
    objElemT.setMax(10);
    elementos.addElemento(objElemT);

    objElemT = new elemento("clemail","es_max","","El e-mail es demasiado largo");
    objElemT.setMax(75);
    elementos.addElemento(objElemT);

    //errores = elementos.getTestArray();

    if(elementos.test()){
      elementos.transformar();
      enviar();
    }
 }
 
 function cargarProvincias(){
	url = "XmlGetProvinciasServlet"
	var selectId = "clidprovincia";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Provincia");
	clearSelect(selectId);
	var selectedIndex = document.formulario.clprovid.value;
	buildTopicList(options,selectId,"Pvnombre","Pvidprovincia", selectedIndex);
	document.formulario.clprovid.value = document.formulario.clidprovincia[document.formulario.clidprovincia.selectedIndex].value;
}

function cargarLocalidades(provId){
	url = "XmlGetLocalidadesServlet?provId="+provId;
	var selectId = "clidlocalidad";
	var req = getResponseXml(url);
	var options = req.responseXML.getElementsByTagName("Localidad");
	var selectedIndex = document.formulario.cllocaid.value;
	clearSelect(selectId);
	buildTopicList(options,selectId,"Lonombre","Loidlocalidad", selectedIndex);
	document.formulario.cllocaid.value = document.formulario.clidlocalidad[document.formulario.clidlocalidad.selectedIndex].value;
}
