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
 * This view shows a list of comments that can be managed
 *
 * @package Comment
 * @subpackage UserInterface
 *
 */
class ManageCommentsView extends GalleryView {

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

	list ($ret, $permissions) = GalleryItemHelper::getPermissions($item->getId());
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null, null);
	}

	$show = array();
	if (isset($permissions['comment.edit'])) {
	    $show['edit'] = 1;
	}
	
	if (isset($permissions['comment.delete'])) {
	    $show['delete'] = 1;
	}

	if (empty($show)) {
	    return array(GalleryStatus::error(ERROR_PERMISSION_DENIED, __FILE__, __LINE__), null, null);
	}

	/* Get all comments */
	list ($ret, $comments) = GalleryCommentHelper::fetchComments($item->getId());
	if ($ret->isError()) {
	    return array($ret->wrap(__FILE__, __LINE__), null, null);
	}

	/* Convert comments to member data, and get commenter ids */
	$userIds = array();
	for ($i = 0; $i < sizeof($comments); $i++) {
	    $userIds[$comments[$i]->getCommenterId()] = 1;
	    $comments[$i] = $comments[$i]->getMemberData();
	}


	/* Fetch all commenters */
	$commenters = array();
	if (sizeof($userIds) > 0) {
	    list ($ret, $users) = $gallery->loadEntitiesById(array_keys($userIds));
	    if ($ret->isError()) {
		return array($ret->wrap(__FILE__, __LINE__), null, null);
	    }

	    /* Reduce them to member data also */
	    foreach ($users as $user) {
		$commenters[$user->getId()] = $user->getMemberData();
	    }
	}

	$ManageComments = array();
	$ManageComments['comments'] = $comments;
	$ManageComments['commenters'] = $commenters;
	$ManageComments['show'] = $show;

	$template->setVariable('ManageComments', $ManageComments);
	$template->setVariable('controller', 'comment:ManageComments');
	
	return array(GalleryStatus::success(), '', 'modules/comment/templates/ManageComments.tpl');
    }
}
?>
