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
    
    /**
     * style theme method
     * @param array the template context
     * @return string HTML content
     */
    function style($context) {
	$themeCss = $this->getBaseUrl() . 'styles/theme.css';
	return '<style type="text/css" media="all">@import url(' . $themeCss . ');</style>';
    }

    /**
     * thumbnail theme method
     * @param array the template context
     * @return string HTML content
     */
    function thumbnail($context) {
	global $gallery;
	$urlGenerator = $gallery->getUrlGenerator();

	$params = $context['params'];
	$src = $urlGenerator->generateUrl(array('view' => 'core:DownloadItem',
						'itemId' => $params['thumbnail']['id']));

	if (in_array('sidebar', $context['stack'])) {
	    list ($width, $height) =
		GalleryUtilities::shrinkDimensionsToFit(110,
							$params['thumbnail']['width'],
							$params['thumbnail']['height']);
	} else {
	    list ($width, $height) = array($params['thumbnail']['width'],
					   $params['thumbnail']['height']);
	}

	$title = $params['item']['title'];
	if (empty($title)) {
	    $title = $params['item']['pathComponent'];
	}

	$result = sprintf('<img src="%s" width="%s" height="%s" alt="%s" longdesc="%s" class="thumbnail">' .
			  '<p class="thumbnail_title"> %s </p>',
			  $src,
			  $width,
			  $height,
			  $title,
			  $params['item']['description'],
			  $title);
	return $result;
    }

    /**
     * error theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function error($context, $content) {
	return '<p class="error">' . $content . '</p>';
    }

    /**
     * status theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function status($context, $content) {
	return '<span class="status">' . $content . '</span>';
    }

    /**
     * textmodifier theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function textmodifier($context, $content) {
	return '<span class="textmodifier">' . $content . '</span>';
    }

    /**
     * globalheader theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function globalheader($context, $content) {
	return '<table class="globalheader"> <tr> <td> ' . $content . ' </td> </tr> </table>';
    }

    /**
     * main theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => header content)
     * @param array optional ("params" => array, "content" => footer content)
     * @param array optional ("params" => array, "content" => pathbar content)
     * @param array optional (array("params" => array, "content" => sidebar content), ...)
     * @param array optional (array("params" => array, "content" => component content), ...)
     * @return string HTML content
     */
    function main($context, $header, $footer, $pathbar, $sidebar_array, $component_array) {
	$buf = '<table class="main"> ';

	// Header row
	if (!empty($header)) {
	    $buf .= '<tr> <td class="header"> ' . $header['content'] . ' </td> </tr> ';
	}

	// Pathbar row
	if (!empty($pathbar)) {
	    $buf .= '<tr> <td class="pathbar" colspan="2"> ' . $pathbar['content'] . ' </td> </tr> ';
	}

	// Begin center row
	$buf .= '<tr> ';

	// First sidebar goes on the left 
	if (sizeof($sidebar_array) > 0) {
	    $buf .= '<td class="sidebar_left"> ' . $sidebar_array[0]['content'] . ' </td>';
	}

	// Center body 
	$buf .= '<td class="main_inner"> <table class="main_inner">';
	for ($i = 0; $i < sizeof($component_array); $i++) {
	    $buf .= '<tr> <td> ' . $component_array[$i]['content'] . '</td> </tr>';
	}
	$buf .= '</table> </td>';

	// Remaining sidebars go on the right
	if (sizeof($sidebar_array) > 1) {
	    for ($i = 1; $i < sizeof($sidebar_array); $i++) {
		$buf .= '<td> ' . $sidebar_array[$i]['content'] . ' </td>';
	    }
	}

	// End center row
	$buf .= '</tr>';

	// Footer row
	if (!empty($footer)) {
	    $buf .= '<tr> <td class="footer"> ' . $footer['content'] . ' </td> </tr> ';
	}

	$buf .= '</table>';
	return $buf;
    }

    /**
     * globalfooter theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function globalfooter($context, $content) {
	return '<table class="globalfooter"> <tr> <td> <p> ' . $content . ' </p> </td> </tr> </table>';
    }

    /**
     * header theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function header($context, $content) {
	return $content;
    }

    /**
     * footer theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function footer($context, $content) {
        trigger_error("Undefined theme function: footer", E_USER_ERROR);
    }

    /**
     * pathbar theme method
     * @param array the template context
     * @param array mandatory (array("params" => array, "content" => item content), ...)
     * @return string HTML content
     */
    function pathbar($context, $item_array) {
	$buf = '<table class="pathbar_inner"> <tr> ';
	for ($i = 0; $i < sizeof($item_array); $i++) {
	    $buf .= '<td class="pathbar_item">' . $item_array[$i]['content'] . '</td>';
	    if ($i < sizeof($item_array)-1) {
		$buf .= '<td class="pathbar_item"> &raquo; </td>';
	    }
	}
	$buf .= ' </tr> </table>';
	return $buf;
    }

    /**
     * sidebar theme method
     * @param array the template context
     * @param array mandatory (array("params" => array, "content" => component content), ...)
     * @return string HTML content
     */
    function sidebar($context, $component_array) {
	$buf = '<table class="sidebar">';
	foreach ($component_array as $component) {
	    $buf .= '<tr> <td class="sidebar_box"> ' . $component['content'] . ' </td> </tr>';
	}
	$buf .= '</table>';
	return $buf;
    }

    /**
     * bannerbox theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array optional ("params" => array, "content" => description content)
     * @param array optional (array("params" => array, "content" => component content), ...)
     * @return string HTML content
     */
    function bannerbox($context, $title, $description, $component_array) {
	$buf = '<table class="bannerbox">';
	if (empty($component_array)) {
	    if (!empty($title)) {
		$buf .= '<tr> <td> ' . $title['content'] . ' </td> </tr>';
	    }

	    if (!empty($description)) {
		$buf .= '<tr> <td> ' . $description['content'] . ' </td> </tr>';
	    }
	} else {
	    $buf .= '<tr> <td> BANNERBOX INCOMPLETE </td> </tr>';
	}
	$buf .= '</table>';
	return $buf;
    }

    /**
     * linksbox theme method
     * @param array the template context
     * @param array mandatory (array("params" => array, "content" => item content), ...)
     * @return string HTML content
     */
    function linksbox($context, $item_array) {
        trigger_error("Undefined theme function: linksbox", E_USER_ERROR);
    }

    /**
     * infobox theme method
     * @param array the template context
     * @param array mandatory (array("params" => array, "content" => item content), ...)
     * @return string HTML content
     */
    function infobox($context, $item_array) {
        trigger_error("Undefined theme function: infobox", E_USER_ERROR);
    }

    /**
     * listingbox theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array mandatory (array("params" => array, "content" => item content), ...)
     * @return string HTML content
     */
    function listingbox($context, $title, $item_array) {
	$buf = '<table class="listingbox"> ';
	if (!empty($title)) {
	    $buf .= '<tr> <td class="listingbox_title"> ' . $title['content'] . '</td> </tr>';
	}
	$buf .= '<tr> <td> <ul class="listingbox_list">';
	foreach ($item_array as $item) {
	    if ($item['params']['selected'] == 'true') {
		$buf .= '<li class="listingbox_selecteditem"> ' . $item['content'];
	    } else {
		$buf .= '<li class="listingbox_item"> ' . $item['content'];
	    }
	}
	$buf .= '</ul> </td> </tr> </table>';
	return $buf;
    }

    /**
     * detailedbox theme method
     * @param array the template context
     * @param array mandatory ("params" => array, "content" => title content)
     * @param array mandatory ("params" => array, "content" => description content)
     * @param array mandatory ("params" => array, "content" => body content)
     * @return string HTML content
     */
    function detailedbox($context, $title, $description, $body) {
	$buf = '<table class="detailedbox"> ';
	if (!empty($title)) {
	    $buf .= '<tr> <td class="detailedbox_title"> ' . $title['content'] . '</td> </tr> ';
	}

	if (!empty($description)) {
	    $buf .= '<tr> <td class="detailedbox_description"> ' . $description['content'] . '</td> </tr> ';
	}

	$buf .= '<tr> <td> ' . $body['content'] . '</td> </tr> </table>';
	return $buf;
    }

    /**
     * tabbedbox theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array mandatory (array("params" => array, "content" => item content), ...)
     * @param array mandatory ("params" => array, "content" => body content)
     * @return string HTML content
     */
    function tabbedbox($context, $title, $item_array, $body) {
        trigger_error("Undefined theme function: tabbedbox", E_USER_ERROR);
    }

    /**
     * simplebox theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array mandatory ("params" => array, "content" => body content)
     * @return string HTML content
     */
    function simplebox($context, $title, $body) {
	$buf = '<table class="simplebox">';
	if (!empty($title)) {
	    $buf .= '<tr> <td class="simplebox_title"> ' . $title['content'] . '</td> </tr> ';
	}

	if (!empty($body)) {
	    $buf .= '<tr> <td class="simplebox_body"> ' . $body['content'] . '</td> </tr> ';
	}
	$buf .= '</table>';
	return $buf;
    }

    /**
     * widget1box theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array mandatory (array("params" => array, "content" => widget1 content), ...)
     * @return string HTML content
     */
    function widget1box($context, $title, $widget1_array) {
	$buf = '<table class="widget1box"> <tr> <td> ' . $title . ' </td> </tr> ';
	for ($i = 0; $i < sizeof($widget1_array); $i++) {
	    $buf .= $widget1_array[$i]['content'];
	}
	$buf .= ' </table>';
	return $buf;
    }

    /**
     * widget2box theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array mandatory (array("params" => array, "content" => widget2 content), ...)
     * @return string HTML content
     */
    function widget2box($context, $title, $widget2_array) {
	$buf = '<table class="widget2box"> <tr> <td> ' . $title . ' </td> </tr> ';
	for ($i = 0; $i < sizeof($widget2_array); $i++) {
	    $buf .= $widget2_array[$i]['content'];
	}
	$buf .= ' </table>';
	return $buf;
    }

    /**
     * widget1 theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array mandatory ("params" => array, "content" => body content)
     * @return string HTML content
     */
    function widget1($context, $title, $body) {
	return '<tr> <td class="widget1_title"> ' . $title['content'] . '</td> ' .
	    '<td class="widget1_body"> ' . $body['content'] . '</td> </tr>';
    }

    /**
     * widget2 theme method
     * @param array the template context
     * @param array optional ("params" => array, "content" => title content)
     * @param array optional ("params" => array, "content" => description content)
     * @param array mandatory ("params" => array, "content" => body content)
     * @return string HTML content
     */
    function widget2($context, $title, $description, $body) {
	$buf = '';
	if (!empty($title)) {
	    $buf .= '<tr> <td class="widget2_title"> ' . $title['content'] . ' </td> </tr> ';
	}
	
	if (!empty($description)) {
	    $buf .= '<tr> <td class="widget2_description"> ' . $description['content'] . ' </td> </tr> ';
	}

	$buf .= '<tr> <td class="widget2_body"> ' . $body['content'] . ' </td> </tr>';
	return $buf;
    }

    /**
     * table theme method
     * @param array the template context
     * @param array mandatory (array("params" => array, "content" => row content), ...)
     * @return string HTML content
     */
    function table($context, $row_array) {
	$buf = '<table class="table">';
	for ($i = 0; $i < sizeof($row_array); $i++) {
	    $buf .= $row_array[$i]['content'];
	}
	$buf .= '</table>';
	return $buf;
    }

    /**
     * row theme method
     * @param array the template context
     * @param array mandatory (array("params" => array, "content" => column content), ...)
     * @return string HTML content
     */
    function row($context, $column_array) {
	$buf = '<tr>';
	for ($i = 0; $i < sizeof($column_array); $i++) {
	    if ($column_array[$i]['params']['header'] == 'true') {
		$buf .= '<td class="columnheader">' . $column_array[$i]['content'] . '</td>';
	    } else {
		$buf .= '<td class="column">' . $column_array[$i]['content'] . '</td>';
	    }
	}
	$buf .= '</tr>';
	return $buf;
    }

    /**
     * bigFontSize theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function bigFontSize($context, $content) {
        trigger_error("Undefined theme function: bigFontSize", E_USER_ERROR);
    }

    /**
     * biggerFontSize theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function biggerFontSize($context, $content) {
        trigger_error("Undefined theme function: biggerFontSize", E_USER_ERROR);
    }

    /**
     * biggestFontSize theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function biggestFontSize($context, $content) {
        trigger_error("Undefined theme function: biggestFontSize", E_USER_ERROR);
    }

    /**
     * errorFontColor theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function errorFontColor($context, $content) {
        trigger_error("Undefined theme function: errorFontColor", E_USER_ERROR);
    }

    /**
     * heavyFrame theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function heavyFrame($context, $content) {
        trigger_error("Undefined theme function: heavyFrame", E_USER_ERROR);
    }

    /**
     * highlight1 theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function highlight1($context, $content) {
        trigger_error("Undefined theme function: highlight1", E_USER_ERROR);
    }

    /**
     * highlight2 theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function highlight2($context, $content) {
        trigger_error("Undefined theme function: highlight2", E_USER_ERROR);
    }

    /**
     * lightFrame theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function lightFrame($context, $content) {
        trigger_error("Undefined theme function: lightFrame", E_USER_ERROR);
    }

    /**
     * smallFontSize theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function smallFontSize($context, $content) {
        trigger_error("Undefined theme function: smallFontSize", E_USER_ERROR);
    }

    /**
     * smallerFontSize theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function smallerFontSize($context, $content) {
        trigger_error("Undefined theme function: smallerFontSize", E_USER_ERROR);
    }

    /**
     * smallestFontSize theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function smallestFontSize($context, $content) {
        trigger_error("Undefined theme function: smallestFontSize", E_USER_ERROR);
    }

    /**
     * successFontColor theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function successFontColor($context, $content) {
        trigger_error("Undefined theme function: successFontColor", E_USER_ERROR);
    }

    /**
     * thinFrame theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function thinFrame($context, $content) {
        trigger_error("Undefined theme function: thinFrame", E_USER_ERROR);
    }

    /**
     * threeDFrame theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function threeDFrame($context, $content) {
        trigger_error("Undefined theme function: threeDFrame", E_USER_ERROR);
    }

    /**
     * warningFontColor theme method
     * @param array the template context
     * @param string optional content
     * @return string HTML content
     */
    function warningFontColor($context, $content) {
        trigger_error("Undefined theme function: warningFontColor", E_USER_ERROR);
    }
}
?>
