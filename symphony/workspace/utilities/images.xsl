<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="jit.xsl"/>

  <xsl:template name="list-images">
    <xsl:param name="section" />
    <xsl:for-each select="$section/item">
      <image>
	<xsl:call-template name="add-images-attributes">
	  <xsl:with-param name="entry" select="." />
	</xsl:call-template>
	<xsl:call-template name="add-images-nodes">
	  <xsl:with-param name="entry" select="." />
	</xsl:call-template>
      </image>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="add-images-attributes">
    <xsl:param name="entry" />
    <xsl:attribute name="id"><xsl:value-of select="$entry/@id" /></xsl:attribute>
    <xsl:attribute name="name"><xsl:value-of select="$entry/name" /></xsl:attribute>
    
    <xsl:call-template name="add-jit-attributes">
      <xsl:with-param name="image" select="$entry/image-file"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="add-images-nodes">
    <xsl:param name="entry" />
  </xsl:template>

</xsl:stylesheet>
