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
$fitToWindow = !strcmp($gallery->album->fields["fit_to_window"], "yes") && 
			!$gallery->album->isResized($index) && !$full;
if ($fitToWindow && !$GALLERY_EMBEDDED_INSIDE) { 
	$photoTag = "\n"
		. "<script language=\"javascript1.2\"> \n"
		. "  // <!-- \n"
		. "  fitToWindow(); \n"
		. "  // --> \n"
		. "</script><noscript>$photoTag</noscript>";

    $pageHeadExtra .= "\n" 
		. "<script language=\"javascript1.2\"> \n"
		. "// <!-- \n"
		. "function fitToWindow(do_resize) { \n"
		. "    var changed = 0; \n"
    	. "    var heightMargin = 160; \n"
		. "    var widthMargin = 40; \n"
		. "    var imageHeight = $imageHeight; \n"
		. "    var imageWidth = $imageWidth; \n"
		. "    var aspect = imageHeight / imageWidth; \n"

		. "    // Get the window dimensions height.  IE and Nav use different techniques. \n"
		. "    var windowWidth, windowHeight; \n"
		. "    if (typeof(window.innerWidth) == \"number\") { \n"
		. "        windowWidth = window.innerWidth; \n"
		. "        windowHeight = window.innerHeight; \n"
        . "    } else { \n"
        . "        windowWidth = document.body.clientWidth; \n"
        . "        windowHeight = document.body.clientHeight; \n"
        . "    } \n"

        . "    // Leave a gutter around the edges \n"
        . "    windowWidth = windowWidth - widthMargin; \n"
        . "    windowHeight = windowHeight - heightMargin; \n"

        . "    var diffx = windowWidth - imageWidth, \n"
        . "        diffy = windowHeight - imageHeight; \n"

        . "    if (diffx < 0 || diffy < 0) { \n"
        . "        if (diffx < diffy) { \n"
        . "        imageWidth = windowWidth; \n"
        . "        imageHeight = aspect * imageWidth; \n"
        . "        changed = 1; \n"
        . "        } else { \n"
        . "        imageHeight = windowHeight; \n"
        . "        imageWidth = imageHeight / aspect; \n"
        . "        changed = 1; \n"
        . "        } \n"
        . "    } \n"

        . "    if (do_resize) { \n"
        . "        var img = document.images.photo; \n"
        . "        img.height = imageHeight; \n"
        . "        img.width = imageWidth; \n"
        . "    } else { \n"
        . "        if (changed) { \n"
        . "            document.write('<a href=\"".makeGalleryUrl($gallery->session->albumName, $id, "&full=1")."\">'); \n"
        . "        } \n"
        . "        document.write('<img name=photo src=\"$photoUrl\" border=0 width=' + \n"
        . "                         imageWidth + ' height=' + imageHeight + '>'); \n"
        . "        if (changed) { \n"
        . "            document.write('</a>'); \n"
        . "        } \n"
        . "    } \n"
        . "} \n"

        . "function doResize() { \n"
        . "    if (document.all) { \n"
        . "        // We're in IE where we can just resize the image. \n"
        . "        fitToWindow(true); \n"
        . "    } else { \n"
        . "        // In Netscape we've got to reload the page. \n"
        . "        document.reload(); \n"
        . "    } \n"
        . "} \n"
		. "// --> \n"
		. "</script> \n";

	$pageBodyTagExtra .= "onResize='doResize()'";
}

$numPhotos = $gallery->album->numPhotos($gallery->user->canWriteToAlbum($gallery->album));
$next = $index+1;
if ($next > $numPhotos) {
	$last = 1;
}
$prev = $index-1;
if ($prev <= 0) {
	$first = 1;
}

if ($index > $gallery->album->numPhotos(1)) {
	$index = $numPhotos;
}

//-- calculate the page we're on (for the breadcrumb) ---
$page = ceil($index / ($gallery->album->fields["rows"] * $gallery->album->fields["cols"]));

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

