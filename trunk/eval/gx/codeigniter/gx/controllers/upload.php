<?php
class Upload extends Controller {

    function Upload() {
	parent::Controller();
	$this->load->helper(array('form'));
    }

    function index() {
	$this->load->view('upload', array('error' => ' '));
    }

    function store() {
	$config['upload_path'] = APPPATH . 'tmp';
	$config['allowed_types'] = 'gif|jpg|png';
	$config['max_size']= '4000000';
	$config['max_width']  = '1024';
	$config['max_height']  = '768';

	$this->load->library('upload', $config);

	if (!$this->upload->do_upload('image')) {
	    return $this->load->view('upload', array('error' => $this->upload->display_errors()));
	}

	$this->load->model('photomodel');
	$data = $this->upload->data();

	$config = array('width' => 200, 'height' => 140, 'source_image' => $data['full_path']);
	$this->load->library('image_lib', $config);
	if (!$this->image_lib->resize()) {
	    return $this->load->view(
		'upload', array('error' => $this->image_lib->display_errors()));
	}

	$this->photomodel->insert(
	    $data['full_path'],
	    $this->input->post('name'));
	redirect('album');
    }
}
?>