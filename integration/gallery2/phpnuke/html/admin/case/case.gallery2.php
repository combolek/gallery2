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
 */
/**
 * Gallery 2 admin for PHPNuke.
 * @version $Revision$ $Date$
 * @author Dariush Molavi <dari@nukedgallery.net>
 */

global $admin_file;

if(!isset($admin_file)) {
	$admin_file = "admin";
}

if (!eregi("".$admin_file.".php", $_SERVER['PHP_SELF'])) { die ("Access Denied"); }
$module_name = "gallery2";

if(file_exists("modules/$module_name/admin/language/lang-".$currentlang.".php")) {
	include_once("modules/$module_name/admin/language/lang-".$currentlang.".php");
}
else {
	include_once("modules/$module_name/admin/language/lang-english.php");
}

switch($op) {

    case "gallery2":
    include_once("modules/$module_name/admin/index.php");
    break;
    
    case "gallery2_update_embed":
    include_once("modules/$module_name/admin/index.php");
    break;
    
    case "gallery2_update_main":
    include_once("modules/$module_name/admin/index.php");
    break;
    
    case "gallery2_user_export":
    include_once("modules/$module_name/admin/export.php");
    break;

	case "gallery2_update_database":
    include_once("modules/$module_name/admin/index.php");
    break;

}

?>