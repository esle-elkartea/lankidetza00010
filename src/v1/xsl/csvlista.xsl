<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="result">
		<xsl:text disable-output-escaping="yes">Cliente&#9;NIF&#9;Dirección&#9;Localidad&#9;Provincia&#9;C.P.&#9;Teléfono&#9;Móvil&#9;Fax&#9;E-mail&#9;Fecha de alta&#10;</xsl:text>
		<xsl:for-each select="./Cliente">
			<xsl:value-of select="ClnombreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="ClnifParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="CldireccionParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="NombreLocalidad"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="NombreProvincia"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="ClcpParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="CltelefonoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="ClmovilParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>				
			<xsl:value-of select="ClfaxParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="ClemailParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="ClfechaaltaParsed"/>
			<xsl:text disable-output-escaping="yes">&#10;</xsl:text>														
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
