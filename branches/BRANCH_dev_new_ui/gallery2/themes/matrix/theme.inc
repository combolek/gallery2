<?php
/*
 * $RCSfile$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2003 Bharat Mediratta
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
 * @version $Revision$ $Date$
 * @package MatrixTheme
 * @author Bharat Mediratta <bharat@menalto.com>
 * @author Ross Reyman 
 */

/**
 * This theme (code named "Matrix") is based on the UI designed by Ross Reyman.  
 *
 * @package MatrixTheme
 */
class MatrixTheme extends GalleryTheme {

    function MatrixTheme() {
	$this->GalleryTheme(dirname(__FILE__));
    }
    
    function header($params, $content) {
	return '<table class="header"> <tr> <td> <p> ' . $content . ' </p> </td> </tr> </table>';
    }
    
    function pathbar($params, $content) {
	return '<table cellspacing="0" class="pathbar"> <tr> <td> ' . $content . ' </td> </tr> </table>';
    }
    
    function pathbaritem($params, $content) {
	return '<p class="pathbar_item">' . $content . '</p>';
    }
    
    function main($params, $content) {
	return '<table cellspacing="0" class="main"> <tr> ' . $content . ' </tr> </table>';
    }
    
    function maintitle1($params, $content) {
	return '<tr> <td class="maintitle1"> ' . $content . ' </td> </tr>';
    }
    
    function mainbody1($params, $content) {
	return '<td class="mainbody1"> <table cellspacing="0" class="mainbody1_inner"> ' . $content .
	    ' </table> </td> ';
    }
    
    function sidebar1($params, $content) {
	return '<td class="sidebar1"> ' . $content . ' </td>';
    }
    
    function sidebarbox($params, $content) {
	return '<table class="sidebarbox"> <tr> <td> ' . $content . ' </td> </tr> </table>';
    }
    
    function sidebarboxtitle($params, $content) {
	return '<p class="sidebarbox_title">' . $content . '</p>';
    }
    
    function sidebarboxbody($params, $content) {
	return $content;
    }
    
    function listing($params, $content) {
	return '<ul class="listing"> ' . $content . ' </ul> ';
    }
    
    function listingitem($params, $content) {
	return '<li class="listing_item">' . $content . '</li>';
    }
    
    function listingitemselected($params, $content) {
	return '<li class="listing_selecteditem">' . $content . '</li>';
    }
    
    function detailedbox($params, $content) {
	return '<tr> <td> <table class="detailedbox"> ' . $content . ' </table> </td> </tr> ';
    }
    
    function detailedboxtitle($params, $content) {
	return '<tr> <td class="detailedbox_title"> ' . $content . ' </td> </tr';
    }
    
    function detailedboxdescription($params, $content) {
	return '<tr> <td class="detailedbox_description"> ' . $content . ' </td> </tr';
    }
    
    function detailedboxbody($params, $content) {
	return '<tr> <td> ' . $content . ' </td> </tr>';
    }
    
    function widget1($params, $content) {
	return '<tr> ' . $content . ' </tr> ';
    }
    
    function widget1set($params, $content) {
	return '<table cellspacing="0" class="widget1set"> ' . $content . ' </table>';
    }
    
    function widget1title($params, $content) {
	return '<td class="widget1title"> ' . $content . ' </td>';
    }
    
    function widget1body($params, $content) {
	return '<td> ' . $content . ' </td>';
    }
    
    function widget2($params, $content) {
	return '<tr> <td> ' . $content . ' </td> </tr> ';
    }
    
    function widget2set($params, $content) {
	return '<table cellspacing="0" class="widget2set"> ' . $content . ' </table>';
    }
    
    function widget2title($params, $content) {
	return '<span class="widget2title">' . $content . '</span> ';
    }
    
    function widget2body($params, $content) {
	return '<br /> ' . $content . ' ';
    }
    
    function footer($params, $content) {
	return $content;
    }
    
    function status($params, $content) {
	return '<span class="status">' . $content . '</span>';
    }
    
    function error($params, $content) {
	return '<p class="error">' . $content . '</p>';
    }
    
    function textmodifier1($params, $content) {
	return '<span class="textmodifier1">' . $content . '</span> ';
    }
    
    function table($params, $content) {
	return '<table class="table"> ' . $content . ' </table>';
    }
    
    function row($params, $content) {
	return '<tr class="row"> ' . $content . ' </tr>';
    }
    
    function column($params, $content) {
	return '<td class="column"> ' . $content . ' </td>';
    }
    
    function columnheader($params, $content) {
	return '<th class="columnheader"> ' . $content . ' </th>';
    }
    
    function style($params) {
	$themeCss = $this->getBaseUrl() . 'styles/theme.css';
	return '<style type="text/css" media="all">@import url(' . $themeCss . ');</style>';
    }
}
?>
