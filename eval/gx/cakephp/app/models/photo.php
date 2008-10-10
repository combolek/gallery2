<?php
class Photo extends AppModel {
	var $name = 'Photo';
	var $validate = array(
	    'title' => array('notEmpty'),
	    'path' => array('notEmpty')
	    );
}
?>