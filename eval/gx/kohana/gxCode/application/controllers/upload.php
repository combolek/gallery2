<?php
class Upload_Controller extends Gallery_Controller {
    // Set the name of the template to use
    public $template = 'templates/jacob';

    public function Index() {
	// In Kohana, all views are loaded and treated as objects.
	$this->template->header->active = "Upload New Photos";
	$this->template->content = new View('upload_index');
    }
}
?>