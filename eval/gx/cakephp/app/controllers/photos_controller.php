<?php
define('FILES', dirname(dirname(__FILE__)) . '/webroot/files');

class PhotosController extends AppController {
    var $name = 'Photos';
    var $helpers = array('Html', 'Form');

    function index() {
	$this->Photo->recursive = 0;
	$this->set('photos', $this->paginate());
	$this->pageTitle = "John Doe's Gallery";
    }

    function view($id = null) {
	if (!$id) {
	    $this->Session->setFlash(__('Invalid Photo.', true));
	    $this->redirect(array('action'=>'index'));
	}
	$this->set('photo', $this->Photo->read(null, $id));
	$this->pageTitle = $this->viewVars['photo']['Photo']['title'];
    }

    function add() {
	if (!empty($this->data)) {
	    $title = $this->data['photos']['title'];
	    $name = $this->data['photos']['image']['name'];
	    rename($this->data['photos']['image']['tmp_name'], FILES . '/' . $name);
	    if ($this->Photo->save(array('title' => $title, 'path' => $name))) {
		$this->flash('The Photo has been saved', '/photos');
	    } else {
		$this->flash('The Photo could not be saved. Please, try again.', '/photos/add');
	    }
	}
    }
}
?>