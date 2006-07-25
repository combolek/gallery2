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
var GalleryUtilities = {

  /* Client supports Ajax callbacks */
  isCallbackSupported: function() {
    return YAHOO.util.Connect.getConnectionObject();
  },

  /* Serialize form elements */
  serializeForm: function(form, target) {
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
  },

  /* Make Ajax callback request */
  callbackRequest: function(url, args) {

    /* TODO Make script a template & use {g->url} */
    YAHOO.util.Connect.asyncRequest("POST", url, {
      success: function(response) {
	if (response.getResponseHeader["Content-Type"] &&
	    response.getResponseHeader["Content-Type"].ltrim().substr(0, 15) ==
	      "text/javascript") {
	  eval(response.responseText);
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
	  return;
	}

	document.open();
	document.write(response.responseText);
	document.close();
      }}, args.join("&"));
  },

  hide: function() {
    for (var i = 0; i < arguments.length; i++) {
      YAHOO.util.Dom.get(arguments[i]).style.display = "none";
    }
  },

  show: function() {
    for (var i = 0; i < arguments.length; i++) {
      YAHOO.util.Dom.get(arguments[i]).style.display = "";
    }
  }
};

/* Trim leading spaces */
String.prototype.ltrim = function() {
  var index = 0;
  while (this.substr(index, 1) == " ") {
    index++;
  }

  return this.substr(index);
}
