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
var RotatePhotoBlock = {

  /**
   * Submit template's form using Ajax
   *
   * @param {event} event which triggered the form's submision
   * @param {Object} self reference, since function will be executed in scope of the event target
   */
  submit: function(url, templateId, RotatePhotoBlock) {
    return function(event, self) {
      if (!GalleryUtilities.isCallbackSupported()) {
	return;
      }

      var form = YAHOO.util.Dom.get(GalleryUtilities.elementId("form", "RotatePhotoBlock",
	templateId));

      /* Disable template's form */
      YAHOO.util.Dom.batch(form.elements, function(element) {
	element.blur();
	element.disabled = "disabled";
      });

      /* Give immediate feedback if possible */
      if (YAHOO.util.Event.getTarget(event).name
	  == GalleryUtilities.formVar("form[action][rotate][-90]")) {
	YAHOO.util.Dom.get(RotatePhotoBlock.id).style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";
      } else if (YAHOO.util.Event.getTarget(event).name
	  == GalleryUtilities.formVar("form[action][rotate][180]")) {
	YAHOO.util.Dom.get(RotatePhotoBlock.id).style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";
      } else if (YAHOO.util.Event.getTarget(event).name
	  == GalleryUtilities.formVar("form[action][rotate][90]")) {
	YAHOO.util.Dom.get(RotatePhotoBlock.id).style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
      }

      GalleryUtilities.hide(GalleryUtilities.elementId("status", "RotatePhotoBlock", templateId));

      var connection;

      /* Register with all callback responses */
      GalleryUtilities.callbackEvent.subscribe(function(type, args) {
	var response = args[0];
	if (response.tId == connection.tId) {

	  /* Enable template's form */
	  YAHOO.util.Dom.batch(form.elements, function(element) {
	    element.disabled = "";
	  });

	  if (!GalleryUtilities.isResponseSuccessful(response)) {
	    GalleryUtilities.show(GalleryUtilities.elementId("status", "RotatePhotoBlock",
	      templateId));
	    GalleryUtilities.hide(GalleryUtilities.elementId("success", "RotatePhotoBlock",
	      templateId));
	    GalleryUtilities.hide(GalleryUtilities.elementId("warning", "RotatePhotoBlock",
	      templateId));
	    GalleryUtilities.show(GalleryUtilities.elementId("error", "RotatePhotoBlock",
	      templateId));
	  }
	}
      });

      /* Serialize form elements */
      var args = GalleryUtilities.serializeForm(form, YAHOO.util.Event.getTarget(event));
      args.push(GalleryUtilities.formVar("callback") + "=callback");

      args.push(GalleryUtilities.formVar("delegate[view]") + "=core.RotatePhotoBlock");
      args.push(GalleryUtilities.formVar("delegate[templateId]") + "=" + templateId);
      args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][item][id]") + "="
        + RotatePhotoBlock.item.id);
      args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][image][id]") + "="
        + RotatePhotoBlock.image.id);
      args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][class]") + "="
        + RotatePhotoBlock.class);
      args.push(GalleryUtilities.formVar("delegate[RotatePhotoBlock][id]") + "="
        + RotatePhotoBlock.id);

      /* Make Ajax callback request */
      connection = GalleryUtilities.callbackRequest(url, args);

      YAHOO.util.Event.preventDefault(event);
    };
  }
};
