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

<xsl:variable name="CountEvents" select="$OnUnload + $OnActivate + $OnDeactivate + $OnBoundVariableChange + $OnTimer" />

<text>$boundVariableType:=</text>
<xsl:choose>
	<xsl:when test="$BoundVariableType = 'est un champ alpha'">
	<text>Est un champ alpha
	</text>
	</xsl:when>
	<xsl:when test="$BoundVariableType = 'est un texte'">
	<text>Est un texte
	</text>
	</xsl:when>
	<xsl:when test="$BoundVariableType = 'est un numérique'">
	<text>Est un numérique
	</text>
	</xsl:when>	
	<xsl:when test="$BoundVariableType = 'est une date'">
	<text>Est une date
	</text>
	</xsl:when>		
	<xsl:when test="$BoundVariableType = 'est une heure'">
	<text>Est une heure
	</text>
	</xsl:when>			
</xsl:choose>

<text><![CDATA[
$Container:=OBJET Lire pointeur(Objet conteneur sous formulaire)
	]]></text>

<xsl:if test="($OnLoad + $CountEvents) != 0">
<text><![CDATA[
$event:=Evenement formulaire
	]]></text>
</xsl:if>  

<xsl:if test="$OnLoad = 1">
<text><![CDATA[	
Au cas ou
: ($event=Sur chargement)

  // ON_LOAD_WIDGET

Si (Nil($Container))

  // ON_STANDALONE 

Sinon   
  
  // ON_WIDGET

$event:=Sur modif variable liée

Fin de si  

Fin de cas  
	]]></text> 
</xsl:if>  

<xsl:if test="$CountEvents != 0">
<text><![CDATA[	
Au cas ou
	]]></text> 

<xsl:if test="$OnUnload = 1">
<text><![CDATA[	
: ($event=Sur libération)

  // ON_UNLOAD
	]]></text> 
</xsl:if>  
	
<xsl:if test="$OnActivate = 1">
<text><![CDATA[	
: ($event=Sur activation)

  // ON_ACTIVATE
	]]></text> 
</xsl:if> 

<xsl:if test="$OnDeactivate = 1">
<text><![CDATA[	
: ($event=Sur désactivation)

  // ON_DEACTIVATE
	]]></text> 
</xsl:if> 

<xsl:if test="$OnBoundVariableChange = 1">
<text><![CDATA[	
: ($event=Sur modif variable liée)

  // ON_BOUND_VARIABLE_CHANGE
	]]></text> 
</xsl:if> 

<xsl:if test="$OnTimer = 1">
<text><![CDATA[	
: ($event=Sur minuteur)

  // ON_TIMER
	]]></text> 
</xsl:if> 
	
<text><![CDATA[
Fin de cas	
	]]></text>
</xsl:if>

</xsl:template>
</xsl:stylesheet>
