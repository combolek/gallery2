<?php
function nicename($filename) {
    return ucwords(preg_replace('/[^[:alnum:]]+/', ' ', $filename));
}

$contents = new DirectoryIterator('tests');
$files = array();
foreach ($contents as $file) {
    if (!$contents->current()->isDot()
	&& $contents->current()->isFile()
	&& '~' != substr($file->getFileName(), -1)) {
	$files[] = str_replace('.php', '', $file->getFileName());
    }
}
sort($files);
array_unshift($files, 'overhead');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
    <title>benchmarks</title>
<script type="text/javascript" src="js/yui/build/yuiloader/yuiloader-beta-min.js"></script>
<script type="text/javascript" src="js/yui/build/event/event-min.js"></script>
<script type="text/javascript" src="js/yui/build/dom/dom-min.js"></script>
<script type="text/javascript" src="js/yui/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="js/yui/build/connection/connection-min.js"></script>
<script type="text/javascript" src="js/stuff.js"></script>
<?php
echo '<script type="text/javascript">';
echo "function run_tests() {\n";
echo "var divs = new Array();\n";
echo "var i = 0;\n";
foreach ($files as $file) {
    echo "divs[i] = document.createElement('div');";
    echo "divs[i].id = '$file';\n";
    echo "document.body.appendChild(divs[i]);\n";
}
echo "i = 0;";
foreach ($files as $file) {
    echo "setTimeout(function () { loadUrl('loop.php?type=$file', '$file', 2500);}, i * 3000)\n";
    echo "i++;\n";
}
echo "}\n";
echo "YAHOO.util.Event.addListener(window, 'load', run_tests);\n";
echo '</script>';
?>
  </head>
  <body>
    <h1>benchmarks</h1>
<?php
echo '<ul>';
foreach ($files as $file) {
    echo '<li>';
    echo '<a href="loop.php?type=';
    echo $file;
    echo '">';
    echo nicename($file);
    echo '</a>';
    echo '</li>';
}
echo '</ul>';
?>
</body>
</html>
