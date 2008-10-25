<?php defined('SYSPATH') or die('No direct script access.');
class Photo_Core {
  static function create($filename, $title, $parentId) {
    $image = Image::factory($filename);
    $image->save(DOCROOT .'var/images/'.basename($filename));
    $item = ORM::factory('item');
    $item->type = 'photo';
    $item->title = $title;
    $item->path = basename($filename);
    $item->parent_id = $parentId;
    $item->parent->add_child($item);
    $id = $item->id;
    $image->resize(200, 140, Image::WIDTH)
      ->save(DOCROOT .'var/thumbnails/'.$id.'.jpg');
    $item->parent->add_child($item);

    return $item;
  }
}
?>