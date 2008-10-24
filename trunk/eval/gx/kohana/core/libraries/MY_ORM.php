<?php defined('SYSPATH') or die('No direct script access.');
class ORM extends ORM_Core {
  public function save() {
    Event::run('item.pre_save', $this);
    parent::save();
  }
}
