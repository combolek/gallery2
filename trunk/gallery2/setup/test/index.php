<?php
require_once('../../init.php');
require_once('TestCase.class');
require_once('TestCase/ActivateModule.class');
require_once('TestCase/DeactivateModule.class');

$modulesDir = $gallery->getConfig('code.gallery.modules');
$tests = array();

list ($ret, $platform) = $gallery->getPlatform();
if ($ret->isError()) {
    $ret = $ret->wrap(__FILE__, __LINE__);
    print $ret->getAsHtml();
    return;
}

/*
 * Load the test cases for every module (active or not).
 */
list ($ret, $moduleNames) = $gallery->getAllModuleNames();
if ($ret->isError()) {
    $ret = $ret->wrap(__FILE__, __LINE__);
    print $ret->getAsHtml();
    return;
}

foreach ($moduleNames as $moduleName) {
    $testDir = $modulesDir . $moduleName . '/test/TestCase';

    /* Add our implicit tests */
    foreach (array('ActivateModule', 'DeactivateModule') as $implicitTestName) {
	$className = $implicitTestName . 'TestCase';
	$testCase = new $className($moduleName);
	$test = array('moduleName' => $moduleName,
		      'testName' => $implicitTestName,
		      'class' => $testCase,
		      'description' => $testCase->getDescription());
	$tests[$moduleName][$implicitTestName] = $test;
    }

    $files = array();
    if ($platform->is_dir($testDir) && $dir = $platform->opendir($testDir)) {
	while (($file = readdir($dir)) != false) {
	    if (preg_match('/.class$/', $file)) {
		$files[] = $file;
		require_once($testDir . '/' . $file);
	    }
	}
	closedir($dir);

	/* Add our explicit tests */
	foreach ($files as $file) {
	    $testName = str_replace('.class', '', $file);
	    $className = $testName . 'TestCase';
	    $testCase = new $className();
	    $test = array('moduleName' => $moduleName,
			  'testName' => $testName,
			  'class' => $testCase,
			  'description' => $testCase->getDescription());
	    foreach ($testCase->getIterations() as $iter) {
		$test['iterations'][$iter] = array('count' => $iter,
						   'title' => shorten($iter));
	    }
	    $tests[$moduleName][$testName] = $test;
	}
    }
}

/*
 * Alphabetize the module names and test names
 */
ksort($tests);
foreach ($tests as $moduleName => $testArray) {
    ksort($tests[$moduleName]);
}

/* Suppress preliminary debug output */
if (0) {
    print "<pre>";
    print_r($gallery->getDebugBuffer());
    print "</pre>";
}
$gallery->clearDebugBuffer();

$results = array();
if (!empty($HTTP_GET_VARS['testName']) &&
    !empty($HTTP_GET_VARS['moduleName'])) {
    
    $testName = $HTTP_GET_VARS['testName'];
    $moduleName = $HTTP_GET_VARS['moduleName'];
    
    $iterations = 1;
    if (!empty($HTTP_GET_VARS['iterations'])) {
	$iterations = $HTTP_GET_VARS['iterations'];
    }

    $results = $results + runTest($moduleName, $testName, $iterations);
}

$rollup = array();
if (sizeof($results) > 1) {
    $rollup['elapsed'] = 0.0;
    foreach ($results as $result) {
	if (!empty($result['error']) && empty($rollup['error'])) {
	    $rollup['error'] = $result['error'];
	}
	$rollup['elapsed'] += $result['timing']['elapsed'];
    }
}

/*
 * Get a Smarty instance and specify a local directory in the setup directory as the
 * compile target.  This allows us to use Smarty before the core module has
 * been configured.
 */
$setup = $gallery->getConfig('code.gallery.setup');
$smartyDir = $setup . 'smarty';

/*
 * Make sure the compile dir exists
 */
if (!($platform->file_exists($smartyDir) &&
      $platform->is_dir($smartyDir) &&
      $platform->is_writeable($smartyDir))) {

    print "You must create a temporary directory writeable by the web server<br>";
    print "in order to use the test harness.  Here's one way to do it:<br>";
    print "<pre>";
    print "    cd $setup\n";
    print "    mkdir smarty\n";
    print "    chmod 777 smarty\n";
    print "</pre>";
    return;
}

list ($ret, $smarty) = $gallery->getSmarty($smartyDir);
$smarty->compile_dir = $smartyDir;
if ($ret->isError()) {
    $ret = $ret->wrap(__FILE__, __LINE__);
    print $ret->getAsHtml();
    return;
}

$smarty->template_dir = dirname(__FILE__) . '/templates';
$smarty->assign('tests', $tests);
$smarty->assign('results', $results);
$smarty->assign('rollup', $rollup);
$smarty->display('index.tpl');

function shorten($number) {
    $number = str_replace("000000", "M", $number);
    $number = str_replace("00000", "00K", $number);
    $number = str_replace("0000", "0K", $number);
    $number = str_replace("000", "K", $number);
    return $number;
}

function runTest($moduleName, $testName, $iterations) {
    global $gallery;
    global $tests;

    $results = array();
    $class = $tests[$moduleName][$testName]['class'];

    /* Satisfy all dependencies first */
    $dependencies = $class->getDependencies();
    foreach ($dependencies as $dependency) {
	$results = array_merge($results,
			       runTest($dependency['moduleName'],
				       $dependency['testName'],
				       $iterations));
    }

    /* Run the test */
    ob_start();

    $gallery->setTimeLimit(30);
    list ($timing, $ret1) = $class->start($iterations);
    $ret2 = $class->cleanup();

    $result = array();
    $result['moduleName'] = $moduleName;
    $result['testName'] = $testName;
    $result['iterations'] = $iterations;
    $result['timing'] = $timing;
    $result['debug'] = $gallery->getDebugBuffer();
    $gallery->clearDebugBuffer();
    
    $result['output'] = ob_get_contents();
    ob_end_clean();

    if ($ret1->isError() || $ret2->isError()) {
	if ($ret1->isError()) {
	    $ret1 = $ret1->wrap(__FILE__, __LINE__);
	    $result['error'] = $ret1->getAsHtml();
	} else {
	    $ret2 = $ret2->wrap(__FILE__, __LINE__);
	    $result['error'] = $ret2->getAsHtml();
	}
    } else {
	$result['error'] = null;
    }
    $results[] = $result;

    return $results;
}
?>
