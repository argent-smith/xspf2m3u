<!--
  xspf2m3u.xsl: transform XSPF to Extended M3U
  author: Pavel Argentov <argentoff@gmail.com>
-->
<xsl:stylesheet version = '1.0'
  xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
  xmlns:xspf="http://xspf.org/ns/0/">
  <xsl:output method="text" indent="no"/>
  <xsl:template match="/">
    <xsl:text>#EXTM3U</xsl:text>
<xsl:for-each select="//xspf:trackList/xspf:track">
#EXTINF:-1,<xsl:value-of select="./xspf:title"/>
<xsl:text>
</xsl:text>
<xsl:value-of select="./xspf:location"/>
    </xsl:for-each> 
  </xsl:template>
</xsl:stylesheet>
