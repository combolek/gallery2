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
function fs_copy($source, $dest) {
	return copy($source, $dest);
}

function fs_file_exists($filename) {
	return file_exists($filename);
}

function fs_filesize($filename) {
	return filesize($filename);
}

function fs_fopen($filename, $mode, $use_include_path=0) {
	return fopen($filename, $mode, $use_include_path);
}

function fs_is_dir($filename) {
	return is_dir($filename);
}

function fs_opendir($path) {
	return opendir($path);
}

function fs_rename($oldname, $newname) {
	return rename($oldname, $newname);
}

function fs_stat($filename) {
	return stat($filename);
}

function fs_unlink($filename) {
	return unlink($filename);
}
?>
