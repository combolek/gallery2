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

$albumDB = new AlbumDB();

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
		$pAlbum = $albumDB->getAlbumByName($pAlbumName);
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
//$breadLevels[$breadCount]['href'] = makeAlbumUrl($albumName, "", array("page" => $page));

//-- set up the command structure ---
$commands = Array();
$commandCount = 0;
if ($user->canAddToAlbum($album)) {
    $commandCount++;
    $commands[$commandCount]['name'] = "album_add_items";
    $commands[$commandCount]['title'] = "Add Items";
    $commands[$commandCount]['action'] = popup("add_photos.php?albumName=$albumName");
}   
if ($user->canCreateAlbums()) {
    $commandCount++;
    $commands[$commandCount]['name'] = "album_new_nested_album";
    $commands[$commandCount]['title'] = "New Album";
    $commands[$commandCount]['action'] = doCommand("new-album",
		array("parentName" => $albumName), "view_album.php");
}   
if ($user->canWriteToAlbum($album)) {
	if ($album->numPhotos(1)) {
    	$commandCount++;
    	$commands[$commandCount]['name'] = "album_sort";
    	$commands[$commandCount]['title'] = "Sort";
    	$commands[$commandCount]['action'] = popup("sort_album.php?albumName=$albumName");
    	$commandCount++;
    	$commands[$commandCount]['name'] = "album_resize_all";
    	$commands[$commandCount]['title'] = "Resize All";
    	$commands[$commandCount]['action'] = popup("resize_photo.php?albumName=$albumName");
    	$commandCount++;
    	$commands[$commandCount]['name'] = "album_rethumb_all";
    	$commands[$commandCount]['title'] = "Rethumb All";
		//-- XXX - popup do_command ??? huh??? ---
    	$commands[$commandCount]['action'] = 
			popup("do_command.php?cmd=remake-thumbnail&albumName=$albumName&index=all");
	
	}
    $commandCount++;
    $commands[$commandCount]['name'] = "album_properties";
    $commands[$commandCount]['title'] = "Properties";
    $commands[$commandCount]['action'] = popup("edit_appearance.php?albumName=$albumName");
	
}
if ($user->isAdmin() || $user->isOwnerOfAlbum($album)) {
    $commandCount++;
    $commands[$commandCount]['name'] = "album_permissions";
    $commands[$commandCount]['title'] = "Permissions";
    $commands[$commandCount]['action'] = popup("album_permissions.php?albumName=$albumName");
}   
if ($user->isLoggedIn()) {
    $commandCount++;
    $commands[$commandCount]['name'] = "user_logout";
    $commands[$commandCount]['title'] = "Logout";
    $commands[$commandCount]['action'] = doCommand("logout", "", "view_album.php", array("page" => $page));
} else {
    $commandCount++;
    $commands[$commandCount]['name'] = "user_login";
    $commands[$commandCount]['title'] = "Login";
    $commands[$commandCount]['action'] = popup("login.php");
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
$itemIds = $album->getIds($user, $firstItem, $perPage);
$i = 0;
foreach ($itemIds as $itemId) {

	$i++;
	$iCommands = Array();
	$icCount = 0;

	$items[$i]['id'] = $itemId;

    $index = $album->getPhotoIndex($itemId);
	$items[$i]['index'] = $index;
	$items[$i]['hidden'] = $album->isHidden($index);
	
	if (!$album->isMovie($itemId)) {
		$photoHref = makeAlbumUrl($gallery->session->albumName, $itemId);
	} else {
	    //-- XXX - if a movie, slip in the target ---
	    $photoHref = $album->getPhotoPath($index)."\" target=\"other";
	}
	$items[$i]['href'] = $photoHref;

	$items[$i]['thumbnail']['tag'] = 
		$album->getThumbnailTag($index, $album->fields["thumb_size"]);
	$items[$i]['thumbnail']['url'] = $album->getThumbnailPath($index);
    if ($album->isMovie($itemId)) { 
		$items[$i]['type'] = 'movie';
	} else if ($album->isAlbumName($index)) {
		$items[$i]['type'] = 'album';
		$myAlbum = $albumDB->getAlbumbyName($album->isAlbumName($index));
		$items[$i]['title'] = $myAlbum->fields[title];
		$items[$i]['description'] = $myAlbum->fields[description];
		$items[$i]['dateChanged'] = $myAlbum->getLastModificationDate();
		$items[$i]['clickCount'] = $myAlbum->getClicks();
		$items[$i]['clickCountText'] = "Viewed: " . pluralize($myAlbum->getClicks(), "time", "0");

		//-- the album commands ---
		if ($user->canChangeTextOfAlbum($myAlbum)) {
			$icCount++;
			$iCommands['name'] = "album_edit_info";
			$iCommands['title'] = "Edit Album Info";
			$iCommands['action'] = 
				popup("album_edit_info.php?albumName={$myAlbum->fields[name]}");
		}
		//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx HERE

	} else {
		$items[$i]['type'] = 'photo';
		$items[$i]['caption'] = $album->getCaption($index);
		$items[$i]['commentCount'] = 
			((!strcmp($album->fields["public_comments"], "yes"))) ? 
			$album->numComments($index) : 0;
		$items[$i]['clickCount'] = $album->getItemClicks($index);
		$items[$i]['clickCountText'] = "Viewed: " . pluralize($album->getItemClicks($index), "time", "0");
	}

	//-- the generic commands ---
	if ($user->canChangeTextOfAlbum($album)) {
		$icCount++;
		$iCommands['name'] = "";
		$iCommands['title'] = "Nuke Russia";
		$iCommands['action'] = popup("nuke_russia.php?albumName=$albumName");
	}
	$items[$i]['commandCount'] = $icCount;
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
$GLO['album']['url'] = $album->getAlbumDirURL();
$GLO['album']['name'] = $gallery->session->albumName;
$GLO['album']['styleSheetInclude'] = $albumStyle;
$GLO['album']['borderSize'] = $borderWidth;
$GLO['album']['thumbnailSize'] = $album->fields["thumb_size"];
$GLO['album']['rows'] = $rows;
$GLO['album']['cols'] = $cols;
$GLO['album']['displayClicks'] = !(strcmp($album->fields["display_clicks"] , "yes"));

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



