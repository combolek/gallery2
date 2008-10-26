<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Enter Description Here
 * @package
 * @subpackage
 * @author Tim
 */
final class ItemType {
  const Album     = 'album';
  const Photo     = 'photo';

  // ensures that this class acts like an enum
  // and that it cannot be instantiated
  private function __construct(){}
}

class Item_Model extends ORM_MPTT {
  protected $children = 'items';
}
