<?php
interface Module {
    function Hook();
}

class BaseModule implements Module {
    function Hook() {
	return 0;
    }
}

class Module1 implements Module {
    function Hook() {
	return 3;
    }
}

class Module2 extends BaseModule implements Module {
}

class Module3 extends BaseModule implements Module {
}

function prepare() {
    $GLOBALS['instances'] = array(
	new Module1(),
	new Module2(),
	new Module3());
}

function go() {
    $answer = 0;
    foreach ($GLOBALS['instances'] as $instance) {
	$answer += $instance->Hook();
    }
    return $answer;
}
?>