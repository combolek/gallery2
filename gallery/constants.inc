<?php
/**
 * Gallery application constants
 *
 * These are constants defined by Gallery for use throughout the application.
 *
 * @version $Id$
 * @module Constants
 * @modulegroup Application
 * @package GalleryApplication
 * @author Bharat Mediratta <bharat@menalto.com>
 */

/*
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2002 Bharat Mediratta
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

/*
 * ****************************************
 *           Status code bitflags
 * ****************************************
 */

/**
 * The operation was a success
 *
 * @constant SUCCESS
 */
define("SUCCESS", 0x00000000);

/**
 * The operation had errors
 *
 * @constant ERROR
 */
define("ERROR", 0x00000001);

/**
 * A name collision happened in the filesystem as a result of this operation.
 * A common cause for this is attempting to use an existing filename when
 * moving an item from one location to another.
 *
 * @constant ERROR_NAME_COLLISION
 */
define("ERROR_NAME_COLLISION", 0x00000002);

/**
 * The object you're trying to access is no longer available.  Perhaps it was
 * deleted.  You shouldn't get this when an object has simply moved.
 *
 * @constant ERROR_MISSING_OBJECT
 */
define("ERROR_MISSING_OBJECT", 0x00000004);

/**
 * The lock you're trying to acquire is currently in use and was not released
 * within the timeout period you specified.
 * 
 *
 * @constant ERROR_LOCK_IN_USE
 */
define("ERROR_LOCK_IN_USE", 0x00000008);

/**
 * One of the parameters passed to this function is bad.
 *
 * @constant ERROR_BAD_PARAMETER
 */
define("ERROR_BAD_PARAMETER", 0x00000010);

/*
 * ****************************************
 *           Permission bitflags
 * ****************************************
 */

/**
 * The user has permission to view the source image.
 *
 * @constant PERMISSION_VIEW_SOURCE
 */
define("PERMISSION_VIEW_SOURCE", 0x00000001);

/**
 * The user has permission to view the thumbnail image.
 *
 * @constant PERMISSION_VIEW_THUMB
 */
define("PERMISSION_VIEW_THUMB", 0x00000004);

/**
 * The user has permission to view the resized image.
 *
 * @constant PERMISSION_VIEW_RESIZES
 */
define("PERMISSION_VIEW_RESIZES", 0x00000010);

/**
 * The user has permission to insert a new item.
 *
 * @constant PERMISSION_INSERT
 */
define("PERMISSION_INSERT", 0x00000020);

/**
 * The user has permission to change the item.
 *
 * @constant PERMISSION_CHANGE
 */
define("PERMISSION_CHANGE", 0x00000040);

/**
 * The user has permission to change the item's text.
 *
 * @constant PERMISSION_CHANGE_TEXT
 */
define("PERMISSION_CHANGE_TEXT", 0x00000080);

/**
 * The user has permission to delete the item.
 *
 * @constant PERMISSION_DELETE
 */
define("PERMISSION_DELETE", 0x00000100);

/*
 * ****************************************
 *          GalleryItem Properties
 * ****************************************
 */

/**
 * Creation date as a string in "YYYYMMDDHHMMSS" format (we don't want it
 * limited by the epoch)
 *
 * @constant PROPERTY_CREATIONDATE
 */
define("PROPERTY_CREATIONDATE", "creationDate");

/**
 * Last modification date as an integer unix timestamp
 *
 * @constant PROPERTY_MODIFICATIONDATE
 */
define("PROPERTY_MODIFICATIONDATE", "modificationDate");

/**
 * View count start date as an integer unix timestamp
 *
 * @constant PROPERTY_VIEWEDSINCEDATE
 */
define("PROPERTY_VIEWEDSINCEDATE", "viewedSinceDate");


/**
 * View count as an integer
 *
 * @constant PROPERTY_VIEWCOUNT
 */
define("PROPERTY_VIEWCOUNT", "viewCount");

/**
 * Key words about this item
 *
 * @constant PROPERTY_KEYWORDS
 */
define("PROPERTY_KEYWORDS", "keywords" );

/**
 * A short title of this item
 *
 * @constant PROPERTY_TITLE
 */
define("PROPERTY_TITLE", "title");

/**
 * A longer description of of this item
 *
 * @constant PROPERTY_DESCRIPTION
 */
define("PROPERTY_DESCRIPTION", "description");

/**
 * Is HTML allowed in the title & description?
 *
 * @constant PROPERTY_ISHTMLALLOWED
 */
define("PROPERTY_ISHTMLALLOWED", "isHtmlAllowed");

/**
 * Is this item hidden?
 *
 * @constant PROPERTY_ISHIDDEN
 */
define("PROPERTY_ISHIDDEN", "isHidden");

/**
 * Does this item inherit permissions from its parents?
 *
 * @constant PROPERTY_INHERITSPERMISSIONS
 */
define("PROPERTY_INHERITSPERMISSIONS", "inheritsPermissions");

/*
 * ****************************************
 *             Sorting Tags
 * ****************************************
 */

/**
 * Sort in an ascending fashion
 *
 * @constant SORT_ASCENDING
 */
define("SORT_ASCENDING", "asc");

/**
 * Sort in an descending fashion
 *
 * @constant SORT_DESCENDING
 */
define("SORT_DESCENDING", "desc");

?>

