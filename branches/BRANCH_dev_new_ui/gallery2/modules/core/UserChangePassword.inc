<?php
/*
 * $RCSfile$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2003 Bharat Mediratta
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
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

/**
 * @version $Revision$ $Date$
 * @package GalleryCore
 * @subpackage UserInterface
 * @author Bharat Mediratta <bharat@menalto.com>
 */

/**
 * This controller will handle changes made to an user
 *
 * @package GalleryCore
 * @subpackage UserInterface
 *
 */
class UserChangePasswordController extends GalleryController {

    /**
     * @see GalleryController::handleRequest
     */
    function handleRequest($form) {
	global $gallery;

	$userId = $gallery->getActiveUserId();

	list ($ret, $anonymousUserId) = $gallery->getModuleParameter('core', 'id.anonymousUser');
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null);
	}
	if ($userId == $anonymousUserId) {
	    return array(GalleryStatus::error(ERROR_PERMISSION_DENIED, __FILE__, __LINE__), null);
	}

	$results = array();
	$status = array();
	$redirectParams = array();

	if (isset($form['action']['cancel'])) {

	    /* XXX: broken for now */
	    /* Redirect back to the same view */
	    $redirectParams['view'] = 'core:UserAdmin';
	    $redirectParams['subView'] = 'core:UserChangePassword';
	    
	} else if (isset($form['action']['undo'])) {

	    /* Redirect back to the same view to reset the form */
	    $redirectParams['view'] = 'core:UserAdmin';
	    $redirectParams['subView'] = 'core:UserChangePassword';
	    
	} else if (isset($form['action']['save'])) {

	    /*
	     * Validate our data before we continue.
	     */
	    $error = false;

	    if (!isset($form['password1'])) {
		GalleryUtilities::putRequestVariable('form.error.password1.missing', 1);
		$error = true;
	    }
	    
	    if (!isset($form['password2'])) {
		GalleryUtilities::putRequestVariable('form.error.password2.missing', 1);
		$error = true;
	    }

	    if (!$error && $form['password1'] != $form['password2']) {
		GalleryUtilities::putRequestVariable('form.error.password2.mismatch', 1);
		$error = true;
	    }

	    /*
	     * If all the right fields are in place then go ahead and modify
	     * the user.
	     */
	    if (!$error) {
		list ($ret, $lockId) = $gallery->acquireWriteLock($userId);
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}

		list ($ret, $user) = $gallery->loadEntitiesById($userId);
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}
		
		$user->changePassword($form['password1']);

		$ret = $user->save();
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}

		$ret = $gallery->releaseLocks($lockId);
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}

		/* Request a redirect to the confirmation screen */
		$redirectParams['view'] = 'core:UserAdmin';
		$redirectParams['subView'] = 'core:UserChangePassword';
		$status['changedPassword'] = 1;
	    }
	}

	if (!empty($redirectParams)) {
	    $results['redirect'] = $redirectParams;
	    if (!empty($status)) {
		$results['status'] = $status;
	    }
	} else {
	    if (empty($results['view'])) {
		$results['view'] = 'core:UserAdmin';
		GalleryUtilities::putRequestVariable('subView', 'core:UserChangePassword');
	    }
	}

	return array(GalleryStatus::success(), $results);
    }
}

/**
 * This view will show a form to change user options
 *
 * @package GalleryCore
 * @subpackage UserInterface
 *
 */
class UserChangePasswordView extends GalleryView {

    /**
     * @see GalleryView::loadTemplate
     */
    function loadTemplate(&$template, &$form) {
	global $gallery;

	/* Load the form with user data the first time around. */
	if ($form['formName'] != 'UserChangePassword') {
	    $form['formName'] = 'UserChangePassword';
	}

	/* Render the HTML body */
	$template->setVariable('controller', 'core:UserChangePassword');
	return array(GalleryStatus::success(), '', 'modules/core/templates/UserChangePassword.tpl');
    }
}
?>
