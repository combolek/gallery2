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

//-------------------------------------------------------------------------
//-- The Business section ---
//

//-- Hack check. You have to have permission to see the album ---
if (!$gallery->user->canReadAlbum($gallery->album)) {
	header("Location: albums.php");
	return;
}

//-- The AlbumItem ID --- 
if ($id) {
	$index = $gallery->album->getPhotoIndex($id);
	if ($index == -1) {
		// That photo no longer exists. Go back to the album 
		header("Location: " . $gallery->app->photoAlbumURL . 
			"/" . $gallery->session->albumName);
		return;
	}
} else {
	// We must have an index
	$id = $gallery->album->getPhotoId($index);
}

//-- Increment the clickCount for this AlbumItem --- 
if (!$viewedItem[$gallery->session->albumName][$id]) {
	setcookie("viewedItem[$gallery->session->albumName][$id]", "1");
	$gallery->album->incrementItemClicks($index);
}

$photo = $gallery->album->getPhoto($index);
if ($photo->isMovie()) {
	$image = $photo->thumbnail;
} else {
	$image = $photo->image;
}
list($imageWidth, $imageHeight) = $image->getDimensions();

$do_fullOnly = !strcmp($gallery->session->fullOnly,"on") &&
               !strcmp($gallery->album->fields["use_fullOnly"],"yes");
if ($do_fullOnly) {
	$full = 1;
}
$fitToWindow = !strcmp($gallery->album->fields["fit_to_window"], "yes") && 
			!$gallery->album->isResized($index) && !$full;

$photoTag = $gallery->album->getPhotoTag($index, $full);
$photoUrl = $gallery->album->getPhotoPath($index, $full);

if (!$gallery->album->isMovie($id)) {
	if ($gallery->album->isResized($index) && !$do_fullOnly) { 
		if (!$full) {
			$photoHref = makeGalleryUrl($gallery->session->albumName, $id, "full=1");
		} else {
			$photoHref = makeGalleryUrl($gallery->session->albumName, $id);
		}
	}
} else {
	//-- XXX - if a movie, slip in the target ---
	$photoHref = $gallery->album->getPhotoPath($index)."\" target=\"other";
}

//-- in the fitToWindow case, wrap the photo with some JS ---
if ($fitToWindow && !$GALLERY_EMBEDDED_INSIDE) { 
	$photoTag = "<script language=\"javascript1.2\">"
			."  // <!--"
			."  fitToWindow();"
			."  // -->"
			."</script><noscript>$photoTag</noscript>";
}

$numPhotos = $gallery->album->numPhotos($gallery->user->canWriteToAlbum($gallery->album));
$next = $index+1;
if ($next > $numPhotos) {
	//$next = 1;
	$last = 1;
}
$prev = $index-1;
if ($prev <= 0) {
	//$prev = $numPhotos;
	$first = 1;
}

if ($index > $gallery->album->numPhotos(1)) {
	$index = $numPhotos;
}

$borderColor = $gallery->album->fields["bordercolor"];
$borderWidth = $gallery->album->fields["border"];
if (!strcmp($borderWidth, "off")) {
    $borderWidth = 1;
}

//-- setup the album specific style sheet ---
$albumStyle = "<style type=\"text/css\">\n";
if ($gallery->album->fields["linkcolor"]) {
    $albumStyle .= 
		"  A:link, A:visited, A:active\n" .
		"    { color: ".$gallery->album->fields[linkcolor]."; }\n" . 
		"  A:hover\n" . 
		"    { color: #ff6600; }\n";
}
if ($gallery->album->fields["bgcolor"]) {
	$albumStyle .=
		"  BODY { background-color:".$gallery->album->fields[bgcolor]."; }\n";
} 
if ($gallery->album->fields["background"]) {
	$albumStyle .= 
		"  BODY { background-image:url(".$gallery->album->fields[background].") ; }\n";  
}   
if ($gallery->album->fields["textcolor"]) {
	$albumStyle .= 
		"  BODY, TD {color:".$gallery->album->fields[textcolor]."; }\n" .
		"  .head {color:".$gallery->album->fields[textcolor]."; }\n" .
		"  .headbox {background-color:".$gallery->album->fields[bgcolor]."; }\n";
}
$albumStyle .= "</style>\n";

