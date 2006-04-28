<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <xsl:output method="text"/>
  
  <xsl:template match="class">
/*
 * $RCSfile: JavaClasses.xsl,v $
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2006 Bharat Mediratta
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */

/**
 * Java peer class for the <xsl:value-of select="class-name"/> class.
 * (Class schema version: <xsl:value-of select="schema/schema-major"/>.<xsl:value-of select="schema/schema-minor"/>)
 *
 * This file is automatically generated from XML embedded in the
 * class, combined with the JavaClasses.xsl file.  You should not modify
 * it by hand, as your changes will be lost next time this file is
 * rebuilt.  If you want to add more getters/setters, you should add
 * them in the core class.  If you want to change the format of this
 * file, then you should edit the XSL template.
 */
public class <xsl:value-of select="class-name"/>
  <xsl:if test="parent-class-name"> extends <xsl:value-of select="parent-class-name"/> </xsl:if> {
  <xsl:for-each select="member/member-name">
    private String <xsl:value-of select="."/>;
  </xsl:for-each>

  <xsl:for-each select="member/member-name">
    public String get<xsl:value-of select="."/>() { return <xsl:value-of select="."/>; }
    public void set<xsl:value-of select="."/>(String value) { <xsl:value-of select="."/> = value; }
  </xsl:for-each>

}      
</xsl:template>
</xsl:stylesheet>
