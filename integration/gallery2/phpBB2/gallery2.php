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
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
/**
 * Gallery 2 integration for phpBB2.
 * @version $Revision$ $Date$
 * @author Dariush Molavi <dari@nukedgallery.net>
 */

define('IN_PHPBB', true);
$phpbb_root_path = './';
require($phpbb_root_path . 'extension.inc');
require($phpbb_root_path . 'common.' . $phpEx);
$userdata = session_pagestart($user_ip, PAGE_INDEX);
init_userprefs($userdata);

require($phpbb_root_path . 'g2helper.inc');
$g2h = new g2helper($db);
$g2h->init($userdata);

GalleryCapabilities::set('showSidebarBlocks', true);
$g2data = GalleryEmbed::handleRequest(); 
if ($g2data['isDone']) {
	exit;
}
elseif (isset($g2data['headHtml'])) {
	list($page_title, $css, $javascript) = GalleryEmbed::parseHead($g2data['headHtml']);
}
$css = ($css) ? implode("\n", $css) . "\n" : '';
$javascript = ($javascript) ? implode("\n", $javascript) . "\n" : '';
$bodyHtml = ($g2data['bodyHtml']) ? $g2data['bodyHtml'] : '';

$template->set_filenames(array('body' => 'gallery2.tpl'));
$template->assign_vars(array(
	'PAGE_TITLE' => $page_title,
	'GALLERY2_BODY' => $bodyHtml,
	'GALLERY2_CSS' => $css,
	'GALLERY2_JAVASCRIPT' => $javascript)
);

include($phpbb_root_path . 'includes/page_header.' . $phpEx);
$template->pparse('body');
include($phpbb_root_path . 'includes/page_tail.' . $phpEx);

?>