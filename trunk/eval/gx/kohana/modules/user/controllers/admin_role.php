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
 * @author tim
 */

class Admin_Role_Controller extends Gallery_Controller {
  // Set the name of the template to use
  public $template = 'templates/base.html';

  static function getDescriptor() {
    return array('category' => 'user', 'description' => "Manage Roles");
  }

  public function Index() {
    $roles = ORM::factory("role")->find_all();

    $this->template->header->active = "Admin";
    $this->template->header->item = null;
    $this->template->header->path = array();
    
    $this->template->content = new View('admin_role.html');
    $this->template->content->roles = $roles;
  }
}