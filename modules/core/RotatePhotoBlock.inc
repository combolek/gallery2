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
 * @version $Revision: 14127 $ $Date: 2006-07-31 09:18:25 -0700 (Mon, 31 Jul 2006) $
 * @package GalleryCore
 * @subpackage UserInterface
 * @author Bharat Mediratta <bharat@menalto.com>
 */

/**
 * Render one instance of the Ajax rotation block
 *
 * @package GalleryCore
 * @subpackage UserInterface
 */
class RotatePhotoBlockView extends GalleryView {

    /**
     * @see GalleryView::loadTemplate
     */
    function loadTemplate(&$template, &$form) {
	list ($templateId, $RotatePhotoBlock) = GalleryUtilities::getRequestVariables('templateId',
	    'RotatePhotoBlock');

	list ($ret, $item) = GalleryCoreApi::loadEntitiesById($RotatePhotoBlock['item']['id']);
	if ($ret) {
	    return array($ret, null);
	}

	$RotatePhotoBlock['item'] = (array)$item;

	/* Render the HTML body */
	$template->setVariable('templateId', $templateId);
	$template->setVariable('RotatePhotoBlock', $RotatePhotoBlock);

	return array(null, array('body' => 'modules/core/templates/RotatePhotoBlock.tpl'));
    }
}
?>
