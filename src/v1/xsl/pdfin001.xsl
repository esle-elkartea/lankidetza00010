<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0">
	<xsl:output method="fo"/>
	<xsl:include href="main.xslt"/>
	<xsl:template match="result">
		<xsl:for-each select="./Instalacion">
			<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed">
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="10cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#C0C0C0">
							<fo:block>
								INSTALACIÓN: <xsl:value-of select="Innombre"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Tipo
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Innombre"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fecha de alta
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="InfechaaltaParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Contacto
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Incontacto"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Contacto (teléfono)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Incontactotelefono"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Técnico
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Intecnico"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Técnico (teléfono)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Intecnicotelefono"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Administrador
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Inadministrador"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Administrador (teléfono)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Inadministradortelefono"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Número de registro
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="Innumeroregistro"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Proyecto
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<xsl:choose>
								<xsl:when test="Inproyecto= 1">
									<fo:block border-style="solid" border-width="0.1mm" padding="-4.7cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;X
											</fo:block>
								</xsl:when>
								<xsl:otherwise>
									<fo:block border-style="solid" border-width="0.1mm" padding="-4.7cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;&#160;
											</fo:block>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fecha de Contrato
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="InfechacontratoParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
			<xsl:for-each select="./Correctivo">
				<fo:table break-before="page" table-layout="fixed" border-style="solid" border-width="0.1mm">
					<fo:table-column column-width="6cm"/>
					<fo:table-column column-width="10cm"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#D0D0D0">
								<fo:block>
								CORRECTIVO: <xsl:value-of select="Coidcorrectivo"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Técnico
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Cotecnico"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Total
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="ImporteParsed"/>
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
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
