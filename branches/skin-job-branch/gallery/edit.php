<?
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000 Bharat Mediratta
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
?>
<? 

require($GALLERY_BASEDIR . "init.php"); 

$albumName = $gallery->session->albumName;
$album = $gallery->album;
$user = $gallery->user;

//-- Hack check. You have to have permission to see the album ---
if (!$user->canReadAlbum($album)) {
    header("Location: albums.php");
    return;
}

if (!$album->isLoaded()) {
    header("Location: albums.php");
    return;
}

//-- if we have a submit and the command wants to show progress ---
//-- go straight there... ---
if ($doit && $show_progress) {

	echo ("<html><head><title>in progress</title></head>");
	reload();
	
}



//-- load up the available commands ---
switch ($type) {

	case "album":
		//
		break;

	case "item":
		//
		break;
	default:
		// uh, this is bad...
}

//-- which command is selected ---





//-- if show_progress is set, then we actually display an interum page instead
//-- of the real one.


//-------------------------------------------------------------------------
//-- The Layout of the Page ---
//

//-- first get the html for the header and footer and stick it in the GLO
//-- for use by the layout. The html_wrap template gets is own limited
//-- layout object.
$G['TITLE'] = $gallery->app->galleryTitle.":: edit";
$G['HEAD']['EXTRA'] = $pageHeadExtra;
$G['HEAD']['STYLESHEET_INCLUDE'] = getStyleSheetLink();
$G['BODYTAG']['EXTRA'] = $pageBodyTagExtra;
$G['GALLERY_PROJECT']['HREF'] = $gallery->url;
$G['GALLERY_PROJECT']['VERSION'] = $gallery->version;
$G['PIXEL_IMAGE'] = $GLO['pixelImage'];

list($GLO['header'], $GLO['footer']) = getLayoutWrapHeaderFooter($G);

//-- now do the layout, wrapped by the embed logic ---
includeHtmlWrap("wrapper.header");
includeLayout("edit", $GLO);
includeHtmlWrap("wrapper.footer");

?>
