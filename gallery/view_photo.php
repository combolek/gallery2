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
	$gallery->session->albumName = "";
	header("Location: view_album.php");
	return;
}

//-- The AlbumItem ID --- 
if ($id) {
	$index = $album->getPhotoIndex($id);
	if ($index == -1) {
		// That photo no longer exists. Go back to the album 
		header("Location: " . $gallery->app->photoAlbumURL . 
			"/" . $albumName);
		return;
	}
} else {
	// We must have an index
	$id = $album->getPhotoId($index);
}

//-- Increment the clickCount for this AlbumItem --- 
if (!$viewedItem[$albumName][$id]) {
	setcookie("viewedItem[$albumName][$id]", "1");
	$album->incrementItemClicks($index);
}

$photo = $album->getPhoto($index);
if ($photo->isMovie()) {
	$image = $photo->thumbnail;
} else {
	$image = $photo->image;
}
list($imageWidth, $imageHeight) = $image->getDimensions();

$do_fullOnly = !strcmp($gallery->session->fullOnly,"on") &&
               !strcmp($album->fields["use_fullOnly"],"yes");
if ($do_fullOnly) {
	$full = 1;
}

$photoURL = $album->getPhotoPath($index, $full);

if (!$album->isMovie($id)) {
	if ($album->isResized($index) && !$do_fullOnly) { 
		if (!$full) {
			$photoHref = makeAlbumUrl($albumName, $id, array("full" => 1));
		} else {
			$photoHref = makeAlbumUrl($albumName, $id);
		}
	}
} else {
	//-- XXX - if a movie, slip in the target ---
	$photoHref = $album->getPhotoPath($index)."\" target=\"other";
}

$numPhotos = $album->numPhotos($user->canWriteToAlbum($album));
$next = $index+1;
if ($next > $numPhotos) {
	$last = 1;
}
$prev = $index-1;
if ($prev <= 0) {
	$first = 1;
}

if ($index > $album->numPhotos(1)) {
	$index = $numPhotos;
}

//-- calculate the page we're on (for the breadcrumb) ---
$page = ceil($index / ($album->fields["rows"] * $album->fields["cols"]));

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

if (!strcmp($album->fields["resize_size"], "off")) {
	$mainWidth = imageWidth;
} else {
	$mainWidth = $album->fields["resize_size"];
}
$mainWidth += (borderWidth * 2);

