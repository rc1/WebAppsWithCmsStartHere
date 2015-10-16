<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="images.xsl"/>
  <xsl:import href="jit.xsl"/>

  <xsl:template name="list-pages">
    <xsl:param name="section" />
    <xsl:for-each select="$section/entry">
      <page>
	<xsl:call-template name="add-page-attributes">
	  <xsl:with-param name="entry" select="." />
	</xsl:call-template>
	<xsl:call-template name="add-page-nodes">
	  <xsl:with-param name="entry" select="." />
	</xsl:call-template>
      </page>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="add-page-attributes">
    <xsl:param name="entry" />
    <xsl:attribute name="id"><xsl:value-of select="$entry/@id" /></xsl:attribute>
    <xsl:attribute name="handle"><xsl:value-of select="$entry/title/@handle" /></xsl:attribute>
    <xsl:attribute name="title"><xsl:value-of select="$entry/title" /></xsl:attribute>
    <xsl:attribute name="published"><xsl:value-of select="$entry/published" /></xsl:attribute>
  </xsl:template>

  <xsl:template name="add-page-nodes">
    <xsl:param name="entry" />
    <images>
      <xsl:call-template name="list-images">
        <xsl:with-param name="section" select="$entry/images" />
      </xsl:call-template>
    </images>
  </xsl:template>
  
</xsl:stylesheet>
