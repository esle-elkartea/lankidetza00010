<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="result">
		<xsl:text disable-output-escaping="yes">Cliente&#9;Instalación&#9;Protocolo&#9;Máquina&#9;Fecha de alta&#9;Fecha de garantía&#10;</xsl:text>
		<xsl:for-each select="./Maquina">
			<xsl:value-of select="NombreCliente"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="NombreInstalacion"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="NombreProtocolo"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>			
			<xsl:value-of select="ManombreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="MafechaaltaParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="MafechagarantiaParsed"/>
			<xsl:text disable-output-escaping="yes">&#10;</xsl:text>														
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
