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
 * @package Comment
 * @subpackage UserInterface
 * @author Bharat Mediratta <bharat@menalto.com>
 */

/**
 * This controller will handle the changes made to a comment
 *
 * @package Comment
 * @subpackage UserInterface
 */
class EditCommentController extends GalleryController {

    /**
     * @see GalleryController::handleRequest()
     */
    function handleRequest($form) {
	global $gallery;

	list ($itemId, $commentId) =
	    GalleryUtilities::getRequestVariables('itemId', 'commentId');

	/* Make sure we have permission to edit a comment */
	$ret = GalleryUserHelper::assertHasItemPermission($itemId, 'comment.edit');
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null);
	}

	if (isset($form['action']['save'])) {
	    /* Edit the comment */
	    list ($ret, $comment) = $gallery->loadEntitiesById($commentId);
	    if ($ret->isError()) {
		return array($ret->wrap(__FILE__, __LINE__), null);
	    }

	    /* Make sure that the comment<->parent relationship is right */
	    if ($comment->getParentId() != $itemId) {
		return array(GalleryStatus::error(ERROR_BAD_PARAMETER, __FILE__, __LINE__), null);
	    }

	    /* Verify the input parameters */
	    $valid = true;
	    if (empty($form['commenterName'])) {
		GalleryUtilities::putRequestVariable('form.error.missingCommenterName', 1);
		$valid = false;
	    } else {
		list ($ret, $commenter) = GalleryUserHelper::fetchUserByUsername($form['commenterName']);
		if ($ret->isError()) {
		    GalleryUtilities::putRequestVariable('form.error.invalidCommenterName', 1);
		    $valid = false;
		}
	    }

	    if (empty($form['date'])) {
		GalleryUtilities::putRequestVariable('form.error.missingDate', 1);
		$valid = false;
	    } else {
		$newDate = strtotime($form['date']);
		if ($newDate == -1) {
		    GalleryUtilities::putRequestVariable('form.error.invalidDate', 1);
		    $valid = false;
		} else {
		    $form['date'] = $newDate;
		}
	    }

	    if ($valid) {
		list ($ret, $lockId) = $gallery->acquireWriteLock(array($comment->getId()));
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}

		list ($ret, $comment) = $comment->refresh();
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}
		
		$comment->setCommenterId($commenter->getId());
		$comment->setHost($form['host']);
		$comment->setComment($form['comment']);
		$comment->setDate($form['date']);
		$ret = $comment->save();
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}

		$ret = $gallery->releaseLocks($lockId);
		if ($ret->isError()) {
		    return array($ret->wrap(__FILE__, __LINE__), null);
		}
	    
		/* Redirect back to the item */
		$results['redirect'] = array('view' => 'core:ShowItem',
					     'itemId' => $itemId);
	    } else {
		/* Stay on the same page */
		$results['view'] = 'comment:EditComment';
	    }
	} else {
	    /* Redirect back to the item */
	    $results['redirect'] = array('view' => 'core:ShowItem',
					 'itemId' => $itemId);
	}

	return array(GalleryStatus::success(), $results);
    }
}

/**
 * This view shows a form to edit a comment
 *
 * @package Comment
 * @subpackage UserInterface
 *
 */
class EditCommentView extends GalleryView {

    /**
     * @see GalleryView::loadTemplate
     */
    function loadTemplate(&$template, &$form) {
	global $gallery;

	/* Load our item */
	list ($ret, $item) = $this->_getItem();
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null, null);
	}

	/* Make sure we have permission to edit a comment */
	$ret = GalleryUserHelper::assertHasItemPermission($item->getId(), 'comment.edit');
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null, null);
	}

	/* Load the specific comment */
	$commentId = GalleryUtilities::getRequestVariables('commentId');
	list ($ret, $comment) = $gallery->loadEntitiesById($commentId);
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null, null);
	}

	/* Associate the commenter's info */
	$commenterId = $comment->getCommenterId();
	list ($ret, $commenter) = $gallery->loadEntitiesById($commenterId);
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null, null);
	}

	if ($form['formName'] != 'EditComment') {
	    $form['commenterName'] = $commenter->getUserName();
	    $form['host'] = $comment->getHost();
	    $form['date'] = $comment->getDate();
	    $form['comment'] = $comment->getComment();
	    $form['formName'] = 'EditComment';
	}

	$EditComment['comment'] = $comment->getMemberData();

	$template->setVariable('EditComment', $EditComment);
	$template->setVariable('controller', 'comment:EditComment');
	
	return array(GalleryStatus::success(), '', 'modules/comment/templates/EditComment.tpl');
    }
}
?>
