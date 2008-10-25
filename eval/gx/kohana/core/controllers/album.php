<?php
class Album_Controller extends Gallery_Controller {
  // Set the name of the template to use
  public $template = 'templates/base.html';

  public function View($id) {
    $item = ORM::factory('item', $id);
    if (empty($item->id)) {
      return Kohana::show_404();
    }

    $this->template->header->item = $item;
    $this->template->header->active = "Browse Photos";
    $this->template->content = new View('album_view.html');
    $this->template->content->maxRows = 3;
    $this->template->content->maxColumns = 3;
    $this->template->content->children = $item->children;
    $this->template->content->item = $item;
  }

  public function Add($id) {
    $item = ORM::factory('item', $id);

    $this->template->content = new View('album_add.html');
    $this->template->content->item = $item;
    $this->template->header->item = $item;
    $this->template->header->active = "Upload New Photos";

    // @todo:
    // We can be adding a photo or an album here, so we should check to see what
    // the type is.
    if (request::method() == 'post') {
      $_FILES = Validation::factory($_FILES)
	->add_rules('image', 'upload::valid', 'upload::type[gif,jpg,png]', 'upload::size[1M]');

      $_POST = Validation::factory()
	->add_rules('name', 'valid::alpha_dash');

      if (!$_FILES->validate()) {
	return $this->template->content->error = 'Invalid File format';
      }

      if (!$_POST->validate()) {
	return $this->template->content->error = 'Invalid Characters in Name';
      }

      try {
	$temp = upload::save('image', $_FILES['image']['name']);
	photo::create($temp, $_POST['name'], 1);
	$this->template->content->success = basename($temp) . " was added.";
      } catch (Exception $e) {
	$this->template->content->error = $e;
      }
      if (isset($temp) && file_exists($temp)) {
	unlink($temp);
      }
    }
  }
}
?>