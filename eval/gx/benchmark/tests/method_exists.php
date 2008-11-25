<?php
class BaseClass {
    function A() {
	return 1;
    }
}

function expected() {
  return 1;
}

function prepare() {
}

function go() {
  return method_exists("BaseClass", "A");
}
?>