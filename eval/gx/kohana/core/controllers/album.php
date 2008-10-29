<?php
class Album_Controller extends Gallery_Controller {
  // Set the name of the template to use
  public $template = "templates/base.html";

  public function View($id) {
    $item = ORM::factory("item", $id);
    if (empty($item->id)) {
      return Kohana::show_404();
    }

    $this->template->header->item = $item;
    $this->template->header->active = "Browse Photos";
    $this->template->header->path = $item->parent->path();
    $this->template->content = new View("album_view.html");
    $this->template->content->maxRows = 3;
    $this->template->content->maxColumns = 3;
    $this->template->content->children = $item->children;
    $this->template->content->item = $item;
  }

  public function AddPhoto($id) {
    $item = ORM::factory("item", $id);

    $this->template->content = new View("album_add.html");
    $this->template->content->item = $item;
    $this->template->header->item = $item;
    $this->template->header->active = "Upload New Photos";
    $this->template->header->path = $item->parent->path();

    $form = new Forge();
    $group = $form->group("Add Photo");
    $group->upload("image", true)->label('Image')->rules("required|allow[jpg,png,gif]");
    $group->input("title")->label('Title')->rules("length[0,255]");
    $group->submit("submit");
    $this->template->content->form = $form->set_attr('class', 'gExpandedForm');

    if (request::method() == "post" && $form->validate()) {
      try {
	$temp = $this->input->post('image');
	photo::create($temp, $_FILES['image']['name'], $item->id);
	$this->template->content->success = basename($temp) . " was added.";
      } catch (Exception $e) {
	$this->template->content->error = $e;
	Kohana::log('error', $e->getTraceAsString());
      }
      if (isset($temp) && file_exists($temp)) {
	unlink($temp);
      }
    }
  }

  public function AddAlbum($id) {
    $item = ORM::factory("item", $id);

    $this->template->content = new View("album_add.html");
    $this->template->content->item = $item;
    $this->template->header->item = $item;
    $this->template->header->active = "Create Album";
    $this->template->header->path = $item->parent->path();

    $form = new Forge();
    $group = $form->group("Add Album");
    $group->input("title")->label('Title')->rules("required|length[0,255]");
    $group->submit("submit");
    $this->template->content->form = $form->set_attr('class', 'gExpandedForm');

    if (request::method() == "post" && $form->validate()) {
      try {
	$album = album::create($_POST["title"], $_POST["title"], $item->id);
	$this->template->content->success = "$_POST[title] was added.";
      } catch (Exception $e) {
	$this->template->content->error = $e;
	Kohana::log('error', $e->getTraceAsString());
      }
    }
  }
}
?>