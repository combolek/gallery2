<?php defined('SYSPATH') or die('No direct script access.');
class Photo_Core {
  static function create($filename, $title, $parent_id) {
    $item = ORM::factory('item');
    $item->type = ItemType::Photo;
    $item->title = $title;
    $item->path = basename($filename);

    // Conflict?  Rename the file to a random number
    $retries = 100;
    while (ORM::Factory('item')
	   ->where('parent_id', $parent_id)
	   ->where('path', $item->path)
	   ->find()->id) {
      $pi = pathinfo(basename($filename));
      $item->path = rand() . "." . $pi['extension'];
      if (!$retries--) {
	throw new Exception("CONFLICT");
      }
    }

    $item->parent_id = $parent_id;
    $image = Image::factory($filename);
    $image->save(DOCROOT . item::url($item));

    $item->parent->add_child($item);
    $image->resize(200, 140, Image::WIDTH)
      ->save(DOCROOT . "var/thumbnails/{$item->id}.jpg");

    return $item;
  }
}
