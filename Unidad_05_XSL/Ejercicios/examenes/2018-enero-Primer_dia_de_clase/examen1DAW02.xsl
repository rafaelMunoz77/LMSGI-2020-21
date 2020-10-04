<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="iso-8859-1"/>

	<xsl:template match="/primerDia1DAW">
		<html>
		   <head>
		   </head>
		   <body>
		     	<xsl:apply-templates select="horario"/>
		   </body>
		</html>
	</xsl:template>
	
	
	
	<xsl:template match="horario">
		<table border="1" width="95%">
			<xsl:for-each select="dia">
				<xsl:call-template name="dia"/>
			</xsl:for-each>
		</table>
	</xsl:template>
	

	<xsl:template name="dia">
		<xsl:variable name="colorDelDia"><xsl:value-of select="@color"/></xsl:variable>
		<tr bgcolor="{/primerDia1DAW/colores/color[@color=$colorDelDia]}">
			<td><xsl:value-of select="@desc"/></td>
			<xsl:apply-templates select="hora">
				<xsl:sort select="@orden" order="ascending"/>
			</xsl:apply-templates>			
		</tr>			
	</xsl:template>
	
	
	<xsl:template match="hora">
		<td><xsl:value-of select="."/></td>
	</xsl:template>
	
</xsl:stylesheet>