<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:output method="xml" encoding="US-ASCII"/>
<xsl:preserve-space elements="*"/>

<xsl:template match="/">
  <xsl:text>&#10;</xsl:text>
  <xsl:comment>This file was created automatically by html2xhtml</xsl:comment>
  <xsl:text>&#10;</xsl:text>
  <xsl:comment>from the HTML stylesheets. Do not edit this file.</xsl:comment>
  <xsl:text>&#10;</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>&#10;</xsl:text>
</xsl:template>

<!-- Make sure we override some templates and parameters appropriately for XHTML -->
<xsl:template match="xsl:output">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="method">xml</xsl:attribute>
    <xsl:attribute name="encoding">UTF-8</xsl:attribute>
    <xsl:attribute name="doctype-public">-//W3C//DTD XHTML 1.0 Transitional//EN</xsl:attribute>
    <xsl:attribute name="doctype-system">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</xsl:attribute>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsl:param[@name='stylesheet.result.type']">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="select">'xhtml'</xsl:attribute>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsl:param[@name='make.valid.html']">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="select">1</xsl:attribute>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsl:param[@name='output.method']">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="select">'xml'</xsl:attribute>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsl:param[@name='chunker.output.method']">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="select">'xml'</xsl:attribute>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsl:attribute[@name='name']">
  <xsl:choose>
    <xsl:when test="ancestor::a">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:attribute name="name">id</xsl:attribute>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="xsl:element">
  <!-- make sure literal xsl:element declarations propagate the right namespace -->
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:attribute name="namespace">http://www.w3.org/1999/xhtml</xsl:attribute>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="xsl:template[@name='body.attributes']">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:comment> no apply-templates; make it empty </xsl:comment>
    <xsl:text>&#10;</xsl:text>
  </xsl:copy>
</xsl:template>

<!-- this only occurs in docbook.xsl to identify errors -->
<xsl:template match="font">
  <span class="ERROR" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:apply-templates/>
  </span>
</xsl:template>

<!-- this only occurs in docbook.xsl to identify errors -->
<xsl:template match="a[@name]">
  <xsl:element name="{local-name(.)}" namespace="http://www.w3.org/1999/xhtml">
    <xsl:attribute name="id"><xsl:value-of select="@name"/></xsl:attribute>
    <xsl:for-each select="@*">
      <xsl:if test="local-name(.) != 'name'">
        <xsl:attribute name="{name(.)}"><xsl:value-of select="."/></xsl:attribute>
      </xsl:if>
    </xsl:for-each>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="*">
  <xsl:choose>
    <xsl:when test="namespace-uri(.) = ''">
      <xsl:element name="{local-name(.)}" namespace="http://www.w3.org/1999/xhtml">
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      </xsl:element>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates/>
      </xsl:copy>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="comment()|processing-instruction()|text()">
  <xsl:copy/>
</xsl:template>

</xsl:stylesheet>
