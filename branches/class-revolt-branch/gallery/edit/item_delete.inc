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
if ($doit) {
    $index = $gallery->album->getPhotoIndex($id);
	$gallery->album->deletePhoto($index);
    $gallery->album->save();

	//-- when this command executes we want to leave the edit page ---
	$forceReturn = 1;

	return;
} else {

	//-- build up some html for output ---
	$content = "
		<span class=\"title\">Delete $typeLabel</span>
		<br>
		<br>
		Do you really want to delete this $typeLabel?
		<br>
		<br>
		<i>This action cannot be undone!</i>
	";

	return $content;
}
?>
