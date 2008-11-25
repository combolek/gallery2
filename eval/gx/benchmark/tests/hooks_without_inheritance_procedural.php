<?php
function module1_hook() {
  return 1;
}

function expected() {
  return 1;
}

function prepare() {
    $GLOBALS['callbacks'] = array(
	'module1_hook',
	'module2_hook',
	'module3_hook');
}

function go() {
    $answer = 0;
    foreach ($GLOBALS['callbacks'] as $callback) {
	if (function_exists($callback)) {
	    $answer += $callback();
	}
    }
    return $answer;
}
?>