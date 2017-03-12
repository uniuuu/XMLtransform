<?xml version="1.0" encoding="WINDOWS-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:strip-space elements="*"/>
 <xsl:output method="xml" indent="yes"/>
<xsl:key name="cnt" match="//request" use="@type"/>
 <xsl:template match="/">
  <xsl:apply-templates/>
 </xsl:template>
 <xsl:template match="service">
  <xsl:apply-templates/>
 </xsl:template>
 <xsl:template match="request-types">
  <xsl:element name="request-stats">
   <xsl:apply-templates/>
  </xsl:element>
 </xsl:template>
 <xsl:template match="type">      
   <xsl:element name="request">
    <xsl:attribute name="type-caption">
     <xsl:value-of select="@caption"/>
    </xsl:attribute>
    <xsl:attribute name="count">
<xsl:variable name="tmp" >
        <xsl:value-of select="@id" />
      </xsl:variable>
<xsl:value-of select="count(key('cnt',$tmp))" />
</xsl:attribute>
 </xsl:element>
 </xsl:template>
 <xsl:template match="requests"> </xsl:template>
 <xsl:template match="request"> </xsl:template>
</xsl:stylesheet>