function anterior(pag,ultima,url){
  if (pag > 0 && pag >= 0) {
    document.formulario.action=url;
    document.formulario.target="";
    document.formulario.pagina.value=pag -1 ;
    document.formulario.submit();
  }
}
function siguiente(pag,ultima,url){
  if (pag < ultima && pag >= 0) {
    document.formulario.target="";	
    document.formulario.action=url;
    document.formulario.pagina.value=pag +1;
    document.formulario.submit();
  }
}
function ultima(pag,ultima,url){
 if (pag < ultima && pag >= 0) {
    document.formulario.target="";	
    document.formulario.action=url;
    document.formulario.pagina.value=ultima;
    document.formulario.submit();
  }
}
function primera(pag, ultima,url){
  if (pag > 0 && pag >= 0) {
     document.formulario.target="";	
     document.formulario.action=url;
     document.formulario.pagina.value=0;
     document.formulario.submit();
   }
}
function irA(pag, ultima,url){
  if (true) {
     document.formulario.target="";	
     document.formulario.action=url;
     document.formulario.pagina.value=pag;
     document.formulario.submit();
   }
}

