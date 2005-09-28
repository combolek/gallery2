<?php
/*
 * $RCSfile$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2005 Bharat Mediratta
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
 * @package {$package}
 * @subpackage ClassInterfaces
 * @version $Revision$ $Date$
 * @author Bharat Mediratta <bharat@menalto.com>
 */

/**
 * Interface class for the {$className} class.
 * (Class schema version: {$schema.0}.{$schema.1})
 *
 * This file is automatically generated from XML embedded in the
 * class, combined with the ClassCode.xsl file.  You should not modify
 * it by hand, as your changes will be lost next time this file is
 * rebuilt.  If you want to add more getters/setters, you should add
 * them in the core class.  If you want to change the format of this
 * file, then you should edit lib/tools/bin/interface.tpl.
 *
 * @package {$package}
 * @subpackage Classes
 */
class {$className} extends {$className}_core {ldelim}
{if !$isMap}

{if !empty($members)}
    /**
     * Return meta information about the members of this class
     *
     * @return array member => array(type, class)
     */
    function getPersistentMemberInfo() {ldelim}
	$meta = parent::getPersistentMemberInfo();
{foreach from=$members item=member}
        $meta['members']['{$member.name}'] = array('class' => '{$className}', 'type' => STORAGE_TYPE_{$member.type}{if isset($member.id)}| STORAGE_TYPE_ID{/if});
{/foreach}
	return $meta;
    {rdelim}

    /**
     * Get the data from this persistent object as an associative array
     *
     * @return array memberName => memberValue
     */
    function getMemberData() {ldelim}
        $data = parent::getMemberData();
{foreach from=$members item=member}
{if $member.linked}
        if (isset($this->_linkedEntity)) {ldelim}
            $data['{$member.name}'] = isset($this->_linkedEntity->_{$member.name}) ? $this->_linkedEntity->_{$member.name} : null;
	{rdelim} else {ldelim}
            $data['{$member.name}'] = isset($this->_{$member.name}) ? $this->_{$member.name} : null;
        {rdelim}
{else}
        $data['{$member.name}'] = isset($this->_{$member.name}) ? $this->_{$member.name} : null;
{/if}
{/foreach}
	return $data;
    {rdelim}
{/if} {* !empty($members) *}
{/if} {* !$isMap *}

    /**
     * Return the name of this class with the proper mix of uppercase and
     * lowercase (get_class() always returns lowercase)
     *
     * @return string class name
     */
    function getClassName() {ldelim}
	return '{$className}';
    {rdelim}

    /**
     * Return the path to the PHP file for this class, relative to the gallery2 dir
     *
     * @return string path
     */
    function getClassFile() {ldelim}
        return 'modules/' . basename(dirname(dirname(dirname(__FILE__)))) . '/classes/{$className}.class';
    {rdelim}
{if $isMap}

    /**
     * Get meta information about this class' map
     *
     * @return array map member => type
     */
    function getMapInfo() {ldelim}
	$info = array();
{foreach from=$members item=member}
	$info['members']['{$member.name}'] = STORAGE_TYPE_{$member.type};
{/foreach}
	return $info;
    {rdelim}

    /**
     * Add an entry to this map
     *
     * @param array an associative array of the entry data
     * @return object GalleryStatus a status code
     * @static
     */
    function addMapEntry($data) {ldelim}
	global $gallery;
        foreach (array({foreach name=members from=$members item=member}'{$member.name}'{if !$smarty.foreach.members.last}, {/if}{/foreach}) as $key) {ldelim}
	    if (!array_key_exists($key, $data)) {ldelim}
	        return GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__,
                                            'Missing parameter: ' . $key);
	    {rdelim}
        {rdelim}

	$storage =& $gallery->getStorage();
	$ret = $storage->addMapEntry('{$className}', $data);
	if ($ret->isError()) {ldelim}
	    return $ret->wrap(__FILE__, __LINE__);
	{rdelim}
	return GalleryStatus::success();
    {rdelim}

    /**
     * Remove an entry from this map
     *
     * @param array an associative array of the entry data to match and remove
     * @return object GalleryStatus a status code
     * @static
     */
    function removeMapEntry($data) {ldelim}
	global $gallery;

	if (sizeof($data) == 0) {ldelim}
	    return GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__);
	{rdelim}

	$storage =& $gallery->getStorage();
	$ret = $storage->removeMapEntry('{$className}', $data);
	if ($ret->isError()) {ldelim}
	    return $ret->wrap(__FILE__, __LINE__);
	{rdelim}
	return GalleryStatus::success();
    {rdelim}

    /**
     * Remove ALL entries from this map.. use with caution!
     *
     * @return object GalleryStatus a status code
     * @static
     */
    function removeAllMapEntries() {ldelim}
	global $gallery;

	$storage =& $gallery->getStorage();
	$ret = $storage->removeAllMapEntries('{$className}');
	if ($ret->isError()) {ldelim}
	    return $ret->wrap(__FILE__, __LINE__);
	{rdelim}
	return GalleryStatus::success();
    {rdelim}

    /**
     * Update an entry in this map
     *
     * @param array the entry to match
     * @param array the values to change
     * @return object GalleryStatus a status code
     * @static
     */
    function updateMapEntry($match, $change) {ldelim}
	global $gallery;

	if (sizeof($match) == 0 || sizeof($change) == 0) {ldelim}
	    return GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__);
	{rdelim}

	$storage =& $gallery->getStorage();
	$ret = $storage->updateMapEntry('{$className}', $match, $change);
	if ($ret->isError()) {ldelim}
	    return $ret->wrap(__FILE__, __LINE__);
	{rdelim}
	return GalleryStatus::success();
    {rdelim}
{else}
{foreach from=$members item=member}

    /**
     * Get the value of {$member.name}
     *
     * @return {$member.lcType} the value
     */
    function get{$member.ucName}() {ldelim}
{if $member.linked}
	$linkedEntity = $this->getLinkedEntity();
	if (isset($linkedEntity)) {ldelim}
	    return $linkedEntity->get{$member.ucName}();
	{rdelim}
{/if}
	if (!isset($this->_{$member.name})) {ldelim}
	    return null;
	{rdelim}
	return $this->_{$member.name};
    {rdelim}

    /**
     * Set the value of {$member.name}
     *
     * @param {$member.lcType} the value
     */
    function set{$member.ucName}($value) {ldelim}
{if $member.type == 'INTEGER'}
        /* Type cast the incoming value to be an integer */
        if ($value != null) {ldelim}
            $value = (int)$value;
        {rdelim}

{elseif $member.type == 'BOOLEAN'}
	/* Set the incoming value to be a 1 or 0 */
	$value = empty($value) ? 0 : 1;

{/if}
	/* Convert unset values to null, to avoid generating warnings. */
	$value = isset($value) ? $value : null;
{if $member.type == 'STRING'}
{if $member.size == 'LARGE'}
        $value = $this->_truncateString($value, 255);
{elseif empty($member.size) || $member.size == 'MEDIUM'}
        $value = $this->_truncateString($value, 128);
{elseif $member.size == 'SMALL'}
        $value = $this->_truncateString($value, 32);
{/if}
{/if}
	$orig = isset($this->_{$member.name}) ? $this->_{$member.name} : null;

        /* Only take action if the value actually changes */
{if $member.type == 'INTEGER' || $member.type == 'BOOLEAN'}
        if ($value !== $orig) {ldelim}
{else}
        if ($value != $orig) {ldelim}
{/if}
	    $this->setModifiedFlag('{$member.name}', $value);
	    $this->_{$member.name} = $value;
	{rdelim}
    {rdelim}
{/foreach}
{/if} {* if $isMap *}

{rdelim}
?>

