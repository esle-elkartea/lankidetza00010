<jsp:useBean id="criterio" scope="request" class="java.lang.String"/>
<script language="javascript">
function buscar(){
 url = window.location+"";
 var url_array = url.split("/");
 direccion = url_array[url_array.length-1];
 document.formulario.target="_top";
 document.formulario.pagina.value="0";
 document.formulario.action = direccion;
 document.formulario.submit();
}
</script>
<input type="text" id="criterio" class="cajas" name="criterio" value="<%=criterio%>"/> <a href="#" onclick="buscar()" class="menu"><img src="<%=alias%>/img/lupa.gif" align="middle" border="0"></a>