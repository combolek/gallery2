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

/*
 * Block-random version 1.1
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
require($GALLERY_BASEDIR . "init.php");
?>
<?
/* Initializing the seed */
srand ((double) microtime() * 1000000);

for ($i = 0; $i < 10; $i++) {
	list($album, $index) = getRandomPhoto();
	if ($album) {
		break;
	}
}

if ($album) {
	$id = $album->getPhotoId($index);

	echo ""
	     ."<a href=" .makeAlbumUrl($album->fields["name"], $id) .">"
	     .$album->getThumbnailTag($index)
	     ."</a>";
	
	$caption = $album->getCaption($index);
	if ($caption) {
		echo "<br><center>$caption</center>";
	}
	
	echo "<br><center>From: "
	     ."<a href=" .makeAlbumUrl($album->fields["name"]) .">"
	     .$album->fields["title"]
	     ."</a></center>";
} else {
	print "No photo chosen.";
}

function getRandomPhoto() {
	global $gallery;

	$albumDB = new AlbumDB();

	/* Try n times to get an album with photos in it */
	for ($i = 0; $i < 10; $i++) {
		$count = 0;
		foreach ($albumDB->albumList as $tmpAlbum) {
			if ($gallery->user->canReadAlbum($tmpAlbum)) {

				/*
				 * The odds that this album will be selected is proportional
				 * to the number of (visible) items in the album.
				 */
				$seeHidden = $gallery->user->canWriteToAlbum($tmpAlbum);
				$numPhotos = $tmpAlbum->numPhotos($seeHidden);
				$count += $numPhotos;	

				// print "Check {$tmpAlbum->fields[title]}<br>";
				// print "Count is now: $count<br>";

				if ($count != 0 && ($count == 1 || rand(1, $count) <= $numPhotos)) {
					$album = $tmpAlbum;
					// print "--> keep!<br>";
				} 
			}
		}

		// We'll skip hidden photos
		$count = $album->numPhotos();

		// debug
		// print "Count: $count<br>";
		// print "Chose " . $album->fields["title"] . "<br>";
		if ($count) {
			break;
		}
		$album = "";
	}
	
	/* Failed to find an album with photos? */
	if (!$album) {
		return array("", "");
	}

	/* Try n times to get a photo (not a movie or a nested album) */
	for ($i = 0; $i < 10; $i++) {
		if ($count > 1) {
			$pick = rand(1, $count);
		} else {
			$pick = 1;
		}

		// debug
		// print "Pick: $pick<br>";
		
		if ($album->isHidden($pick)) {
			$pick = "";
			continue;
		}

		$photo = $album->getPhoto($pick);

		// debug
		// print "movie: " . $photo->isMovie() . "<br>";
		// print "iAN: " . $photo->isAlbumName . "<br>";

		if ($photo->isMovie()) {
			$pick = "";
			continue;
		}
		
		if ($photo->isAlbumName) {
			$pick = "";
			continue;
		}
	}

	if (!$pick) {
		return array("", "");
	}

	return array($album, $pick);
}
?>
