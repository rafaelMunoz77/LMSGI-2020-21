<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="iso-8859-1"/>

	<xsl:template match="/gormitis">

		<html>
			<head>
				<style>
					th {
						background: blue;
						color: white;
					}
				</style>
			</head>
			<body>
				<!--<xsl:call-template name="apartadoA-Tabla"/>-->
				<xsl:call-template name="apartadoB"/>			
			</body>
		</html>
	</xsl:template>


	<xsl:template name="apartadoA-Tabla">
		<table width="100%" border="1">
			<tr>
				<th></th>
				<th>Gormiti</th>
				<th>Tribu</th>
			</tr>
			<xsl:for-each select="gormiti">
				<tr>
					<xsl:if test="position() mod 2 = 1">
						<xsl:attribute name="style">background: lightblue;</xsl:attribute>
					</xsl:if>
					<td>
						<xsl:value-of select="position()"/>
					</td>
					<td><img width="100px" src="{.}"/></td>
					<td>
						<xsl:value-of select="@tribu"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>


	<xsl:template name="apartadoB">
		<table width="100%" border="1" style="background: url('{/gormitis/tablero/@url}') no-repeat;">
			<tr>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">0</xsl:with-param>
					<xsl:with-param name="y">0</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">1</xsl:with-param>
					<xsl:with-param name="y">0</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">2</xsl:with-param>
					<xsl:with-param name="y">0</xsl:with-param>
				</xsl:call-template>			
			</tr>
			<tr>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">0</xsl:with-param>
					<xsl:with-param name="y">1</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">1</xsl:with-param>
					<xsl:with-param name="y">1</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">2</xsl:with-param>
					<xsl:with-param name="y">1</xsl:with-param>
				</xsl:call-template>			
			</tr>
			<tr>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">0</xsl:with-param>
					<xsl:with-param name="y">2</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">1</xsl:with-param>
					<xsl:with-param name="y">2</xsl:with-param>
				</xsl:call-template>
				<xsl:call-template name="celdaEnTablaMapa">
					<xsl:with-param name="x">2</xsl:with-param>
					<xsl:with-param name="y">2</xsl:with-param>
				</xsl:call-template>			
			</tr>
		</table>
	</xsl:template>

	<xsl:template name="celdaEnTablaMapa">
		<xsl:param name="x"/>
		<xsl:param name="y"/>
		<td>
			<xsl:for-each select="tablero/gormitiEnMapa">
				<xsl:if test="$x = @x and $y = @y">
					<xsl:call-template name="imagenEnTabla">
						<xsl:with-param name="tribu">
							<xsl:value-of select="@tribu"/>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</xsl:for-each>
		</td>
	</xsl:template>

	<xsl:template name="imagenEnTabla">
		<xsl:param name="tribu"/>
		<img width="100px" src="{/gormitis/gormiti[@tribu=$tribu]}"/>
	</xsl:template>
</xsl:stylesheet>