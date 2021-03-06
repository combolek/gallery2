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
class Data_Controller extends Controller {
  function Index() {
    print "<title>Gx Scaffolding</title>";
    print "<h1>Scaffolding</h1>";
    print "<h2>Reset/Populate</h2>";


    foreach (array("core", "Comment", "User") as $module) {
      print html::anchor("data/reset/$module", "reset $module");
      print " | ";
      print html::anchor("data/populate/$module", "populate $module");
      print "<br/>";
    }

    print "<h2>Useful Links and Tools</h2>";
    print html::anchor("", "browse gx");
    print "<br/>";
    print "add ";
    foreach (array(1, 10, 50, 100, 500, 1000) as $count) {
      print html::anchor("data/overpopulate/$count", "$count");
      print ", ";
    }
    print " photos and albums";
    print "<br/>";
    print "show tree: ";
    print html::anchor("data/graph&type=text", "(text)");
    print " ";
    print html::anchor("data/graph", "(graph)");
    print " <i>(requires /usr/bin/dot from the graphviz package)</i>";
    print "<br/>";

    try {
      // If the database hasn't been initialized then this should fail and we won't print
      // this section.
      if (array_key_exists("use_profiler", $this->input->get())) {
	Session::instance()->set("use_profiler", $this->input->get("use_profiler", false));
	return url::redirect("data/index");
      }

      print "profiler: ";

      if (Session::instance()->get("use_profiler", false)) {
	print "on ";
	print html::anchor("data&use_profiler=0", "(turn off)");
      } else {
	print "off ";
	print html::anchor("data&use_profiler=1", "(turn on)");
      }
    } catch (Exception $e) {
    }
    print "<br/>";

    print "interesting: ";
    foreach (array("album", "photo") as $type) {
      $deepest = ORM::factory("item")
	->where("type", $type)
	->orderby("level", "desc")
	->find();
      if ($deepest->loaded) {
	print html::anchor("$type/{$deepest->id}", "deepest $type");
	print " ({$deepest->level} levels) ";
      } else {
	print "<i>(no ${type}s)</i> ";
      }
    }

    print "<h2>Concurrency/Performance Tools</h2>";
    print "reset: ";
    foreach (array("with-mptt-indices", "without-mptt-indices") as $arg) {
      print html::anchor("data/concurrency/reset/$arg", "$arg");
      print ", ";
    }
    print "<br/>";

    print "populate: ";
    foreach (array(8, 10, 12, 14, 16) as $depth) {
      print html::anchor("data/concurrency/populate/$depth", pow(2, $depth));
      print ", ";
    }
    print "<br/>";

    print "shifts: ";
    foreach (array(4, 16, 128, 1024) as $count) {
      print html::anchor("data/concurrency/shift/$count", "$count");
      print ", ";
    }
    print "<br/>";

    print "views: ";
    foreach (array(1, 10, 100, 1000) as $count) {
      print html::anchor("data/concurrency/view/$count", "$count");
      print ", ";
    }
    print "<br/>";

    print "scans: ";
    foreach (array(1, 10, 100, 1000) as $count) {
      print html::anchor("data/concurrency/scan/$count", "$count");
      print ", ";
    }
  }

  function Graph() {
    $items = ORM::factory("item")->orderby("id")->find_all();
    $data = "digraph G {\n";
    foreach ($items as $item) {
      $data .= "  $item->parent_id -> $item->id\n";
      $data .= "  $item->id [label=\"$item->id <$item->lft, $item->rgt>\"]\n";
    }
    $data .= "}\n";

    if ($this->input->get("type") == "text") {
      print "<pre>$data";
    } else {
      $proc = proc_open("/usr/bin/dot -Tsvg",
			array(array("pipe", "r"),
			      array("pipe", "w")),
			$pipes,
			VARPATH . "tmp");
      fwrite($pipes[0], $data);
      fclose($pipes[0]);

      header("Content-Type: image/svg+xml");
      print(stream_get_contents($pipes[1]));
      fclose($pipes[1]);
      proc_close($proc);
    }
  }

  function Reset($module) {
    if ($module == "core") {
      $db = Database::instance("default");
      $db->query("DROP TABLE IF EXISTS `items`;");

      $db->query("CREATE TABLE  `items` (
              `id` int(9) NOT NULL auto_increment,
              `type` char(32) default NULL,
              `title` char(255) default NULL,
              `path` char(255) default NULL,
              `parent_id` int(9) default NULL,
              `level` int(9) default NULL,
              `lft` int(9) default NULL,
              `rgt` int(9) default NULL,
              PRIMARY KEY  (`id`),
              KEY `parent_id` (`parent_id`),
              KEY `type` (`type`))
            ENGINE=InnoDB DEFAULT CHARSET=utf8;");

      $db->query("DROP TABLE IF EXISTS `sessions`;");
      $db->query("CREATE TABLE sessions (
                  session_id VARCHAR(127) NOT NULL,
                  last_activity INT(10) UNSIGNED NOT NULL,
                  data TEXT NOT NULL,
                  PRIMARY KEY (session_id))
            ENGINE=InnoDB DEFAULT CHARSET=utf8;");

      $this->_delete_files(DOCROOT . "var/images/", true);
      $this->_delete_files(DOCROOT . "var/thumbnails/", true);
    } else {
      call_user_func(array($module, "Reset"));
    }
    url::redirect("data/index");
  }

  function Populate($module) {
    if ($module == "core") {
      $album = album::create("John Doe's Gallery", "", 0);
      $photo = photo::create(DOCROOT . "core/test/sample.jpg", "GX Sprint!", $album->id);
    } else {
      call_user_func(array($module, "Populate"));
    }
    url::redirect("data/index");
  }

