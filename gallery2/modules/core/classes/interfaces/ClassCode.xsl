<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <xsl:output method="text"/>
  
  <xsl:template match="class">&lt;?php
/*
 * $RCSfile$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2004 Bharat Mediratta
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
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
/**
 * @package @@package@@
 * @subpackage ClassInterfaces
 * @version $Revision$ $Date$
 * @author Bharat Mediratta &lt;bharat@menalto.com&gt;
 */

/**
 * Interface class for the <xsl:value-of select="class-name"/> class.
 * (Class schema version: <xsl:value-of select="schema/schema-major"/>.<xsl:value-of select="schema/schema-minor"/>)
 *
 * This file is automatically generated from XML embedded in the
 * class, combined with the ClassCode.xsl file.  You should not modify
 * it by hand, as your changes will be lost next time this file is
 * rebuilt.  If you want to add more getters/setters, you should add
 * them in the core class.  If you want to change the format of this
 * file, then you should edit the XSL template.
 *
 * @package @@package@@
 * @subpackage Classes
 */
class <xsl:value-of select="class-name"/> extends <xsl:value-of select="class-name"/>_core {
  <!-- If the class has members then we must create a 
       getPersistentMemberInfo() method 
   -->

  <xsl:if test="/class/member">
    /**
     * Return meta information about the members of this class
     *
     * @return array member => array(type, class)
     */
    function getPersistentMemberInfo() {
	$meta = parent::getPersistentMemberInfo();
    <xsl:for-each select="member">
	$meta['members']['<xsl:value-of select="member-name"/>'] = array(
	    'class' => '<xsl:value-of select="/class/class-name"/>',
	    'type' => STORAGE_TYPE_<xsl:value-of select="member-type"/><xsl:if test="id"> | STORAGE_TYPE_ID</xsl:if>
	);
    </xsl:for-each>
	return $meta;
    }

    /**
     * Get the data from this persistent object as an associative array
     *
     * @return array memberName => memberValue
     */
    function getMemberData() {
	$data = parent::getMemberData();
    <xsl:for-each select="member">
 	<xsl:if test="linked">
	if (isset($this->_linkedEntity)) {
	    if (!isset($this->_linkedEntity->_<xsl:value-of select="member-name"/>)) {
 	        $data['<xsl:value-of select="member-name"/>'] = null;
	    } else {
		$data['<xsl:value-of select="member-name"/>'] = $this->_linkedEntity->_<xsl:value-of select="member-name"/>;
	    }
	} else if (!isset($this->_<xsl:value-of select="member-name"/>)) {
 	    $data['<xsl:value-of select="member-name"/>'] = null;
 	} else {
	    $data['<xsl:value-of select="member-name"/>'] = $this->_<xsl:value-of select="member-name"/>;
	}
	</xsl:if>
 	<xsl:if test="not(linked)">
	if (!isset($this->_<xsl:value-of select="member-name"/>)) {
 	    $data['<xsl:value-of select="member-name"/>'] = null;
 	} else {
	    $data['<xsl:value-of select="member-name"/>'] = $this->_<xsl:value-of select="member-name"/>;
	}
	</xsl:if>
    </xsl:for-each>
	return $data;
    }
  </xsl:if>

    /**
     * Return the name of this class with the proper mix of uppercase and
     * lowercase (get_class() always returns lowercase)
     *
     * @return string class name
     */
    function getClassName() {
	return '<xsl:value-of select="class-name"/>';
    }

    /** 
     * Return the path to the PHP file for this class, relative to the gallery2 dir
     * 
     * @return string path
     */ 
    function getClassFile() { 
        return 'modules/' .  
            basename(dirname(dirname(dirname(__FILE__)))) .  
            '/classes/<xsl:value-of select="class-name"/>.class'; 
    }

