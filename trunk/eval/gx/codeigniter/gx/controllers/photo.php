<?php
class Photo extends Controller {

    function Photo() {
	parent::Controller();
    }

    function view($id) {
	$this->load->model('photomodel');
	$photo = $this->photomodel->get_by_id($id);
	$this->load->view('photo', array('photo' => $photo));
    }
}
?>