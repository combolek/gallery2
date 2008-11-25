<?php
include('measure.inc');
header('Content-Type: text/html');

print "<pre>";
if ('overhead' == $_REQUEST['type']) {
  $type = 'overhead.php';
} else {
  $type = 'tests/' . preg_replace('/\W/', '', $_REQUEST['type']) . '.php';
}
if (!file_exists($type) || !is_file($type) || !is_readable($type)) {
  foreach (glob("tests/*.php") as $file) {
    $test = preg_replace("|tests/(.*).php|", "\\1", $file);
    print "<a href=\"loop.php?type=$test\">$test</a>\n";
  }
  exit;
}
include($type);

prepare();
start();
if (isset($_REQUEST["iterations"])) {
  $iterations = (int)$_REQUEST["iterations"];
} else {
  $iterations = 100000;
}
$result = 0;
for ($i = 0; $i < $iterations; $i++) {
  $result += go();
}
stop();

$elapsed = elapsed();
printf("%d iterations in %f seconds (%d iterations / second)\n",
       $iterations, $elapsed, $iterations / $elapsed);
// print "$result, $iterations, " . expected() . "\n";
assert($result == $iterations * expected());
?>