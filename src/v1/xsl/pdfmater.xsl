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
		<fo:block font-size="14pt">
		Instalación: <fo:inline font-weight="bold">
				<xsl:value-of select="./Instalacion/InnombreParsed"/>
			</fo:inline>
		</fo:block>
		<fo:block font-size="14pt">
		Correctivo (referencia): <fo:inline font-weight="bold">
				<xsl:value-of select="./Correctivo/CoidcorrectivoParsed"/>
			</fo:inline>
		</fo:block>		

			<fo:table table-layout="fixed" border-style="solid" border-width="0.1mm" space-before="1cm">
				<fo:table-column column-width="6cm"/>
				<fo:table-column column-width="10cm"/>			
				<fo:table-body>
					<fo:table-row>						
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Nº
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Material/Mtidmaterial"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>				
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Concepto
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Material/Mtconcepto"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>	
					<fo:table-row>						
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Unidades
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Material/UnidadesParsed"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
					<fo:table-row>						
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Descuento
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Material/DescuentoParsed"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>
					<fo:table-row>						
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Importe
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.1cm" padding-before="0.1cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="./Material/ImporteParsed"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>			
				</fo:table-body>
			</fo:table>					
		
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
