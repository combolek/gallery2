<?php 
/* SVN FILE: $Id$ */
/* Photo Fixture generated on: 2008-10-10 01:10:51 : 1223625951*/

class PhotoFixture extends CakeTestFixture {
	var $name = 'Photo';
	var $table = 'photos';
	var $fields = array(
			'id' => array('type'=>'integer', 'null' => false, 'default' => NULL, 'length' => 9, 'key' => 'primary'),
			'title' => array('type'=>'string', 'null' => true, 'default' => NULL, 'length' => 128),
			'path' => array('type'=>'string', 'null' => true, 'default' => NULL, 'length' => 128),
			'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1))
			);
	var $records = array(array(
			'id'  => 1,
			'title'  => 'Lorem ipsum dolor sit amet',
			'path'  => 'Lorem ipsum dolor sit amet'
			));
}
?>