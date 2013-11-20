<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" indent="no" omit-xml-declaration="yes"/>
    <xsl:template name="writeFieldset" match="/">
        <xsl:text disable-output-escaping="yes"><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:dri="http://di.tamu.edu/DRI/1.0/"
                xmlns:mets="http://www.loc.gov/METS/"
                xmlns:xlink="http://www.w3.org/TR/xlink/"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:dim="http://www.dspace.org/xmlns/dspace/dim"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:mods="http://www.loc.gov/mods/v3"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="i18n dri mets xlink xsl dim xhtml mods dc">

<xsl:import href="../dri2xhtml.xsl"/>
<xsl:output indent="yes"/>            
<xsl:template name="itemSummaryView-DIM-fields">
<xsl:param name="clause" select="'1'"/>
<xsl:param name="phase" select="'even'"/>
<xsl:variable name="otherPhase">
    <xsl:choose>
        <xsl:when test="$phase = 'even'">
            <xsl:text>odd</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>even</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:choose>
            ]]>
        </xsl:text>
        <xsl:call-template name="nextField">
            <xsl:with-param name="clause" select="'1'"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="nextField">
        <xsl:param name="clause" />
        <xsl:text disable-output-escaping="yes"><![CDATA[
    <xsl:when test="$clause = ]]></xsl:text><xsl:value-of select="$clause"/><xsl:text disable-output-escaping="yes">"></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[
        <xsl:call-template name="itemFieldDisplay.]]></xsl:text><xsl:value-of select="/fieldset/field[$clause]"/><xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>
        <xsl:text disable-output-escaping="yes"><![CDATA[
            <xsl:with-param name="clause" select="$clause" />
            <xsl:with-param name="phase" select="$phase" />
            <xsl:with-param name="otherPhase" select="$otherPhase" />
        </xsl:call-template>
    </xsl:when>]]></xsl:text>
        <xsl:choose>
            <xsl:when test="$clause &lt; count(/fieldset/field)">
                <xsl:call-template name="nextField">
                    <xsl:with-param name="clause" select="$clause + 1"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text disable-output-escaping="yes"><![CDATA[
    <xsl:when test="$clause &lt; ]]></xsl:text>
            <xsl:value-of select="$clause + 1"/>
            <xsl:text disable-output-escaping="yes"><![CDATA[">
        <xsl:call-template name="itemSummaryView-DIM-fields">
                <xsl:with-param name="clause" select="($clause + 1)"/>
                <xsl:with-param name="phase" select="$phase"/>
        </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
            <xsl:choose>
                    <xsl:when test="dim:field[@element='identifier'][@qualifier='uri']">
                        <tr class="ds-table-row {$phase}">
                            <td class="field-label"></td>
                            <td class="addthis"><xsl:call-template name="addthis_button"/></td>
                        </tr>
                    </xsl:when>
            </xsl:choose>
    </xsl:otherwise>
</xsl:choose>

</xsl:template>
                    
</xsl:stylesheet>]]>
                </xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>
    
</xsl:stylesheet>
