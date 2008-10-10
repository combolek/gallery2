<?php 
/* SVN FILE: $Id$ */
/* Photo Test cases generated on: 2008-10-10 01:10:51 : 1223625951*/
App::import('Model', 'Photo');

class TestPhoto extends Photo {
	var $cacheSources = false;
	var $useDbConfig  = 'test_suite';
}

class PhotoTestCase extends CakeTestCase {
	var $Photo = null;
	var $fixtures = array('app.photo');

	function start() {
		parent::start();
		$this->Photo = new TestPhoto();
	}

	function testPhotoInstance() {
		$this->assertTrue(is_a($this->Photo, 'Photo'));
	}

	function testPhotoFind() {
		$this->Photo->recursive = -1;
		$results = $this->Photo->find('first');
		$this->assertTrue(!empty($results));

		$expected = array('Photo' => array(
			'id'  => 1,
			'title'  => 'Lorem ipsum dolor sit amet',
			'path'  => 'Lorem ipsum dolor sit amet'
			));
		$this->assertEqual($results, $expected);
	}
}
?>