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

require($GALLERY_BASEDIR . "layout_util/xtpl/xtemplate.inc");

//-----------------------------------------------------------------------------
function includeLayout($name, $GLO) {
        
	// define these globals to make them available to layouts
	global $gallery;
	global $GLO;
    include (getLayoutFile("$name.inc"));
    
	return 1;
}   

//-----------------------------------------------------------------------------
function getLayoutFile($name) {
	global $gallery;

    $LAYOUT_DIR_NAME = "layout/";
	//$layout = $gallery->layout;
	$layout = "default";

	$layoutDir =  $GALLERY_BASEDIR . $LAYOUT_DIR_NAME . $layout;

	return ($layoutDir . "/" . $name);
}

//-----------------------------------------------------------------------------
//-- returns an initialized XTemplate object ---
//-----------------------------------------------------------------------------
function getLayoutXTemplate($name) {

	return new XTemplate(getLayoutFile($name));
}

//-----------------------------------------------------------------------------
//-- returns an initialized PSPCooker object ---
//-----------------------------------------------------------------------------
//require($GALLERY_BASEDIR . "layout_util/PSPCooker/class_pspcooker.php");
//function getLayoutPSPCooker($handle, $name) {
//
//	$template = new PSPCooker($gallery->app->tmpDir);
//    $template->load_file($handle, getLayoutFile($name));
//}

?>
