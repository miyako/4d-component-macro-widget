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

<xsl:variable name="CountEvents" select="$OnUnload + $OnActivate + $OnDeactivate + $OnBoundVariableChange + $OnTimer" />

<text>$boundVariableType:=</text>
<xsl:choose>
	<xsl:when test="$BoundVariableType = 'is string var'">
	<text>Is String Var
	</text>
	</xsl:when>
	<xsl:when test="$BoundVariableType = 'is text'">
	<text>v
	</text>
	</xsl:when>
	<xsl:when test="$BoundVariableType = 'is real'">
	<text>Is Real
	</text>
	</xsl:when>	
	<xsl:when test="$BoundVariableType = 'is date'">
	<text>Is Date
	</text>
	</xsl:when>		
	<xsl:when test="$BoundVariableType = 'is time'">
	<text>Is Time
	</text>
	</xsl:when>			
</xsl:choose>

<text><![CDATA[
$Container:=OBJECT Get pointer(Object subform container)
	]]></text>

<xsl:if test="($OnLoad + $CountEvents) != 0">
<text><![CDATA[
$event:=Form event
	]]></text>
</xsl:if>  

<xsl:if test="$OnLoad = 1">
<text><![CDATA[	
Case of
: ($event=On Load)

  // ON_LOAD_WIDGET

If (Nil($Container))

  // ON_STANDALONE 

Else  
  
  // ON_WIDGET

$event:=On Bound Variable Change

End if   

End case   
	]]></text> 
</xsl:if>  

<xsl:if test="$CountEvents != 0">
<text><![CDATA[	
Case of
	]]></text> 

<xsl:if test="$OnUnload = 1">
<text><![CDATA[	
: ($event=On Unload)

  // ON_UNLOAD
	]]></text> 
</xsl:if>  
	
<xsl:if test="$OnActivate = 1">
<text><![CDATA[	
: ($event=On Activate)

  // ON_ACTIVATE
	]]></text> 
</xsl:if> 

<xsl:if test="$OnDeactivate = 1">
<text><![CDATA[	
: ($event=On Deactivate)

  // ON_DEACTIVATE
	]]></text> 
</xsl:if> 

<xsl:if test="$OnBoundVariableChange = 1">
<text><![CDATA[	
: ($event=On Bound Variable Change)

  // ON_BOUND_VARIABLE_CHANGE
	]]></text> 
</xsl:if> 

<xsl:if test="$OnTimer = 1">
<text><![CDATA[	
: ($event=On Timer)

  // ON_TIMER
	]]></text> 
</xsl:if> 
	
<text><![CDATA[
End case	
	]]></text>
</xsl:if>

</xsl:template>
</xsl:stylesheet>