//-- set up the command structure ---
$commands = Array();
$commandCount = 0;
if ($gallery->user->canChangeTextOfAlbum($gallery->album)) {
	$commandCount++;
	$commands[$commandCount]['name'] = "Edit Info";
	$commands[$commandCount]['action'] = popup("edit_caption.php?index=$index");
}
if (!strcmp($gallery->album->fields["public_comments"], "yes")) {
	$commandCount++;
	$commands[$commandCount]['name'] = "Add Comment";
	$commands[$commandCount]['action'] = popup("add_comment.php?index=$index");
}
if (!$gallery->album->isMovie($id)) {
    if ($gallery->user->canWriteToAlbum($gallery->album)) {
		$commandCount++;
		$commands[$commandCount]['name'] = "Resize Photo";
		$commands[$commandCount]['action'] = popup("resize_photo.php?index=$index");
    }

    if ($gallery->user->canDeleteFromAlbum($gallery->album)) {
		$commandCount++;
		$commands[$commandCount]['name'] = "Delete Photo";
		$commands[$commandCount]['action'] = popup("delete_photo.php?index=$index");
    }

    if (!strcmp($gallery->album->fields["use_fullOnly"], "yes")) {
		$commandCount++;
		$commands[$commandCount]['name'] = "View Images " .
			(strcmp($gallery->session->fullOnly,"on") ? "Full" : "Normal");
		$commands[$commandCount]['action'] = doCommand("", "set_fullOnly=" .
			(strcmp($gallery->session->fullOnly,"on") ? "on" : "off"), 
			"view_photo.php", "id=$id");

	}
   
    if (!strcmp($gallery->album->fields["use_exif"],"yes") && (!strcmp($image->type,"jpg")) &&
        ($gallery->app->use_exif)) {
		$commandCount++;
		$commands[$commandCount]['name'] = "Photo Properties";
		$commands[$commandCount]['action'] = popup("view_photo_properties.php?index=$index");
    }


    if (strcmp($gallery->album->fields["print_photos"],"none")) {
		$commandCount++;
		$commands[$commandCount]['name'] = "Print on Shutterfly";
		$commands[$commandCount]['action'] = "document.sflyc4p.returl.value=document.location; document.sflyc4p.submit()";

		//-- build the shutterfly form ---
		$hostname = $GLOBALS["SERVER_NAME"];
		$protocol = "http";
		$photoPath = $protocol . "://" . $hostname . $gallery->album->getAlbumDirURL();
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
$navIds = $gallery->album->getIds($gallery->user);
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
	$navPages[$i_nav]['href'] = makeGalleryUrl($gallery->session->albumName, $navId); 
	$i_nav++;
}

//-- the breadcrumb info ---
$breadCount = 0;
$breadLevels[$breadCount]['level'] = "Album";
$breadLevels[$breadCount]['name'] = $gallery->album->fields["title"];
$breadLevels[$breadCount]['href'] = makeGalleryUrl($gallery->session->albumName, "", "page=$page");
$breadCount++;
$pAlbum = $gallery->album;
do {
    if (!strcmp($pAlbum->fields["returnto"], "no")) {
        break;
    }   
    $pAlbumName = $pAlbum->fields['parentAlbumName'];
    if ($pAlbumName) {
        $pAlbum = $albumDB->getAlbumByName($pAlbumName);
        $breadLevels[$breadCount]['level'] = "Album";
        $breadLevels[$breadCount]['name'] = $pAlbum->fields['title'];
        $breadLevels[$breadCount]['href'] = makeGalleryUrl($pAlbumName);
    } else { 
        //-- we're at the top! ---
        $breadLevels[$breadCount]['level'] = "Gallery";
        $breadLevels[$breadCount]['name'] = $gallery->app->galleryTitle;
        $breadLevels[$breadCount]['href'] = makeGalleryUrl();
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
if (!strcmp($gallery->album->fields["public_comments"], "yes")) {
	$publicCommentCount = $gallery->album->numComments($index);
	for ($i=1; $i <= $publicCommentCount; $i++) {
		$comment = $gallery->album->getComment($index, $i);
		$publicComments[$i]['text'] = $comment->getCommentText();
		$publicComments[$i]['IPNumber'] = $comment->getIPNumber();
		$publicComments[$i]['datePosted'] = $comment->getDatePosted();
		$publicComments[$i]['name'] = $comment->getName();
		$publicComments[$i]['UID'] = $comment->getUID();
		if ($gallery->user->canWriteToAlbum($gallery->album)) {
			$url = "do_command.php?cmd=delete-comment&index=$index&comment_index=$i";
			$publicComments[$i]['remove'] = 
				'<a href="#" onClick="' . popup($url) . '">[remove]</a>';
		}
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
includeHtmlWrap("wrapper.header");
includeLayout("view_item", $GLO);
includeHtmlWrap("wrapper.footer");


