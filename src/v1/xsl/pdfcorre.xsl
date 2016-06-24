<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0">
	<xsl:output method="fo"/>
	<xsl:include href="main.xslt"/>
	<xsl:template match="result">
<fo:block  font-size="9pt">
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="2cm"/>				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fecha de apertura
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/CofechaaceptacionParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Nº
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/Coidcorrectivo"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
				</fo:table-body>
			</fo:table>					

			<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed">
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="7cm"/>
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="3cm"/>	
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="4" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								DATOS DEL USUARIO
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Cliente
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/ClnombreParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								NIF
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/ClnifParsed"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Dirección
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/CldireccionParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								C.P.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/ClcpParsed"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Provincia
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/NombreProvincia"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Localidad
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/NombreLocalidad"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Teléfono
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/CltelefonoParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								e-mail
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/ClemailParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fax
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Cliente/ClfaxParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>	

			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="16cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Observaciones
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" height="3cm">
							<fo:block>
								<xsl:value-of select="./Correctivo/Cosolucion"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>							
				</fo:table-body>
			</fo:table>
			
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="5cm"/>
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="3cm"/>	
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fecha de cierre
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/CofechacierreParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Horas
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/HorasParsed"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Técnico
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-columns-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/Cotecnico"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>			


			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-column column-width="3cm"/>							
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="5" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								MATERIALES
							</fo:block>
						</fo:table-cell>
					</fo:table-row>				
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Referencia
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Descripción
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Unidades
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Dto.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Total
							</fo:block>
						</fo:table-cell>
					</fo:table-row>																				
				</fo:table-body>
			</fo:table>
		<xsl:for-each select="./Material">
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-column column-width="3cm"/>							
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="MtidmaterialParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Mtconcepto"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="UnidadesParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="DescuentoParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ImporteParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>
					</fo:table-row>																				
				</fo:table-body>
			</fo:table>
		</xsl:for-each>	

			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="9cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="3cm"/>	
				<fo:table-body>					
					<fo:table-row>
						<fo:table-cell number-rows-spanned="4" text-align="left"  padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;Renuncio a presupuesto previo. Autorizando la reparación.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Total materiales
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/ImporteTotalMateriales"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>	
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Mano de obra
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/HorasImporteParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>	
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Desplazamiento
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/KilometrajeImporteParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>	
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Disposición servicio
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/DisposicionservicioParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>											
					<fo:table-row>
						<fo:table-cell text-align="left" padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">				
							<fo:block font-size="8pt">
								&#160;El Cliente.
							</fo:block>														
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Descuento
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/DescuentoParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>															
				</fo:table-body>
			</fo:table>
			
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="4.5cm"/>
				<fo:table-column column-width="4.5cm"/>				
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="3cm"/>	
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;Conforme el cliente
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" border-left-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;Recibí
							</fo:block>
						</fo:table-cell>						
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Total
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/ImporteParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>										
					<fo:table-row>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" border-left-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;
							</fo:block>
						</fo:table-cell>						
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								IVA %
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/IVAParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>	
					<fo:table-row>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" border-left-style="solid"  border-right-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;El técnico
							</fo:block>
						</fo:table-cell>						
						<fo:table-cell number-rows-spanned="2" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Total factura
							</fo:block>
						</fo:table-cell>
						<fo:table-cell number-rows-spanned="2" text-align="right" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Correctivo/ImporteTotalParsed"/>&#160;&#8364;
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>	
					<fo:table-row>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="left"  padding-after="0.1cm" padding-before="0.1cm" border-left-style="solid"  border-right-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;
							</fo:block>
						</fo:table-cell>										
					</fo:table-row>																
				</fo:table-body>
			</fo:table>
			
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="10cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="2cm"/>				
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell number-rows-spanned="3" text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								Esta reparación tiene 3 meses de garantía según normativa R.D. 58/1988.Todo hecho relacionado con esta reparación ha de ir acompañado de este documento.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Contado
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block border-style="solid" border-width="0.1mm" padding="-1.2cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;&#160;
											</fo:block>
						</fo:table-cell>			
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Cheque
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block border-style="solid" border-width="0.1mm" padding="-1.2cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;&#160;
											</fo:block>
						</fo:table-cell>	
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								A facturar
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block border-style="solid" border-width="0.1mm" padding="-1.2cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;&#160;
											</fo:block>
						</fo:table-cell>	
					</fo:table-row>					
				</fo:table-body>
			</fo:table>		
			
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="16cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="left" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block font-size="8pt">
								&#160;Precios según tarifas vigentes
							</fo:block>
						</fo:table-cell>
					</fo:table-row>							
				</fo:table-body>
			</fo:table>									

</fo:block>		
		
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
