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

function makeEditUrl($type, $id, $t, $return) {
	$url = "edit.php?"
		. "type=$type"
		. "&id=$id"
		. "&tab=$t"
		. "&return=" . urlencode($return);
	return makeGalleryUrl($url);
}

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

if ($doreturn) {
	header("Location: $return");
	return;
}

if (!$tab) {
	$tab = "general";
}
$editDir = $GALLERY_BASEDIR . "edit/";
$editInclude = $editDir. $type . "_" . $tab . ".inc";

//-- if we have a submit and the command wants to show progress ---
//-- go straight there (don't bother loading the layout)...     ---
//-- Otherwise we 'doit' within the layout ---
if ($doit && $show_progress) {

	echo ("<html><head><title>in progress</title></head>");

	require($editInclude);

	$url = makeEditUrl($type, $id, $tab, $return);
    $doit = 0;
    $show_progress = 0;
	echo ("<BODY onLoad='document.location = \"$url\"'>");
	
}


$commands = Array();
$commandCount = 0;

//-- load up the available commands ---
switch ($type) {

	case "album":

		//-- the item info for display ---
		$myAlbum = new Album();
		$myAlbum->load($id);
		$thumbnail['tag'] = $myAlbum->getHighlightTag(100);
		$thumbnail['url'] = $album->getHighlightPath($index);

        //-- the album commands ---
		if ($user->canChangeTextOfAlbum($myAlbum)) {
			$name = "general";
			$commands[$name]['title'] = "Info";
			$commands[$name]['href'] = makeEditUrl($type, $id, $name, $return);
		}

		break;

	case "item":

		//-- the item info for display ---
		$index = $album->getPhotoIndex($id);
		$thumbnail['tag'] = $album->getThumbnailTag($index, 100);
		$thumbnail['url'] = $album->getThumbnailPath($index);

		//-- the item commands ---
		if ($user->canChangeTextOfAlbum($album)) {
			$name = "general";
			$commands[$name]['title'] = "Info";
			$commands[$name]['href'] = makeEditUrl($type, $id, $name, $return);
		}
		if ($user->canWriteToAlbum($album)) {
			if (!$album->isMovie($id)) {
				$name = "image_thumbnail";
				$commands[$name]['title'] = "Edit Thumbnail";
				$commands[$name]['href'] = makeEditUrl($type, $id, $name, $return);
				$name = "image_rotate";
				$commands[$name]['title'] = "Rotate";
				$commands[$name]['href'] = makeEditUrl($type, $id, $name, $return);
			}
			$name = "showhide";
			$commands[$name]['title'] = "Show/Hide";
			$commands[$name]['href'] = makeEditUrl($type, $id, $name, $return);

        }

		if ($user->canDeleteFromAlbum($album))
			$name = "delete";
			$commands[$name]['title'] = "Delete";
			$commands[$name]['href'] = makeEditUrl($type, $id, $name, $return);

		break;

	default:
		// uh, this is bad...
}

//-- which command is selected ---
$commands[$tab]['selected'] = 1;

//-- form elements ---
$formUrl = makeGalleryUrl("edit.php");
$form['openTag'] = "<form action=\"$formUrl\" method=\"POST\">";
$form['closeTag'] = "</form>";
$form['hidden'] = "
	<input type=\"hidden\" name=\"type\" value=\"$type\">
	<input type=\"hidden\" name=\"tab\" value=\"$tab\">
	<input type=\"hidden\" name=\"id\" value=\"$id\">
	<input type=\"hidden\" name=\"return\" value=\"$return\">
";

$form['buttons'] = "
	<input type=\"submit\" name=\"doit\" value=\"Do It!\">
	<input type=\"submit\" name=\"doreturn\" value=\"No More. I'm Done\">
";


//-- The Layout object ---
$GLO['item']['id'] = $id;
$GLO['item']['thumbnail'] = $thumbnail;
$GLO['item']['thumbnail']['size'] = 100;

$GLO['album']['fontColor'] = "black";
$GLO['album']['bgColor'] = "white";

$GLO['commands'] = $commands;

//-- the tab content ---
$GLO['form'] = $form;
$GLO['selected']['content'] = include($editInclude);

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
