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
<?
global $GALLERY_BASEDIR;
global $GALLERY_EMBEDDED_INSIDE;
global $GALLERY_MODULENAME;
global $op;
global $name;
global $include;

/* Detect PHP-Nuke and react accordingly */
if (!strcmp($op, "modload")) {

	/* 
	 * Change this variable if your Gallery module has a different
	 * name in the Nuke modules directory.
	 */
	$GALLERY_MODULENAME = $name;
	$GALLERY_BASEDIR = "modules/$GALLERY_MODULENAME/";
	$GALLERY_EMBEDDED_INSIDE = "nuke";

	if (!$include) {
		$include = "view_album.php";
	}

	/*
	 * As a security precaution, only allow allow one of the following files to be included.
	 * If you want Gallery to allow you to include other files (such as the random photo block)
	 * then you need to add the name of the file including any relevant path components to this
	 * array.
	 */
	$safe_to_include =
		 array(
		       "albums.php",
		       "view_photo.php",
		       "view_album.php",
		       );
	
	if (!in_array($include, $safe_to_include)) {
	    print "Security error!  The file you tried to include ";
	    print "is not on the <b>approved file list</b>.  To include ";
	    print "this file you must edit Gallery's index.php ";
	    print "and add <b>$include</b> to the <i>\$safe_to_include</i> ";
	    print "array.";
	    exit;
	}

	include(${GALLERY_BASEDIR} . $include);
} else {
	include("view_album.php");
}
?>
