<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="result">
		<xsl:text disable-output-escaping="yes">Cliente&#9;Instalación&#9;Fecha de Aceptación&#9;Fecha de Cierre&#9;Fecha de Facturación&#9;Técnico&#9;Horas&#9;Kilometraje&#9;Disposición de servicio&#9;Descuento&#9;Importe&#9;Incidencia&#9;Solución&#10;</xsl:text>
		<xsl:for-each select="./Correctivo">
			<xsl:value-of select="ClienteNombreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="InstalacionNombreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="CofechaaceptacionParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="CofechacierreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="CofechafacturacionParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="Cotecnico"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>			
			<xsl:value-of select="HorasParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="KilometrajeParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="DisposicionservicioParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="DescuentoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="ImporteParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="Coincidencia"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="Cosolucion"/>
			<xsl:text disable-output-escaping="yes">&#10;</xsl:text>														
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
