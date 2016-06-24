<HTML>
<HEAD>
<script language="javascript">
function cerrar(){
  try{
        opener.recargar();
        window.close();
  }catch(e){
    window.close();
  }
}
</script>
</HEAD>
<BODY onload="cerrar()">
</BODY>
</HTML>