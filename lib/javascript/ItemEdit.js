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
function ItemEdit() {
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
ItemEdit.prototype.handleRequest = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    /* Give immediate feedback if possible */
    YAHOO.util.Dom.get(
      GalleryUtilities.elementId("working", "ItemEdit", self.templateId)).innerHTML =
      "Saving changes...";
    if (args[2].name == GalleryUtilities.formVar("form[action][rotate][-90]")
        || args[2].name == GalleryUtilities.formVar("form[action][rotate][180]")
	|| args[2].name == GalleryUtilities.formVar("form[action][rotate][90]")) {
      YAHOO.util.Dom.get(
        GalleryUtilities.elementId("working", "ItemEdit", self.templateId)).innerHTML =
	"Rotating photo...";
    } else if (args[2].name == GalleryUtilities.formVar("form[action][resize]")) {
      YAHOO.util.Dom.get(
        GalleryUtilities.elementId("working", "ItemEdit", self.templateId)).innerHTML =
	"Scaling photo...";
    } else if (args[2].name == GalleryUtilities.formVar("form[action][revert]")) {
      YAHOO.util.Dom.get(
        GalleryUtilities.elementId("working", "ItemEdit", self.templateId)).innerHTML =
	"Reverting rotate and scale changes...";
    }

    GalleryUtilities.hide(
      GalleryUtilities.elementId("success", "ItemEdit", self.templateId));
    GalleryUtilities.hide(
      GalleryUtilities.elementId("warning", "ItemEdit", self.templateId));
    GalleryUtilities.hide(
      GalleryUtilities.elementId("error", "ItemEdit", self.templateId));
    GalleryUtilities.show(
      GalleryUtilities.elementId("working", "ItemEdit", self.templateId));
    GalleryUtilities.show(
      GalleryUtilities.elementId("status", "ItemEdit", self.templateId));
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
ItemEdit.prototype.handleResponse = function(type, args, self) {
    if (args[3] != self) {
      return;
    }

    if (!GalleryUtilities.isResponseSuccessful(args[0])) {
      GalleryUtilities.hide(
        GalleryUtilities.elementId("working", "ItemEdit", self.templateId));
      GalleryUtilities.hide(
        GalleryUtilities.elementId("success", "ItemEdit", self.templateId));
      GalleryUtilities.hide(
        GalleryUtilities.elementId("warning", "ItemEdit", self.templateId));
      GalleryUtilities.show(
        GalleryUtilities.elementId("error", "ItemEdit", self.templateId));
      GalleryUtilities.show(
        GalleryUtilities.elementId("status", "ItemEdit", self.templateId));
    }
  }
