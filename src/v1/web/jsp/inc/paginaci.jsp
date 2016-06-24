<%
	int actualPage = Integer.parseInt(paginaActual);
	int lastPage = Integer.parseInt(paginaUltima);
	String postUrl = urlPost;
%>
      <div class="link03">
<%
		if(actualPage > 0)
		//if(true)
		{
%>			<span>
			<a href="#" onclick="primera(<%=actualPage%>,<%=lastPage%>,'<%=postUrl%>')" class="menu" style="font-size:12;"><img src="<%=alias%>/img/flprimero.gif" border="0" align="middle">&nbsp;Primero</a>&nbsp;
			<a href="#" onclick="anterior(<%=actualPage%>,<%=lastPage%>,'<%=postUrl%>')" class="menu" style="font-size:12;"><img src="<%=alias%>/img/flanterior.gif" border="0" align="middle">&nbsp;Anterior</a>
			</span>
<%
		}
%>


<%
		if(actualPage < lastPage)
		//if(true)
		{
%>			<span style="position:absolute;left:410px;" >
			<a href="#" onclick="siguiente(<%=actualPage%>,<%=lastPage%>,'<%=postUrl%>')" class="menu" style="font-size:12;">Siguiente&nbsp;<img src="<%=alias%>/img/flsiguiente.gif" border="0" align="middle"></a>&nbsp;
        		<a href="#" onclick="ultima(<%=actualPage%>,<%=lastPage%>,'<%=postUrl%>')" class="menu" style="font-size:12;">Último&nbsp;<img src="<%=alias%>/img/flultimo.gif" border="0" align="middle"></a>
			</span>
<%
		}
%>
 </div>