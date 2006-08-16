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

    var params = [];
    Array.prototype.forEach.apply(form.elements, [function(element) {

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
	  Array.prototype.forEach.apply(element.options, [function(option) {
	      if (option.selected) {
		value.push(option.value);
	      }
	    }]);
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
	  params.push(arg);
	}
      }]);

    return params;
  }

/**
 * Make Ajax callback request
 *
 * @param {String} request URL
 * @param {Array} "name=value" arguments
 * @param {mixed} additional arguments applied to fire custom events
 * @return {Object} YUI connection object
 */
GalleryUtilities.callbackRequest = function(url, params) {
    var args = Array.prototype.slice.apply(arguments, [2]);
    var connection = YAHOO.util.Connect.asyncRequest("POST", url, {
	success: function(response) {
	    if (response.getResponseHeader["Content-Type"]
	        && response.getResponseHeader["Content-Type"].ltrim().substr(0, 15)
		== "text/javascript") {
	      eval(response.responseText);
	      this.responseEvent.fire.apply(this.responseEvent, [response].concat(args));

	      return;
	    }

	    document.open();
	    document.write(response.responseText);
	    document.close();
	  },

	failure: function(response) {
	    if (response.getResponseHeader["Content-Type"]
	        && response.getResponseHeader["Content-Type"].ltrim().substr(0, 15)
		== "text/javascript") {
	      eval(response.responseText);
	      this.responseEvent.fire.apply(this.responseEvent, [response].concat(args));

	      return;
	    }

	    document.open();
	    document.write(response.responseText);
	    document.close();
	  },
	
	scope: this}, params.map(function(param) {
	    return encodeURIComponent(param[0]) + "=" + encodeURIComponent(param[1]);
	  }).join("&"));


      this.requestEvent.fire.apply(this.requestEvent, [connection].concat(args));

      return connection;
  }

/**
 * Custom event triggered on all callback requests
 */
GalleryUtilities.requestEvent = new YAHOO.util.CustomEvent("request");

/**
 * Custom event triggered on all callback responses
 */
GalleryUtilities.responseEvent = new YAHOO.util.CustomEvent("response");

/**
 * Callback response is successful
 *
 * @param {Object} YUI response object
 * @return {Boolean} true if the callback response is successful
 */
GalleryUtilities.isResponseSuccessful = function(response) {
    return response.status >= 200 && response.status < 300;
  }

/**
 * Center one element relative to another
 *
 * @param {Element} one element
 * @param {Element} another element
 */
GalleryUtilities.center = function(element, context) {
    element = YAHOO.util.Dom.get(element);
    context = YAHOO.util.Dom.get(context);

    var position = YAHOO.util.Dom.getXY(context);
    position[0] += (context.offsetWidth - element.offsetWidth) / 2;
    position[1] += (context.offsetHeight - element.offsetHeight) / 2;

    YAHOO.util.Dom.setXY(element, position);
  }

/**
 * Hide element
 *
 * @param {mixed} one element or many elements
 */
GalleryUtilities.hide = function() {
    Array.prototype.forEach.apply(arguments, [function(argument) {
	var element = YAHOO.util.Dom.get(argument);
	if (element != null) {
	  element.style.display = "none";
	}
      }]);
  }

/**
 * Show element
 *
 * @param {mixed} one element or many elements
 */
GalleryUtilities.show = function() {
    Array.prototype.forEach.apply(arguments, [function(argument) {
	var element = YAHOO.util.Dom.get(argument);
	if (element != null) {
	  element.style.display = "";
	}
      }]);
  }

/**
 * Element ids in Gallery contain 1) the element id, 2) the template basename - to avoid conflicts
 * between different templates included in the same HTML page - and optionally 3) a template id - to
 * avoid conflicts between the same template, if included more than once like an item block on an
 * album page.
 *
 * @param {String} element id
 * @param {String} template name
 * @param {String} template id
 * @return {String} an element id
 */
GalleryUtilities.elementId = function(elementId, templateName, templateId) {
    return Array.prototype.filter.apply(arguments, [function(argument) {
        return argument != null;
      }]).join("-");
  }

/**
 * Return prefixed form variable name
 *
 * @param {String} form variable name
 * @return {String} prefixed form variable name
 * @todo use GALLERY_FORM_VARIABLE_PREFIX
 */
GalleryUtilities.formVar = function(key) {
    return "g2_" + key;
  }

/**
 * Return array of prefixed form variable names and values
 *
 * @param {String} form variable name
 * @param {mixed} form variable value or values
 * @return {Array} {Array} {String} prefixed form variable name
 *                         {mixed} form variable value
 */
GalleryUtilities.formVars = function(key, value) {
    var vars = [[GalleryUtilities.formVar(key), value]];
    var params = [];
    while (vars.length > 0) {
      var arg = vars.shift();
      if (typeof arg[1] == "object") {
	for (var key in arg[1]) {
	  vars.push([arg[0] + "[" + key + "]", arg[1][key]]);
	}
      } else {
        params.push(arg);
      }
    }

    return params;
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
