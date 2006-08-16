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
function RotatePhotoBlock() {
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
RotatePhotoBlock.prototype.handleRequest = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "RotatePhotoBlock", self.templateId));

    /* Disable template's form */
    YAHOO.util.Dom.batch(form.elements, function(element) {
	element.blur();
	element.disabled = "disabled";
      });

    /* Give immediate feedback if possible */
    if (args[2].name == GalleryUtilities.formVar("form[action][rotate][-90]")) {
      YAHOO.util.Dom.get(args[1].RotatePhotoBlock.id).style.filter =
	"progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";
    } else if (args[2].name == GalleryUtilities.formVar("form[action][rotate][180]")) {
      YAHOO.util.Dom.get(args[1].RotatePhotoBlock.id).style.filter =
	"progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";
    } else if (args[2].name == GalleryUtilities.formVar("form[action][rotate][90]")) {
      YAHOO.util.Dom.get(args[1].RotatePhotoBlock.id).style.filter =
	"progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
    }

    GalleryUtilities.hide(
      GalleryUtilities.elementId("success", "RotatePhotoBlock", self.templateId));
    GalleryUtilities.hide(
      GalleryUtilities.elementId("warning", "RotatePhotoBlock", self.templateId));
    GalleryUtilities.hide(
      GalleryUtilities.elementId("error", "RotatePhotoBlock", self.templateId));
    GalleryUtilities.show(
      GalleryUtilities.elementId("working", "RotatePhotoBlock", self.templateId));
    GalleryUtilities.show(
      GalleryUtilities.elementId("status", "RotatePhotoBlock", self.templateId));

    /* Center status over image */
    GalleryUtilities.center(
      GalleryUtilities.elementId("status", "RotatePhotoBlock", self.templateId),
      args[1].RotatePhotoBlock.id);

    /* TODO Make prettier */
    YAHOO.util.Dom.setStyle(
      GalleryUtilities.elementId("status", "RotatePhotoBlock", self.templateId), "opacity", 0.8);
  }

/**
 * Handle custom response event
 *
 * @param {String} type of custom event
 * @param {Array} {Object} response object
 *                {Object} parameters
 *                {Element} target of event which triggered the form's submission
 *                {Object} template object which triggered the request
 * @param {Object} self reference
 */
RotatePhotoBlock.prototype.handleResponse = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "RotatePhotoBlock", self.templateId));

    /* Enable template's form */
    YAHOO.util.Dom.batch(form.elements, function(element) {
	element.disabled = "";
      });

    if (!GalleryUtilities.isResponseSuccessful(args[0])) {
      GalleryUtilities.hide(
	GalleryUtilities.elementId("working", "RotatePhotoBlock", self.templateId));
      GalleryUtilities.hide(
	GalleryUtilities.elementId("success", "RotatePhotoBlock", self.templateId));
      GalleryUtilities.hide(
	GalleryUtilities.elementId("warning", "RotatePhotoBlock", self.templateId));
      GalleryUtilities.show(
	GalleryUtilities.elementId("error", "RotatePhotoBlock", self.templateId));
      GalleryUtilities.show(
	GalleryUtilities.elementId("status", "RotatePhotoBlock", self.templateId));

      /* Center status over image */
      GalleryUtilities.center(
	GalleryUtilities.elementId("status", "RotatePhotoBlock", self.templateId),
	args[1].RotatePhotoBlock.id);
    }
  }

/**
 * Submit template's form using Ajax
 *
 * @param {Object} parameters
 * @param {Element} target of event which triggered the form's submision
 * @param {Object} self reference, since function will be executed in scope of the event target
 */
RotatePhotoBlock.prototype.submit = function(params, target, self) {
    if (!GalleryUtilities.isCallbackSupported()) {
      return;
    }

    var form = YAHOO.util.Dom.get(
      GalleryUtilities.elementId("form", "RotatePhotoBlock", self.templateId));

    /* Serialize form elements */
    var args = GalleryUtilities.serializeForm(form, target);
    args.push([GalleryUtilities.formVar("callback"), "callback"]);

    args.push([GalleryUtilities.formVar("delegate[view]"), "core.RotatePhotoBlock"]);

    if (self.templateId != null) {
      args.push([GalleryUtilities.formVar("delegate[templateId]"), self.templateId]);
    }

    args = args.concat(GalleryUtilities.formVars("delegate[RotatePhotoBlock]", params.RotatePhotoBlock));

    /* Make Ajax callback request */
    GalleryUtilities.callbackRequest(form.action, args, params, target, self);
  }
