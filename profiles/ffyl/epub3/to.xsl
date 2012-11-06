<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
                xmlns:tbx="http://www.lisa.org/TBX-Specification.33.0.html"
                xmlns:iso="http://www.iso.org/ns/1.0"
                xmlns:cals="http://www.oasis-open.org/specs/tm9901"
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:teix="http://www.tei-c.org/ns/Examples"
                xmlns:s="http://www.ascc.net/xml/schematron"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:t="http://www.thaiopensource.com/ns/annotations"
                xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
                xmlns:rng="http://relaxng.org/ns/structure/1.0"
                exclude-result-prefixes="tei html t a rng s iso tbx cals teix"
                version="2.0">
    <xsl:import href="../../../epub3/tei-to-epub3.xsl"/>

    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl"
         scope="stylesheet"
         type="stylesheet">
      <desc>
        <p>tei to epub</p>
      </desc>
    </doc>

    <xsl:param name="publisher">Facultad de Filosofía y Letras, UNAM</xsl:param>
    <xsl:param name="subject">Publicaciones FFyL UNAM</xsl:param>
    <xsl:param name="lang">es</xsl:param>
    <xsl:param name="numberHeadings">false</xsl:param>
    <xsl:param name="filePerPage">false</xsl:param>
    <xsl:param name="splitLevel">1</xsl:param>
    <xsl:param name="autoToc">true</xsl:param>
    <xsl:param name="cssSecondaryFile">../profiles/ffyl/epub3/ffyl.css</xsl:param>
    <xsl:param name="outputMethod">xhtml</xsl:param>
    <xsl:param name="footnoteBackLink">true</xsl:param>


    <xsl:template match="tei:titleStmt" mode="metadata">
      <h3>Títulos</h3>
      <xsl:apply-templates mode="metadata"/>
    </xsl:template>

    <xsl:template match="tei:editionStmt" mode="metadata">
      <h3>Edición</h3>
      <xsl:apply-templates mode="metadata"/>
    </xsl:template>

    <xsl:template match="tei:publicationStmt" mode="metadata">
      <h3>Publicación</h3>
      <xsl:choose>
        <xsl:when test="tei:p">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
          <dl>
            <xsl:apply-templates mode="metadata"/>
          </dl>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:publicationStmt/tei:publisher" mode="metadata">
      <dt>Editor</dt>
      <dd>
        <xsl:apply-templates/>
      </dd>
    </xsl:template>

    <xsl:template match="tei:publicationStmt/tei:pubPlace" mode="metadata">
      <dt>Lugar de publicación</dt>
      <dd>
        <xsl:apply-templates/>
      </dd>
    </xsl:template>

    <xsl:template match="tei:availability" mode="metadata">
      <dt>Licencias</dt>
      <dd>
        <xsl:apply-templates mode="metadata"/>
      </dd>
    </xsl:template>

    <xsl:template match="tei:sourceDesc" mode="metadata">
      <h3>Fuente</h3>
      <xsl:apply-templates mode="metadata"/>
    </xsl:template>

    <!-- Licencia -->
    <xsl:template name="generateLicence">
      <xsl:value-of select="//tei:availability" />
    </xsl:template>

    <!-- outputs -->
    <xsl:output method="xml" encoding="utf-8" doctype-system="" indent="yes"/>


</xsl:stylesheet>
