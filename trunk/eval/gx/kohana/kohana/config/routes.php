<?php defined('SYSPATH') or die('No direct access allowed.');

$config['admin/([a-z]+)/(.*)'] = '$1/admin/$2';
/**
 * @package  Core
 *
 * Sets the default route to "welcome"
 */
$config['_default'] = 'show/1';

