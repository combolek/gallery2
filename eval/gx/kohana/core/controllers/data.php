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
    print html::anchor("", "browse gx");
  }

  function Reset($module) {
    if ($module == 'core') {
      $db = Database::instance('default');
      $db->query('DROP TABLE IF EXISTS `items`;');

      $db->query('CREATE TABLE  `gx_eval_kohana`.`items` (
              `id` int(9) NOT NULL auto_increment,
              `type` char(32) default NULL,
              `title` char(255) default NULL,
              `path` char(255) default NULL,
              `parent_id` int(9) default NULL,
              `level` int(9) default NULL,
              `lft` int(9) default NULL,
              `rgt` int(9) default NULL,
              PRIMARY KEY  (`id`))
            ENGINE=InnoDB DEFAULT CHARSET=utf8;');

      $this->_createAuthTables();

      $db->query('DROP TABLE IF EXISTS `sessions`;');
      $db->query('CREATE TABLE sessions (
                  session_id VARCHAR(127) NOT NULL,
                  last_activity INT(10) UNSIGNED NOT NULL,
                  data TEXT NOT NULL,
                  PRIMARY KEY (session_id))
            ENGINE=InnoDB DEFAULT CHARSET=utf8;');

      $this->_delete_files(DOCROOT . 'var/images/', true);
    } else {
      call_user_func(array($module, "Reset"));
    }
    url::redirect('data/index');
  }

  function Populate($module) {
    if ($module == 'core') {
      $album = album::create("John Doe's Gallery", "", 0);
      $photo = photo::create(DOCROOT . 'core/test/sample.jpg', "GX Sprint!", $album->id);

      $item = ORM::factory('user');
      $item->id = 1;
      $item->email = "admin@gx.com";
      $item->username = "admin";
      $item->password = 'admin';
      $item->logins = 0;
      $item->last_login = 1224873607;
      $item->save();

      $roles = ORM::factory('role');
      $roles->name = 'login';
      $roles->description = 'Login privileges, granted after account confirmation';
      $roles->save();

      $roles = ORM::factory('role');
      $roles->name = 'admin';
      $roles->description = 'Administrative user, has access to everything.';
      $roles->save();

      Database::instance('default')->query(
         'INSERT INTO `roles_users` (`user_id`,`role_id`) VALUES (1,1);');

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

  function _createAuthTables() {
    $db = Database::instance('default');

    $db->query('DROP TABLE IF EXISTS `roles_users`;');
    $db->query('CREATE TABLE IF NOT EXISTS `roles_users` (
                `user_id` int(10) unsigned NOT NULL,
                `role_id` int(10) unsigned NOT NULL,
                PRIMARY KEY  (`user_id`,`role_id`),
                KEY `fk_role_id` (`role_id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;');

    $db->query('DROP TABLE IF EXISTS `user_tokens`;');
    $db->query('CREATE TABLE IF NOT EXISTS `user_tokens` (
                  `id` int(11) unsigned NOT NULL auto_increment,
                  `user_id` int(11) unsigned NOT NULL,
                  `user_agent` varchar(40) NOT NULL,
                  `token` varchar(32) NOT NULL,
                  `created` int(10) unsigned NOT NULL,
                  `expires` int(10) unsigned NOT NULL,
                  PRIMARY KEY  (`id`),
                  UNIQUE KEY `uniq_token` (`token`),
                  KEY `fk_user_id` (`user_id`)
                ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;');

    $db->query('DROP TABLE IF EXISTS `roles`;');
    $db->query('CREATE TABLE  `roles` (
              `id` int(11) unsigned NOT NULL auto_increment,
              `name` varchar(32) NOT NULL,
              `description` varchar(255) NOT NULL,
              PRIMARY KEY  (`id`),
              UNIQUE KEY `uniq_name` (`name`))
            ENGINE=InnoDB DEFAULT CHARSET=utf8;');

    $db->query('DROP TABLE IF EXISTS `users`;');
    $db->query('CREATE TABLE IF NOT EXISTS `users` (
                `id` int(11) unsigned NOT NULL auto_increment,
                `email` varchar(127) NOT NULL,
                `username` varchar(32) NOT NULL default \'\',
                `password` char(50) NOT NULL,
                `logins` int(10) unsigned NOT NULL default \'0\',
                `last_login` int(10) unsigned,
                PRIMARY KEY  (`id`),
                UNIQUE KEY `uniq_username` (`username`),
                UNIQUE KEY `uniq_email` (`email`)
              ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;');

    $db->query('ALTER TABLE `roles_users`
                    ADD CONSTRAINT `roles_users_ibfk_1` FOREIGN KEY (`user_id`)
                        REFERENCES `users` (`id`) ON DELETE CASCADE,
                    ADD CONSTRAINT `roles_users_ibfk_2` FOREIGN KEY (`role_id`)
                        REFERENCES `roles` (`id`) ON DELETE CASCADE;');

    $db->query('ALTER TABLE `user_tokens`
                    ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`)
                        REFERENCES `users` (`id`) ON DELETE CASCADE;');
  }
}
