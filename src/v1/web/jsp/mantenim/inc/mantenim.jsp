

					<input type="hidden" id="clinombre" name="clinombre" value="<%=Util.getStrParam(request, "clinombre")%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=Util.getStrParam(request, "innombre")%>">
					<input type="hidden" id="manombre" name="manombre" value="<%=Util.getStrParam(request, "manombre")%>">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%>/<%=request.getParameter("manombre")%></div>
					</div>

					<div class="altas01">
					 <table>
					  <tr>
					   <td>
						<span class="form01_3" style="width:120px;">Frecuencia:</span><span class="spanAlineado" style="font-size:14px;width:120px;"><%=mantenimiento.getNombreDeFrecuencia(Util.getIntParam(request,"frecuencia"))%></span>
					   	<span class="form01_3" style="width:220px;">Fecha (dd/mm/aaaa):</span>
						<span class="spanAlineado" style="width:130px;">
						<input class="cajas" size="12" type='text' id='mmfechaNueva' name='mmfechaNueva' value='<%=mantenimiento.getMnfechaParsed()%>'>
					 	<a href="#" class="menu1"><img id="calendar_image_trigger" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a>
						</span>
						<span class="spanAlineado" style="width:40px;"><a href="#" class="menu" onclick="estiloCoste()">coste</a></span>
					   </td>
					   <script type="text/javascript" src="<%=alias%>/js/calendar.js"></script>
  					   <script type="text/javascript" src="<%=alias%>/js/calendar-setup.js"></script>
  					   <script type="text/javascript" src="<%=alias%>/js/calendar-lang/calendar-es.js"></script>
					   <link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "mmfechaNueva",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger" // trigger for the calendar (button ID)
   								});
   							</script>
					  </tr>

					</table>
					<div id="divCoste" name="divCoste" style="display:none">
					<table width="100%">
					<tr>
					     <td>
                                             	<span class="spanAlineado" style="width:50px;">&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mmHoras' name='mmHoras' onchange="calculoImportePerfil();" value='<%=mantenimiento.getMnhoras()%>'></span>
						<span class="form01_3" style="width:50px;">&nbsp;h.&nbsp;</span>
						<span class="spanAlineado" style="width:250px;"><select class="spanAlineado" style="width:250px;" name="mmidperfil" id="mmidperfil" onchange="calculoImportePerfil();"></select></span>
						<span class="spanAlineado" style="width:20px;">&nbsp;</span>
						<span class="spanAlineado" style="font-size:14px;border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;width:80px;text-align:right;" id="mmHorasImporte" name="mmHorasImporte"></span>
						<span class="form01_3" style="width:80px;">&nbsp;&euro;</span>
                                             </td>
					</tr>
					<tr>
					     <td>
                                             	<span class="spanAlineado" style="width:50px;">&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mmKm' name='mmKm' onchange="calculoImporteKm();" value='<%=mantenimiento.getMnkm()%>'></span>
						<span class="form01_3" style="width:50px;">&nbsp;km.&nbsp;</span>
						<span class="spanAlineado" style="width:250px;"><select class="spanAlineado" style="width:250px;" name="mmidkm" id="mmidkm" onchange="calculoImporteKm();"></select></span>
						<span class="spanAlineado" style="width:20px;">&nbsp;</span>
                                                <span class="spanAlineado" style="font-size:14px;border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;width:80px;text-align:right;" id="mmKmImporte" name="mmKmImporte"></span>
						<span class="form01_3" style="width:80px;">&nbsp;&euro;</span>
                                             </td>
					</tr>
					<tr>
					     <td>
                                             	<span class="form01_3" style="width:450px;text-align:right;">&nbsp;dto.&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mmDescuento' name='mmDescuento' value='<%=mantenimiento.getMndescuento()%>'></span>
						<span class="form01_3" style="width:80px;">&nbsp;&euro;</span>
                                             </td>
                                        </tr>
					<tr>
					     <td>
                                             	<span class="form01_3" style="width:450px;text-align:right;">&nbsp;total&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mmImporte' name='mmImporte' value='<%=mantenimiento.getMnimporte()%>'></span>
						<span class="form01_3" style="width:20px;">&nbsp;&euro;</span>
						<span class="form01_3" style="width:40px;"><a href="#" class="menu1" onclick="calculoImporteTotal();"><img src="<%=alias%>/img/money.gif" align="middle" border="0" alt="recalcular"></a></span>
                                             </td>
					</tr>

					 </table>
					</div>
					</div>
					<div class="lista002">
						<table cellpadding="0" cellspacing="0" width="100%">
						<tr style="background-color:#bbc2c6" width="100%">
							<td class="listaCabezaNom" style="width:500px;">mantenimiento</td>
							<td class="listaCabeza" style="width:100px;">valor</td>
							<td class="anchoScroll"></td>
						</tr></table>
					</div>
