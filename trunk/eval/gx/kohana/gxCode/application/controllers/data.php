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
    $config = Kohana::config('database.default');
    printf("<pre> [%s:%s] database: %s</pre>",__FILE__,__LINE__,print_r($config['connection']['database'], 1)); flush();
    $forge->create_database($config['connection']['database']);
    $forge->drop_table('photo');

    $forge->add_field('id');
    $forge->add_field(array('title' => array('type' => 'VARCHAR', 'constraint' => 128)));
    $forge->add_field(array('path' => array('type' => 'VARCHAR', 'constraint' => 128)));
    $forge->create_table('photo');

    $this->_delete_files(DOCROOT . 'images/', true);
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
