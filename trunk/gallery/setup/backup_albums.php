<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2003 Bharat Mediratta
 * 
 * This file created by Joan McGalliard, Copyright 2003
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
	print "Security violation\n";
	exit;
}

if (!isset($GALLERY_BASEDIR)) {
    $GALLERY_BASEDIR = '';
}
require($GALLERY_BASEDIR . 'init.php');

if (!$gallery->user->isAdmin()) {
    print "You must be logged on as a Gallery admin to use this feature.";
    exit;
}
set_time_limit(0);
$showForce = false;
if (!empty($submit) || !empty($force))
{
	$error_text='';
	switch ($backup_method) {
		case "zip":
			if (!fs_file_exists($zip_path))
			{
				$error_text .= "Zip file \"$zip_path\" does not exist or is not readable.<br>";
			}
			break;
		case "tgz":
			if (!fs_file_exists($gzip_path))
			{
				$error_text .= "Gzip file \"$gzip_path\" does not exist or is not readable.<br>";
			}
			if (!fs_file_exists($tar_path))
			{
				$error_text .= "Tar file \"$tar_path\" does not exist or is not readable.<br>";
			}
			if (!strcmp($target_files, "dat")) { 
				if (!fs_file_exists($find_path)) {
					$error_text .= "Find file \"$find_path\" does not exist or is not readable.<br>";
				}
				if (!fs_file_exists($xargs_path)) {
					$error_text .= "Xargs file \"$xargs_path\" does not exist or is not readable.<br>";
				}
			}
	}

	if ($force || strlen($error_text) == 0)
	{
		backup();
		exit;
	} else {
	    if (ini_get('open_basedir')) {
		$error_text = " <b>Note:</b> Your webserver is configured with the 
 <a href=\"http://www.php.net/manual/en/features.safe-mode.php#ini.open-basedir\">
 open_basedir</a> restriction.  This may make it difficult for Gallery to detect 
 and verify your binaries, even if they exist and function properly.  If you know
 that the paths you entered are correct, you must click the \"force\" button.  We
 detected the following error(s):<ul>$error_text</ul>";
		$showForce = true;
	    }
	}
} 
?>
<html>
<head>
  <title>Backup Albums</title>
  <?php echo getStyleSheetLink() ?>
</head>
<body>

<span class="popuphead">Backup album data</span>
<p>
<?php
if ($error_text) {
?>
<span class=error><?php echo $error_text?></span>
<?php
}
?>

<?php
if (!isset($backup_method)) { $backup_method="zip";}
if (!isset($target_files)) { $target_files="dat";}
if (!isset($tar_path)) { $tar_path= ( ($path = findInPath ("tar")) ? $path : "/usr/bin/tar" );}
if (!isset($find_path)) { $find_path=( ($path = findInPath ("find")) ? $path : "/usr/bin/find" );}
if (!isset($xargs_path)) { $xargs_path=( ($path = findInPath ("xargs")) ? $path : "/usr/bin/xargs");}
if (!isset($gzip_path)) { $gzip_path=( ($path = findInPath ("gzip")) ? $path : "/usr/bin/gzip");}
if (!isset($zip_path)) { $zip_path="C:\bin\zip.exe";}
?>
<center>
Choose archiving option and which files you wish to archive.
<?php echo makeFormIntro("backup_albums.php", array("name" => "theform", "method" => "POST")); ?>
<table>

<tr> <td>Backup Method:</td> <td><input type="radio" name="backup_method" value="tgz" align="middle" <?php ($backup_method == "tgz") ? print 'checked' : '' ?> >tar/gzip</td> </tr>
<tr> <td></td> <td><input type="radio" name="backup_method" value="zip" align="middle" <?php $backup_method =="zip" ? print 'checked' : '' ?> >zip</td> </tr>
<tr><td></td> </tr>
<tr> <td>Files to backup:</td> <td><input type="radio" name="target_files" value="all" align="middle" <?php $target_files =="all" ? print 'checked' : '' ?> >All files</td> </tr>
<tr> <td></td> <td><input type="radio" name="target_files" value="dat" align="middle" <?php $target_files =="dat" ? print 'checked' : '' ?> >Data files only</td> </tr>
<tr> <td>zip path</td> <td><input name="zip_path" value="<?php echo $zip_path ?>" size=30></td> </tr>
<tr> <td>tar path</td> <td><input name="tar_path" value="<?php echo $tar_path ?>" size=30></td> </tr>
<tr> <td>gzip path</td> <td><input name="gzip_path" value="<?php echo $gzip_path ?>" size=30></td> </tr>
<tr> <td>find path</td> <td><input name="find_path" value="<?php echo $find_path ?>" size=30></td> </tr>
<tr> <td>xargs path</td> <td><input name="xargs_path" value="<?php echo $xargs_path ?>" size=30></td> </tr>
</table>
</table>
<p>
<input type=submit name="submit" value="Backup">
<?php if ($showForce) { ?>
<input type=submit name="force" value="Force Backup">
<?php } ?>
<input type=button value="Cancel" onclick='parent.close()'>

