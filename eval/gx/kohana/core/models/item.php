<?php defined('SYSPATH') or die('No direct script access.');
class Item_Model extends ORM_MPTT {
  protected $children = 'items';
}
?>