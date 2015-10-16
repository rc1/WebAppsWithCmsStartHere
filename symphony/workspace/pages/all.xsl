<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="../utilities/about.xsl" />
  <xsl:import href="../utilities/pages.xsl" />

  <xsl:output method="xml"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	      omit-xml-declaration="yes"
	      encoding="UTF-8"
	      indent="yes" />

  <xsl:template match="/">
    <xml>
      
      <!-- About -->
      <xsl:call-template name="list-about">
        <xsl:with-param name="section" select="/data/about" />
      </xsl:call-template>
      
      <!-- Pages -->
      <pages>
          <xsl:call-template name="list-pages">
            <xsl:with-param name="section" select="/data/pages" />
          </xsl:call-template>
      </pages>
      
    </xml>
  </xsl:template>

</xsl:stylesheet>
