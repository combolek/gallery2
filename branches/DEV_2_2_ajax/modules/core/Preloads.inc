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

/**
 * @version $Revision: 13541 $ $Date: 2006-04-27 09:58:35 -0700 (Thu, 27 Apr 2006) $
 * @package GalleryCore
 * @subpackage UserInteface
 * @author Bharat Mediratta <bharat@menalto.com>
 */

class CorePreloads {
    function preload(&$template, $preload, $params) {
	switch($preload) {
	case 'BreadCrumb':
	    /* Nothing to do */
	    return null;

	case 'EditItemBlock':
	    $template->javascript('lib/yui/yahoo-min.js');
	    $template->javascript('lib/yui/connection-min.js');
	    $template->javascript('lib/yui/dom-min.js');
	    $template->javascript('lib/yui/event-min.js');
	    $template->javascript('lib/javascript/GalleryUtilities.js');
	    $template->javascript('lib/javascript/EditItemBlock.js');
	    return null;

	case 'EmergencyEditItemLink':
	    /* Nothing to do */
	    return null;

	case 'GuestPreview':
	    /* Nothing to do */
	    return null;

	case 'ItemInfo':
	    /* Nothing to do */
	    return null;

	case 'ItemLinks':
	    /* Nothing to do */
	    return null;

	case 'LanguageSelector':
	    /* Nothing to do */
	    return null;

	case 'LoginBlock':
	    /* Nothing to do */
	    return null;

	case 'NavigationLinks':
	    /* Nothing to do */
	    return null;

	case 'Navigator':
	    /* Nothing to do */
	    return null;

	case 'Pager':
	    /* Nothing to do */
	    return null;

	case 'PeerList':
	    /* Nothing to do */
	    return null;

	case 'PhotoSizes':
	    /* Nothing to do */
	    return null;

	case 'SystemLink':
	    /* Nothing to do */
	    return null;

	case 'SystemLinks':
	    /* Nothing to do */
	    return null;

	case 'ThemeSettingsForm':
	    /* Nothing to do */
	    return null;
	}

	return GalleryCoreApi::error(ERROR_BAD_PARAMETER);
    }
}
?>
