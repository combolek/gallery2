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

function makeEditUrl($t) {
	global $type, $id, $return;
	$url = "edit.php?type=$type&id=$id&tab=$t&return=" . urlencode($return);
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

//-- The user hit "done". forgetaboutit ---
if ($doreturn) {
	header("Location: $return");
	return;
}

$editDir = $GALLERY_BASEDIR . "edit/";

//-- we're executing the command? ---
if ($doit) {

	$editTabInclude = $editDir. $type . "_" . $tab . ".inc";

	//-- after doint it we either return to the edit or, if the tab
	//-- sets forceReturn it exit's edit ---
	$returnAfterDoit = ($forceReturn) ? $return : makeEditUrl($tab);

	//-- if we have a submit and the command wants to show progress ---
	//-- go straight there (don't bother loading the layout)...     ---
	if ($show_progress) {

		$progressHead = "
			<html>
			<head>
			<title>in progress</title>
			<META HTTP-EQUIV=\"Pragma\" CONTENT=\"no-cache\">
			". getStyleSheetLink() ." 
			</head>
			<body>
		";
		echo($progressHead);

		//-- here the command should 'execute' ---
		require($editTabInclude);

		//-- use javascript to pop back to the edit page ---
		$backtoEditUrl = makeEditUrl($tab);
		$jsreturn = "
			<script language=\"javascript1.2\">
			<!--
			document.location = \"$returnAfterDoit\";
			//-->
			</script>
		";
		echo($jsreturn);
	
		//-- if javascript is off, the location change won't work. Put a 
		//-- link up to let the user get back to the edit page.
		$nojsreturn = "
			<hr size=\"1\">
			Done!<br><br>
			Click <a href=\"$returnAfterDoit\">here</a> to return.
			</body>
			</html>
		";
		echo($nojsreturn);

		return;	

	} else {
		
		//-- a normal doit (which should not emit any text) ---
		require($editTabInclude);

		//-- reset the doit so the command won't execute again ---
		$doit = 0;

		//-- we either leave edit here, or let the page display below ---
		if ($forceReturn) {
			header("Location: $returnAfterDoit");
			return;
		}

	}
}


//-- load up the available commands ---
$commands = Array();
$commandCount = 0;

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
			$commands[$name]['href'] = makeEditUrl($name);
		}

		//-- 
		$typeLabel = "Album";

		break;

	case "item":

		//-- 
		if ($album->isMovie($id)) {
			$typeLabel = "Movie";
		} else {
			$typeLabel = "Photo";
		}

		//-- the item info for display ---
		$index = $album->getPhotoIndex($id);

		//-- have to make url 'unique' to guarantee browser refresh ---
		$thumbnail['url'] = $album->getThumbnailPath($index);

		$p = $album->getPhoto($index);
		list($w, $h) = $p->thumbnail->getScaledDimensions(100);
		$thumbnail['width'] = $w;
		$thumbnail['height'] = $h;

		//-- the item commands ---
		if ($user->canChangeTextOfAlbum($album)) {
			$name = "general";
			$commands[$name]['title'] = "Edit Info";
			$commands[$name]['href'] = makeEditUrl($name);
		}
		if ($user->canWriteToAlbum($album)) {
			if (!$album->isMovie($id)) {
				$name = "image_thumbnail";
				$commands[$name]['title'] = "Edit Thumbnail";
				$commands[$name]['href'] = makeEditUrl($name);
				$name = "image_rotate";
				$commands[$name]['title'] = "Rotate Photo";
				$commands[$name]['href'] = makeEditUrl($name);
			}
			$name = "showhide";
			$commands[$name]['title'] = "Show/Hide $typeLabel";
			$commands[$name]['href'] = makeEditUrl($name);

        }

		if ($user->canDeleteFromAlbum($album))
			$name = "delete";
			$commands[$name]['title'] = "Delete $typeLabel";
			$commands[$name]['href'] = makeEditUrl($name);

		break;

	default:
		// uh, this is bad...
}

//-- is a tab is not passed in, pick the first one ---
if (!$tab) {
	$tabs = array_keys($commands);
	$tab = $tabs[0];
}
$editInclude = $editDir. $type . "_" . $tab . ".inc";

//-- which command is selected ---
$commands[$tab]['selected'] = 1;

//-- the tab content ---
$GLO['selected']['content'] = include($editInclude);

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

//-- is the tab set this flag, insert a hidden field to be submitted ---
if ($show_progress) {
	$form['hidden'] .= "<input type=\"hidden\" name=\"show_progress\" value=\"1\">\n";
}

$form['buttons'] = "
	<input type=\"submit\" name=\"doit\" value=\"Do It!\">
	<input type=\"submit\" name=\"doreturn\" value=\"No More. I'm Done\">
";


//-- The Layout object ---
$GLO['type']['name'] = $type;
$GLO['type']['label'] = $typeLabel;
$GLO['item']['id'] = $id;
$GLO['item']['thumbnail'] = $thumbnail;
$GLO['item']['thumbnail']['size'] = 100;

//-- XXX - we'll fix these colors ---
$GLO['album']['fontColor'] = "black";
$GLO['album']['bgColor'] = "white";

$GLO['commands'] = $commands;

$GLO['form'] = $form;

//-- some extra useful stuff ---
$GLO['pixelImage'] = "<img src=\"" . $gallery->app->photoAlbumURL .
                     "/images/pixel_trans.gif\" width=\"1\" height=\"1\">";

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
