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

<html>
<head>
  <title>Rotate Photo</title>
  <link rel="stylesheet" type="text/css" href="<?= getGalleryStyleSheetName() ?>">
</head>
<body>

<?
if ($albumName && isset($index)) {
	if ($rotate) {
		$album->rotatePhoto($index, $rotate);
		$album->save();
		dismissAndReload();
		return;
	} else {
?>

<center>
How do you want to rotate this photo?
<br>
<a href=rotate_photo.php?rotate=90&albumName=<?= $album->fields["name"] ?>&index=<?= $index ?>>Counter-Clockwise</a>
/
<a href=rotate_photo.php?rotate=-90&albumName=<?= $album->fields["name"] ?>&index=<?= $index ?>>Clockwise</a>
/
<a href="javascript:void(parent.close())">Cancel</a>
<br>

<p>
<?= $album->getThumbnailTag($index) ?>

<?
	}
} else {
	error("no album / index specified");
}
?>

</body>
</html>

