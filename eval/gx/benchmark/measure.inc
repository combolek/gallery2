<?php
function start() {
    $GLOBALS['start'] = microtimeFloat();
}

function stop() {
    $GLOBALS['stop'] = microtimeFloat();
}

function elapsed() {
    return $GLOBALS['stop'] - $GLOBALS['start'];
}

function microtimeFloat() {
    list($usec, $sec) = explode(" ", microtime());
    return ((float)$usec + (float)$sec);
}
?>