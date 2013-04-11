<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:str="http://exslt.org/strings"
                >
<xsl:output method="text" />

<xsl:param name="BoundVariableType" select="'is text'" />

<xsl:param name="OnLoad" select="0" />
<xsl:param name="OnUnload" select="0" />
<xsl:param name="OnActivate" select="0" />
<xsl:param name="OnDeactivate" select="0" />
<xsl:param name="OnBoundVariableChange" select="0" />
<xsl:param name="OnTimer" select="0" />

<xsl:template match="/">

<xsl:text>The type of variable for the container </xsl:text>
<xsl:value-of select="$BoundVariableType" /><xsl:text>.&#xD;&#xD;</xsl:text>

<xsl:variable name="CountEvents" select="$OnLoad + $OnUnload + $OnActivate + $OnDeactivate + $OnBoundVariableChange + $OnTimer" />

<xsl:choose>
<xsl:when test="$CountEvents &gt; 1">
<xsl:text>The form events selected for this widget are...&#xD;&#xD;</xsl:text>
</xsl:when>
<xsl:when test="$CountEvents = 1">
<xsl:text>The form event selected for this widget is...&#xD;&#xD;</xsl:text>
</xsl:when>
</xsl:choose>

<xsl:if test="$OnLoad = 1">On Load&#xD;</xsl:if>
<xsl:if test="$OnUnload = 1">On Unload&#xD;</xsl:if>
<xsl:if test="$OnActivate = 1">On Activate&#xD;</xsl:if>
<xsl:if test="$OnDeactivate = 1">On Deactivate&#xD;</xsl:if>
<xsl:if test="$OnBoundVariableChange = 1">On Bound Variable Change&#xD;</xsl:if>
<xsl:if test="$OnTimer = 1">On Timer&#xD;</xsl:if>
</xsl:template>
</xsl:stylesheet>
