<jsp:useBean id="orderby" scope="request" class="java.lang.String"/>
<script language="javascript">
function limpiar_orderby(){
	document.formulario.orderby.value="";
}
function add_orderby(campo){
	if(document.formulario.orderby.value != "" && document.formulario.orderby.value.indexOf(campo) < 0){
		document.formulario.orderby.value = document.formulario.orderby.value +".and."+campo+":1";
	}else if(document.formulario.orderby.value != "" && document.formulario.orderby.value.indexOf(campo+":1") >= 0){
		nueva = document.formulario.orderby.value.replace(campo+":1",campo+":-1")
		document.formulario.orderby.value = nueva;
	}else if(document.formulario.orderby.value != "" && document.formulario.orderby.value.indexOf(campo+":-1") >= 0){
		nueva = document.formulario.orderby.value.replace(campo+":-1",campo+":1")
		document.formulario.orderby.value = nueva;
	}else{
	    document.formulario.orderby.value = campo+":1";
	}
}

function simple_order(campo){
	limpiar_orderby();
	add_orderby(campo);
	ordenar();
}
function complex_order(campo){
	add_orderby(campo);
	ordenar();
}
function ordenar(){
 url = window.location+"";
 var url_array = url.split("/");
 direccion = url_array[url_array.length-1];
 document.formulario.target="_top";
 document.formulario.pagina.value="0";
 document.formulario.action = direccion;
 document.formulario.submit();
}
</script>
<input type="hidden" id="orderby" name="orderby" value="<%=orderby%>" />