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
    $item->title .= "[m]";
    $item->title = preg_replace("/\[m\]\[m\]$/", "[m:2]", $item->title);
    $item->title = preg_replace("/\[m:(\d+)\]\[m\]/e", "'[m:'.\\1+1,']'", $item->title);
  }
}

