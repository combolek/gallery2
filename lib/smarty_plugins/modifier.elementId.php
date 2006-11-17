<?php
/*
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

/*
 * Smarty plugin
 * -------------------------------------------------------------
 * Type:     modifier
 * Name:     elementId
 * Purpose:  Make an HTML element id
 *
 * Element ids in Gallery contain 1) the element id, 2) the template basename (to avoid conflicts
 * between different templates included in the same HTML page) and optionally 3) a template id (to
 * avoid conflicts between the same template, if included more than once, like an item block on an
 * album page).
 *
 * The template name and id may be specified in the first and second arguments, or either may be
 * omitted.  If the template name is omitted, it is filled in automatically with the basename of the
 * current template.  If the template name and id are omitted, the template id is filled in with the
 * {$templateId} template variable, if present.
 *
 * @param string element id
 * @param string template name
 * @param string template id
 * @return string an HTML element id
 * -------------------------------------------------------------
 */
function smarty_modifier_elementId($elementId, $templateName=null, $templateId=null) {
    $args = array();
    if (!empty($elementId)) {
	$args[] = $elementId;
    }

    if (empty($templateName)) {
	/* Ideally $smarty would be passed in the modifier signature */
	$smarty =& GallerySmarty::getSmarty();

	/* TODO Use $this->_current_file, but it's only available at compile time */
	$templateName = $smarty->_smarty_vars['templateName'];

	if (empty($templateId) && !empty($smarty->_tpl_vars['templateId'])) {
	    $templateId = $smarty->_tpl_vars['templateId'];
	}
    }
    $args[] = $templateName;

    if (!empty($templateId)) {
	$args[] = $templateId;
    }

    return implode('-', $args);
}
?>
