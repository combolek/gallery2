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
function EditItemBlock() {
}

/**
 * Handle custom request event
 *
 * @param {String} type of custom event
 * @param {Array} {Object} connection object
 *                {Object} parameters
 *                {Element} target of event which triggered the form's submission
 *                {Object} template object which triggered the request
 * @param {Object} self reference
 */
EditItemBlock.prototype.handleRequest = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "EditItemBlock", self.templateId));

    /* Disable template's form */
    YAHOO.util.Dom.batch(form.elements, function(element) {
	element.blur();
	element.disabled = "disabled";
      });

    /* Give immediate feedback if possible */
    YAHOO.util.Dom.get(
      GalleryUtilities.elementId("link", "EditItemBlock", self.templateId)).title = "Saving changes...";
    GalleryUtilities.show(GalleryUtilities.elementId("link", "EditItemBlock", self.templateId));

    YAHOO.util.Dom.get(
      GalleryUtilities.elementId("value", "EditItemBlock", self.templateId)).innerHTML = "Saving changes...";

    GalleryUtilities.hide(
      GalleryUtilities.elementId("success", "EditItemBlock", self.templateId));
    GalleryUtilities.hide(
      GalleryUtilities.elementId("warning", "EditItemBlock", self.templateId));
    GalleryUtilities.hide(
      GalleryUtilities.elementId("error", "EditItemBlock", self.templateId));
    GalleryUtilities.show(
      GalleryUtilities.elementId("working", "EditItemBlock", self.templateId));
    GalleryUtilities.show(
      GalleryUtilities.elementId("status", "EditItemBlock", self.templateId));

    GalleryUtilities.hide(
      GalleryUtilities.elementId("form", "EditItemBlock", self.templateId));
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
EditItemBlock.prototype.handleResponse = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "EditItemBlock", self.templateId));

    /* Enable template's form */
    YAHOO.util.Dom.batch(form.elements, function(element) {
	element.disabled = "";
      });

    if (!GalleryUtilities.isResponseSuccessful(args[0])) {
      YAHOO.util.Dom.get(
	GalleryUtilities.elementId("link", "EditItemBlock", self.templateId)).title =
	"There was a problem processing your request";

      GalleryUtilities.hide(
	GalleryUtilities.elementId("working", "EditItemBlock", self.templateId));
      GalleryUtilities.hide(
	GalleryUtilities.elementId("success", "EditItemBlock", self.templateId));
      GalleryUtilities.hide(
	GalleryUtilities.elementId("warning", "EditItemBlock", self.templateId));
      GalleryUtilities.show(
	GalleryUtilities.elementId("error", "EditItemBlock", self.templateId));
      GalleryUtilities.show(
	GalleryUtilities.elementId("status", "EditItemBlock", self.templateId));
    }
  }

/**
 * Submit template's form using Ajax
 *
 * @param {Object} parameters
 * @param {Element} target of event which triggered the form's submision
 * @param {Object} self reference, since function will be executed in scope of the event target
 */
EditItemBlock.prototype.submit = function(params, target, self) {
    if (!GalleryUtilities.isCallbackSupported()) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "EditItemBlock", self.templateId));

    /* Serialize form elements */
    var args = GalleryUtilities.serializeForm(form, target);
    args.push([GalleryUtilities.formVar("callback"), "callback"]);

    args.push([GalleryUtilities.formVar("delegate[view]"), "core.EditItemBlock"]);

    if (self.templateId != null) {
      args.push([GalleryUtilities.formVar("delegate[templateId]"), self.templateId]);
    }

    args = args.concat(GalleryUtilities.formVars("delegate[EditItemBlock]", params.EditItemBlock));

    /* Make Ajax callback request */
    GalleryUtilities.callbackRequest(form.action, args, params, target, self);
  }
