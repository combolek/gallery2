<?
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2001 Bharat Mediratta
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

// Hack prevention.
if (!empty($HTTP_GET_VARS["GALLERY_BASEDIR"]) ||
		!empty($HTTP_POST_VARS["GALLERY_BASEDIR"]) ||
		!empty($HTTP_COOKIE_VARS["GALLERY_BASEDIR"])) {
	print "Security violation\n";
	exit;
}

require($GALLERY_BASEDIR . "init.php");

//-------------------------------------------------------------------------
//-- The Business section ---
//

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

if (!$page) {
    $page = 1;
}

//-- increment album click counter ---
if (!$viewedAlbum[$albumName]) {
    setcookie("viewedAlbum[$albumName]","1");
    $album->incrementClicks();
}

//-- some stuff for nav ---
$rows = $album->fields["rows"];
$cols = $album->fields["cols"];
$numPhotos = $album->numPhotos($user->canWriteToAlbum($album));
$perPage = $rows * $cols;
$maxPages = max(ceil($numPhotos / $perPage), 1);

if ($page > $maxPages) {
    $page = $maxPages;
}

for ($i_nav=1; $i_nav<=$maxPages; $i_nav++) {
	$navPages[$i_nav]['name'] = "Page ".$i_nav;
	$navPages[$i_nav]['href'] = makeAlbumUrl($albumName, "", array("page" => $i_nav));
}

//--
$borderColor = $album->fields["bordercolor"];
$borderWidth = $album->fields["border"];
if (!strcmp($borderWidth, "off")) {
    $borderWidth = 1;
}

$thisUrl = makeAlbumUrl($albumName, "", array('page' => $page));

//-- setup the album specific style sheet ---
$albumStyle = "<style type=\"text/css\">\n";
if ($album->fields["linkcolor"]) {
    $albumStyle .=
        "  A:link, A:visited, A:active\n" .
        "    { color: ".$album->fields[linkcolor]."; }\n" .
        "  A:hover\n" .
        "    { color: #ff6600; }\n";
}
if ($album->fields["bgcolor"]) {
    $albumStyle .=
        "  BODY { background-color:".$album->fields[bgcolor]."; }\n";
}
if ($album->fields["background"]) {
    $albumStyle .=
        "  BODY { background-image:url(".$album->fields[background].") ; }\n";
}
if ($album->fields["textcolor"]) {
    $albumStyle .=
        "  BODY, TD {color:".$album->fields[textcolor]."; }\n" .
        "  .head {color:".$album->fields[textcolor]."; }\n" .
        "  .headbox {background-color:".$album->fields[bgcolor]."; }\n";
}
$albumStyle .= "</style>\n";

//-- the breadcrumb info ---
$breadCount = 0;
$pAlbum = $album;
do {
	if (!strcmp($pAlbum->fields["returnto"], "no")) {
		break;
	}
	$pAlbumName = $pAlbum->fields['parentAlbumName'];
   	if ($pAlbumName) {
		$pAlbum = new Album();
		$pAlbum->load($pAlbumName);
		$breadLevels[$breadCount]['level'] = "Album";
   		$breadLevels[$breadCount]['name'] = $pAlbum->fields['title'];
   		$breadLevels[$breadCount]['href'] = makeAlbumUrl($pAlbumName);
	} else {
		//-- we're at the top! ---
    	$breadLevels[$breadCount]['level'] = "Gallery";
    	$breadLevels[$breadCount]['name'] = $gallery->app->galleryTitle;
	    $breadLevels[$breadCount]['href'] = makeGalleryUrl("albums.php");
	}
	$breadCount++;
	if ($pAlbum) {
	}
} while ($pAlbumName);

//-- we built the array backwards, so reverse it now ---
//-- XXX we have to zero-index this array to make it work ---
$breadLevels = array_reverse($breadLevels, false);

//-- XXX - I think we should add current page to breadcrumb ---
//$breadCount++;
//$breadLevels[$breadCount]['level'] = "Album";
//$breadLevels[$breadCount]['name'] = $album->fields["title"];
//$breadLevels[$breadCount]['href'] = $thisUrl;

