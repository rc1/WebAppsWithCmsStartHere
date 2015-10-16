<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="add-jit-attributes">
    <xsl:param name="image" />
    <xsl:attribute name="path"><xsl:value-of select="$image/@path" /></xsl:attribute>
    <xsl:attribute name="type"><xsl:value-of select="$image/@type" /></xsl:attribute>
    <xsl:attribute name="image"><xsl:value-of select="$image/image" /></xsl:attribute>
    <xsl:attribute name="url"><xsl:value-of select="concat($image/@path, '/', $image/filename)" /></xsl:attribute>
    <xsl:attribute name="url-clean"><xsl:value-of select="concat($image/@path, '/', $image/clean-filename)" /></xsl:attribute>
    <xsl:attribute name="filename"><xsl:value-of select="$image/filename" /></xsl:attribute>
    <xsl:attribute name="filename-clean"><xsl:value-of select="$image/clean-filename" /></xsl:attribute>
    <xsl:attribute name="width"><xsl:value-of select="$image/meta/@width" /></xsl:attribute>
    <xsl:attribute name="height"><xsl:value-of select="$image/meta/@height" /></xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
