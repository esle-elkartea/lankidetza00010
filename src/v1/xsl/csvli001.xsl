<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="result">
		<xsl:text disable-output-escaping="yes">Cliente&#9;Instalación&#9;Protocolo&#9;Máquina&#9;Fecha de alta&#9;Frecuencia&#9;Horas&#9;Kilometraje&#9;Descuento&#9;Importe&#10;</xsl:text>
		<xsl:for-each select="./Mantenimiento">
			<xsl:value-of select="NombreCliente"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="NombreInstalacion"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="NombreProtocolo"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="NombreMaquina"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>							
			<xsl:value-of select="MnfechaParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="NombreFrecuencia"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="HorasParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="KilometrajeParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>		
			<xsl:value-of select="DescuentoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>							
			<xsl:value-of select="ImporteParsed"/>
			<xsl:text disable-output-escaping="yes">&#10;</xsl:text>														
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
