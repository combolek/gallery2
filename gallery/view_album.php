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

if (!$gallery->album->isLoaded()) {
    header("Location: albums.php");
    return;
}

$albumDB = new AlbumDB();

if (!$page) {
    $page = 1;
}
$albumName = $gallery->session->albumName;

//-- increment album click counter ---
if (!$viewedAlbum[$albumName]) {
    setcookie("viewedAlbum[$albumName]","1");
    $gallery->album->incrementClicks();
}

//-- some stuff for nav ---
$rows = $gallery->album->fields["rows"];
$cols = $gallery->album->fields["cols"];
$numPhotos = $gallery->album->numPhotos($gallery->user->canWriteToAlbum($gallery->album));
$perPage = $rows * $cols;
$maxPages = max(ceil($numPhotos / $perPage), 1);

if ($page > $maxPages) {
    $page = $maxPages;
}

for ($i_nav=1; $i_nav<=$maxPages; $i_nav++) {
	$navPages[$i_nav]['name'] = "Page ".$i_nav;
	$navPages[$i_nav]['href'] = makeGalleryUrl($albumName, "", "page=$i_nav");
}

//--
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

//-- the breadcrumb info ---
$breadCount = 0;
if (strcmp($gallery->album->fields["returnto"], "no")) {
    $breadCount++;
    $breadLevels[$breadCount]['level'] = "Gallery";
    $breadLevels[$breadCount]['name'] = $gallery->app->galleryTitle;
    $breadLevels[$breadCount]['href'] = makeGalleryUrl();
    $pAlbumName = $gallery->album->fields['parentAlbumName'];
	while ($pAlbumName) {
		$pAlbum = $albumDB->getAlbumByName($pAlbumName);
		$breadCount++;
    	$breadLevels[$breadCount]['level'] = "Album";
    	$breadLevels[$breadCount]['name'] = $pAlbum->fields['title'];
    	$breadLevels[$breadCount]['href'] = makeGalleryUrl($pAlbumName);
		$pAlbumName = $pAlbum->fields['parentAlbumName'];
	}
}
//-- XXX - I think we should add current page to breadcrumb ---
//$breadCount++;
//$breadLevels[$breadCount]['level'] = "Album";
//$breadLevels[$breadCount]['name'] = $gallery->album->fields["title"];
//$breadLevels[$breadCount]['href'] = makeGalleryUrl($gallery->session->albumName, "", "page=$page");

//-- set up the command structure ---
$commands = Array();
$commandCount = 0;
if (1) {
    $commandCount++;
    $commands[$commandCount]['name'] = "Dummy Command";
    $commands[$commandCount]['action'] = popup("xxx.php?index=$index");
}   

//-- some javascript for the body required to interact with the add photo windows ---
$pageBodyExtra = "\n"
	. "<script language=\"javascript1.2\"> \n"
    . "// <!-- \n"
    . "  var statusWin; \n"
    . "  function showProgress() { \n"
    . "    statusWin = ". popup_status("progress_uploading.php"). " \n"
    . "  } \n"

    . "  function hideProgress() { \n"
    . "    if (typeof(statusWin) != \"undefined\") { \n"
    . "        statusWin.close(); \n"
    . "        statusWin = void(0); \n"
    . "    } \n"
    . "  } \n"

    . "  function hideProgressAndReload() { \n"
    . "    hideProgress(); \n"
    . "    document.location.reload(); \n"
    . "  } \n"
    . "// --> \n"
    . "</script> \n";

//-- Load up the AlbumItem array ---
$itemIds = $gallery->album->getIds($gallery->user->canWriteToAlbum($gallery->album));
$i = 0;
$to_skip = 0;
foreach ($itemIds as $itemId) {
	//-- skip the images from previous pages ---
	if ($to_skip++ < ($perPage * ($page - 1))) {
		continue;
	}

	$i++;
	$items[$i]['id'] = $itemId;

    $index = $gallery->album->getPhotoIndex($itemId);
	$items[$i]['index'] = $index;

	if (!$gallery->album->isMovie($itemId)) {
		$photoHref = makeGalleryUrl($gallery->session->albumName, $itemId);
	} else {
	    //-- XXX - if a movie, slip in the target ---
	    $photoHref = $gallery->album->getPhotoPath($index)."\" target=\"other";
	}
	$items[$i]['href'] = $photoHref;

    if ($gallery->album->isMovie($itemId)) { 
		$itemType = "movie";
	} else if ($gallery->album->isAlbumName($index)) {
		$itemType = "album";
	} else {
		$itemType= "photo";
	}
	$items[$i]['type'] = $itemType;
    $items[$i]['thumbnailTag'] = $gallery->album->getThumbnailTag($index);
	$items[$i]['thumbnailUrl'] = "";

}


//-------------------------------------------------------------------------
//-- The Gallery Layout Object ---
//
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
$GLO['album']['thumbSize'] = $gallery->album->fields["thumb_size"];
$GLO['album']['rows'] = $rows;
$GLO['album']['cols'] = $cols;

$GLO['album']['items'] = $items;

$GLO['borderColor'] = $borderColor;



//-- the 'boxTools' is the stuff that goes in the tool block ---
$GLO['toolbox']['commands'] = $commands;

//-- the 'boxBreadcrumb' is the stuff that goes in the breadcrums block ---
$GLO['breadcrumb']['levels'] = $breadLevels;

//-- the 'boxNavigation' is the stuff that goes in the navigation block ---
$GLO['navigator']['pages'] = $navPages;
$GLO['navigator']['pageNumber'] = $page;
$GLO['navigator']['pageLabel'] = "Pages";

//-- special stuff ---
$GLO['page']['body']['extra'] = $pageBodyExtra;
$GLO['page']['bodyTag']['extra'] = $pageBodyTagExtra;
$GLO['page']['head']['extra'] = $pageHeadExtra;

//-- some extra useful stuff ---
$GLO['pixelImage'] = "<img src=\"" . $gallery->app->photoAlbumURL .
                     "/images/pixel_trans.gif\" width=\"1\" height=\"1\">";
$GLO['galleryProject']['anchor'] = "<a href=\"".$gallery->url."\">".
                                 "Gallery v" . $gallery->version . "</a>";

//-------------------------------------------------------------------------
//-- The Layout of the Page ---
//  
includeHtmlWrap("wrapper.header");
includeLayout("view_album", $GLO);
includeHtmlWrap("wrapper.footer");


?>



