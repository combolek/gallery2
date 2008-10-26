<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Auth module demo controller. This controller should NOT be used in production.
 * It is for demonstration purposes only!
 *
 * $Id$
 *
 * @package    Auth
 * @author     Kohana Team
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Auth_Controller extends Gallery_Controller {

  // Do not allow to run in production
  const ALLOW_PRODUCTION = FALSE;

  // Use the default Kohana template
  public $template = 'templates/base.html';

  public function login() {
    $this->template->header->active = "";
    $this->template->header->item = null;
    $this->template->header->path = array();

    if (Auth::instance()->logged_in()) {
      $this->template->title = 'User Logout';
      $this->template->content = new View("user_logout.html");

      $form = new Forge('auth/logout');
      $form->submit('Logout Now');
    } else {
      $this->template->title = 'User Login';
      $this->template->content = new View("user_login.html");

      $form = new Forge('auth/login');
      $form->input('username')->label(TRUE)->rules('required|length[4,32]');
      $form->password('password')->label(TRUE)->rules('required|length[5,40]');
      $form->submit('Login');

      if ($form->validate()) {
        // Load the user
        $user = ORM::factory('user', $form->username->value);

        if (Auth::instance()->login($user, $form->password->value, true)) {
          // Login successful, redirect
          $redirect = Session::instance()->get('redirectPath');
          url::redirect($redirect);
        } else {
          $form->password->add_error('login_failed', 'Invalid username or password.');
        }
      }
    }
    // Display the form
    $this->template->content->form = $form->set_attr('class', 'gExpandedForm');

  }

  public function logout() {
    // Force a complete logout
    Auth::instance()->logout(true);

    // Redirect back to the login page
    url::redirect('album/view/1');
  }

} // End Auth Controller