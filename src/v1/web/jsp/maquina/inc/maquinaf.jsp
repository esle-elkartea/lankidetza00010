<jsp:useBean id="maquina" scope="request" class="net.idtoki.amicyf.torque.data.Maquina"/>
<jsp:useBean id="instalacion" scope="request" class="net.idtoki.amicyf.torque.data.Instalacion"/>
<jsp:useBean id="cliente" scope="request" class="net.idtoki.amicyf.torque.data.Cliente"/>
<jsp:useBean id="protocolo" scope="request" class="net.idtoki.amicyf.torque.data.Protocolo"/>
<%@page import="java.util.ResourceBundle,
					net.idtoki.amicyf.torque.data.Maquina,net.idtoki.amicyf.torque.data.Instalacion,net.idtoki.amicyf.torque.data.Protocolo,
					net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>

					<input type="hidden" id="maqid" name="maqid" value="<%=maquina.getMaidmaquina()%>">
					<input type="hidden" id="insid" name="insid" value="<%=instalacion.getInidinstalacion()%>">
					<input type="hidden" id="proid" name="proid" value="<%=protocolo.getPridprotocolo()%>">
					<input type="hidden" id="cliid" name="cliid" value="<%=cliente.getClidcliente()%>">
					<input type="hidden" id="clinombre" name="clinombre" value="<%=cliente.getClnombre()%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=instalacion.getInnombre()%>">
					<input type="hidden" name="maidinstalacion" id="maidinstalacion" value="<%=instalacion.getInidinstalacion()%>">
					<div class="altas01">
						<table><tr>
							<td class="form01_1">Tipo</td>
							<td class="form01_2" colspan='3' style="text-align:left;"><input type="text" id="manombre" class="cajas" name="manombre" size="36" value="<%=maquina.getManombreParsed()%>"></td>
						</tr>
                                                <tr>
							<td class="form01_1">Fecha de alta</td>
							<td class="form01_2" style="text-align:left;">
								<input type="text" id="mafechaalta" class="cajas" size="15" name="mafechaalta" size="36" value="<%=maquina.getMafechaaltaParsed()%>">
							 	<a href="#" class="menu1"><img id="calendar_image_trigger_FA" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a>
							</td>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "mafechaalta",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_FA" // trigger for the calendar (button ID)
   								});
   							</script>
							<td class="form01_1" style="text-align:right;"> Garantía</td>
							<td class="form01_2" style="text-align:left;">
								<input type="text" id="mafechagarantia" class="cajas" size="15" name="mafechagarantia" size="36" value="<%=maquina.getMafechagarantiaParsed()%>">
							 	<a href="#" class="menu1"><img id="calendar_image_trigger_GA" src="<%=alias%>/img/popcalendar/date.gif" width="19" height="17" border="0"></a>
							</td>
							<script type="text/javascript">
    							Calendar.setup({
        							inputField     :    "mafechagarantia",            // id of the input field
									ifFormat       :    "%d/%m/%Y",      	      // format of the input field
									button         :    "calendar_image_trigger_GA" // trigger for the calendar (button ID)
   								});
   							</script>
						</tr>
						<tr>
							<td class="form01_1">Protocolo</td>
							<td class="form01_2" colspan='3' style="text-align:left;">
							<%=maquina.protocoloConstruirParsed(protocolo.getPridprotocolo(),protocolo.getPrnombre())%>
							</td>
						</tr></table>
					</div>

					<div class="lista002">
						<table cellpadding="0" cellspacing="0" width="100%">
						<tr style="background-color:#bbc2c6" width="100%">
							<td class="listaCabezaNom" style="width:500px;">caracteristica</td>
							<td class="listaCabeza" style="width:100px;">valor</td>
							<td class="anchoScroll" ></td>
						</tr></table>
					</div>
