<?php
class Album extends Controller {

    function Album() {
	parent::Controller();
    }

    function index() {
	$this->load->model('photomodel');
	$photos = $this->photomodel->get_set(10);
	$this->load->view('album', array('photos' => $photos));
    }
}
?>