//-- set up the command structure ---
$commands = Array();
$name = "item_edit";
$commands[$name]['title'] = "Edit";
$returnFromEdit = urlencode(makeAlbumUrl($albumName, $id));
$commands[$name]['href'] = makeGalleryUrl("edit.php?type=item&id=$id&return=$returnFromEdit");
if (!strcmp($album->fields["public_comments"], "yes")) {
	$name = "item_add_comment";
	$commands[$name]['title'] = "Add Comment";
	$commands[$name]['href'] = makeGalleryUrl("add_comment.php?index=$index");
}
if (!$album->isMovie($id)) {

    if (!strcmp($album->fields["use_fullOnly"], "yes")) {
		$name = "photo_view_toggle";
		$commands[$name]['title'] = "View Images " .
			(strcmp($gallery->session->fullOnly,"on") ? "Full" : "Normal");
		$commands[$name]['href'] = doCommand("", array("set_fullOnly" =>
			(strcmp($gallery->session->fullOnly,"on") ? "on" : "off")), 
			"view_photo.php", array("id" => $id));

	}
   
    if (!strcmp($album->fields["use_exif"],"yes") && (!strcmp($image->type,"jpg")) &&
        ($gallery->app->use_exif)) {
		$name = "photo_properties";
		$commands[$name]['title'] = "Properties";
		$commands[$name]['href'] = makeGalleryUrl("view_photo_properties.php?index=$index");
    }


    if (!strcmp($album->fields["print_photos"],"shutterfly")) {
		$name = "photo_print_shutterfly";
		$commands[$name]['title'] = "Print on Shutterfly";
		$commands[$name]['action'] = "document.sflyc4p.returl.value=document.location; document.sflyc4p.submit()";

		//-- build the shutterfly form ---
		$hostname = $GLOBALS["SERVER_NAME"];
		$protocol = "http";
		$photoPath = $protocol . "://" . $hostname . $album->getAlbumDirURL("full");
		$rawImageURL = $photoPath . "/" . $image->name . "." . $image->type;

		$thumbImageURL = $photoPath . "/";
		if ($image->resizedName) {
			$thumbImageURL .= $image->resizedName . "." . $image->type;
		} else {
			$thumbImageURL .= $image->name . "." . $image->type;
		}
		list($rawWidth, $rawHeight) = $image->getRawDimensions();

        $pageBodyExtra .= "<form name=\"sflyc4p\" action=\"http://www.shutterfly.com/c4p/UpdateCart.jsp\" method=\"post\">\n"
			. "  <input type=hidden name=addim value=\"1\">\n"
            . "  <input type=hidden name=protocol value=\"SFP,100\">\n"
            . "  <input type=hidden name=pid value=\"C4P\">\n"
            . "  <input type=hidden name=psid value=\"AFFL\">\n"
            . "  <input type=hidden name=referid value=\"jackodog\">\n"
            . "  <input type=hidden name=returl value=\"this-gets-set-by-javascript-in-onClick\">\n"
            . "  <input type=hidden name=imraw-1 value=\"$rawImageURL\">\n"
            . "  <input type=hidden name=imrawheight-1 value=\"$rawHeight\">\n"
            . "  <input type=hidden name=imrawwidth-1 value=\"$rawWidth\">\n"
            . "  <input type=hidden name=imthumb-1 value=\"$thumbImageURL\">\n"
            . "  <input type=hidden name=imbkprntb-1 value=\"Hi\">\n"
            . "</form>\n";
    }
}


//-- The page navigation info ---
$navIds = $album->getIds($user, 1);
$navPageCount = sizeof($navIds);
$navPage = $navPageCount;
while ($navPage > 0) { // looking for the index among the 'visible' items
    if (!strcmp($navIds[$navPage], $id)) {
        break;
    }
    $navPage--;
}
$i_nav = 1; // pages are 1 based
foreach ($navIds as $navId) {
	$navPages[$i_nav]['name'] = $navId;
	$navPages[$i_nav]['href'] = makeAlbumUrl($albumName, $navId); 
	$i_nav++;
}

//-- the breadcrumb info ---
$breadCount = 0;
$breadLevels[$breadCount]['level'] = "Album";
$breadLevels[$breadCount]['name'] = $album->fields["title"];
$breadLevels[$breadCount]['href'] = makeAlbumUrl($albumName, "", array("page" => $page));
$breadCount++;
$pAlbum = $album;
do {
    if (!strcmp($pAlbum->fields["returnto"], "no")) {
        break;
    }   
    $pAlbumName = $pAlbum->fields['parentAlbumName'];
    if ($pAlbumName) {
	$pAlbum = new Album($pAlbumName);
        $breadLevels[$breadCount]['level'] = "Album";
        $breadLevels[$breadCount]['name'] = $pAlbum->fields['title'];
        $breadLevels[$breadCount]['href'] = makeAlbumUrl($pAlbumName);
    } else { 
        //-- we're at the top! ---
        $breadLevels[$breadCount]['level'] = "Gallery";
        $breadLevels[$breadCount]['name'] = $gallery->app->galleryTitle;
        $breadLevels[$breadCount]['href'] = makeAlbumUrl();
    }
    $breadCount++;
    if ($pAlbum) {
    }
} while ($pAlbumName);

//-- we built the array backwards, so reverse it now ---
//-- XXX we have to zero-index this array to make it work ---
$breadLevels = array_reverse($breadLevels, false);

