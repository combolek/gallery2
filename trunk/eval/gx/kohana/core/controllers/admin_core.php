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

class Admin_Core_Controller extends Gallery_Controller {
  // Set the name of the template to use
  public $template = 'templates/base.html';

  public function Index() {
    $this->template->header->active = "Admin";
    $this->template->header->item = null;
    $this->template->header->path = array();

    $controllers = $this->_find_admin_controllers();
    $data = array();
    foreach ($controllers as $route => $descriptor) {
      $data[ucfirst($descriptor['category'])][] = 
        array('route' => $route, 'description' => $descriptor['description']);
    }

    $this->template->content = new View('admin_core.html');
    $this->template->content->data = $data;
  }

  private function _find_admin_controllers() {
    $admin_controllers = array();
    $modules = Kohana::config('core.modules');
    foreach ($modules as $module_path) {
      $module = substr($module_path, strrpos($module_path, "/") + 1);
      $controller_directory = "$module_path/controllers";
      if (is_dir($controller_directory)) {
        if ($dh = opendir($controller_directory)) {
          while (($controller = readdir($dh)) !== false) {
            if ($controller[0] == ".") {
              continue;
            }
            $matches = array();
            if (preg_match("#^admin_([a-zA-Z][a-z_A-Z0-9]*)\.php$#", $controller, $matches)) {
              $descriptor = $this->_get_descriptor("Admin_" . ucfirst($matches[1]) . '_Controller');
              if (!empty($descriptor)) {
                $admin_controllers["admin/$matches[1]"] = $descriptor;
              }
            }
          }
          closedir($dh);
        }
        }
    }

    return $admin_controllers;
  }

  private function _get_descriptor($class) {
    $descriptor = null;
    try {
      $class = new ReflectionClass($class);
      if ($class->hasMethod("getDescriptor")) {
        $descriptor = $class->getMethod("getDescriptor")->invoke(null);
      }
    } catch (ReflectionException $e) {
      Kohana::log('alert', $e->getMessage());
    }
    return $descriptor;
  }
}
