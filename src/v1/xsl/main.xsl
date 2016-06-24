<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0">
<xsl:output method="fo"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="1.0cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="3cm" margin-bottom="2cm"/>
					<fo:region-before region-name="header-main" extent="3cm"/>
					<fo:region-after region-name="footer-main" extent="1.0cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simple">
				<fo:static-content flow-name="header-main">
					<fo:block xsl:use-attribute-sets="header">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="3cm"/>
							<fo:table-column column-width="13cm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell text-align="left" padding="0.5cm">
										<fo:external-graphic src="file:..\imagenes\amicyf.gif"/>
									</fo:table-cell>
									<fo:table-cell text-align="center" padding="0.5cm">
											<xsl:apply-templates select="document('cabecera.xml')/empresa"/>
																	
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="footer-main">
					<fo:block xsl:use-attribute-sets="footer">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="13cm"/>
							<fo:table-column column-width="3cm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell text-align="left">
										<fo:block color="#808080">    Imprimido el 
    <xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('d / MM / yyyy'), java:java.util.Date.new())"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="right">
										<fo:block color="#808080">
											<fo:page-number/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:static-content>
				<fo:flow flow-name="xsl-region-body">
					<xsl:apply-templates select="result"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>	