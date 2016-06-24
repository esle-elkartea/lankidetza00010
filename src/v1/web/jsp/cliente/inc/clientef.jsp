<jsp:useBean id="cliente" scope="request" class="net.idtoki.amicyf.torque.data.Cliente"/>
<jsp:useBean id="listaProvincias" scope="request" class="net.idtoki.amicyf.torque.data.group.ProvinciaGroupBean"/>
<%@page import="	java.util.ResourceBundle,
					net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>


					<input type="hidden" id="cliid" name="cliid" value="<%=cliente.getClidcliente()%>">
					<input type="hidden" id="clinombre" name="clinombre" value="<%=cliente.getClnombre()%>">
					<input type="hidden" id="cllocaid" name="cllocaid" value="<%=cliente.getClidlocalidad()%>">
					<input type="hidden" id="clprovid" name="clprovid" value="<%=cliente.getClidprovincia()%>">
					<div class="altas01">
						<table width="100%">
						<tr><td>&nbsp;</td></tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Fecha de alta (dd/mm/aaaa)</span>
							 	<span class="spanAlineado" style="width:300px;"><input type="text" id="clfechaalta" class="cajas" name="clfechaalta" size="15" value="<%=cliente.getClfechaaltaParsed()%>">
                              				 	<a href="#" class="menu1"><img id = "calendar_image_trigger" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a></span>
							</td>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "clfechaalta",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger" // trigger for the calendar (button ID)
   								});
   							</script>

						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Nombre (razón social)</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="clnombre" class="cajas" name="clnombre" size="36" value="<%=cliente.getClnombreParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">NIF</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="clnif" class="cajas" size="36" name="clnif" value="<%=cliente.getClnifParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Dirección</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="cldireccion" class="cajas" size="36" name="cldireccion" value="<%=cliente.getCldireccionParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">C.P.</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="clcp" class="cajas" size="36" name="clcp" value="<%=cliente.getClcpParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Provincia</span>
							 	<span class="spanAlineado" style="width:300px;"><select name="clidprovincia" id="clidprovincia" onchange="cargarLocalidades(document.formulario.clidprovincia[document.formulario.clidprovincia.selectedIndex].value)"></select></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Localidad</span>
							 	<span class="spanAlineado" style="width:300px;"><select name="clidlocalidad" id="clidlocalidad"></select></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Teléfono</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="cltelefono" class="cajas" size="36" name="cltelefono" value="<%=cliente.getCltelefonoParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Móvil</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="clmovil" class="cajas" size="36" name="clmovil" value="<%=cliente.getClmovilParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Email</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="clemail" class="cajas" size="36" name="clemail" value="<%=cliente.getClemailParsed()%>"></span>
							</td>
						  </tr>
						  <tr>
							<td>
								<span class="spanAlineado" style="width:100px;">&nbsp;</span>
								<span class="form01_3" style="width:250px;">Fax</span>
								<span class="spanAlineado" style="width:300px;"><input type="text" id="clfax" class="cajas" size="36" name="clfax" value="<%=cliente.getClfaxParsed()%>"></span>
							</td>
						  </tr>
						</table>
					</div>
