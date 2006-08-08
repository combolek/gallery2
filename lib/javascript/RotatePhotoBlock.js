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
 * Submit template's form using Ajax
 *
 * @param {Object} scope from which to import new values
 * @param {Element} target of event which triggered the form's submision
 * @param {Object} self reference, since function will be executed in scope of the event target
 */
RotatePhotoBlock.prototype.submit = function(RotatePhotoBlock, target, self) {
  if (!GalleryUtilities.isCallbackSupported()) {
    return;
  }

  var form = YAHOO.util.Dom.get(GalleryUtilities.elementId("form", "RotatePhotoBlock",
    self.templateId));

  /* Disable template's form */
  YAHOO.util.Dom.batch(form.elements, function(element) {
    element.blur();
    element.disabled = "disabled";
  });

  /* Give immediate feedback if possible */
  if (target.name == GalleryUtilities.formVar("form[action][rotate][-90]")) {
    YAHOO.util.Dom.get(RotatePhotoBlock.id).style.filter =
      "progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";
  } else if (target.name == GalleryUtilities.formVar("form[action][rotate][180]")) {
    YAHOO.util.Dom.get(RotatePhotoBlock.id).style.filter =
      "progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";
  } else if (target.name == GalleryUtilities.formVar("form[action][rotate][90]")) {
    YAHOO.util.Dom.get(RotatePhotoBlock.id).style.filter =
      "progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
  }

  GalleryUtilities.hide(GalleryUtilities.elementId("success", "RotatePhotoBlock", self.templateId));
  GalleryUtilities.hide(GalleryUtilities.elementId("warning", "RotatePhotoBlock", self.templateId));
  GalleryUtilities.hide(GalleryUtilities.elementId("error", "RotatePhotoBlock", self.templateId));
  GalleryUtilities.show(GalleryUtilities.elementId("working", "RotatePhotoBlock", self.templateId));
  GalleryUtilities.show(GalleryUtilities.elementId("status", "RotatePhotoBlock", self.templateId));

  var connection;

  /* Register with all callback responses */
  GalleryUtilities.responseEvent.subscribe(function(type, args) {
    var response = args[0];
    if (response.tId == connection.tId) {

      /* Enable template's form */
      YAHOO.util.Dom.batch(form.elements, function(element) {
	element.disabled = "";
      });

      if (!GalleryUtilities.isResponseSuccessful(response)) {
	GalleryUtilities.hide(GalleryUtilities.elementId("working", "RotatePhotoBlock",
	  self.templateId));
	GalleryUtilities.hide(GalleryUtilities.elementId("success", "RotatePhotoBlock",
	  self.templateId));
	GalleryUtilities.hide(GalleryUtilities.elementId("warning", "RotatePhotoBlock",
	  self.templateId));
	GalleryUtilities.show(GalleryUtilities.elementId("error", "RotatePhotoBlock",
	  self.templateId));
	GalleryUtilities.show(GalleryUtilities.elementId("status", "RotatePhotoBlock",
	  self.templateId));
      }
    }
  });

  /* Serialize form elements */
  var args = GalleryUtilities.serializeForm(form, target);
  args.push(GalleryUtilities.formVar("callback") + "=callback");

  args.push(GalleryUtilities.formVar("delegate[view]") + "=core.RotatePhotoBlock");
  args.push(GalleryUtilities.formVar("delegate[templateId]") + "=" + self.templateId);
  args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][item][id]") + "="
    + RotatePhotoBlock.item.id);
  args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][image][id]") + "="
    + RotatePhotoBlock.image.id);
  args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][class]") + "="
    + RotatePhotoBlock.class);
  args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][id]") + "="
    + RotatePhotoBlock.id);

  /* Make Ajax callback request */
  connection = GalleryUtilities.callbackRequest(form.action, args);
}
