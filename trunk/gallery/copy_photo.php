<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2003 Bharat Mediratta
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
 *
 * $Id$
 */
?>
<?php
// Hack prevention.
if (!empty($HTTP_GET_VARS["GALLERY_BASEDIR"]) ||
		!empty($HTTP_POST_VARS["GALLERY_BASEDIR"]) ||
		!empty($HTTP_COOKIE_VARS["GALLERY_BASEDIR"])) {
	print _("Security violation") ."\n";
	exit;
}
?>
<?php if (!isset($GALLERY_BASEDIR)) {
    $GALLERY_BASEDIR = './';
}
require($GALLERY_BASEDIR . 'init.php'); ?>
<?php
// Hack check
if (!$gallery->user->canWriteToAlbum($gallery->album)) {
	exit;
}

$albumDB = new AlbumDB(FALSE); // read album database

?>
<html>
<head>
  <title><?php echo _("Copy Photo") ?></title>
  <?php echo getStyleSheetLink() ?>
</head>
<body dir="<?php echo $gallery->direction ?>">

<?php
if ($gallery->session->albumName && isset($index)) {
	$numPhotos = $gallery->album->numPhotos(1);

        if (isset($newAlbum)) {	// we are copying from one album to another
            	$postAlbum = $albumDB->getAlbumbyName($newAlbum);
		if (!$postAlbum) {
			gallery_error(sprintf(_("Invalid album selected: %s"),
						$newAlbum));
		} else {
			if ($gallery->album->isAlbumName($index)) {
			       gallery_error(sprintf(_("Can't copy album #%d"),
						       $index));
			} else { // copying "picture" to another album

				for ($index = $startPhoto; $index <= $endPhoto; $index++) {
					if (!$gallery->album->isAlbumName($index)) {
					        set_time_limit($gallery->app->timeLimit);
						processingMsg (sprintf(_("Copying photo #%d"),$index));
						$mydir = $gallery->album->getAlbumDir();
						$myphoto = $gallery->album->getPhoto($index);
						$myname = $myphoto->image->name;
						$myresized = $myphoto->image->resizedName;
						$mytype=$myphoto->image->type;
						$myfile="$mydir/$myname.$mytype";
						$myhidden=$myphoto->isHidden();
						if (($postAlbum->fields["thumb_size"] == $gallery->album->fields["thumb_size"]) &&
						    (!$myphoto->isMovie())) {
							$pathToThumb="$mydir/$myname.thumb.$mytype";
						} else {
							$pathToThumb="";
							echo "- ". _("Creating Thumbnail") ."<br>";
							my_flush();
						}
						$photo=$gallery->album->getPhoto($index);

						$id=$gallery->album->getPhotoId($index);


						$err = $postAlbum->addPhoto($myfile, $mytype, $myname, 
								$gallery->album->getCaption($index), 
								$pathToThumb, $photo->extraFields, 
								$gallery->album->getItemOwner($index));
						if (!$err) {
							$newPhotoIndex = $postAlbum->numPhotos(1);

							// Save additional item settings... currently:
							//  $clicks $keywords $comments $uploadDate $itemCaptureDate;
							$newphoto = $postAlbum->getPhoto($newPhotoIndex);
							$oldphoto = $gallery->album->getPhoto($index);
							$newphoto->clicks = $oldphoto->clicks;
							$newphoto->keywords = $oldphoto->keywords;
							$newphoto->comments = $oldphoto->comments;
							$newphoto->uploadDate = $oldphoto->uploadDate;
							$newphoto->itemCaptureDate = $oldphoto->itemCaptureDate;
							if ($myhidden) {
								$newphoto->hide();
							}
							$postAlbum->setPhoto($newphoto,$newPhotoIndex);
							_("An image has been copied into this album.");
							$postAlbum->save(array("An image has been copied into this album."));
						} else {
							echo "<font color=red>". _("Error") . ": "."$err!</font>";
							return;
                				}
			     		} else {
						echo sprintf(_("Skipping Album #%d"), $index)."<br>";
						$index++; // we hit an album... don't copy it... just increment the index
					}
	    			} //end for
			} //end else
		       	?>
			<center><form>
			<input type="button" value="<?php echo _("Dismiss") ?>" onclick='parent.close()'>
			</form></center>
		       	<?php
		       	return;
	       	} //end if ($gallery->album != $postAlbum)
	} //end if (isset($newAlbum))

?>

<center>
<?php
if ($gallery->album->isAlbumName($index)) {
       	gallery_error(sprintf(_("Can't copy album #%d"),
			       	$index));
	return;
} else {  
echo $gallery->album->getThumbnailTag($index)
?>
<p>
<?php echo _("Copy a range of photos to a new album:") ?><br>
<i>(<?php echo _("To copy just one photo, make First and Last the same") ?>)</i><br>
<i>(<?php echo _("Nested albums in this range will be ignored") ?>)</i><p>
<?php echo makeFormIntro("copy_photo.php", array("name" => "copy_to_album_form")); ?>
<input type=hidden name="index" value="<?php echo $index ?>">

<?php
// Display album list for a photo and display num photos to copy
?>
<table>
<tr>
<td align="center"><b><?php echo _("First") ?></b></td>
<td align="center"><b><?php echo _("Last") ?></b></td>
<td align="center"><b><?php echo _("New Album") ?></b></td>
</tr>
<tr>
<td align="center">
<select name="startPhoto">
<?php
for ($i = 1; $i <= $numPhotos; $i++) {
        $sel = "";
        if ($i == $index) {
                $sel = "selected";
        }
        echo "<option value=\"$i\" $sel> $i</option>";
}
?>
</select>
</td>
<td align="center">
<select name="endPhoto">
<?php
for ($i = 1; $i <= $numPhotos; $i++) {
        $sel = "";
        if ($i == $index) {
                $sel = "selected";
        }
        echo "<option value=\"$i\" $sel> $i</option>";
}
?>
</select>
</td>
<td>
<select name="newAlbum">
<?php
	$uptodate= printAlbumOptionList(0,0,1); 
?>
</select>
</td>
</tr>
</table>
<?php
} // end else

if (!$uptodate) {
	print '<span class="error"> <br>' . sprintf(_("WARNING: Some of the albums need to be upgraded to the current version of %s."), Gallery()) . '</span>  ' .
	'<a href="'. makeGalleryUrl("upgrade_album.php").'"><br>'. _("Upgrade now") . '</a>.<p>';
}
?>
<br>
<input type="submit" value="<?php echo _("Copy to Album!") ?>">
<input type="button" name="close" value="<?php echo _("Cancel") ?>" onclick='parent.close()'>
</form>
<?php
} else {
	gallery_error(_("no album / index specified"));
}
?>
</font>

</body>
</html>