if (!strcmp($gallery->album->fields["resize_size"], "off")) {
	$mainWidth = imageWidth;
} else {
	$mainWidth = $gallery->album->fields["resize_size"];
}
$mainWidth += (borderWidth * 2);

//-------------------------------------------------------------------------
//-- The Gallery Layout Object ---
//
require($GALLERY_BASEDIR . "layout.php"); // XXX move to init.php

$GLO = array();

//-- the 'gallery' ---
$GLO['gallery']['title'] = $gallery->app->galleryTitle;
$GLO['gallery']['url'] = $gallery->app->photoAlbumURL;
$GLO['gallery']['styleSheetInclude'] = getStyleSheetLink();

//-- the 'album' ---
$GLO['album']['title'] = $gallery->album->fields['title'];
$GLO['album']['url'] = $gallery->album->getAlbumDirURL();
$GLO['album']['name'] = $gallery->session->albumName;
$GLO['album']['styleSheetInclude'] = $albumStyle;
$GLO['album']['borderSize'] = $borderWidth;
$GLO['borderColor'] = $borderColor;

//-- the 'item' is the focus of this page ---
$GLO['item']['id'] = $id;
$GLO['item']['index'] = $index;
$GLO['item']['caption'] = $gallery->album->getCaption($index);
 
//-- the 'image' is the image that represents the 'item' ---
$GLO['image']['width'] = $imageWidth;
$GLO['image']['height'] = $imageHeight;
$GLO['image']['tableWidth'] = $mainWidth;
$GLO['image']['url'] = $photoURL;
$GLO['image']['tag'] = $photoTag;
$GLO['image']['href'] = $photoHref;

//-- the 'boxTools' is the stuff that goes in the tool block ---
$toolCount = 1;
$GLO['toolbox']['tools'][$toolCount]['name'] = "Do This";
$GLO['toolbox']['tools'][$toolCount]['href'] = "http://www.dothis.com";
$toolCount++;
$GLO['toolbox']['tools'][$toolCount]['name'] = "Do That";
$GLO['toolbox']['tools'][$toolCount]['href'] = "http://www.dothat.com";
$toolCount++;
$GLO['toolbox']['tools'][$toolCount]['name'] = "Do The Other";
$GLO['toolbox']['tools'][$toolCount]['href'] = "http://www.dotheother.com";
$GLO['toolbox']['toolCount'] = $toolCount;

//-- the 'boxBreadcrumb' is the stuff that goes in the breadcrums block ---

//-- the 'boxNavigation' is the stuff that goes in the navigation block ---
$navIds = $gallery->album->getIds($gallery->user->canWriteToAlbum($gallery->album));

$navPageCount = sizeof($navIds);
$navpage = $navPageCount;
while ($navpage > 0) { // looking for the index among the 'visible' items
    if (!strcmp($navIds[$navpage], $id)) {
        break;
    }
    $navpage--;
}
$i_nav = 1; // pages are 1 based
foreach ($navIds as $navId) {
	$GLO['navigator']['pages'][$i_nav]['name'] = $navId;
	$GLO['navigator']['pages'][$i_nav]['href'] = 
		makeGalleryUrl($gallery->session->albumName, $navId); 
	$i_nav++;
}
$GLO['navigator']['pageNumber'] = $navpage + 1; // 1 based
$GLO['navigator']['pageCount'] = $navPageCount;
$GLO['navigator']['pageLabel'] = "Items";


//-- the 'layout' relevant info ---
$GLO['layout']['dir'] = $GLO['gallery']['url'] . "/" . getLayoutFile(""); 

//-- some axtra useful stuff ---
$GLO['pixelImage'] = "<img src=\"" . $gallery->app->photoAlbumURL .
                     "/images/pixel_trans.gif\" width=\"1\" height=\"1\">";

//-------------------------------------------------------------------------
//-- The Layout of the Page ---
//         
includeHtmlWrap("wrapper.header");
includeLayout("view_item", $GLO);
includeHtmlWrap("wrapper.footer");


