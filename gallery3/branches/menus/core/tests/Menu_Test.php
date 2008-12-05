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
class Menu_Test extends Unit_Test_Case {
  public function find_menu_item_test() {
    $test_menu = new Menu();
    $test_menu->append(new Menu("test1"));
    $test_menu->append(new Menu("test2"));
    $expected = new Menu("test3");
    $test_menu->append($expected);
    $test_menu->append(new Menu("test4"));

    $menu_item = $test_menu->get("test3");
    $this->assert_equal($expected, $menu_item);
  }
}