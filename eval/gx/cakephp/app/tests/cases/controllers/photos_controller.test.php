<?php 
/* SVN FILE: $Id$ */
/* PhotosController Test cases generated on: 2008-10-10 01:10:51 : 1223626011*/
App::import('Controller', 'Photos');

class TestPhotos extends PhotosController {
	var $autoRender = false;
}

class PhotosControllerTest extends CakeTestCase {
	var $Photos = null;

	function setUp() {
		$this->Photos = new TestPhotos();
		$this->Photos->constructClasses();
	}

	function testPhotosControllerInstance() {
		$this->assertTrue(is_a($this->Photos, 'PhotosController'));
	}

	function tearDown() {
		unset($this->Photos);
	}
}
?>