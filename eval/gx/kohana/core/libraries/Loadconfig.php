<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2008 Bharat Mediratta
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
 * Enter Description Here
 * @package
 * @subpackage
 * @author Tim
 */

class LoadConfig {
  /**
   * Loads the configuration.  In the prototype, it just lists the directories in the THEMEPATH
   * and MODPATH. In the final version it could get the module directories from a database table.
   *
   */
  public static function onLoadConfig() {
    $modules = Kohana::config('core.modules');
    $modules = array_merge(LoadConfig::_readModules(THEMEPATH),
                           LoadConfig::_readModules(MODPATH), $modules);

    Kohana::config_set('core.modules', $modules);
  }

  private static function _readModules($path) {
    $modules = array();
    if ($dh = opendir($path)) {
      while (($file = readdir($dh)) !== false) {
        if ($file[0] != '.') {
          $modules[] = $path . $file;
        }
      }
      closedir($dh);
    }
    return $modules;
  }
}