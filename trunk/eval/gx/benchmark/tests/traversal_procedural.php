<?php
function base_depth() {
    return 0;
}

function subclass1_depth() {
    return 1 + base_depth();
}

function subclass2_depth() {
    return 1 + base_depth();
}

function subclass3_depth() {
    return 1 + base_depth();
}

function prepare() {
    $GLOBALS['callbacks'] = array(
	'subclass1_depth',
	'subclass2_depth',
	'subclass3_depth');
}

function go() {
    $answer = 0;
    foreach ($GLOBALS['callbacks'] as $callback) {
	if (function_exists($callback)) {
	    $answer += $callback();
	} else {
	    $answer = 1 + base_depth();
	}
    }
    return $answer;
}
?>