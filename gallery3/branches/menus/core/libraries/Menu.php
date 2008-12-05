<?php defined("SYSPATH") or die("No direct script access.");
/**
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2008 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */
class Menu_Item {
  protected $_text;
  protected $_url;

  function __constructor($text, $url="#") {
    $this->_text = $text;
    $this->_url = $url;
  }

  function __toString() {
    return "<li><a href=\"$this->_url\">$this->_text</a></li>";
  }
}

class Menu_Core {
  protected $_text;
  protected $_url;
  protected $_items = array();

  public function __construct($text="", $url="#") {
    $this->_text = $text;
    $this->_url = $url;
  }

  public function append($menu_item) {
    $this->_items[] = $menu_item;
  }

  public function get($text) {
    foreach ($this->_items as $item) {
      if ($item->_text == $text) {
        return $item;
      }
    }
    return false;
  }

  public function insert_before($text, $menu_item) {
    $offset = (int)array_search($text, $this->_items);
    $this->_items = array_merge(array_splice($this->_items, 0, $offset-1),
                                array($menu_item),
                                array_splice($this->_items, $offset));
  }

  public function insert_after($text, $menu_item) {
    $offset = (int)array_search($text, $this->_items);
    $this->_items = array_merge(array_splice($this->_items, 0, $offset),
                                array($menu_item),
                                array_splice($this->_items, $offset+1));
  }

  public function __toString() {
    $items_html = array();
    if (!empty($this->_text)) {
      $items_html[] = "<li><a href=\"$this->_url\">$this->_text</a>";
    }

    if (!empty($this->_items)) {
//      $items_html[] = "<ul class=\"gItemMenu\">";
      $items_html[] = "<ul>";

      foreach ($this->_items as $item) {
        $items_html[] = $item->__toString();
      }

      $items_html[] = "</ul>";
    }

    if (!empty($this->_text)) {
      $items_html[] = "</li>";
    }
    return implode("\n", $items_html);
  }
}
