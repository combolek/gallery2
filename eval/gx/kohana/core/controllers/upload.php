<?php
class Upload_Controller extends Gallery_Controller {
  // Set the name of the template to use
  public $template = 'templates/base';

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
      try {
	// Temporary file name
	$filename = upload::save('image', $_FILES['image']['name']);
	photo::store($filename, $_POST['name'], 1);
	$this->template->content->success = basename($filename) . " was added.";
      } catch (Exception $e) {
	$this->template->content->error = $e;
      }
      if (isset($filename) && file_exists($filename)) {
	unlink($filename);
      }
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