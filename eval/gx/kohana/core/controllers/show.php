<?php
class Show_Controller extends Gallery_Controller {
  // Set the name of the template to use
  public $template = 'templates/base';

  public function __call($id, $arguments) {
    $item = ORM::factory('Item', $id);
    if (empty($item->id)) {
      return Kohana::show_404();
    }

    switch($item->type) {
    case 'album':
      $this->template->header->active = "Browse Photos";
      $this->template->content = new View('show_album');
      $this->template->content->item = $item;
      $this->template->content->maxRows = 3;
      $this->template->content->maxColumns = 3;
      $this->template->content->children = $item->children;
      break;

    case 'photo':
//      printf("<pre> [%s:%s] Session: %s</pre>",__FILE__,__LINE__,print_r(Auth::instance(), 1)); flush();
//      if (Auth::instance()->logged_in('login')) {
        $this->template->header->active = "Browse Photos";
        $this->template->content = new View('show_item');
        $this->template->content->path = $item->parent->path . '/' . $item->path;
        $this->template->content->item = $item;
//      } else {
//        url::redirect('auth/login');
//      }
      break;

    default:
      throw new Kohana_Exception(print_r($item, 1));
    }
  }
}
?>