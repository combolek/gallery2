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
class UserDB {
	
	function UserDB() {
		global $app;

		if (!file_exists($app->userDir)) {
			if (!mkdir($app->userDir, 0777)) {
				error("Unable to create dir: $app->userDir");
			}
		} else {
			if (!is_dir($app->userDir)) {
				error("$app->userDir exists, but is not a directory!");
			}
		}
	}

	function getUser($username) {
		global $app;

		if (file_exists("$app->userDir/$username")) {
			$user = new User();
			$user->load($username);
			return $user;
		}
	}

	function getOrCreateUser($username) {
		$user = $this->getUser($username);
		if (!$user) {
			$user = new User();
			$user->setUsername($username);
		}
		return $user;
	}

	function deleteUser($username) {
		global $app;

		if (file_exists("$app->userDir/$username")) {
			return unlink("$app->userDir/$username");
		}

		return 0;
	}

	function getUserList() {
		global $app;
		
		$userList = array();
		if ($fd = opendir($app->userDir)) {
			while ($file = readdir($fd)) {
				if (is_dir($file)) {
					continue;
				}

				array_push($userList, $file);
			}
		}

		sort($userList);
		return $userList;
	}

	function validNewUsername($username) {

		if (strlen($username) < 3) {
			return "Username must be at least 3 characters";
		}

		if (preg_match("/[^A-Za-z0-9]/", $username)) {
			return "Username must contain only letters or digits";
		}

		$user = $this->getUser($username);
		if ($user) {
			return "A user with the username of <i>$username</i> already exists";
		}

		return null;
	}

	function validPassword($password) {
		if (strlen($password) < 3) {
			return "Password must be at least 3 characters";
		}

		return null;
	}
}

?>
