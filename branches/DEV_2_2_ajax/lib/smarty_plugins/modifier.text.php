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
 * Name:     text
 * Purpose:  Localize the given text
 *
 * @param string some text to localize
 * @param mixed no arguments or many arguments
 * @return string localized value
 * @see GalleryTranslator::translateDomain
 * -------------------------------------------------------------
 */
function smarty_modifier_text($text) {
    global $gallery;

    $smarty =& GalleryTemplate::getSmarty();
    if (isset($smarty->_tpl_vars['viewL10domain'])) {
	$domain = $smarty->_tpl_vars['viewL10domain'];
    } else {
	$domain = $smarty->_tpl_vars['l10Domain'];
    }

    $params = array('text' => $text);
    $args = func_get_args();
    for ($i = 1; $i < count($args); $i++) {
	$params['arg' . $i] = $args[$i];
    }

    $translator =& $gallery->getTranslator();
    list ($ret, $text) = $translator->translateDomain($domain, $params);
    if ($ret) {
	return $ret->getAsHtml();
	return "[Translation error]";
    }

    return $text;
}
?>
