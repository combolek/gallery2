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

	$album->setFields(
		array("title" => $f_title,
			"description" => $f_description
		)
	);

	// did the name change? Gotta handle this all special like
	if ($f_name && (strcmp($f_name, $album->fields["name"]))) {

		$albumDB = new AlbumDB();

		$f_name = str_replace("'", "", $f_name);
		$f_name = str_replace("`", "", $f_name);
		$f_name = strtr($f_name, "+\\/*?\"<>|& ", "-----------");
		$f_name = ereg_replace("\-+", "-", $f_name);
		$f_name = ereg_replace("\-+$", "", $f_name);
		if ($albumDB->renameAlbum($oldName, $f_name)) {
			$albumDB->save();
			// need to account for nested albums by updating
			// the parent album when renaming an album
			if ($gallery->album->fields[parentAlbumName]) {
				$parentName = $gallery->album->fields[parentAlbumName];
				if (isDebugging()) {
					print "parentName=".$parentName."<br>";
					print "newName=".$f_name."<br>";
					print "oldName=".$oldName."<br>";
				}
				$parentAlbum = $albumDB->getAlbumbyName($parentName);
				for ($i=1; $i <= $parentAlbum->numPhotos(1); $i++) {
					if ($parentAlbum->isAlbumName($i) == $oldName) {
						$parentAlbum->setIsAlbumName($i,$f_name);
						$parentAlbum->save();
						break;
					}
				}
			}
			// then we need to update the parentAlbumName field in the children
			for ($i=1; $i <= $gallery->album->numPhotos(1); $i++) {
				if ($gallery->album->isAlbumName($i)) {
					$childAlbum = $gallery->album->getNestedAlbum($i);
					$childAlbum->fields[parentAlbumName] = $f_name;
					$childAlbum->save();
				}
			}
		} else {
			$tab_error = "name in use";
			return;
		}
	
	}

	return;
} else {

	//-- build up some html for output ---
	$pixelsrc = $gallery->app->photoAlbumURL . "/images/pixel_trans.gif";
	$content = "

		<span class=\"title\">Edit the album's general info: name, title, description, ...</span>
		<br>
		<br>
		
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		<tr>
		<td width=\"200\"><img src=\"$pixelsrc\" width=\"200\" height=\"1\"></td>
		<td><img src=\"$pixelsrc\" width=\"200\" height=\"1\"></td>
		</tr>

		<tr>
		  <td colspan=\"2\">
		  <span class=\"admin\">Album Title</span>
		  <br>
		  <span class=\"fineprint\">The title can be any character string, and should not conatain any HTML.</span>
		  </td>
		</tr>
		<tr>
		  <td colspan=\"2\">
		  <input type=\"text\" name=\"f_title\" value=\"". $album->fields["title"] ."\" size=\"50\">
		  </td>
		</tr>

		<tr>
		  <td colspan=\"2\">
		  <span class=\"admin\">Album Name</span>
		  <br>
		  <span class=\"fineprint\">The name must be unique amongst all album names in the gallery.  <b>NOTE:</b> The name cannot conatin any of the following characters: <b>\ / * ? \" ' &amp; &lt; &gt; | + </b>or<b> spaces</b></span>
";
if (!strcmp($tab_error, "name in use")) {
	$content .= "
		  <br>
		  <span class=\"error\">!!! ERROR: There is already an album with that name !!!</span>
	";
}
$content .= "
		  </td>
		</tr>
		<tr>
		  <td colspan=\"2\">
		  <input type=\"text\" name=\"f_name\" value=\"". $album->fields["name"] ."\" size=\"50\">
		  </td>
		</tr>
		
		<tr>
		  <td colspan=\"2\">
		  <span class=\"admin\">Album Description</span>
		  <br>
		  <span class=\"fineprint\">The description can be any character string. It may contain HTML.</span>
		  </td>
		</tr>
		<tr>
		  <td colspan=\"2\">
		  <textarea name=\"f_description\" rows=\"4\" cols=\"50\">". $album->fields["description"] ."</textarea>
		  </td>
		</tr>
		
		</table>


	";

	return $content;

}
?>