</form>
<p>
<hr>
<span class=title>Notes</span>
</center>
<ol>
<li> On Linux/Unix systems, tar/gzip is recommended.
<li> On Windows system, choose zip backup, and ensure the path for the zip.exe is correct.
<li> Zip file backup requires enough space in the temporary directory to create a zip file of entire backup.
<li> Data files backup will <b>not</b> backup your images, and is recommended before upgrade.
<li> If you choose a tar/gzip backup of data files only, you need to have correct paths for <b>xargs</b> and <b>find</b>, otherwise these are not needed.
<li> This will take a while, please be patient. Hit "Backup" to begin, and when download is complete, hit "Cancel"
</ol>
</body>
</html>

<?php
function backup() {
	global $gallery, $backup_method, $tar_path, $gzip_path, $find_path,$zip_path,$target_files, $xargs_path;
	if ( !strcmp($backup_method, "tgz") && 
		!strcmp($target_files, "all")) {
		$cmd=fs_import_filename($tar_path) .  " cf - ".  
			$gallery->app->albumDir. " " . $gallery->app->userDir . 
			" | ".  fs_import_filename($gzip_path) . " -c ";
		header( "Content-type: application/x-gzip" );
		header( "Content-Disposition: attachment; filename=gallery_dump.tar.gz" );
		header( "Content-Description: PHP Generated Data" );
		passthru("$cmd");
		//echo ("$cmd<p>");
	}
	else if  (!strcmp($backup_method, "tgz") && 
	                !strcmp($target_files, "dat")) {
		$cmd=fs_import_filename($find_path) . " " . $gallery->app->albumDir .
			' -name .users -prune -o -name "*.dat" | ' . fs_import_filename($xargs_path) . 
			' ' .  fs_import_filename($tar_path) .  " cf - " .
			$gallery->app->userDir .
			" | ".  fs_import_filename($gzip_path) . " -c ";
		// echo ("$cmd<p>");
		header( "Content-type: application/x-gzip" );
		header( "Content-Disposition: attachment; filename=gallery_dump.tar.gz" );
		header( "Content-Description: PHP Generated Data" );
		passthru("$cmd");
		// echo ("$cmd<p>");
	}
	else if  (!strcmp($backup_method, "zip") && 
		!strcmp($target_files, "dat")) {
		$zipfile=tempnam($gallery->app->tmpDir, "dump").".zip";
		$cmd=fs_import_filename($zip_path).
			" -r $zipfile ".  $gallery->app->albumDir .
			' -i "*.dat"';
		exec_wrapper($cmd);
		// echo ("$cmd<p>");
		$cmd=fs_import_filename($zip_path).
			" -r $zipfile ".  $gallery->app->userDir;
		exec_wrapper($cmd);
		// echo ("$cmd<p>");
		header( "Content-type: application/zip" );
		header( "Content-Disposition: attachment; filename=gallery_dump.zip" );
		header( "Content-Description: PHP Generated Data" );
		readfile($zipfile);
		fs_unlink($zipfile);
	}
	else if  (!strcmp($backup_method, "zip") && 
		!strcmp($target_files, "all")) {
		$zipfile=tempnam($gallery->app->tmpDir, "dump").".zip";
		$cmd=fs_import_filename($zip_path).
			" -r $zipfile ".  $gallery->app->userDir . " " .
			$gallery->app->albumDir;
		exec_wrapper($cmd);
		// echo ("$cmd<p>");
		header( "Content-type: application/zip" );
		header( "Content-Disposition: attachment; filename=gallery_dump.zip" );
		header( "Content-Description: PHP Generated Data" );
		readfile($zipfile);
		fs_unlink($zipfile);
	}
}
?>
