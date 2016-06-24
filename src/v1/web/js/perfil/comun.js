 function comun() {
    var elementos = new comprueba();
    elementos.addElemento(new elemento("peNombre","no_es_vacia","","el nombre es obligatorio"));
    elementos.addElemento(new elemento("peValor","es_numero","normalizar","El valor no es correcto, el formato debería ser hh.hh"));     
    objElemH = new elemento("peValor","es_parte_entera","","La parte entera debe tener menos de 5 digitos");
    objElemH.setMax(4);
    elementos.addElemento(objElemH);

    if(elementos.test()){
      elementos.transformar();
      enviar();
    }
 }
 

 

