<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2008 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */

/**
 * Enter Description Here
 * @package
 * @subpackage
 * @author Tim
 */

class Register_Controller extends Gallery_Controller {
  // Use the default Kohana template
  public $template = 'kohana/template';

  public function index() {
    $this->template->title = 'Create User';

    $form = new Forge;
    $form->input('email')->label(TRUE)->rules('required|length[4,32]|valid_email');
    $form->input('username')->label('User Name')->rules('required|length[4,32]')->value('');
    $form->password('password')->label('Password')->rules('required|length[5,40]')->value('');
    $form->password('password2')->label('Confirm Password')->rules('required|length[5,40]')
         ->matches($form->password);
    $form->submit('Create New User');

    if ($form->validate()) {
      // Create new user
      $user = ORM::factory('user');

      if ( ! $user->username_exists($form->username->value)) {
        foreach ($form->as_array() as $key => $val) {
          if ('password2' != $key) {
            // Set user data
            $user->$key = $val;
          }
        }

        if ($user->save() /*AND $user->add(ORM::factory('role', 'login'))*/) {
          Auth::instance()->login($user, $form->password->value);

          // Redirect to the login page
          url::redirect('show/1');
        }
      }
    }

    // Display the form
    $this->template->content = $form->render();
  }
}
