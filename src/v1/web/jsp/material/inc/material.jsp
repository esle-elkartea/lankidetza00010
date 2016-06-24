<%@page import="java.util.ResourceBundle,net.idtoki.amicyf.utils.Elemento,net.idtoki.amicyf.utils.Util"%>
<jsp:useBean id="material" scope="request" class="net.idtoki.amicyf.torque.data.Material"/>

					<input type="hidden" id="clinombre" name="clinombre" value="<%=Util.getStrParam(request, "clinombre")%>">
					<input type="hidden" id="innombre" name="innombre" value="<%=Util.getStrParam(request, "innombre")%>">
					<input type="hidden" name="mtid" id="mtid" value="<%=material.getMtidmaterial()%>"/>
					<input type="hidden" name="coid" id="coid" value="<%=request.getParameter("coid")%>"/>
					<div>
						<div class="link04"><%=request.getParameter("clinombre")%>/<%=request.getParameter("innombre")%>/<%=request.getParameter("coid")%></div>
					</div>
					<div class="altas01">
						<table>
                                                  <tr>
							<td>
						<span class="form01_3" style="width:350px;">&nbsp;Nº:&nbsp;</span>
						<span class="spanAlineado" style="width:300px;"><%=material.getMtidmaterialParsed()%></span>
							</td>
                                                </tr>
                                                  <tr>
							<td>
						<span class="form01_3" style="width:350px;">&nbsp;Concepto:&nbsp;</span>
						<span class="spanAlineado" style="width:300px;"><input class="cajas" size="30" type='text' id='mtConcepto' name='mtConcepto' value='<%=material.getMtconcepto()%>'></span>
						<div id="divConcepto" name="divConcepto" class="divConcepto" style="display:none;background-color:#ffffff;"></div>
							</td>
                                                </tr>

						<tr>
					     <td>
                                             	<span class="form01_3" style="width:350px;">&nbsp;Unidades&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mtUnidades' name='mtUnidades' value='<%=material.getMtunidades()%>'></span>
                                             </td>
						</tr>
						<tr>
					     <td>
                                             	<span class="form01_3" style="width:350px;">&nbsp;Descuento&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mtDescuento' name='mtDescuento' value='<%=material.getMtdescuento()%>'></span>
                                                <span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
					    </tr>
						<tr>
					     <td>
                                             	<span class="form01_3" style="width:350px;">&nbsp;Importe total&nbsp;</span>
						<span class="spanAlineado" style="width:80px;"><input class="cajas" style="text-align:right;" size="9" type='text' id='mtImporte' name='mtImporte' value='<%=material.getMtimporte()%>'></span>
						<span class="form01_3" style="width:50px;">&nbsp;&euro;</span>
                                             </td>
						</tr>

						</table>
					</div>



