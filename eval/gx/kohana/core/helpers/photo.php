<?php defined('SYSPATH') or die('No direct script access.');
class Photo_Core {
  static function create($filename, $title, $parent_id) {
    $item = ORM::factory('item');
    $item->type = ItemType::Photo;
    $item->title = $title;
    $item->path = basename($filename);
    $item->parent_id = $parent_id;
    $item->parent->add_child($item);

    $image = Image::factory($filename);
    $image->save(DOCROOT . item::url($item));

    $image->resize(200, 140, Image::WIDTH)
      ->save(DOCROOT . "var/thumbnails/{$item->id}.jpg");
    $item->parent->add_child($item);

    return $item;
  }
}
