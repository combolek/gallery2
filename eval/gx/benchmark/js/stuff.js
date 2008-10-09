/* Stolen from Zach's code */

function loadUrl(url, div, expire) {
    if (document.getElementById(div)) {
	document.getElementById(div).innerHTML = 'Loading ' + div;
    }
    var callback = {
    success: function( o ) {
	    if (document.getElementById(div)) {
		document.getElementById(div).innerHTML = div + ' ' + o.responseText;
	    } else {
		alert(div);
	    }
	},
    failure: function( o ) {
	    if (document.getElementById(div)) {
		document.getElementById(div).innerHTML = 'Failed.';
	    }
	},
    argument: null,    
    timeout: expire
    };
    
    YAHOO.util.Connect.asyncRequest(
        'GET',
        url,
        callback
    );
}
