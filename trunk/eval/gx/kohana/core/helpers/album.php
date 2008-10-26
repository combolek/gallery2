<?php defined('SYSPATH') or die('No direct script access.');
class Album_Core {
  static function create($title, $path, $parent_id) {
    $pre_existing = ORM::factory('item')->where('parent_id', $parent_id)
      ->where('path', $path)->find();

    if ($pre_existing->id) {
      throw new Exception('ALREADY EXISTS');
    }

    $album = ORM::factory('item');
    $album->type = "album";
    $album->title = $title;
    $album->path = $path;
    $album->parent_id = $parent_id;

    if ($parent_id == 0) {
      // Special case for the root album, used only for the initial install
      // It probably shouldn't be in the API at all.
      $album->lft = 1;
      $album->rgt = 2;
      $album->level = 0;
      $album->save();
    } else {
      $album = $album->parent->add_child($album);
      mkdir(DOCROOT . item::url($album));
      copy(DOCROOT . 'core/test/album_placeholder.jpg', VARPATH . "thumbnails/{$album->id}.jpg");
    }
    return $album;
  }
}
?>