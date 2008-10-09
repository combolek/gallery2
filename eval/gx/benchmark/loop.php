<?php
include('measure.inc');
header('Content-Type: text/plain');

if ('overhead' == $_REQUEST['type']) {
    $type = 'overhead.php';
} else {
    $type = 'tests/' . preg_replace('/\W/', '', $_REQUEST['type']) . '.php';
}
if (!file_exists($type) || !is_file($type) || !is_readable($type)) {
    exit;
}
include($type);

prepare();
start();
$iterations = 100000;
$result = 0;
for ($i = 0; $i < $iterations; $i++) {
    $result += go();
}
stop();

$elapsed = elapsed();
printf("%d iterations in %f seconds (%d iterations / second)\n",
       $iterations, $elapsed, $iterations / $elapsed);
assert($result == $iterations * 3);
?>