  function OverPopulate($count) {
    srand(time());
    $parents = ORM::factory("item")->where("type", "album")->find_all()->as_array();
    for ($i = 0; $i < $count; $i++) {
      $parent = $parents[array_rand($parents)];
      switch(rand(0, 1)) {
      case 0:
	$album = album::create("Rnd $i", "rnd_" . rand(), $parent->id);
	$parents[] = $album;
	break;

      case 1:
	photo::create(DOCROOT . "core/test/sample.jpg", "rnd_" . rand(), $parent->id);
	break;
      }

      print "$i ";
      if (!($i % 100)) {
	set_time_limit(30);
      }
    }
    print "<br/>";
    print html::anchor("data", "return to scaffold");
  }

  function Concurrency($action, $arg=null) {
    $db = Database::instance("default");
    switch($action) {
    case "reset":
      $db->query("DROP TABLE IF EXISTS `concurrency`");
      switch ($arg) {
      case "with-mptt-indices":
	$db->query("CREATE TABLE `concurrency` (
		   `id` int(11) NOT NULL,
		   `parent_id` int(11) NOT NULL,
		   `level` int(11) NOT NULL,
		   `lft` int(11) NOT NULL,
		   `rgt` int(11) NOT NULL,
		   PRIMARY KEY  (`id`),
		   KEY `mptt` (`lft`,`rgt`)
		   ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
	break;

      default:
      case "without-mptt-indices":
	$db->query("CREATE TABLE `concurrency` (
		   `id` int(11) NOT NULL,
		   `parent_id` int(11) NOT NULL,
		   `level` int(11) NOT NULL,
		   `lft` int(11) NOT NULL,
		   `rgt` int(11) NOT NULL,
		   PRIMARY KEY  (`id`)
		   ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
      }
      break;

    case "populate":
      $GLOBALS["max_id"] = 1;
      $GLOBALS["ptr"] = 1;
      $tree = $this->_create_tree(null, $arg);
      $this->_set_mptt_pointers($tree);

      $this->_walk_tree($tree, $values);
      if (count($values)) {
	$db->query("INSERT INTO `concurrency` (id, parent_id, level, lft, rgt) VALUES " .
		   join(",", $values));
      }
      break;

    case "shift":
      for ($i = 1; $i <= $arg / 4; $i++) {
	$db->query("UPDATE `concurrency` SET lft=lft+$i WHERE lft>1");
	$db->query("UPDATE `concurrency` SET rgt=rgt+$i WHERE lft>1");
	$db->query("UPDATE `concurrency` SET lft=lft-$i WHERE lft>1");
	$db->query("UPDATE `concurrency` SET rgt=rgt-$i WHERE lft>1");
      }
      break;

    case "view":
      $count = $db->query("SELECT COUNT(*) AS C FROM `concurrency`")->current()->C;
      for ($i = 1; $i <= $arg; $i++) {
	$db->query("SELECT * FROM `concurrency` WHERE id=" . rand(1, $count));
      }
      break;

    case "scan":
      $count = $db->query("SELECT COUNT(*) AS C FROM `concurrency`")->current()->C;
      for ($i = 1; $i <= $arg; $i++) {
	$db->query("SELECT * FROM `concurrency` WHERE lft >= " . rand(1, $count));
      }
      $profiler = new Profiler();
      break;
    }

    $profiler = new Profiler();
    print $profiler->render();
  }

  function _walk_tree($node, &$values) {
    if (!$node) {
      return;
    }
    $values[] = "($node->id, $node->parent_id, $node->level, $node->left_ptr, $node->right_ptr)";
    $this->_walk_tree($node->left, $values);
    $this->_walk_tree($node->right, $values);

    if (count($values) > 1024) {
      Database::instance()->query(
	"INSERT INTO `concurrency` (id, parent_id, level, lft, rgt) VALUES " .
	join(",", $values));
      $values = array();
    }
  }

  function _set_mptt_pointers($node) {
    $node->left_ptr = $GLOBALS["ptr"]++;
    if ($node->left) {
      $this->_set_mptt_pointers($node->left);
    }
    if ($node->right) {
      $this->_set_mptt_pointers($node->right);
    }
    $node->right_ptr = $GLOBALS["ptr"]++;
  }

  function _create_tree($parent, $maxDepth) {
    $node = new stdClass();
    if ($parent) {
      if ($parent->level == $maxDepth) {
	return null;
      }
      $node->parent_id = $parent->id;
      $node->level = $parent->level + 1;
    } else {
      $node->parent_id = 0;
      $node->level = 1;
    }
    $node->id = $GLOBALS["max_id"]++;
    $node->left = $this->_create_tree($node, $maxDepth);
    $node->right = $this->_create_tree($node, $maxDepth);
    return $node;
  }

  function _delete_files($path, $del_dir = FALSE, $level = 0) {
    // Trim the trailing slash
    $path = preg_replace("|^(.+?)/*$|", "\\1", $path);

    if (!$current_dir = @opendir($path)) {
      return;
    }

    while (FALSE !== ($filename = @readdir($current_dir))) {
      if ($filename != "." and $filename != ".." and $filename != "sample.jpg") {
        if (is_dir($path."/".$filename)) {
          // Ignore empty folders
          if (substr($filename, 0, 1) != ".") {
            $this->_delete_files($path."/".$filename, $del_dir, $level + 1);
          }
        } else {
          unlink($path."/".$filename);
        }
      }
    }
    @closedir($current_dir);

    if ($del_dir == TRUE AND $level > 0) {
      @rmdir($path);
    }
  }
}
