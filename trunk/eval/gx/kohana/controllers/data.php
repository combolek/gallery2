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
class Data_Controller {
  function reset() {
    $forge = new Dbforge();
    $forge->drop_table('items');
    $forge->add_field('id');
    $forge->add_field(array('type' => array('type' => 'CHAR', 'constraint' => 32)));
    $forge->add_field(array('title' => array('type' => 'CHAR', 'constraint' => 255)));
    $forge->add_field(array('path' => array('type' => 'CHAR', 'constraint' => 255)));
    $forge->add_field(array('parent_id' => array('type' => 'INT', 'constraint' => 9)));
    $forge->create_table('items');

    $this->_delete_files(VARROOT . 'images/', true);
    print html::anchor("data/populate", "populate");
  }

  function populate() {
    $item = ORM::factory('item');
    $item->type = "album";
    $item->title = "John Doe's Gallery";
    $item->path = "";
    $item->parent_id = 0;
    $item->save();
    print html::anchor("data/reset", "reset");
  }

  function _delete_files($path, $del_dir = FALSE, $level = 0) {
    // Trim the trailing slash
    $path = preg_replace("|^(.+?)/*$|", "\\1", $path);

    if (!$current_dir = @opendir($path)) {
      return;
    }

    while (FALSE !== ($filename = @readdir($current_dir))) {
      if ($filename != "." and $filename != "..") {
        if (is_dir($path.'/'.$filename)) {
          // Ignore empty folders
          if (substr($filename, 0, 1) != '.') {
            delete_files($path.'/'.$filename, $del_dir, $level + 1);
          }
        } else {
          unlink($path.'/'.$filename);
        }
      }
    }
    @closedir($current_dir);

    if ($del_dir == TRUE AND $level > 0) {
      @rmdir($path);
    }
  }
}
