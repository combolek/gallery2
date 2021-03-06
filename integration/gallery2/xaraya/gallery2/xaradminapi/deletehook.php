<?php
/**
 * File: $Id$
 * 
 * Xaraya gallery2 wrapper
 * 
 * @package Xaraya eXtensible Management System
 * @copyright (C) 2002 by the Xaraya Development Team.
 * @license GPL <http://www.gnu.org/licenses/gpl.html>
 * @link http://www.xaraya.org
 *
 * @subpackage gallery2 Module
 * @author Andy Staudacher / valiant
*/

// Load the xarGallery2Helper class
include_once(dirname(__FILE__) .'/../xargallery2helper.php');

/**
 * Hook function for roles delete/purge item hook calls
 *
 * @param $args['objectid'] ID of the object
 * @param $args['extrainfo'] extra information
 * @return extrainfo the updated extrainfo array
 */
function gallery2_adminapi_deletehook($args)
{
  // switch delete / purge roles and removemember hook calls
  if (isset($args['extrainfo']['uid'])) {
    // removemember hook call
    return _gallery2_adminapi_removememberhook($args);
  } else {
    // delete/purge role hook call
    return _gallery2_adminapi_deleterolehook($args);
  }
}


/**
 * Function for roles delete/purge item hook calls
 *
 * @param $args['objectid'] ID of the object
 * @param $args['extrainfo'] extra information
 * @return extrainfo the updated extrainfo array
 */
function _gallery2_adminapi_deleterolehook($args)
{
  
  // first check if the module has been configured
  if(!xarGallery2Helper::isConfigured()) {
    return $args['extrainfo'];
  }
  
  extract($args['extrainfo']);
  
  // we only accept roles module hook calls
  if (!isset($module) || $module != 'roles') {
    return $args['extrainfo'];
  }
  
  if (!isset($uid) && !isset($itemid) && !isset($args['objectid'])) {
    $msg = xarML('Could not delete G2 user, no uid/itemid supplied by hook call!');
    xarErrorSet(XAR_USER_EXCEPTION, 'BAD_PARAM', new DefaultUserException($msg));
    return $args['extrainfo'];
  }
  
  if (!isset($itemid) && isset($uid)) {
    $itemid = $uid;
  } else {
    $itemid = $args['objectid'];
  }
  
  /**
   * Delete Hooks are called either on delete or purge. Thus, this hook call 
   * may be for a role that has already been deleted and now is purged, i.e.
   * in G2, this role may already be deleted. 
   * -> First check if this role still exists in G2 and only call the G2 delete
   * in this case.
   */

  // Start G2 transaction
  if(!xarGallery2Helper::init()) {
    return $args['extrainfo'];
  }
  list($ret,$g2role) = xarGallery2Helper::g2loadEntityByExternalId($itemid, null, false);
  if (!$ret) {
    // role does not exist in G2, probably it was already deleted. return ok status.
    return $args['extrainfo'];
  } 
  
  //
  // role exists in G2, try to delete it.
  
  if ((isset($itemtype) && $itemtype == 1) || $g2role->getClassName() == 'GalleryGroup') { // it's a group
    $ret = GalleryEmbed::deleteGroup($itemid);
  } elseif ((isset($itemtype) && $itemtype == 0) ||  $g2role->getClassName() == 'GalleryUser') {
    // remove the user from G2
    $ret = GalleryEmbed::deleteUser($itemid);
  }
  if (!empty($ret)) {
    $msg = xarML('Failed to delete G2 user/group with extId [#(1)]! Here is the error message from G2: <br /> [#(2)',
		 $itemid, $ret->getAsHtml());
    xarErrorSet(XAR_SYSTEM_EXCEPTION, 'FUNCTION_FAILED', new SystemException($msg));
    return $args['extrainfo'];
  }
   
  // complete G2 transaction
  xarGallery2Helper::done();
  
  return $args['extrainfo'];
}



/**
 * Function for roles removemember hook call
 *
 * @param $args['objectid'] ID of the object
 * @param $args['extrainfo'] extra information
 * @return extrainfo the updated extrainfo array
 */
