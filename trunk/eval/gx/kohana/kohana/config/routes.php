<?php defined('SYSPATH') or die('No direct access allowed.');

$config['admin/([a-z]+)(/(.*))?'] = 'admin_$1/$3';
$config['(\w+)/(\d+)/(add.*|delete|update|view)'] = '$1/$3/$2';
$config['(\w+)/(\d+)'] = '$1/view/$2';

/**
 * @package  Core
 *
 * Sets the default route to "welcome"
 */
$config['_default'] = 'album/view/1';

