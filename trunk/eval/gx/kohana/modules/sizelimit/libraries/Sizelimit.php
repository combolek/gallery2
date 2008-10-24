<?php defined('SYSPATH') or die('No direct script access.');
/*
  * This will change the size and/or dimensions of the image,
  * but for now just changing the title will do
 */
class Sizelimit {
  static function presave() {
    $item = Event::$data;
    if (!($item instanceof Item_Model)) {
      return;
    }
    $title = $item->title;
    $title .= ' modified';
    $item->title = $title;
  }
}