//-- XXX - I think we should add current page to breadcrumb??? ---
//$breadCount++;
//$breadLevels[$breadCount]['level'] = "";
//$breadLevels[$breadCount]['name'] = $gallery->app->galleryTitle;
//$breadLevels[$breadCount]['href'] = makeGalleryUrl();

//-- Public comments for this photo ---
if (!strcmp($album->fields["public_comments"], "yes")) {
	$publicCommentCount = $album->numComments($index);
	for ($i=1; $i <= $publicCommentCount; $i++) {
		$comment = $album->getComment($index, $i);
		$publicComments[$i]['text'] = $comment->getCommentText();
		$publicComments[$i]['IPNumber'] = $comment->getIPNumber();
		$publicComments[$i]['datePosted'] = $comment->getDatePosted();
		$publicComments[$i]['name'] = $comment->getName();
		$publicComments[$i]['UID'] = $comment->getUID();
	}
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
$GLO['borderColor'] = $borderColor;

//-- the 'item' is the focus of this page ---
$GLO['item']['id'] = $id;
$GLO['item']['index'] = $index;
$GLO['item']['caption'] = $album->getCaption($index);
 
//-- the 'image' is the image that represents the 'item' ---
$GLO['image']['width'] = $imageWidth;
$GLO['image']['height'] = $imageHeight;
$GLO['image']['tableWidth'] = $mainWidth;
$GLO['image']['url'] = $photoURL;
$GLO['image']['tag'] = $photoTag;
$GLO['image']['href'] = $photoHref;

//-- the 'boxTools' is the stuff that goes in the tool block ---
$GLO['toolbox']['commands'] = $commands;

//-- the 'boxBreadcrumb' is the stuff that goes in the breadcrums block ---
$GLO['breadcrumb']['levels'] = $breadLevels;

//-- the 'boxNavigation' is the stuff that goes in the navigation block ---
$GLO['navigator']['pages'] = $navPages;
$GLO['navigator']['pageNumber'] = $navPage + 1; // 1 based
$GLO['navigator']['pageLabel'] = "Items";

$GLO['publicComments'] = $publicComments;

//-- info...what to call this? ---
$GLO['info'] = "no info";

//-- special stuff ---
$GLO['page']['body']['extra'] = $pageBodyExtra;
$GLO['page']['bodyTag']['extra'] = $pageBodyTagExtra;
$GLO['page']['head']['extra'] = $pageHeadExtra;

//-- the 'layout' relevant info ---
$GLO['layout']['dir'] = $GLO['gallery']['url'] . "/" . getLayoutFile(""); 

//-- some axtra useful stuff ---
$GLO['pixelImage'] = "<img src=\"" . $gallery->app->photoAlbumURL .
                     "/images/pixel_trans.gif\" width=\"1\" height=\"1\">";
$GLO['galleryProject']['anchor'] = "<a href=\"".$gallery->url."\">".
                                 "Gallery v" . $gallery->version . "</a>";

//-------------------------------------------------------------------------
//-- The Layout of the Page ---
//         

//-- first get the html for the header and footer and stick it in the GLO
//-- for use by the layout. The html_wrap template gets is own limited
//-- layout object.
$G['TITLE'] = $gallery->app->galleryTitle."::".$album->fields['title']."::".$id;
$G['HEAD']['EXTRA'] = $pageHeadExtra;
$G['HEAD']['STYLESHEET_INCLUDE'] = getStyleSheetLink() . "\n" . $albumStyle;
$G['BODYTAG']['EXTRA'] = $pageBodyTagExtra;
$G['GALLERY_PROJECT']['HREF'] = $gallery->url;
$G['GALLERY_PROJECT']['VERSION'] = $gallery->version;
$G['PIXEL_IMAGE'] = $GLO['pixelImage'];

list($GLO['header'], $GLO['footer']) = getLayoutWrapHeaderFooter($G);

//-- now do the layout, wrapped by the embed logic ---
includeHtmlWrap("wrapper.header");
includeLayout("view_item", $GLO);
includeHtmlWrap("wrapper.footer");

?>
