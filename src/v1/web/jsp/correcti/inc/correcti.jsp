<%@page import="java.util.ResourceBundle,
					net.idtoki.amicyf.torque.data.Maquina,
					net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<jsp:useBean id="correctivo" scope="request" class="net.idtoki.amicyf.torque.data.Correctivo"/>
<jsp:useBean id="importeTotalMateriales" scope="request" class="java.lang.String"/>

					<input type="hidden" id="clinombre" name="clinombre" value="<%=Util.getStrParam(request, "clinombre")%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=Util.getStrParam(request, "innombre")%>">
					<input type="hidden" name="coid" id="coid" value="<%=correctivo.getCoidcorrectivo()%>"/>
					<input type="hidden" name="insid" id="insid" value="<%=request.getParameter("insid")%>"/>
					<input type="hidden" name="coperfilid" id="coperfilid" value="<%=correctivo.cogeIdValorPerfilParsed(correctivo.getCoidcorrectivo())%>"/>
					<input type="hidden" name="cokmid" id="cokmid" value="<%=correctivo.cogeIdValorKmParsed(correctivo.getCoidcorrectivo())%>"/>
					<input type="hidden" id="proid" name="proid" value="<%=request.getParameter("proid")%>">
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%></div>
					</div>
					<div class="altas01">
						<table>
                                                <tr>
							<td>
						<span class="form01_3" style="width:130px;">Nº:&nbsp;</span>
						<span class="spanAlineado" style="width:150px;"><%=correctivo.getCoidcorrectivoParsed()%></span>
						<span class="spanAlineado" style="width:60px;">&nbsp;</span>
						<span class="form01_3" style="width:120px;">Apertura:&nbsp;</span>
						<span class="spanAlineado" style="width:130px;"><input class="cajas" size="12" type='text' id='cofechaaceptacion' name='cofechaaceptacion' value='<%=correctivo.getCofechaaceptacionParsed()%>'>
					 	<a href="#" class="menu1"><img id="calendar_image_trigger_1" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a></span>

					   <script type="text/javascript" src="<%=alias%>/js/calendar.js"></script>
  					   <script type="text/javascript" src="<%=alias%>/js/calendar-setup.js"></script>
  					   <script type="text/javascript" src="<%=alias%>/js/calendar-lang/calendar-es.js"></script>
					   <link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "cofechaaceptacion",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_1" // trigger for the calendar (button ID)
   								});
   							</script>
							</td>
                                                  </tr>
                                                  <tr>
							<td>
						<span class="form01_3" style="width:130px;">Contacto:&nbsp;</span>
						<span class="spanAlineado" style="width:150px;"><input class="cajas" size="20" type='text' id='coContacto' name='coContacto' value='<%=correctivo.getCocontacto()%>'></span>
						<span class="spanAlineado" style="width:50px;">&nbsp;</span>
						<span class="form01_3" style="width:120px;">Cierre:&nbsp;</span>
						<span class="spanAlineado" style="width:130px;"><input class="cajas" size="12" type='text' id='cofechacierre' name='cofechacierre' value='<%=correctivo.getCofechacierreParsed()%>'>
					 	<a href="#" class="menu1"><img id="calendar_image_trigger_2" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a></span>

					   <link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "cofechacierre",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_2" // trigger for the calendar (button ID)
   								});
   							</script>
							</td>
                                                </tr>
                                                <tr>
							<td>
						<span class="form01_3" style="width:130px;">Técnico:&nbsp;</span>
						<span class="spanAlineado" style="width:150px;"><input class="cajas" size="20" type='text' id='coTecnico' name='coTecnico' value='<%=correctivo.getCotecnico()%>'></span>
						<span class="spanAlineado" style="width:50px;">&nbsp;</span>
						<span class="form01_3" style="width:120px;">Facturación:&nbsp;</span>
						<span class="spanAlineado" style="width:130px;"><input class="cajas" size="12" type='text' id='cofechafacturacion' name='cofechafacturacion' value='<%=correctivo.getCofechafacturacionParsed()%>'>
					 	<a href="#" class="menu1"><img id="calendar_image_trigger_3" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a></span>

					   <link rel="stylesheet" type="text/css" media="all" href="<%=alias%>/css/calendar.css"/>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "cofechafacturacion",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_3" // trigger for the calendar (button ID)
   								});
   							</script>
							</td>
						</tr>

						<tr>
					     <td>
						<span class="form01_3" style="width:100px;">&nbsp;Incidencia:&nbsp;</span>
                                             	<textarea cols="60" rows="2" id='coIncidencia' name='coIncidencia'><%=correctivo.getCoincidencia()%></textarea>
						</td>
						</tr>

						<tr>
					     <td>
						<span class="form01_3" style="width:100px;">&nbsp;Solución:&nbsp;</span>
                                             	<textarea cols="60" rows="2" id='coSolucion' name='coSolucion'><%=correctivo.getCosolucion()%></textarea>
						</td>
						</tr>
						<tr>
					     <td>
                                             	<span class="form01_3" style="width:450px;text-align:right;">&nbsp;materiales&nbsp;</span>
						<span class="spanAlineado" style="border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;width:80px;text-align:right;" id="coMaterialesImporte" name="coMaterialesImporte"><%=importeTotalMateriales%></span>
						<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
						</tr>
						<tr>
					     <td>
                                             	<span class="spanAlineado" style="width:50px;">&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='coHoras' name='coHoras' onchange="calculoImportePerfil();" value='<%=correctivo.getCohoras()%>'></span>
						<span class="form01_3" style="width:50px;">&nbsp;h.&nbsp;</span>
						<span class="spanAlineado" style="width:250px;"><select class="spanAlineado" style="width:250px;" name="coidperfil" id="coidperfil" onchange="calculoImportePerfil();"></select></span>
						<span class="spanAlineado" style="width:20px;">&nbsp;</span>
						<span class="spanAlineado" style="border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;width:80px;text-align:right;" id="coHorasImporte" name="coHorasImporte"></span>
						<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
						</tr>
						<tr>
					     <td>
                                             	<span class="spanAlineado" style="width:50px;">&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='coKm' name='coKm' onchange="calculoImporteKm();" value='<%=correctivo.getCokm()%>'></span>
						<span class="form01_3" style="width:50px;">&nbsp;km.&nbsp;</span>
						<span class="spanAlineado" style="width:250px;"><select class="spanAlineado" style="width:250px;" name="coidkm" id="coidkm" onchange="calculoImporteKm();"></select></span>
						<span class="spanAlineado" style="width:20px;">&nbsp;</span>
						<span class="spanAlineado" style="border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;width:80px;text-align:right;" id="coKmImporte" name="coKmImporte"></span>
						<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
						</tr>
						<tr>
					     <td>
                                             	<span class="form01_3" style="width:450px;text-align:right;">&nbsp;disposición de servicio&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='coDisposicionServicio' name='coDisposicionServicio' value='<%=correctivo.getCodisposicionservicio()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
					    </tr>
						<tr>
					     <td>
                                             	<span class="form01_3" style="width:450px;text-align:right;">&nbsp;dto.&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='coDescuento' name='coDescuento' value='<%=correctivo.getCodescuento()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
					    </tr>
						<tr>
					     <td>
                                             	<span class="form01_3" style="width:450px;text-align:right;">&nbsp;base imponible&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='coImporte' name='coImporte' value='<%=correctivo.getCoimporte()%>'></span>
						<span class="form01_3" style="width:20px;">&nbsp;&euro;</span>
						<span class="form01_3" style="width:40px;"><a href="#" class="menu1" onclick="calculoImporteTotal();"><img src="<%=alias%>/img/money.gif" align="middle" border="0" alt="recalcular"></a></span>
                                             </td>
						</tr>

						</table>
					</div>



