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

	//-- this command puts up a little status message ---
	echo "<span class=\"title\">Rotating photo</span>"
		. "<br><br>"
		. "(this may take a while)";
	my_flush();

	$index = $album->getPhotoIndex($id);
	$album->rotatePhoto($index, $rotateby);
	$album->save();
	return;
} else {

	//-- build up some html for output ---
	$content = "

		<input type=\"hidden\" name=\"show_progress\" value=\"1\">
		<span class=\"title\">Rotate $typeLabel</span>
		<br>
		<br>
		How do you want to rotate this $typeLabel?
		<br>
		<input type=\"radio\" name=\"rotateby\" value=\"90\">Counter-Clockwise 90&ordm;
		<br>
		<input type=\"radio\" name=\"rotateby\" value=\"-90\">Clockwise 90&ordm;
		<br>
		<input type=\"radio\" name=\"rotateby\" value=\"180\">180&ordm;
		<br>
	";

	return $content;
}
?>
