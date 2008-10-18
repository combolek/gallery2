<?php
/*
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

/**
 * @package  Gallery
 */
class Controller_Gallery extends Controller_Template {

    // Template view name
    public $template = 'templates/layout';

    public function __construct() {
	parent::__construct();

	$gallery = Gallery::instance();

	// Set the default heading and footer
	$this->template->header = new View('templates/header');
	$this->template->header->title = $gallery->title;

	$this->template->sidebar = new View('templates/sidebar');
	$this->template->footer = new View('templates/footer');
    }

    public function __get($key) {
	if (isset($this->$key)) {
	    return $this->$key;
	}
    }

}
?>