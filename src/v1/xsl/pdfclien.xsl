<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0">
	<xsl:output method="fo"/>
	<xsl:include href="main.xslt"/>
	<xsl:template match="result">
		<xsl:for-each select="./Cliente">
			<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed">
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="10cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#B0B0B0">
							<fo:block>
								CLIENTE: <xsl:value-of select="ClnombreParsed"/>
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
								<xsl:value-of select="ClfechaaltaParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Nombre (razón social)
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClnombreParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								NIF
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClnifParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Dirección
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="CldireccionParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								C.P.
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClcpParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Provincia
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="NombreProvincia"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Localidad
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="NombreLocalidad"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Teléfono
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="CltelefonoParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Móvil
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClmovilParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>					
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								e-mail
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClemailParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fax
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClfaxParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:for-each>
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
