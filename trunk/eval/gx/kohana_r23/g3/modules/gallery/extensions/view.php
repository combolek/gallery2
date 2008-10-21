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
 * @package Gallery
 * Extends the standard view to enable themes
 */
class View extends View_Core {
    private static $themePath = null;

    public function __construct($name = NULL, $data = NULL, $type = NULL) {
	if (empty(View::$themePath)) {
	    $gallery = Gallery::instance();

	    /* Dynamically add the current theme to front of the modules list */
	    $modules = Kohana::config('core.modules');
	    View::$themePath = APP_THEME_PATH . $gallery->theme;
	    array_unshift($modules, View::$themePath);
	    Kohana::config_set('core.modules', $modules);
	}
	parent::__construct($name, $data, $type);
    }
}