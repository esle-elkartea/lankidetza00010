 function comun() {
    var elementos = new comprueba();
    elementos.addElemento(new elemento("mtConcepto","no_es_vacia","","el concepto es obligatorio"));
    elementos.addElemento(new elemento("mtUnidades","es_numero","normalizar","Las unidades no son correctas, el formato debería ser hh.hh"));     
    elementos.addElemento(new elemento("mtImporte","es_numero","normalizar","El importe no es correcto, el formato debería ser hh.hh"));
    elementos.addElemento(new elemento("mtDescuento","es_numero","normalizar","El descuento no es correcto, el formato debería ser hh.hh"));
    objElemH = new elemento("mtUnidades","es_parte_entera","","La parte entera debe tener menos de 5 digitos");
    objElemI = new elemento("mtImporte","es_parte_entera","","La parte entera debe tener menos de 5 digitos");
    objElemD = new elemento("mtDescuento","es_parte_entera","","La parte entera debe tener menos de 5 digitos");
    objElemH.setMax(4);
    objElemI.setMax(4);
    objElemD.setMax(4);
    elementos.addElemento(objElemH);
    elementos.addElemento(objElemI);
    elementos.addElemento(objElemD);

    if(elementos.test()){
      elementos.transformar();
      enviar();
    }
 }
 
 function AutoCompletar(inputId,divId,linkServlet)
{
 new Ajax.Autocompleter(inputId,divId,linkServlet,{minChars:2});
}

 

