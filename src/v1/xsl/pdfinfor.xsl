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
			<xsl:for-each select="./Instalacion">
				<fo:table break-before="page" border-style="solid" border-width="0.1mm" table-layout="fixed">
					<fo:table-column column-width="6cm"/>
					<fo:table-column column-width="10cm"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#C0C0C0">
								<fo:block>
								INSTALACIÓN: <xsl:value-of select="Innombre"/>
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
									<xsl:value-of select="Innombre"/>
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
									<xsl:value-of select="InfechaaltaParsed"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Contacto
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Incontacto"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Contacto (teléfono)
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Incontactotelefono"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Técnico
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Intecnico"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Técnico (teléfono)
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Intecnicotelefono"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Administrador
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Inadministrador"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Administrador (teléfono)
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Inadministradortelefono"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Número de registro
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:block>
									<xsl:value-of select="Innumeroregistro"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
								<fo:block>
								Proyecto
							</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
								<xsl:choose>
									<xsl:when test="Inproyecto= 1">
										<fo:block border-style="solid" border-width="0.1mm" padding="-4.7cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;X
											</fo:block>
									</xsl:when>
									<xsl:otherwise>
										<fo:block border-style="solid" border-width="0.1mm" padding="-4.7cm" padding-after="0.0cm" padding-before="0.1cm">
												&#160;&#160;
											</fo:block>
									</xsl:otherwise>
								</xsl:choose>
							</fo:table-cell>
						</fo:table-row>
					<fo:table-row>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
							<fo:block>
								Fecha de Contrato
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
							<fo:block>
								<xsl:value-of select="InfechacontratoParsed"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>						
					</fo:table-body>
				</fo:table>
				<xsl:for-each select="./Maquina">
					<fo:table break-before="page" table-layout="fixed" border-style="solid" border-width="0.1mm">
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
						</fo:table-body>
					</fo:table>
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
					<xsl:for-each select="./Mantenimiento">
						<fo:table break-before="page" table-layout="fixed" border-style="solid" border-width="0.1mm">
							<fo:table-column column-width="6cm"/>
							<fo:table-column column-width="10cm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#E0E0E0">
										<fo:block>
								MANTENIMIENTO
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
										<fo:block>
								Fecha del mantenimiento
							</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
										<fo:block>
											<xsl:value-of select="MnfechaParsed"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
										<fo:block>
								Frecuencia
							</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
										<fo:block>
											<xsl:value-of select="NombreFrecuencia"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed" background-color="#F0F0F0">
										<fo:block>
								Horas
							</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
										<fo:block>
											<xsl:value-of select="HorasParsed"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
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
										<fo:block>Mantenimiento</fo:block>
									</fo:table-cell>
									<fo:table-cell text-align="center" border-style="solid" border-width="0.1mm" table-layout="fixed">
										<fo:block>Valor</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<xsl:for-each select="./MaquinaMantenimientos">
							<fo:table border-style="solid" border-width="0.1mm" table-layout="fixed">
								<fo:table-column column-width="12cm"/>
								<fo:table-column column-width="4cm"/>
								<fo:table-body>
									<fo:table-row>
										<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
											<fo:block>
												<xsl:value-of select="NombreMaquinaMantenimientos"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell text-align="center" padding-after="0.3cm" padding-before="0.3cm" border-style="solid" border-width="0.1mm" table-layout="fixed">
											<xsl:choose>
												<xsl:when test="TipoMaquinaMantenimientos = 3">
													<xsl:choose>
														<xsl:when test="Mmvalor = 1">
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
														<xsl:value-of select="Mmvalor"/>
													</fo:block>
												</xsl:otherwise>
											</xsl:choose>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:for-each>
	</xsl:template>
	<xsl:include href="elementosCabecera.xslt"/>
</xsl:stylesheet>
