<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output  method="xml" indent="yes" encoding="UTF-8" version="1.0" omit-xml-declaration="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <recipe key="{.//head[@type='main']}">
            <keywords>
                <keyword></keyword>
            </keywords>
        <ingredients>
            <xsl:for-each select="//measure[@type='ingredient']">
                <ingredient>
                    <num><xsl:value-of select="num/normalize-space(.)"/></num>
                    <unit><xsl:value-of select="unit/normalize-space(.)"/></unit>
                    <identifier><xsl:value-of select="./text()"/></identifier>
                </ingredient>  
            </xsl:for-each>
        </ingredients>
            <instructions>
                <xsl:for-each select="//*[@type='instructions']">
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </instructions>
        </recipe>
    </xsl:template>
    
</xsl:stylesheet>