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
  function Index() {
    foreach (array('core', 'Comment') as $module) {
      print html::anchor("data/reset/$module", "reset $module");
      print " | ";
      print html::anchor("data/populate/$module", "populate $module");
      print "<br/>";
    }
  }

  function Reset($module) {
    if ($module == 'core') {
      $forge = new Dbforge();
      $forge->drop_table('items');
      $forge->add_field('id');
      $forge->add_field(array('type' => array('type' => 'CHAR', 'constraint' => 32)));
      $forge->add_field(array('title' => array('type' => 'CHAR', 'constraint' => 255)));
      $forge->add_field(array('path' => array('type' => 'CHAR', 'constraint' => 255)));
      $forge->add_field(array('parent_id' => array('type' => 'INT', 'constraint' => 9)));
      $forge->create_table('items');

      $this->_createAuthTables($forge);
      $this->_delete_files(DOCROOT . 'var/images/', true);
    } else {
      call_user_func(array($module, "Reset"));
    }
    url::redirect('data/index');
  }

  function Populate($module) {
    if ($module == 'core') {
      $item = ORM::factory('item');
      $item->type = "album";
      $item->title = "John Doe's Gallery";
      $item->path = "";
      $item->parent_id = 0;
      $item->save();

      $item = ORM::factory('item');
      $item->type = "photo";
      $item->title = "GX Sprint!";
      $item->path = "sample.jpg";
      $item->parent_id = 1;
      $item->save();

      $roles = ORM::factory('role');
      $roles->name = 'login';
      $roles->description = 'Login privileges, granted after account confirmation';
      $roles->save();

      $roles = ORM::factory('role');
      $roles->name = 'admin';
      $roles->description = 'Administrative user, has access to everything.';
      $roles->save();
    } else {
      call_user_func(array($module, "Populate"));
    }
    url::redirect('data/index');
  }

  function _delete_files($path, $del_dir = FALSE, $level = 0) {
    // Trim the trailing slash
    $path = preg_replace("|^(.+?)/*$|", "\\1", $path);

    if (!$current_dir = @opendir($path)) {
      return;
    }

    while (FALSE !== ($filename = @readdir($current_dir))) {
      if ($filename != "." and $filename != ".." and $filename != "sample.jpg") {
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

  function _createAuthTables($forge) {
    $forge->drop_table('roles');
    $forge->add_field('id');
    $forge->add_field(array('name' => array('type' => 'VARCHAR', 'constraint' => 32, 'null' => false)));
    $forge->add_field(array('description' => array('type' => 'VARCHAR', 'constraint' => 255, 'null' => false)));
    $forge->create_table('roles');

    $forge->drop_table('roles_users');
    $forge->add_field(array('user_id' => array('type' => 'INT', 'constraint' => 10, 'null' => false)));
    $forge->add_field(array('role_id' => array('type' => 'INT', 'constraint' => 10, 'null' => false)));
    $forge->add_primaryKey(array('user_id', 'role_id'));
    $forge->add_key('fk_role_id', 'role_id');
    $forge->create_table('roles_users');

    $forge->drop_table('users');
    $forge->add_field('id');
    $forge->add_field(array('email' => array('type' => 'VARCHAR', 'constraint' => 127, 'null' => false)));
    $forge->add_field(array('username' => array('type' => 'VARCHAR', 'constraint' => 32, 'null' => false, 'default' => '')));
    $forge->add_field(array('password' => array('type' => 'CHAR', 'constraint' => 50, 'null' => false)));
    $forge->add_field(array('logins' => array('type' => 'INT', 'constraint' => 10, 'null' => false, 'default' => 0)));
    $forge->add_field(array('last_login' => array('type' => 'INT', 'constraint' => 10)));
    $forge->add_key('uniq_username', 'username', true);
    $forge->add_key('uniq_email', 'email', true);
    $forge->create_table('users');

    $forge->drop_table('user_tokens');
    $forge->add_field('id');
    $forge->add_field(array('user_id' => array('type' => 'INT', 'constraint' => 11, 'null' => false)));
    $forge->add_field(array('user_agent' => array('type' => 'VARCHAR', 'constraint' => 40, 'null' => false)));
    $forge->add_field(array('token' => array('type' => 'VARCHAR', 'constraint' => 32, 'null' => false)));
    $forge->add_field(array('created' => array('type' => 'INT', 'constraint' => 10, 'null' => false)));
    $forge->add_field(array('expires' => array('type' => 'INT', 'constraint' => 10, 'null' => false)));
    $forge->add_key('uniq_token', 'token', true);
    $forge->add_key('fk_user_id', 'user_id');
    $forge->create_table('user_tokens');

    //$forge->add_foreignKey(`user_id, array('user', 'id'), 'CASCADE');
    //$forge->add_foreignKey(`role_id, array('role', 'id'), 'CASCADE');

    //$forge->add_foreignKey(`user_id, array('user', 'id'), 'CASCADE');

//ALTER TABLE `roles_users`
//  ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
//  ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
//
//ALTER TABLE `user_tokens`
//  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
  }
}
