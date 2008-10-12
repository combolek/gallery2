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

class Gallery_Core {

    // Gallery instance
    protected static $instance;

    // Session instance
    protected $session;

    // Configuration
    protected $config;

    protected $original;

    protected $dirty = false;

    public static function instance($config = array()) {
	if (empty(Gallery::$instance)) {
	    // Create our instance
	    Gallery::$instance = new Gallery($config);
	}

	return Gallery::$instance;
    }

    /**
     * Loads The gallery module
     *
     * @return  void
     */
    public function __construct($config = array()) {
	// Append default auth configuration
	$config +=Kohana::config('gallery');

	$this->config = $this->original = $config;

	// Enable cache saving
	Event::add('system.shutdown', array(__CLASS__, 'save_config'));
    }

    public function __get($key) {
	if (isset($this->config[$key])) {
	    return $this->config[$key];
	}
    }

    public function __set($key, $value) {
	$this->config[$key] = $value;
	$dirty = true;
    }

    public function save_config() {
    }
}
