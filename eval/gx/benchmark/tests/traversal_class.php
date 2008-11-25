<?php
class Base {
    function Depth() {
	return 0;
    }
}

class Subclass1 extends Base {
    function Depth() {
	return 1 + parent::Depth();
    }
}

class Subclass2 extends Base {
    function Depth() {
	return 1 + parent::Depth();
    }
}

class Subclass3 extends Base {
    function Depth() {
	return 1 + parent::Depth();
    }
}

function expected() {
  return 3;
}

function prepare() {
    $GLOBALS['instances'] = array(
	new Subclass1(),
	new Subclass2(),
	new Subclass3());
}

function go() {
    $answer = 0;
    foreach ($GLOBALS['instances'] as $instance) {
	$answer += $instance->Depth();
    }
    return $answer;
}
?>