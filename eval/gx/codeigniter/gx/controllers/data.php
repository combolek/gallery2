<?php
class Data extends Controller {

    function Data() {
	parent::Controller();
    }

    function reset() {
	$this->load->dbforge();
	$this->dbforge->drop_table('photo');

	$this->dbforge->add_field('id');
	$this->dbforge->add_field(
	    array('title' => array('type' => 'VARCHAR', 'constraint' => 128)));
	$this->dbforge->add_field(
	    array('path' => array('type' => 'VARCHAR', 'constraint' => 128)));
	$this->dbforge->create_table('photo');

	$this->load->helper('file');
	delete_files(APPPATH . 'data/', true);
	delete_files(APPPATH . 'tmp/', true);
    }
}
?>
