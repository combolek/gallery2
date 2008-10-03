<?php
class Upload_Controller extends Gallery_Controller {
    // Set the name of the template to use
    public $template = 'templates/jacob';

    public function Index() {
	// In Kohana, all views are loaded and treated as objects.
	$this->template->header->active = "Upload New Photos";
	$this->template->content = new View('upload_index');
    }

    public function Store() {
	$this->template->header->active = "Upload New Photos";
	$this->template->content = new View('upload_index');

	$_FILES = Validation::factory($_FILES)
		->add_rules('image', 'upload::valid', 'upload::type[gif,jpg,png]', 'upload::size[1M]');

	$_POST = Validation::factory()
		->add_rules('name', 'valid::alpha_dash');

	$fileValid = $_FILES->validate();
	$nameValid = $_POST->validate();
	if ($fileValid && $nameValid) {
	    echo "It validated<br/>";
	    // Temporary file name
	    $filename = upload::save('image', $_FILES['image']['name']);

	    // Resize, sharpen, and save the image
	    Image::factory($filename)
		->resize(200, 140, Image::WIDTH)
		->save(DOCROOT.'images/'.basename($filename));
	    $item = ORM::factory('item');
	    $item->Name = $_POST['name'];
	    $item->Path = basename($filename);
	    $item->Parent = 1;
	    $item->save();

	    // Remove the temporary file
	    unlink($filename);
	    $this->template->content->success = basename($filename) . " was added.";
	} else {
	    if (empty($fileValid)) {
		$this->template->content->error = 'Invalid File format';
	    } else {
		$this->template->content->error = 'Invalid Characters in Name';
	    }
	}
    }
}
?>