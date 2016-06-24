<%@page import="java.util.ResourceBundle,net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<jsp:useBean id="perfil" scope="request" class="net.idtoki.amicyf.torque.data.Perfil"/>

					<input type="hidden" name="peid" id="peid" value="<%=perfil.getPeidperfil()%>"/>
					<div class="altas01">
						<table>
                                                  <tr>
							<td>
						<span class="spanAlineado" style="width:150px;">&nbsp;</span>
						<span class="form01_3" style="width:200px;">&nbsp;Nº:&nbsp;</span>
						<span class="spanAlineado" style="width:300px;"><%=perfil.getPeidperfilParsed()%></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;</span>
							</td>
                                                </tr>

						<tr>
					     <td>
						<span class="spanAlineado" style="width:150px;">&nbsp;</span>
                                             	<span class="form01_3" style="width:200px;">&nbsp;Nombre&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="32" type='text' id='peNombre' name='peNombre' value='<%=perfil.getPenombre()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;</span>
                                             </td>
						</tr>
						<tr>
					     <td>
						<span class="spanAlineado" style="width:150px;">&nbsp;</span>
                                             	<span class="form01_3" style="width:200px;">&nbsp;Valor&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="32" type='text' id='peValor' name='peValor' value='<%=perfil.getPevalor()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
					    </tr>

						</table>
					</div>