    <xsl:apply-templates select="map" />
    <xsl:apply-templates select="member" />
}
?&gt;</xsl:template>

  <xsl:template match="map">
    /**
     * Get meta information about this class' map 
     *
     * @return array map member => type
     */
    function getMapInfo() {
	$info = array();
    <xsl:for-each select="member">
	$info['members']['<xsl:value-of select="member-name"/>'] = STORAGE_TYPE_<xsl:value-of select="member-type"/>;
  </xsl:for-each>
	return $info; 
    }

    /**
     * Add an entry to this map
     *
     * @param array an associative array of the entry data
     * @return object GalleryStatus a status code
     * @static
     */
    function addMapEntry($data) {
	global $gallery;
    <xsl:for-each select="member/member-name">
	if (!isset($data['<xsl:value-of select="."/>'])) {
	    return GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__);
	}
    </xsl:for-each>

	$storage =&amp; $gallery->getStorage();

	$ret = $storage->addMapEntry('<xsl:value-of select="/class/class-name"/>', $data);
	if ($ret->isError()) {
	    return $ret->wrap(__FILE__, __LINE__);
	}

	return GalleryStatus::success();
    }

    /**
     * Remove an entry from this map
     *
     * @param array an associative array of the entry data to match and remove
     * @return object GalleryStatus a status code
     * @static
     */
    function removeMapEntry($data) {
	global $gallery;

	if (sizeof($data) == 0) {
	    return GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__);
	}

	$storage =&amp; $gallery->getStorage();

	$ret = $storage->removeMapEntry('<xsl:value-of select="/class/class-name"/>', $data);
	if ($ret->isError()) {
	    return $ret->wrap(__FILE__, __LINE__);
	}

	return GalleryStatus::success();
    }

    /**
     * Remove ALL entries from this map.. use with caution!
     *
     * @return object GalleryStatus a status code
     * @static
     */
    function removeAllMapEntries() {
	global $gallery;

	$storage =&amp; $gallery->getStorage();

	$ret = $storage->removeAllMapEntries('<xsl:value-of select="/class/class-name"/>');
	if ($ret->isError()) {
	    return $ret->wrap(__FILE__, __LINE__);
	}

	return GalleryStatus::success();
    }

    /**
     * Update an entry in this map
     *
     * @param array the entry to match
     * @param array the values to change
     * @return object GalleryStatus a status code
     * @static
     */
    function updateMapEntry($match, $change) {
	global $gallery;

	if (sizeof($match) == 0 || sizeof($change) == 0) {
	    return GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__);
	}

	$storage =&amp; $gallery->getStorage();

	$ret = $storage->updateMapEntry('<xsl:value-of select="/class/class-name"/>', $match, $change);
	if ($ret->isError()) {
	    return $ret->wrap(__FILE__, __LINE__);
	}

	return GalleryStatus::success();
    }
  </xsl:template>

  <xsl:template match="member">
    /**
     * Get the value of <xsl:value-of select="member-name"/>
     *
     * @return <xsl:value-of select="member-type"/> the value
     */
    function get<xsl:value-of select="member-name"/>() {
 	<xsl:if test="linked">
	$linkedEntity = $this->getLinkedEntity();
	if (isset($linkedEntity)) {
	    return $linkedEntity->get<xsl:value-of select="member-name"/>();
	}
	</xsl:if>

	if (!isset($this->_<xsl:value-of select="member-name"/>)) {
	    return null;
	}

	return $this->_<xsl:value-of select="member-name"/>;
    }

    /**
     * Set the value of <xsl:value-of select="member-name"/>
     *
     * @param <xsl:value-of select="member-type"/> the value
     */
    function set<xsl:value-of select="member-name"/>($value) {
    <xsl:choose>
      <xsl:when test="member-type='BOOLEAN'">
	/* Set the incoming value to be a 1 or 0 */
	$value = empty($value) ? 0 : 1;
      </xsl:when>
      <xsl:when test="member-type='INTEGER'">
	/* Type cast the incoming value to be an integer */
	if ($value != null) {
	    $value = (int)$value;
	}
      </xsl:when>
    </xsl:choose>
	/* 
	 * Convert unset values to null, to avoid generating warnings.
	 */
	$a = isset($value) ? $value : null;
	$b = isset($this->_<xsl:value-of select="member-name"/>) ? $this->_<xsl:value-of select="member-name"/> : null;

	/* 
	 * Only take action if the value actually changes, but take care not to 
	 * generate warnings for unset values.
	 */
    <xsl:choose>
      <xsl:when test="member-type='INTEGER'">
	if ($a !== $b) {
      </xsl:when>
      <xsl:when test="member-type='BOOLEAN'">
	if ($a !== $b) {
      </xsl:when>
      <xsl:otherwise>
	if ($a != $b) {
      </xsl:otherwise>
    </xsl:choose>
	    $this->_<xsl:value-of select="member-name"/> = $value;
	    $this->setModifiedFlag('<xsl:value-of select="member-name"/>', MEMBER_MODIFIED);
	}
    }
  </xsl:template>
      
</xsl:stylesheet>
