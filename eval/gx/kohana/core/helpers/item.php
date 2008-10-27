<?php defined('SYSPATH') or die('No direct script access.');
class Item_Core {
  static function url($item) {
    $path = 'var/images';
    foreach ($item->path() as $i) {
      if ($i->id > 1) {
	$path .=  "/{$i->path}";
      }
    }
    if (!$item->saved) {
      $path .= "/$item->path";
    }
    return $path;
  }
}
?>