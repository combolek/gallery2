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

// NOTE: I May wrap these functions into the kitchen sink that is util.php. 
//	   For now, it's alot more convient to have them here.

require($GALLERY_BASEDIR . "layout_util/xtpl/xtemplate.inc");

//-----------------------------------------------------------------------------
function getLayouts() {

	// define these globals to make them available to layouts
	global $gallery;

	// XXX not very intelligent way to differentiate layout dirs...

	$dir_handle = fs_opendir('layout');
	while ($file = readdir($dir_handle)) {
		if ( (!ereg("[.]", $file)) && (!ereg("CVS", $file)) ) {
			$layout_list[] = $file;
		}
	}
	closedir($dir_handle);
	sort($layout_list);

	return $layout_list;
}

//-----------------------------------------------------------------------------
function includeLayout($name) {
		
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
	$layout = $gallery->album->fields["layout"];
	
	# XXX TEMPORARY
	if (!$layout) {
		$layout = "default";
	}

	$layoutDir =  $GALLERY_BASEDIR . $LAYOUT_DIR_NAME . $layout;

	return ($layoutDir . "/" . $name);
}

//-----------------------------------------------------------------------------
//-- returns an initialized XTemplate object ---
//-----------------------------------------------------------------------------
function getLayoutXTemplate($name) {

	return new XTemplate($name, getLayoutFile(""));
}

//-----------------------------------------------------------------------------
//-- returns an initialized XTemplate object ---
//-----------------------------------------------------------------------------
function getLayoutWrapTemplate($name) {
	global $GALLERY_BASEDIR;

	$fullname = $GALLERY_BASEDIR . "html_wrap/$name";

	if (!fs_file_exists($fullname)) {
		$fullname .= ".default";
	}
	return new XTemplate($fullname);
}

//-----------------------------------------------------------------------------
//-- returns the header and footer html parsed through an XTPL ---
//-----------------------------------------------------------------------------
function getLayoutWrapHeaderFooter(&$G) {
	global $GALLERY_EMBEDDED_INSIDE;

	$xtpl_hf = getLayoutWrapTemplate("header_footer.xtpl");
	$xtpl_hf->assign('G', $G);

	if (!$GALLERY_EMBEDDED_INSIDE) {
		$xtpl_hf->parse("header.standalone_only");
		$xtpl_hf->parse("footer.standalone_only");
	}
	$xtpl_hf->parse("header");
	$xtpl_hf->parse("footer");
	$header = $xtpl_hf->text("header");
	$footer = $xtpl_hf->text("footer");

	return array($header, $footer);
}
//-----------------------------------------------------------------------------
//-- returns an initialized PSPCooker object ---
//-----------------------------------------------------------------------------
//require($GALLERY_BASEDIR . "layout_util/PSPCooker/class_pspcooker.php");
//function getLayoutPSPCooker($handle, $name) {
//
//	$template = new PSPCooker($gallery->app->tmpDir);
//	$template->load_file($handle, getLayoutFile($name));
//}

?>
