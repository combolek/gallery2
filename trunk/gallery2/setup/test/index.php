<head>
<style type="text/css">
<!--
body {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt}
th {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt; font-weight: bold; background-color: #D3DCE3}
td {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt}
form {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt}
h1 {font-family: helvetica, arial, geneva, sans-serif; font-size: 16pt; font-weight: bold}
A:link {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt; text-decoration: none; color: #0000ff}
A:visited {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt; text-decoration: none; color: #0000ff}
A:hover {font-family: helvetica, arial, geneva, sans-serif; font-size: 10pt; text-decoration: underline; color: #FF0000}
A:link.nav {font-family: helvetica, arial, geneva, sans-serif; color: #000000}
A:visited.nav {font-family: helvetica, arial, geneva, sans-serif; color: #000000}
A:hover.nav {font-family: helvetica, arial, geneva, sans-serif; color: #FF0000}
.nav {font-family: helvetica, arial, geneva, sans-serif; color: #000000}
//-->
</style>
</head>
<?php
require('init.php');
require('TestCase.class');

$testDir = 'TestCase';
if ($dir = opendir($testDir)) {
    while (($file = readdir($dir)) != false) {
	if (preg_match('/.class$/', $file)) {
	    require_once($testDir . '/' . $file);

	    $name = str_replace('.class', '', $file);
	    $className = $name . 'TestCase';
	    $class = new $className();
	    $testTable[$name] = $class;
	}
    }
    closedir($dir);
} else {
    print "Unable to open test dir";
}

print '<center>';
print '<h1> <a href=index.php>Test Harness</a> </h1>';
print '<table border=1 cellspacing=0 cellpadding=5>';
print '<tr>';
print '<th bgcolor=#9999CC> Name';
print '<th bgcolor=#9999CC> Description';
print '</tr>';

ksort($testTable);
$evenOdd = 0;
foreach ($testTable as $name => $class) {
    print '<tr>';
    if ($evenOdd++ % 2) {
	$bgColor = '#EEEEEE';
    } else {
	$bgColor = '#CCCCCC';
    }
    print '<td bgColor=' . $bgColor . '>';
    print '<a href=index.php?testName=' . $name . '>';
    print $name;
    print '</a>';
    print '</td>';
    print '<td bgColor=' . $bgColor . '>';
    print $class->getDescription();
    print '</td>';
    print '</tr>';
}

print '</table>';
print '</center>';

print '<br>';
print '<hr>';

if (!empty($HTTP_GET_VARS['testName'])) {
    ob_start();
    $ret = runTest($HTTP_GET_VARS['testName']);
    $buf = ob_get_contents();
    ob_end_clean();

    if ($ret->isError()) {
	print 'Overall Status: ' . $ret->getAsString() . '<br>';
    } else {
	print 'Overall Status: Success<br>';
    }

    print '<hr>';

    print $buf;
}

function runTest($testName) {
    global $testTable;
    global $gallery;
    
    $class = $testTable[$testName];

    $dependencies = $class->getDependencies();
    foreach ($dependencies as $test) {
	$ret = runTest($test);
	if ($ret->isError()) {
	    return $ret;
	}
    }

    if ($class->requireDatabaseConnection()) {
	/* Set up our storage */
	$storage = new DatabaseStorage();
	$storage->setType($gallery->getConfig('storage.database.type'));
	$storage->setHostname($gallery->getConfig('storage.database.hostname'));
	$storage->setUsername($gallery->getConfig('storage.database.username'));
	$storage->setPassword($gallery->getConfig('storage.database.password'));
	if ($class->useDefaultDatabase()) {
	    $storage->setDatabase($gallery->getConfig('storage.database.database'));
	}
	$ret = $storage->connect();
	if ($ret->isError()) {
	    print "Error: ";
	    print $ret->getAsString();
	    exit;
	}
    
	$gallery->setStorage($storage);
    }

    print '<b>Test: ' . $testName . '</b>';
    print '<br>';
    
    print '<b>Start</b><br>';
    set_time_limit(30);
    $ret1 = $class->start();
    if ($ret1->isSuccess()) {
	print 'Status: Success<br>';
    } else {
	print 'Status: ' . $ret1->getAsString();
    }

    print '<br>';
    
    print '<b>Cleanup</b><br>';
    $ret2 = $class->cleanup();
    if ($ret2->isSuccess()) {
	print 'Status: Success<br>';
    } else {
	print 'Status: ' . $ret2->getAsString();
    }

    print '<hr>';
    print '<b>Debug Output</b>';
    print '<pre>';
    foreach ($class->getDebugOutput() as $line) {
	print $line;
    }
    print '</pre>';

    if ($ret1->isError()) {
	return $ret1;
    }

    return $ret2;
}
?>
