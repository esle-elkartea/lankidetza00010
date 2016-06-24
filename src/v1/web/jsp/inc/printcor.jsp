<%@include file="/jsp/inc/printInformeBase.jsp"%>
<a href="#" onclick="Effect.BlindDown('informeFechasCor');" class="menu" style="font-size:9pt;"><img src="<%=alias%>/img/pdfInforme.gif" align="middle" border="0">&nbsp;Informe correctivos&nbsp;</a>
<div id = "informeFechasCor" style="z-index:10;border:solid 1px;padding:10px;background-color:moccasin;position:absolute;top:-100px;left:580px;display:none">
 <div>INICIO: <input type="text" id="informeFechaIniCor" name="informeFechaIniCor" width="10" size="11"/><a href="#" class="menu1"><img id="calendar_image_trigger_2" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a></div>
 <div>  FIN:  <input type="text" id="informeFechaFinCor" name="informeFechaFinCor" width="10" size="11"/><a href="#" class="menu1"><img id="calendar_image_trigger_3" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a></div>
<div style="font-size:6px;">&nbsp;</div>
<div><a href="#" class="menu" style="font-size:11px;" onclick="imprimir('PdfCorrectivosInforme')"><img src="<%=alias%>/img/aceptar.gif" align="middle" border="0">&nbsp;Aceptar</a>&nbsp;
<a href="#" class="menu" style="font-size:11px;" onclick="Effect.BlindUp('informeFechasCor');">Cancelar&nbsp;<img src="<%=alias%>/img/cancelar.gif" align="middle" border="0"></a></div>
</div>
<script type="text/javascript">
Calendar.setup({
	inputField     :    "informeFechaIniCor",            // id of the input field
	ifFormat       :    "%d/%m/%Y",      	      // format of the input field
	button         :    "calendar_image_trigger_2" // trigger for the calendar (button ID)
});
Calendar.setup({
	inputField     :    "informeFechaFinCor",            // id of the input field
	ifFormat       :    "%d/%m/%Y",      	      // format of the input field
	button         :    "calendar_image_trigger_3" // trigger for the calendar (button ID)
});
</script>