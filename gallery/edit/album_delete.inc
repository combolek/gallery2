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

	// XXX this is a bassackwards way to delete an album in the 2.0
	// XXX mindset. Should we fix Album->delete() to do all of this? hrm.

	//-- find the parent album and this album's index ---
	$pAlbum = new Album();
	$pAlbum->load($album->fields["parentAlbumName"]);
	$aIndex = $pAlbum->getPhotoIndex($album->fields["name"]);

	//-- now delete the album from the parent ---
	$pAlbum->deletePhoto($aIndex);
	$pAlbum->save();

	//-- when this command executes we want to leave the edit page ---
	$forceReturn = 1;

	return;
} else {

	//-- build up some html for output ---
	$content = "
			<span class=\"title\">Delete Album</span>
		<br>
		<br>
		Do you really want to delete this Album?
		<br>
		<br>
		<i>This action cannot be undone!</i>
	";

	return $content;

}
?>
