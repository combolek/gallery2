<?php
// Step 1: APPLICATION CONSTANTS - Set the constants to use in this application.
// These constants are accessible throughout the application, even in ini
// files. We optionally set APPLICATION_PATH here in case our entry point
// isn't index.php (e.g., if required from our test suite or a script).
defined('APPLICATION_PATH')
    or define('APPLICATION_PATH', dirname(__FILE__));

// Trim off the index.php to make our application url
defined('APP_URL')
    or define('APP_URL', substr($_SERVER['SCRIPT_NAME'], 0, -10));

// Trim off the index.php to make our application url
defined('DATA_DIR')
    or define('DATA_DIR', APPLICATION_PATH . '/data');

defined('APPLICATION_ENVIRONMENT')
    or define('APPLICATION_ENVIRONMENT', 'development');

// Step 2: FRONT CONTROLLER - Get the front controller.
// The Zend_Front_Controller class implements the Singleton pattern, which is a
// design pattern used to ensure there is only one instance of
// Zend_Front_Controller created on each request.
$frontController = Zend_Controller_Front::getInstance();

// Step 3: CONTROLLER DIRECTORY SETUP - Point the front controller to your action
// controller directory.
$frontController->setControllerDirectory(APPLICATION_PATH . '/controllers');

// Step 4: APPLICATION ENVIRONMENT - Set the current environment.
// Set a variable in the front controller indicating the current environment --
// commonly one of development, staging, testing, production, but wholly
// dependent on your organization's and/or site's needs.
$frontController->setParam('env', APPLICATION_ENVIRONMENT);

// CONFIGURATION - Setup the configuration object
// The Zend_Config_Ini component will parse the ini file, and resolve all of
// the values for the given section.  Here we will be using the section name
// that corresponds to the APP's Environment
$config = new Zend_Config_Ini(
    APPLICATION_PATH . '/config/app.ini',
        APPLICATION_ENVIRONMENT);

$dbAdapter = Zend_Db::factory($config->database);
Zend_Db_Table_Abstract::setDefaultAdapter($dbAdapter);

// REGISTRY - setup the application registry
// An application registry allows the application to store application
// necessary objects into a safe and consistent (non global) place for future
// retrieval.  This allows the application to ensure that regardless of what
// happends in the global scope, the registry will contain the objects it
// needs.
$registry = Zend_Registry::getInstance();
$registry->configuration = $config;
$registry->dbAdapter = $dbAdapter;

// CLEANUP - remove items from global scope
// This will clear all our local boostrap variables from the global scope of
// this script (and any scripts that called bootstrap).  This will enforce
// object retrieval through the Applications's Registry
unset($frontController, $view, $config, $dbAdapter, $registry);

// Enable layouts
// http://framework.zend.com/manual/en/zend.layout.quickstart.html
Zend_Layout::startMvc();
