<?php defined('SYSPATH') or die('No direct script access.');
class Album_Core {
  static function create($title, $path, $parentId) {
    $album = ORM::factory('item');
    $album->type = "album";
    $album->title = $title;
    $album->path = $path;
    $album->parent_id = $parentId;

    if ($parentId == 0) {
      // Special case for the root album, used only for the initial install
      // It probably shouldn't be in the API at all.
      $album->lft = 1;
      $album->rgt = 2;
      $album->level = 0;
      $album->save();
    } else {
      $album = $album->parent->add_child($album);
    }
    return $album;
  }
}
?>