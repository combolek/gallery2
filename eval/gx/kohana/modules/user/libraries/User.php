<?php defined('SYSPATH') or die('No direct script access.');
class User_Core {
  static function Reset() {
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

  static function Populate() {
      $user = ORM::factory('user');
      $user->email = "admin@gx.com";
      $user->username = "admin";
      $user->password = 'admin';
      $user->logins = 0;
      $user->last_login = 1224873607;
      $user->save();

      $login = ORM::factory('role');
      $login->name = 'login';
      $login->description = 'Login privileges, granted after account confirmation';
      $login->save();

      $admin = ORM::factory('role');
      $admin->name = 'admin';
      $admin->description = 'Administrative user, has access to everything.';
      $admin->save();

      Database::instance('default')->query(
	"INSERT INTO `roles_users` (`user_id`,`role_id`) VALUES ({$user->id},{$login->id});");
      Database::instance('default')->query(
	"INSERT INTO `roles_users` (`user_id`,`role_id`) VALUES ({$user->id},{$admin->id});");
      print html::anchor("data/reset", "reset");
  }
}
?>