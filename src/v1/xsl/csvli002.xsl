<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="ISO-8859-1"/>
	<xsl:template match="result">
		<xsl:text disable-output-escaping="yes">Cliente&#9;Instalación&#9;Fecha de alta&#9;Contacto&#9;Teléfono  del contacto&#9;Técnico&#9;Teléfono del técnico&#9;Administrador&#9;Teléfono del Administrador&#9;Nº de registro&#9;Fecha de contrato&#9;Años de Vigencia del contrato&#9;Importe&#10;</xsl:text>
		<xsl:for-each select="./Instalacion">
			<xsl:value-of select="ClienteNombreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="InnombreParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="InfechaaltaParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="IncontactoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="IncontactotelefonoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="IntecnicoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="IntecnicotelefonoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="InadministradorParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="InadministradortelefonoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>						
			<xsl:value-of select="InnumeroregistroParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="InfechacontratoParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>
			<xsl:value-of select="AniosVigenciaParsed"/>
			<xsl:text disable-output-escaping="yes">&#9;</xsl:text>				
			<xsl:value-of select="ImporteParsed"/>
			<xsl:text disable-output-escaping="yes">&#10;</xsl:text>															
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
