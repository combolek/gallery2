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
define(SUCCESS, 0x00000000);

/**
 * The operation had errors
 *
 * @constant ERROR
 */
define(ERROR, 0x00000001);

/**
 * A name collision happened in the filesystem as a result of this operation.
 * A common cause for this is attempting to use an existing filename when
 * moving an item from one location to another.
 *
 * @constant ERROR_NAME_COLLISION
 */
define(ERROR_NAME_COLLISION, 0x00000002);

/**
 * The object you're trying to access is no longer available.  Perhaps it was
 * deleted.  You shouldn't get this when an object has simply moved.
 *
 * @constant ERROR_MISSING_OBJECT
 */
define(ERROR_MISSING_OBJECT, 0x00000004);

/*
 * ****************************************
 *           Permission bitflags
 * ****************************************
 */

/**
 * The user has permission to view the source image.
 *
 * @constant PERMISSION_CAN_VIEW_SOURCE
 */
define(PERMISSION_CAN_VIEW_SOURCE, 0x00000001);

/**
 * The user is denied permission to view the source image.
 *
 * @constant PERMISSION_CANNOT_VIEW_SOURCE
 */
define(PERMISSION_CANNOT_VIEW_SOURCE, 0x00000002);

/**
 * The user has permission to view the thumbnail image.
 *
 * @constant PERMISSION_CAN_VIEW_THUMB
 */
define(PERMISSION_CAN_VIEW_THUMB, 0x00000004);

/**
 * The user is denied permission to view the thumbnail image.
 *
 * @constant PERMISSION_CANNOT_VIEW_THUMB
 */
define(PERMISSION_CANNOT_VIEW_THUMB, 0x00000008);

/**
 * The user has permission to view the resized image.
 *
 * @constant PERMISSION_CAN_VIEW_RESIZES
 */
define(PERMISSION_CAN_VIEW_RESIZES, 0x00000010);

/**
 * The user is denied permission to view the resized image.
 *
 * @constant PERMISSION_CANNOT_VIEW_RESIZES
 */
define(PERMISSION_CANNOT_VIEW_RESIZES,  0x00000020);

/**
 * The user has permission to change the item.
 *
 * @constant PERMISSION_CAN_CHANGE
 */
define(PERMISSION_CAN_CHANGE, 0x00000040);

/**
 * The user is denied permission to change the item.
 *
 * @constant PERMISSION_CANNOT_CHANGE
 */
define(PERMISSION_CANNOT_CHANGE, 0x00000080);

/**
 * The user has permission to change the item's text.
 *
 * @constant PERMISSION_CAN_CHANGE_TEXT
 */
define(PERMISSION_CAN_CHANGE_TEXT, 0x00000100);

/**
 * The user is denied permission to change the item's text.
 *
 * @constant PERMISSION_CANNOT_CHANGE_TEXT
 */
define(PERMISSION_CANNOT_CHANGE_TEXT, 0x00000200);

/**
 * The user has permission to add to the item.
 *
 * @constant PERMISSION_CAN_ADD_TO
 */
define(PERMISSION_CAN_ADD_TO, 0x00000400);

/**
 * The user is denied permission to add to the item.
 *
 * @constant PERMISSION_CANNOT_ADD_TO
 */
define(PERMISSION_CANNOT_ADD_TO, 0x00000800);

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
define(PROPERTY_CREATIONDATE, "creationDate");

/**
 * Last modification date as an integer unix timestamp
 *
 * @constant PROPERTY_MODIFICATIONDATE
 */
define(PROPERTY_MODIFICATIONDATE, "modificationDate");

/**
 * View count start date as an integer unix timestamp
 *
 * @constant PROPERTY_VIEWEDSINCEDATE
 */
define(PROPERTY_VIEWEDSINCEDATE, "viewedSinceDate");


/**
 * View count as an integer
 *
 * @constant PROPERTY_VIEWCOUNT
 */
define(PROPERTY_VIEWCOUNT, "viewCount");

/**
 * Key words about this item
 *
 * @constant PROPERTY_KEYWORDS
 */
define(PROPERTY_KEYWORDS, "keywords" );

/**
 * A short title of this item
 *
 * @constant PROPERTY_TITLE
 */
define(PROPERTY_TITLE, "title");

/**
 * A longer description of of this item
 *
 * @constant PROPERTY_DESCRIPTION
 */
define(PROPERTY_DESCRIPTION, "description");

/**
 * Is HTML allowed in the title & description?
 *
 * @constant PROPERTY_ISHTMLALLOWED
 */
define(PROPERTY_ISHTMLALLOWED, "isHtmlAllowed");

/**
 * Is this item hidden?
 *
 * @constant PROPERTY_ISHIDDEN
 */
define(PROPERTY_ISHIDDEN, "isHidden");

/**
 * Does this item inherit permissions from its parents?
 *
 * @constant PROPERTY_INHERITSPERMISSIONS
 */
define(PROPERTY_INHERITSPERMISSIONS, "inheritsPermissions");
?>

