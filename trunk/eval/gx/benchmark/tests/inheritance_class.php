<?php
class Base {
    function Depth() {
	return 1;
    }
}

class Subclass extends Base {
    function Depth() {
	return 1 + parent::Depth();
    }
}

class SubSubclass extends Subclass {
    function Depth() {
	return 1 + parent::Depth();
    }
}

function prepare() {
    $GLOBALS['instance'] = new SubSubclass();
}

function go() {
    return $GLOBALS['instance']->Depth();
}
?>