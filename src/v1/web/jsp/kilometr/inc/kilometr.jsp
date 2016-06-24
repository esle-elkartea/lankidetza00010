<%@page import="java.util.ResourceBundle,net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<jsp:useBean id="kilometraje" scope="request" class="net.idtoki.amicyf.torque.data.Kilometraje"/>

					<input type="hidden" name="kmid" id="kmid" value="<%=kilometraje.getKmidkilometraje()%>"/>
					<div class="altas01">
						<table>
                                                  <tr>
							<td>
						<span class="spanAlineado" style="width:150px;">&nbsp;</span>
						<span class="form01_3" style="width:200px;">&nbsp;Nº:&nbsp;</span>
						<span class="spanAlineado" style="width:300px;"><%=kilometraje.getKmidkilometrajeParsed()%></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;</span>
							</td>
                                                </tr>

						<tr>
					     <td>
						<span class="spanAlineado" style="width:150px;">&nbsp;</span>
                                             	<span class="form01_3" style="width:200px;">&nbsp;Nombre&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="32" type='text' id='kmNombre' name='kmNombre' value='<%=kilometraje.getKmnombre()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;</span>
                                             </td>
						</tr>
						<tr>
					     <td>
						<span class="spanAlineado" style="width:150px;">&nbsp;</span>
                                             	<span class="form01_3" style="width:200px;">&nbsp;Valor&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="32" type='text' id='kmValor' name='kmValor' value='<%=kilometraje.getKmvalor()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
					    </tr>

						</table>
					</div>



