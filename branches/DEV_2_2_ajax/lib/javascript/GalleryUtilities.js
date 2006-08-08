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
 * Collection of useful JavaScript utilities
 */
function GalleryUtilities() {
}

/**
 * Client supports Ajax callbacks
 *
 * @return {Boolean} true if the client supports Ajax callbacks
 */
GalleryUtilities.isCallbackSupported = function() {
  return YAHOO.util.Connect.getConnectionObject();
}

/**
 * Serialize form elements
 *
 * @param {Form} form to serialize
 * @param {Element} target of event which triggered form's submission.  Other submit elements are
 *                  not serialized.
 * @return {Array} "name=value" arguments
 */
GalleryUtilities.serializeForm = function(form, target) {
  form = YAHOO.util.Dom.get(form);

  var args = [];
  YAHOO.util.Dom.batch(form.elements, function(element) {

    /* Don't serialize form elements without name attributes */
    if (element.name == "") {
      return;
    }

    /* Don't serialize submit elements which weren't clicked */
    if (element.type.toLowerCase() == "submit" && element != YAHOO.util.Dom.get(target)) {
      return;
    }

    /* Serialize form elements */
    switch (element.type) {
    case "select-one":
      var option = element.options[element.selectedIndex];
      var arg = [element.name, option.value];
      break;
    case "select-multiple":
      var value = [];
      YAHOO.util.Dom.batch(element.options, function(option) {
	if (option.selected) {
	  value.push(option.value);
	}
      });
      var arg = [element.name, value];
      break;
    case "checkbox":
    case "radio":
      if (element.checked) {
	var arg = [element.name, element.value];
      }
      break;
    case "submit":
    case "hidden":
    case "password":
    case "text":
      var arg = [element.name, element.value];
      break;
    }

    /* Ignore empty arguments */
    if (arg) {
      args.push(encodeURIComponent(arg[0]) + "=" + encodeURIComponent(arg[1]));
    }
  });

  return args;
}

/**
 * Make Ajax callback request
 *
 * @param {String} request URL
 * @param {Array} "name=value" arguments
 * @return {Object} YUI connection object
 */
GalleryUtilities.callbackRequest = function(url, args) {
  return YAHOO.util.Connect.asyncRequest("POST", url, {
    success: function(response) {
      if (response.getResponseHeader["Content-Type"] &&
	  response.getResponseHeader["Content-Type"].ltrim().substr(0, 15) ==
	    "text/javascript") {
	eval(response.responseText);
	this.callbackEvent.fire(response);
	return;
      }

      document.open();
      document.write(response.responseText);
      document.close();
    },

    failure: function(response) {
      if (response.getResponseHeader["Content-Type"] &&
	  response.getResponseHeader["Content-Type"].ltrim().substr(0, 15) ==
	    "text/javascript") {
	eval(response.responseText);
	this.callbackEvent.fire(response);
	return;
      }

      document.open();
      document.write(response.responseText);
      document.close();
    },
    
    scope: this}, args.join("&"));
}

/**
 * Custom event triggered on all callback responses
 */
GalleryUtilities.callbackEvent = new YAHOO.util.CustomEvent("callback");

/**
 * Callback response is successful
 *
 * @param {Object} YUI response object
 * @return {Boolean} true if the callback response is successful
 */
GalleryUtilities.isResponseSuccessful = function(response) {
  var status = response.status;
  return status >= 200 && status < 300;
}

/**
 * Hide element
 *
 * @param {mixed} one element or many elements
 */
GalleryUtilities.hide = function() {
  for (var i = 0; i < arguments.length; i++) {
    YAHOO.util.Dom.get(arguments[i]).style.display = "none";
  }
}

/**
 * Show element
 *
 * @param {mixed} one element or many elements
 */
GalleryUtilities.show = function() {
  for (var i = 0; i < arguments.length; i++) {
    YAHOO.util.Dom.get(arguments[i]).style.display = "";
  }
}

/**
 * Element ids in Gallery contain 1) the element id, 2) the template basename - to avoid conflicts
 * between different templates included in the same HTML page - & optionally 3) a template id - to
 * avoid conflicts between the same template, if included more than once like an item block on an
 * album page.
 *
 * @param {String} element id
 * @param {String} template name
 * @param {String} template id
 * @return {String} an element id
 */
GalleryUtilities.elementId = function(elementId, templateName, templateId) {

  /* JavaScript reference mentions join is a generic method, yet arguments.join is undefined */
  arguments.join = Array.prototype.join;
  return arguments.join("-");
}

/**
 * Return variable name with prepended prefix
 *
 * @param {String} key
 * @return {String} key with prefix
 * @todo use GALLERY_FORM_VARIABLE_PREFIX
 */
GalleryUtilities.formVar = function(name) {
  return "g2_" + name;
}

/**
 * Trim leading spaces
 *
 * @return {String} this string without leading spaces
 */
String.prototype.ltrim = function() {
  var index = 0;
  while (this.substr(index, 1) == " ") {
    index++;
  }

  return this.substr(index);
}
