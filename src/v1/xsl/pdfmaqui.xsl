<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0">
	<xsl:output method="fo"/>
	<xsl:include href="main.xslt"/>
	<xsl:template match="result">
		<xsl:for-each select="./Maquina">
			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="10cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#D0D0D0">
							<fo:block>
								MÁQUINA: <xsl:value-of select="Manombre"/>
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
								<xsl:value-of select="Manombre"/>
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
								<xsl:value-of select="MafechaaltaParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fecha de garantía
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="MafechagarantiaParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>					
				</fo:table-body>
			</fo:table>
		</xsl:for-each>
		<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm">
			<fo:table-column column-width="12cm"/>
			<fo:table-column column-width="4cm"/>
			<fo:table-body>
				<fo:table-row background-color="#FFFFFF">
					<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.1cm" padding-before="0.1cm" table-layout="fixed">
						<fo:block>
								
									</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row background-color="#F0F0F0">
					<fo:table-cell text-align="center" border-style="solid" border-width="0.1mm" table-layout="fixed">
						<fo:block>Característica</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center" border-style="solid" border-width="0.1mm" table-layout="fixed">
						<fo:block>Valor</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:for-each select="./MaquinaCaracteristicas">
			<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed">
				<fo:table-column column-width="12cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="NombreMaquinaCaracteristicas"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<xsl:choose>
								<xsl:when test="TipoMaquinaCaracteristicas = 3">
									<xsl:choose>
										<xsl:when test="Mcvalor = 1">
											<fo:block border-style="solid" border-width="0.1mm" padding="-1.7cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;X
											</fo:block>
										</xsl:when>
										<xsl:otherwise>
											<fo:block border-style="solid" border-width="0.1mm" padding="-1.7cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;&#160;
											</fo:block>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<fo:block>
										<xsl:value-of select="Mcvalor"/>
									</fo:block>
								</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:for-each>
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
