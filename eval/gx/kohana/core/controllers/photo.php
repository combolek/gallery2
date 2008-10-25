<?php
class Photo_Controller extends Gallery_Controller {
  public $template = 'templates/base.html';

  public function View($id) {
    if (!Auth::instance()->logged_in('login')) {
      Session::instance()->set('redirectPath', Router::$current_uri);
      return url::redirect('auth/login');
    }

    $item = ORM::factory('item', $id);
    if (empty($item->id)) {
      return Kohana::show_404();
    }

    $this->template->header->item = $item->parent;
    $this->template->header->active = "Browse Photos";
    $this->template->content = new View('photo_view.html');
    $this->template->content->item = $item;
  }
}
?>