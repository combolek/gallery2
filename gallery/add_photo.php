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
 */
?>
<?php
// Hack prevention.
if (!empty($HTTP_GET_VARS["GALLERY_BASEDIR"]) ||
		!empty($HTTP_POST_VARS["GALLERY_BASEDIR"]) ||
		!empty($HTTP_COOKIE_VARS["GALLERY_BASEDIR"])) {
	print "Security violation\n";
	exit;
}
?>
<?php if (!isset($GALLERY_BASEDIR)) {
    $GALLERY_BASEDIR = '';
}
require($GALLERY_BASEDIR . "init.php"); ?>
<?php
// Hack check
if (!$gallery->user->canAddToAlbum($gallery->album)) {
	exit;
}
?>
<html>
<head>
  <title>Add Photo</title>
  <?php echo getStyleSheetLink() ?>

<script language="Javascript">
<!--
	function reloadPage() {
		document.count_form.submit();
		return false;
	}
// -->
</script>
</head>
<body>
<?php
if ($userfile_name) {
        $tag = ereg_replace(".*\.([^\.]*)$", "\\1", $userfile_name);
        $tag = strtolower($tag); 
	processNewImage($userfile, $tag, $userfile_name, $caption, $setCaption, $extra_fields);
	$gallery->album->save();

	if ($temp_files) {
		/* Clean up the temporary url file */
		foreach ($temp_files as $tf => $junk) {
		    fs_unlink($tf);
		}
	}
	reload();
	?>
	<p><center><form>
	<input type=submit value="Dismiss" onclick='parent.close()'>
	</form></center>
<script language="Javascript">
<!--
opener.hideProgressAndReload();
-->
</script>

<?php
}

else
{
?>


<span class="popuphead">Add Photo</span>
<br>
<span class="popup">
Click the <b>Browse</b> button to locate a photo to upload.
<span class="admin">
<br>
&nbsp;&nbsp;(Supported file types: <?php echo join(", ", acceptableFormatList()) ?>)
</span>

<br><br>

<?php echo makeFormIntro("add_photo.php",
			array("name" => "upload_form",
				"enctype" => "multipart/form-data",
				"method" => "POST")); ?>
<input type="hidden" name="max_file_size" value="10000000">
<table>
<tr><td>
File</td>
<td><input name="userfile" type="file" size=40></td></tr>
<td>Caption</td><td> <textarea name="caption" rows=2 cols=40></textarea></td></tr>
<?php
foreach ($gallery->album->getExtraFields() as $field) {
        if ($field == "Capture Date" || $field == "Upload Date")
        {
                continue;
        }
        if ($field == "Title")
        {
        	print "<tr><td valign=top>Title</td><td>";
                print "<input type=text name=\"extra_fields[$field]\" value=\"\" size=\"40\">";
        }
	else
	{
        	print "<tr><td valign=top>$field</td><td>";
        	print "<textarea name=\"extra_fields[$field]\" rows=2 cols=40>";
        	print "</textarea>";
	}
        print "</td></tr>";
}
?>

</table>
<input type=checkbox name=setCaption checked value="1">Use filename as caption if no caption is specified.
<br>
<center>
<input type="button" value="Upload Now" onClick='opener.showProgress(); document.upload_form.submit()'>
<input type=submit value="Cancel" onclick='parent.close()'>
</center>
</form>
<?php } ?>

</body>
</html>
