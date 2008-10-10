<?php 
/* SVN FILE: $Id$ */
/* App schema generated on: 2008-10-10 01:10:22 : 1223625862*/
class AppSchema extends CakeSchema {
	var $name = 'App';

	function before($event = array()) {
		return true;
	}

	function after($event = array()) {
	}

	var $photos = array(
			'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 9, 'key' => 'primary'),
			'title' => array('type' => 'string', 'null' => true, 'default' => NULL, 'length' => 128),
			'path' => array('type' => 'string', 'null' => true, 'default' => NULL, 'length' => 128),
			'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
		);
}
?>