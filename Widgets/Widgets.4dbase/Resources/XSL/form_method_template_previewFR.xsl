<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:str="http://exslt.org/strings"
                >
<xsl:output method="text" />

<xsl:param name="BoundVariableType" select="'est un texte'" />

<xsl:param name="OnLoad" select="0" />
<xsl:param name="OnUnload" select="0" />
<xsl:param name="OnActivate" select="0" />
<xsl:param name="OnDeactivate" select="0" />
<xsl:param name="OnBoundVariableChange" select="0" />
<xsl:param name="OnTimer" select="0" />

<xsl:template match="/">

<xsl:text>Le type de variable pour le conteneur </xsl:text>
<xsl:value-of select="$BoundVariableType" /><xsl:text>.&#xD;&#xD;</xsl:text>

<xsl:variable name="CountEvents" select="$OnLoad + $OnUnload + $OnActivate + $OnDeactivate + $OnBoundVariableChange + $OnTimer" />

<xsl:choose>
<xsl:when test="$CountEvents &gt; 1">
<xsl:text>Les événements sélectionnés pour le widget sont...&#xD;&#xD;</xsl:text>
</xsl:when>
<xsl:when test="$CountEvents = 1">
<xsl:text>L'événement sélectionné pour le widget est...&#xD;&#xD;</xsl:text>
</xsl:when>
</xsl:choose>

<xsl:if test="$OnLoad = 1">Sur chargement&#xD;</xsl:if>
<xsl:if test="$OnUnload = 1">Sur libération&#xD;</xsl:if>
<xsl:if test="$OnActivate = 1">Sur activation&#xD;</xsl:if>
<xsl:if test="$OnDeactivate = 1">Sur désactivation&#xD;</xsl:if>
<xsl:if test="$OnBoundVariableChange = 1">Sur modif variable liée&#xD;</xsl:if>
<xsl:if test="$OnTimer = 1">Sur minuteur&#xD;</xsl:if>
</xsl:template>
</xsl:stylesheet>
