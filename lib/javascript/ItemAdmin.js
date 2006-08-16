/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2006 Bharat Mediratta
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
 * Template's client-side variables & functions
 */
function ItemAdmin() {
}

/**
 * Handle custom request event
 *
 * @param {String} type of custom event
 * @param {Array} {Object} connection object
 *                {Object} parameters
 *                {Element} target of event which triggered the form's submission
 *                {Object} template object which made Ajax callback request
 * @param {Object} self reference
 */
ItemAdmin.prototype.handleRequest = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "ItemAdmin", self.templateId));

    /* Disable template's form */
    YAHOO.util.Dom.batch(form.elements, function(element) {
      element.blur();
      element.disabled = "disabled";
    });
  }

/**
 * Handle custom response event
 *
 * @param {String} type of custom event
 * @param {Array} {Object} response object
 *                {Object} parameters
 *                {Element} target of event which triggered the form's submission
 *                {Object} template object which made Ajax callback request
 * @param {Object} self reference
 */
ItemAdmin.prototype.handleResponse = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "ItemAdmin", self.templateId));

    /* Enable template's form */
    YAHOO.util.Dom.batch(form.elements, function(element) {
      element.disabled = "";
    });
  }

/**
 * Submit template's form using Ajax
 *
 * @param {Object} parameters
 * @param {Element} target of event which triggered the form's submision
 * @param {Object} self reference, since function will be executed in scope of the event target
 */
ItemAdmin.prototype.submit = function(scope, target, self) {
    if (!GalleryUtilities.isCallbackSupported()) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "ItemAdmin", self.templateId));

    /* Serialize form elements */
    var params = GalleryUtilities.serializeForm(form, target);
    params.push([GalleryUtilities.formVar("callback"), "=callback"]);

    /* Make Ajax callback request */
    GalleryUtilities.callbackRequest(form.action, params, scope, target, self);
  }
