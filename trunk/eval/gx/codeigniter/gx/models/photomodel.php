<?php
class PhotoModel extends Model {
    var $title        = '';
    var $path         = '';

    function PhotoModel () {
	parent::Model();
    }

    function get_set($count) {
	$query = $this->db->get('photo', $count);
	return $query->result();
    }

    function get_by_id($id) {
	$query = $this->db->get_where('photo', array('id' => $id));
	return $query->row();
    }

    function insert($path, $title) {
	$this->title = $this->input->post('title');
	$this->path = basename($path);
	rename($path, APPPATH . 'data/' . $this->path);
	$this->db->insert('photo', $this);
    }
}
?>