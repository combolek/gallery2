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
?>
<? require($GALLERY_BASEDIR . "init.php"); ?>
<?

$albumName = $gallery->session->albumName;
$album = $gallery->album;
$user = $gallery->user;

if ($user->canCreateAlbums()) {
	$albumDB = new AlbumDB();
	$newAlbum = new Album();
	$newAlbum->fields["name"] = $albumDB->newAlbumName();
	$newAlbum->setOwner($user->getUid());
	$newAlbum->save();

	$newAlbum->fields[parentAlbumName] = $albumName;
	$album->addNestedAlbum($newAlbum->fields["name"]);
	$album->save();

	// Set default values in nested album to match settings of parent.
	$inheritFields = array( 
		"perms",
		"bgcolor",
		"bgcolor2",
		"textcolor",
		"linkcolor",
		"font",
		"border",
		"bordercolor",
		"thumb_size",
		"resize_size",
		"rows",
		"cols",
		"fit_to_window",
		"use_fullOnly",
		"print_photos",
		"use_exif",
		"display_clicks",
		"public_comments",
		"layout",
		"html_header",
		"html_footer"
	);
	foreach ($inheritFields as $iField) {
		$newAlbum->fields[$iField] = $album->fields[$iField];
	}
	$newAlbum->save();
}
	
header("Location: view_album.php");

?>
