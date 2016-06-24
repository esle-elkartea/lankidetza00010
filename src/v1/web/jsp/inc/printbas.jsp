<script lnaguage="javascript">
function imprimir(prefix){
 window.open('', 'print', '');
 url = window.location+"";
 var url_array = url.split("/");
 direccion = url_array[url_array.length-1];
 document.formulario.target="print";
try{
 document.formulario.pagina.value="0";
}catch(Exception){
//do nothing
}
 document.formulario.action = prefix+direccion;
 document.formulario.submit();
}
</script>
