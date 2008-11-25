<?php
interface Module {
  function Hook();
}

class BaseModule implements Module {
  function Hook() {
    return 1;
  }
}

class Module1 implements Module {
  function Hook() {
    return 2;
  }
}

class Module2 extends BaseModule implements Module {
}

class Module3 extends BaseModule implements Module {
}

function expected() {
  return 4;
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