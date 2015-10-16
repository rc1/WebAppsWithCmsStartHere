<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="list-about">
    <xsl:param name="section" />
    <xsl:for-each select="$section/entry">
      <about>
	<xsl:call-template name="add-about-attributes">
	  <xsl:with-param name="entry" select="." />
	</xsl:call-template>
	<xsl:call-template name="add-about-nodes">
	  <xsl:with-param name="entry" select="." />
	</xsl:call-template>
      </about>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="add-about-attributes">
    <xsl:param name="entry" />
  <xsl:attribute name="id"><xsl:value-of select="$entry/@id" /></xsl:attribute></xsl:template>

  <xsl:template name="add-about-nodes">
    <xsl:param name="entry" />
    <xsl:copy-of select="$entry/text[@mode='formatted']"/>
  </xsl:template>

</xsl:stylesheet>