function _gallery2_adminapi_removememberhook($args)
{
  // first check if the module has been configured
  if(!xarGallery2Helper::isConfigured()) {
    return $args['extrainfo'];
  }
  
  extract($args['extrainfo']);
  
  // we only accept roles module hook calls
  if (!isset($module) || $module != 'roles') {
    return $args['extrainfo'];
  }
  
  // we need both, the parent id (itemid) and the child id (uid)
  if (!isset($itemid) || !isset($uid)) {
    $msg = xarML('removemember hook call without group/user ids!');
    xarErrorSet(XAR_USER_EXCEPTION, 'BAD_PARAM', new DefaultUserException($msg));
    return $args['extrainfo'];
  }
  
  // Start G2 transaction
  if(!xarGallery2Helper::init()) {
    return $args['extrainfo'];
  }
  
  // if child is a group: remove all child users from "groups to be removed"
  // if child is a user: remove user from "groups to be removed"
  // "groups to be removed" = getAncestors of parent + parent - getAncestors of child 
  
  // this is ridiculous, the role get function defaults to type =1 if none was specified
  $childRole = xarModAPIFunc('roles','user','get', array('uid' => $uid));
  if ( !isset($childRole['type']) || $childRole['uid'] != $uid) {
    $childRole = xarModAPIFunc('roles','user','get', array('uid' => $uid, 'type' => 1));
  }
  
  $xarChildUsers = array();
  if ($childRole['type'] == 1) { // it's a group
    $xarChildUsers = xarGallery2Helper::xarGetChildUsers($uid); // returns only users, no groups
  } else {
    $xarChildUsers[] = $childRole;
  }
  
  // Load the parent role
  list($parentRole, $xarParentGroups) = xarGallery2Helper::xarGetAncestors(array('uid' => $itemid)); // an ancestor is a group per se
  $xarParentGroups[] = $parentRole;
  
  $removeGroupsList = array();
  foreach ($xarParentGroups as $group) {
    $removeGroupsList[$group['uid']] = $group;
  }

  // don't remove users from the G2 all users group
  $defaultGroupData = xarModAPIFunc('roles','user','get'
				    , array('name' => xarModGetVar('roles', 'defaultgroup'), 'type' => 1));
  
  foreach ($xarChildUsers as $child) {
    // first get the remaining memberships and delete the group in 
    // $removeGroupsList that we still want to be member of
    $currentGroupsRemoveList = $removeGroupsList;
    list($thechildRole, $remainingGroups) = xarGallery2Helper::xarGetAncestors(array('uid' => $child['uid']));
    foreach ($remainingGroups as $remGroup) {
      $currentGroupsRemoveList[$remGroup['uid']] = null;
    }
    // Now remove the memberships
    foreach ($currentGroupsRemoveList as $groupId => $group) {
      if ($group == null) {
	continue; // still a member of this group
      }
      
      // don't remove user from G2 all user group
      if ($group['uid'] == $defaultGroupData['uid']) {
	continue;
      }

      // make sure the group already exists in G2, if not, add it (there are some
      // rare scenarios where the group doesn't exist in G2. i.e. if the group was 
      // in deleted state in xaraya while we imported/exported the groups and now
      // this group is back, recalled. 
      // other CMS shouldn't care i guess, just a strange and rare issue
      list($ret, $g2Group) = GalleryCoreApi::loadEntityByExternalId($group['uid'], 'GalleryGroup');
      if ($ret) {
	if ($ret->getErrorCode() & ERROR_MISSING_OBJECT) { 
	  // ok, we need to create this group first
	  if (!xarGallery2Helper::g2createGroup($group['uid'], $group)) {
	    return $args['extrainfo'];
	  }
	} else { // a real error, damn
	  $msg = xarML('Failed to fetch group for extId [#(1)] removeusertogroup synchronization! Here
							is the error message from G2: <br />', $group['uid'], $ret->getAsHtml());
	  xarErrorSet(XAR_SYSTEM_EXCEPTION, 'FUNCTION_FAILED', new SystemException($msg));
	  return $args['extrainfo'];
	}
      }

      // remove user from group
      $ret = GalleryEmbed::removeUserFromGroup($child['uid'], $group['uid']);
      if ($ret) {
	$msg = xarML('Failed to remove g2 user [#(1)] with extId [#(2)] from g2 group [#(3)]! Here is the
					error from G2: <br />', $child['uname'], $child['uid'], $group['name'], $ret->getAsHtml());
	xarErrorSet(XAR_SYSTEM_EXCEPTION, 'FUNCTION_FAILED', new SystemException($msg));
	return $args['extrainfo'];
      }
    }
  }
  
  // complete G2 transaction
  xarGallery2Helper::done();
  
  return $args['extrainfo'];
}

?>
