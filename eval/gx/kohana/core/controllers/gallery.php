<?php
class Gallery_Controller extends Template_Controller {
  public function __construct() {
    parent::__construct();

    // Set the default heading and footer
    $this->template->header = new View('templates/header.html');
    $this->template->header->title = 'John Doe\'s Gallery';

    $this->template->header->is_admin = Auth::instance()->logged_in("admin");
    $this->template->header->authenticated = Auth::instance()->logged_in();

    $this->template->footer = new View('templates/footer.html');

    try {
      if (Session::instance()->get("use_profiler", false)) {
	Event::add('system.display', array('Gallery_Controller', '_show_profile'));
      }
    } catch (Exception $e) {
      // Perhaps the database is not initialized yet?
    }
  }

  static function _show_profile() {
    $profiler = new Profiler();
    $profiler->render();
  }
}
?>