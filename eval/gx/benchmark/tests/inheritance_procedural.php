<?php
function base_depth() {
    return 1;
}

function subclass_depth() {
    return 1 + base_depth();
}

function subsubclass_depth() {
    return 1 + subclass_depth();
}


function expected() {
  return 3;
}

function prepare() {
}

function go() {
    return subsubclass_depth();
}
?>