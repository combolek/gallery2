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
<? if (file_exists("config.php")) { ?>

<?
/* Read the album list */
$albumDB = new AlbumDB();
$albumName = "";
$page = 1;

/* If there are albums in our list, display them in the table */
$numAlbums = $albumDB->numAlbums();

if (!$albumListPage) {
	$albumListPage = 1;
}
$perPage = 5;
$maxPages = max(ceil($numAlbums / $perPage), 1);

if ($albumListPage > $maxPages) {
	$albumListPage = $maxPages;
}

$navigator["page"] = $albumListPage;
$navigator["pageVar"] = "albumListPage";
$navigator["url"] = "albums.php";
$navigator["maxPages"] = $maxPages;
$navigator["spread"] = 6;
$navigator["fullWidth"] = 100;
$navigator["widthUnits"] = "%";
$navigator["bordercolor"] = "#DDDDDD";

?>


<html>
<head>
<title><?= $app->galleryTitle ?></title>
<link rel="stylesheet" type="text/css" href="<?= getGalleryStyleSheetName() ?>">
</head>
<body>

<!-- gallery.header begin -->
<?
includeHtmlWrap("gallery.header");
?>
<!-- gallery.header end -->

<!-- admin section begin -->
<? 
$adminText = "<span class=\"admin\">";
$adminText .= "There are $numAlbums albums in this gallery on $maxPages pages&nbsp;";
$adminText .= "</span>";
$adminCommands = "<span class=\"admin\">";
if (isCorrectPassword($edit)) { 
	$adminCommands .= "<a href=do_command.php?cmd=new-album&return=view_album.php>[Create a New Album]</a>&nbsp;";
	$adminCommands .= "<a href=do_command.php?cmd=leave-edit&return=albums.php>[Leave admin mode]</a>";
} else {
	$adminCommands .= "<a href=".popup("edit_mode.php").">[Admin]</a>";
}
$adminCommands .= "</span>";
$adminbox["text"] = $adminText;
$adminbox["commands"] = $adminCommands;
$adminbox["bordercolor"] = "#DDDDDD";
$adminbox["top"] = true;
include ("layout/adminbox.inc");
?>

<!-- top nav -->
<?
include("layout/navigator.inc");
?>

<!-- album table begin -->
<table width=100% border=0 cellspacing=7>


<?
$start = ($albumListPage - 1) * $perPage + 1;
$end = min($start + $perPage - 1, $numAlbums);

for ($i = $start; $i <= $end; $i++) {
        $album = $albumDB->getAlbum($i);
        $tmpAlbumName = $album->fields["name"];
        $albumURL = $app->photoAlbumURL . "/" . $tmpAlbumName;

?>     

  <!-- Begin Album Column Block -->
  <tr>
  <!-- Begin Image Cell -->
  <td width=<?=$app->highlight_size?> align=center valign=middle>
  <a href=<?=$albumURL?>>
  <?   
        if ($album->numPhotos()) {
                echo $album->getHighlightTag();
        } else {
                echo "<span class=title>Empty!</span>";
        }
  ?>   
  </a>
  </td>
  <!-- End Image Cell -->
  <!-- Begin Text Cell -->
  <td align=left valign=top>
  <hr size=1>
  <span class="title">
  <a href=<?=$albumURL?>>
  <?= editField($album, "title", $edit) ?></a>
  </span>
  <br>
  <span class="desc">
  <?= editField($album, "description", $edit) ?>
  </span>
  <br>
  <span class="admin">
  <? if (isCorrectPassword($edit)) { ?>
  <a href=<?= popup("delete_album.php?set_albumName={$tmpAlbumName}")?>>[delete album]</a>
  :
  <a href=<?= popup("move_album.php?set_albumName={$tmpAlbumName}&index=$i")?>>[move album]</a>
  :
  <a href=<?= popup("rename_album.php?set_albumName={$tmpAlbumName}&index=$i")?>>[rename album]</a>
  <br>
  url: <a href=<?=$albumURL?>><?=$albumURL?></a>
   <? if (preg_match("/album\d+$/", $albumURL)) { ?>
 	<br>
         <span class="error">
          Hey!
          <a href=<?= popup("rename_album.php?set_albumName={$tmpAlbumName}&index=$i")?>>Rename</a> 
          this album so that the URL is not so generic!
         </span>
   <? } ?>
  <? } ?>
  <br>
  </span>
  </td>
  </tr>
  <!-- End Text Cell -->
  <!-- End Album Column Block -->

<?
}      
?>
</table>
<!-- album table end -->
<!-- bottom nav -->
<?
include("layout/navigator.inc");
?>

<?
} 

else {
	if (file_exists("setup") && is_readable("setup")) {
		header("Location: setup/");
		return;
	}

?>

<<html>
<head>
  <title>Gallery Configuration Error</title>
  <link rel="stylesheet" type="text/css" href="<?= getGalleryStyleSheetName() ?>">
</head>
<body>
center>
<span class="error">
Gallery has not been configured!
<p>
To configure it, type:
	<table><tr><td>
		<code>
		% cd <?=dirname(getenv("SCRIPT_FILENAME"))?>
		<br>
		% sh ./configure.sh
	</td></tr></table>
<p>
And then go <a href=setup>here</a>
</span>
</body>
</html>
<?
} 
?>

<!-- gallery.footer begin -->
<?
includeHtmlWrap("gallery.footer");
?>
<!-- gallery.footer end -->

</body>
</html>
