					<input type="hidden" id="insid" name="insid" value="<%=instalacion.getInidinstalacion()%>">
					<input type="hidden" id="cliid" name="cliid" value="<%=instalacion.clienteIdParsed(Util.getIntParam(request, "cliid"))%>">
					<input type="hidden" id="clinombre" name="clinombre" value="<%=instalacion.clienteNombreParsed(instalacion.getInidinstalacion(),Util.getIntParam(request, "cliid"),Util.getStrParam(request, "clinombre"))%>">
					<div class="altas01">
                                        	<table>
						<tr><td>&nbsp;</td></tr>
						<tr><td>
							<span class="form01_3" style="width:80px;">Proyecto </span><span class="spanAlineado" style="width:30px;"><input onclick="document.getElementById('nReg').style.visibility=((this.checked)?'':'hidden')" type="checkbox" id="inproyecto" class="cajas" name="inproyecto" value="<%=instalacion.getInproyecto()%>" <%=(instalacion.getInproyecto() == 1)?"checked":""%>></span>
							<span id="nReg" name="nReg"><span class="form01_3" style="width:120px;">Nº de registro: </span><span class="spanAlineado" style="width:130px;"><input type="text" id="innumeroregistro" class="cajas" name="innumeroregistro" size="16" value="<%=instalacion.getInnumeroregistroParsed()%>"></span></span>
							<span class="form01_3" style="text-align:right;width:140px;">Fecha de alta:&nbsp;&nbsp;</span>
							<span class="spanAlineado" style="width:150px;">
							 <input type="text" id="infechaalta" class="cajas" name="infechaalta" size="15" value="<%=instalacion.getInfechaaltaParsed()%>">
							 <a href="#" class="menu1"><img id= "calendar_image_trigger_FA" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "infechaalta",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_FA" // trigger for the calendar (button ID)
   								});
   							</script>
							</span>
						</td></tr>
						<tr><td>
							<span class="spanAlineado" style="width:640px;">&nbsp;</span>
						</td></tr>
						<tr><td>
							<span class="form01_3" style="width:120px;">Nombre: </span><span class="spanAlineado" style="width:290px;"><input type="text" id="innombre" class="cajas" name="innombre" size="36" value="<%=instalacion.getInnombreParsed()%>"></span>
							<span class="form01_3" style="width:80px;">Cliente: </span><span class="spanAlineado" style="width:150px;"><%=instalacion.clienteConstruirParsed(instalacion.getInidinstalacion(),Util.getIntParam(request, "cliid"),Util.getStrParam(request, "clinombre"))%></span>
						</td></tr>
						<tr><td>
							<span class="form01_3" style="width:120px;">Contacto: </span><span class="spanAlineado" style="width:290px;"><input type="text" id="incontacto" class="cajas" name="incontacto" size="36" value="<%=instalacion.getIncontactoParsed()%>"></span>
							<span class="form01_3" style="width:80px;">teléfono: </span><span class="spanAlineado" style="width:150px;"><input type="text" id="incontactotelefono" class="cajas" name="incontactotelefono" size="16" value="<%=instalacion.getIncontactotelefonoParsed()%>"></span>
						</td></tr>
						<tr><td>
							<span class="form01_3" style="width:120px;">Técnico: </span><span class="spanAlineado" style="width:290px;"><input type="text" id="intecnico" class="cajas" name="intecnico" size="36" value="<%=instalacion.getIntecnicoParsed()%>"></span>
							<span class="form01_3" style="width:80px;">teléfono: </span><span class="spanAlineado" style="width:150px;"><input type="text" id="intecnicotelefono" class="cajas" name="intecnicotelefono" size="16" value="<%=instalacion.getIntecnicotelefonoParsed()%>"></span>
						</td></tr>
						<tr><td>
							<span class="form01_3" style="width:120px;">Administrador: </span><span class="spanAlineado" style="width:290px;"><input type="text" id="inadministrador" class="cajas" name="inadministrador" size="36" value="<%=instalacion.getInadministradorParsed()%>"></span>
							<span class="form01_3" style="width:80px;">teléfono: </span><span class="spanAlineado" style="width:150px;"><input type="text" id="inadministradortelefono" class="cajas" name="inadministradortelefono" size="16" value="<%=instalacion.getInadministradortelefonoParsed()%>"></span>
						</td></tr>
						<tr><td>
							<span class="spanAlineado" style="width:640px;">&nbsp;</span>
						</td></tr>
						<tr><td>
							<span class="form01_3" style="width:80px;text-align:right;">Contrato&nbsp;&nbsp;</span>
							<span class="spanAlineado" style="width:150px;">
							 <input type="text" id="infechacontrato" class="cajas" name="infechacontrato" size="15" value="<%=instalacion.getInfechacontratoParsed()%>">
							 <a href="#" class="menu1"><img id= "calendar_image_trigger_FC" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "infechacontrato",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_FC" // trigger for the calendar (button ID)
   								});
   							</script>
							</span>

							<span class="spanAlineado" style="width:10px;">&nbsp;</span>
							<span class="form01_3" style="width:70px;">&nbsp;vigencia:&nbsp;</span>
							<span class="spanAlineado" style="width:40px;"><input class="cajas" style="text-align:right;" size="2" type='text' id='inaniosvigencia' name='inaniosvigencia' value='<%=instalacion.getAniosVigenciaParsed()%>'></span>
							<span class="form01_3" style="width:35px;">&nbsp;años</span>
							<span class="spanAlineado" style="width:10px;">&nbsp;</span>
							<span class="form01_3" style="width:80px;">&nbsp;Importe:&nbsp;</span>
							<span class="spanAlineado" style="width:10px;">&nbsp;</span>
							<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='inimporte' name='inimporte' value='<%=instalacion.getImporteParsed()%>'></span>
							<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
						</td></tr>
						<tr><td>
							<span class="spanAlineado" style="width:310px;">&nbsp;</span>
							<span class="form01_3" style="width:190px;">Importe preventivos:&nbsp;</span>
							<span id="inPreventivosImporte" name="inPreventivosImporte" class="spanAlineado" style="width:80px;border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;text-align:right;"><%=instalacion.getImporteTotalPreventivos()%></span>
							<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
						</td></tr>
						<tr><td>
							<span class="spanAlineado" style="width:310px;">&nbsp;</span>
							<span class="form01_3" style="width:190px;">Importe correctivos:&nbsp;</span>
							<span id="inCorrectivosImporte" name="inCorrectivosImporte" class="spanAlineado" style="width:80px;border:solid 2px #A69583;padding-top:2px;padding-bottom:2px;text-align:right;"><%=instalacion.getImporteTotalCorrectivos()%></span>
							<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
						</td></tr>
						</table>
					</div>
