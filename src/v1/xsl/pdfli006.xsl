<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0">
	<xsl:output method="fo"/>
	<xsl:include href="main.xslt"/>
	<xsl:template match="result">
		<fo:block font-size="14pt">
		Cliente: <fo:inline font-weight="bold">
				<xsl:value-of select="./Instalacion/ClienteNombreParsed"/>
			</fo:inline>
		</fo:block>
		<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed" space-before="1cm">
			<fo:table-column column-width="7cm"/>
			<fo:table-column column-width="6cm"/>
			<fo:table-column column-width="3cm"/>
			<fo:table-body>
				<fo:table-row background-color="#c0c0c0">
					<fo:table-cell text-align="center" border-style="solid" border-width="0.1mm" table-layout="fixed">
						<fo:block>Instalaci�n</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center" border-style="solid" border-width="0.1mm" table-layout="fixed">
						<fo:block>Cliente</fo:block>
					</fo:table-cell>
					<fo:table-cell text-align="center" border-style="solid" border-width="0.1mm" table-layout="fixed">
						<fo:block>Fecha de alta</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
		<xsl:for-each select="./Instalacion">
			<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed">
				<fo:table-column column-width="7cm"/>
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="InnombreParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="ClienteNombreParsed"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="InfechaaltaParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</xsl:for-each>
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
