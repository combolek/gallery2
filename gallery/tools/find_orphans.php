<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2006 Bharat Mediratta
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
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * $Id$
 */
?>
<?php

if (!isset($gallery->version)) {
	require_once(dirname(dirname(__FILE__)) . '/init.php');
}

require(dirname(__FILE__) . '/lib/lib-find_orphans.php');

$action = getRequestVar('action');

// Security check
if (!$gallery->user->isAdmin()) {
	header("Location: " . makeAlbumHeaderUrl());
	exit;
}

$albumDB = new AlbumDB();

clearstatcache() ;
$orphanAlbums = findOrphanedAlbums();
$orphanImages = findOrphanedImages();

global $GALLERY_EMBEDDED_INSIDE;
if (!$GALLERY_EMBEDDED_INSIDE) {
	doctype();
?>
<html>
<head>
<title><?php echo clearGalleryTitle(gTranslate('core', "Find Orphans")); ?></title>
<?php
	common_header();
?>
</head>
<body>
<?php
}
	includeTemplate("gallery.header", '', 'classic');

	$adminbox['text'] = gTranslate('core', "Find Orphans");
	$adminbox["commands"] = galleryLink(
								makeGalleryUrl("admin-page.php"),
								gTranslate('core', "return to _admin page"),
								array(), '', true);

	$adminbox["commands"] .= galleryLink(
								makeAlbumUrl(),
								gTranslate('core', "return to _gallery"),
								array(), '', true);

	$adminbox["bordercolor"] = $gallery->app->default["bordercolor"];
	$breadcrumb['text'][] = languageSelector();

	includeLayout('adminbox.inc');
	includeLayout('breadcrumb.inc');

echo '<div class="g-content-popup" align="center">';
if (empty($action)) {
	if (!empty($orphanAlbums)) { ?>
		<p><?php echo gTranslate('core', "Orphaned Albums:") . " " . sizeof($orphanAlbums) ?></p>
		<p><?php echo gTranslate('core', "Orphaned Albums will be re-attached to their parent albums, if at all possible.  If the parent album is missing, the orphan will be attached to the Gallery Root, and it can be moved to a new location from there.") ?></p>
		<center>
		<table>
		<tr>
			<th><?php echo gTranslate('core', "Parent Album") ?></th>
			<th>&nbsp;</th>
			<th><?php echo gTranslate('core', "Orphaned Album") ?></th>
		</tr>
<?php
		$current = '';
		foreach ($orphanAlbums as $childName => $parentName) {
			echo "\t<tr>";
			if ($current == $parentName) {
				echo "\n\t<td>" . ($parentName ? "<a href='" . makeAlbumUrl($albumName) . "'>" . $albumName . "</a>" : gTranslate('core', "Gallery Root")) . "</td>";
				$current = $parentName;
			} else {
				echo "\n\t<td>\------</td>";
			}
			echo "\n\t<td>=&gt;</td>";
			echo "\n\t<td><a href=\"" . makeAlbumUrl($childName) . "\">" . $childName . "</a></td>";
			echo "\n\t</tr>";
		}
?>
		</table>
		<br>
		<?php echo makeFormIntro("tools/find_orphans.php", array("method" => "GET")); ?>
		<input type="hidden" name="action" value="albums">
		<?php echo gSubmit('reattach', gTranslate('core', "_Re-Attach Orphaned Albums!")); ?>
		</form>
		</center>
<?php
	}
	elseif (!empty($orphanImages)) {
?>

		<p><?php echo gTranslate('core', "Orphaned Files:") . " " . recursiveCount($orphanImages) ?></p>
		<p><?php echo gTranslate('core', "Orphaned files will be deleted from the disk.  Orphaned files should never exist - if they do, they are the result of a failed upload attempt, or other more serious issue such as the photos database being overwritten with bad information.") ?></p>
		<center>
		<table>
		<tr>
			<th><?php echo gTranslate('core', "Album directory") ?></th>
			<th>&nbsp;</th>
			<th><?php echo gTranslate('core', "Orphaned file") ?></th>
		</tr>
<?php
		$current = '';
		foreach ($orphanImages as $albumName => $imageVal) {
			foreach (array_keys($imageVal) as $fileName) {
				echo "\n\t\t<tr>";
				if($current != $albumName) {
					echo "\n\t\t\t<td><a href='" . makeAlbumUrl($albumName) . "'>" . $albumName . "</a></td>";
					$current = $albumName;
				} else {
					echo "\n\t\t\t<td>\------</td>";
				}
				echo "\n\t\t\t<td>=&gt;</td>";
				echo "\n\t\t\t<td><a href='" . $gallery->app->albumDirURL . "/" . $albumName . "/" . $fileName . "'>" . $fileName . "</a></td>";
				echo "\n\t\t</tr>";
			}
		}
?>
		</table>
		<br>
		<?php echo makeFormIntro("tools/find_orphans.php", array("method" => "GET")); ?>
		<input type="hidden" name="action" value="images">
		<?php echo gSubmit('delete', gTranslate('core', "_Delete Orphaned Files!")); ?>
		</form>
		</center>
<?php
	}
	else {
		// No Orphans
		echo "\n<p align=\"center\" class=\"g-success\">" .
			gTranslate('core', "There are no orphaned elements in this Gallery.") . "</p>\n";
	}
} // !isset(update)
else {
	$addon = '';
	$text = ($action == "albums") ? gTranslate('core', "Orphaned albums repaired.") : gTranslate('core', "Orphaned files repaired.");
	$messages[] = array('type' =>'information', 'text' => $text);

	if ($action == 'albums') {
		attachOrphanedAlbums($orphanAlbums);
	}

	if ($action == 'images') {
		$unwriteableFiles = array("jens"); //deleteOrphanedImages($orphanImages);
		if (!empty($unwriteableFiles)) {

			$text = gTranslate('core', "The Webserver has not enough permission to delete the following files:");
			$text .= "\n<ul>";
			foreach ($unwriteableFiles as $filename) {
				$text .= "<li>$filename</li>";
			}
			$text .= "\n</ul>";
			$text .= "\n<p>". gTranslate('core', "Please check the permission of these files and the folder above. chmod them, or ask your admin to do this.") . "<br>";
			$text .= "\n</p>";

			$messages[] = array('type' =>'error', 'text' => $text);
			$addon = gButton('clickme', gTranslate('core', "Reload"), 'location.reload()');
		}
	}
	echo infoBox($messages) . $addon;
}
?>
</div>
<?php
	includeTemplate("overall.footer");
	if (!$GALLERY_EMBEDDED_INSIDE) {
?>
</body>
</html>
<?php } ?>
