<?php
class BaseModule {
  function Hook() {
    return 1;
  }
}

class Module1 {
  function Hook() {
    return 1;
  }
}

class Module2 {
}

class Module3 {
}

function expected() {
  return 1;
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
    if (method_exists($instance, 'Hook')) {
      $answer += $instance->Hook();
    }
  }
  return $answer;
}
?>