//-- set up the command structure ---
$commands = Array();
if ($user->canEditAlbum($album)) {
	$name = "album_edit";
	$commands[$name]['title'] = "Edit Album";
	$commands[$name]['href'] = makeGalleryUrl("edit.php?type=album&id=".$albumName."&return=".urlencode($thisUrl));

	if ($user->canAddToAlbum($myAlbum)) {
		$name = "add_items";
		$commands[$name]['title'] = "Add Items";
		$commands[$name]['href'] = makeGalleryUrl("album_add_items.php?return=".urlencode($thisUrl));
	}
	if ($user->canAddToAlbum($myAlbum)) {
		$name = "add_album";
		$commands[$name]['title'] = "Add Album";
		$commands[$name]['href'] = makeGalleryUrl("album_add_album.php?return=".urlencode($thisUrl));
	}

}
if (!$GALLERY_EMBEDDED_INSIDE) {
	if ($user->isLoggedIn()) {
    	$name = "user_logout";
    	$commands[$name]['title'] = "Logout";
    	$commands[$name]['href'] = 
			doCommand("logout", "", "view_album.php", array("page" => $page));
	} else {
    	$name = "user_login";
    	$commands[$name]['title'] = "Login";
    	$commands[$name]['href'] = makeGalleryUrl("login.php", array('return' => urlencode($thisUrl)));
	}
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
$firstItem = $perPage * ($page - 1);
$itemIds = $album->getIds($user, 0, $firstItem, $perPage);
$i = 0;
foreach ($itemIds as $itemId) {

	$i++;
	$iCommands = Array();

	$items[$i]['id'] = $itemId;

    $index = $album->getPhotoIndex($itemId);
	$items[$i]['index'] = $index;
	$items[$i]['hidden'] = $album->isHidden($index);

	$items[$i]['thumbnail']['url'] = $album->getThumbnailPath($index);

	$item = $album->getPhoto($index);
	$thumbnailImage = $album->getThumbnailImage($index);

	if ($thumbnailImage) {
		list($w, $h) = $thumbnailImage->getScaledDimensions($album->fields["thumb_size"]);
		$items[$i]['thumbnail']['width'] = $w;
		$items[$i]['thumbnail']['height'] = $h;
	}

    if ($album->isMovie($itemId)) { 
		$items[$i]['type'] = 'movie';
		$items[$i]['href'] = $album->getPhotoPath($index)."\" target=\"other"; 
	} else if ($album->isAlbumName($index)) {
		$items[$i]['type'] = 'album';
		$myAlbum = new Album();
		$myAlbum->load($album->isAlbumName($index));
		$items[$i]['itemCount'] = $myAlbum->numPhotos($user->canWriteToAlbum($myAlbum));
		$items[$i]['href'] = makeAlbumUrl($myAlbum->fields['name']);
		$items[$i]['title'] = $myAlbum->fields[title];
		$items[$i]['description'] = $myAlbum->fields[description];
		$items[$i]['dateChanged'] = $myAlbum->getLastModificationDate();
		$items[$i]['clickCount'] = $myAlbum->getClicks();
		$items[$i]['clickCountText'] = "Viewed: " . pluralize($myAlbum->getClicks(), "time", "0");
		$items[$i]['itemCountText'] = "Contains: " . pluralize($items[$i]['itemCount'], item, "no");

		//-- the album commands ---
		if ($user->canEditAlbum($myAlbum)) {
			$name = "album_edit";
			$iCommands[$name]['title'] = "Edit Album";
			$iCommands[$name]['href'] = makeGalleryUrl("edit.php?type=album&id=".$myAlbum->fields['name']."&return=".urlencode($thisUrl));
		}

	} else {
		$items[$i]['type'] = 'photo';
		$items[$i]['href'] = makeAlbumUrl($albumName, $itemId);
		$items[$i]['caption'] = $album->getCaption($index);
		$items[$i]['commentCount'] = 
			((!strcmp($album->fields["public_comments"], "yes"))) ? 
			$album->numComments($index) : 0;
		$items[$i]['clickCount'] = $album->getItemClicks($index);
		$items[$i]['clickCountText'] = "Viewed: " . pluralize($album->getItemClicks($index), "time", "0");

		//-- the photo commands ---
		if ($user->canEditItemsInAlbum($album)) {
			$name = "item_edit";
			$iCommands[$name]['title'] = "Edit Photo";
			$iCommands[$name]['href'] = makeGalleryUrl("edit.php?type=item&id=".$itemId."&return=".urlencode($thisUrl));
		}
	}

	$items[$i]['commands'] = $iCommands;
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
$GLO['album']['title'] = $album->fields['title'];
$GLO['album']['url'] = makeAlbumUrl($albumName);
$GLO['album']['name'] = $albumName;
$GLO['album']['styleSheetInclude'] = $albumStyle;
$GLO['album']['borderSize'] = $borderWidth;
$GLO['album']['thumbnailSize'] = $album->fields["thumb_size"];
$GLO['album']['rows'] = $rows;
$GLO['album']['cols'] = $cols;
$GLO['album']['displayClicks'] = !(strcmp($album->fields["display_clicks"] , "yes"));

$GLO['album']['items'] = $items;

$GLO['borderColor'] = $borderColor;

$GLO['album']['html_header'] = $album->fields['html_header'];
$GLO['album']['html_footer'] = $album->fields['html_footer'];


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

//-- some extra useful stuff ---
$GLO['pixelImage'] = "<img src=\"" . $gallery->app->photoAlbumURL .
                     "/images/pixel_trans.gif\" width=\"1\" height=\"1\">";

//-------------------------------------------------------------------------
//-- The Layout of the Page ---
//  

//-- first get the html for the header and footer and stick it in the GLO
//-- for use by the layout. The html_wrap template gets is own limited
//-- layout object.
$G['TITLE'] = $gallery->app->galleryTitle . "::" . $album->fields['title'];
$G['HEAD']['EXTRA'] = $pageHeadExtra;
$G['HEAD']['STYLESHEET_INCLUDE'] = getStyleSheetLink() . "\n" . $albumStyle;
$G['BODYTAG']['EXTRA'] = $pageBodyTagExtra;
$G['GALLERY_PROJECT']['HREF'] = $gallery->url;
$G['GALLERY_PROJECT']['VERSION'] = $gallery->version;
$G['PIXEL_IMAGE'] = $GLO['pixelImage'];

list($GLO['header'], $GLO['footer']) = getLayoutWrapHeaderFooter($G);

//-- now do the layout, wrapped by the embed logic ---
includeHtmlWrap("wrapper.header");
includeLayout("view_album");
includeHtmlWrap("wrapper.footer");


?>



