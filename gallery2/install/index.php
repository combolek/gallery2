<?php
/*
 * ATTENTION:
 *
 * If you're seeing this in your browser, and are trying to install Gallery,
 * you either do not have PHP installed, or if it is installed, it is not
 * properly enabled. Please visit the following page for assistance:
 *
 *    http://gallery.sourceforge.net/
 *
 * ----------------------------------------------------------------------------
 *
 * $Id$
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2004 Bharat Mediratta
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

//XXX ENABLED FOR DEBUGGING
@ini_set('display_errors', 1);

session_start();

if (!function_exists('_')) {
	function _($s) {
		return $s;
	}
}

if (isset($_GET['step'])) {
	$step = $_GET['step'];
} else {
	$step = 0;
}

if ($step == 1 && isset($_GET['action']) && $_GET['action'] == 'authDownload') {
	if (isset($_SESSION['auth'])) {
		$auth = $_SESSION['auth'];
		$auth .= "\r\n";
		header("Content-Type: text/plain");
		header("Content-Length: " . strlen($auth));
		header("Content-Description: Download login.txt to your computer.");
		header("Content-Disposition: attachment; filename=login.txt");
		print $auth;
		exit;
	} else {
		header("Location: index.php?step=1&auth=nosession");
	}
}

$navbar = '';
$navtext = array (_('Welcome'),
				  _('Authenticate'),
				  _('Install Checks'),
				  _('System Checks'),
				  _('Admin User Setup'),
				  _('Storage Setup'),
				  _('Database Setup'),
				  _('Finish'));
$status = array();
foreach (array_keys($navtext) as $curr) {
	array_push($status, false);
}
$status[0] = true;

// make percentage a nice round multiple of 5
if (0 == count($navtext) || $step < 2) {
	$percentage = 0;
} else {
	$percentage = round((100 * ($step - 1) / (count($navtext) - 2)) / 5) * 5;
}

$authenticated = false;
if ($step > 1 || ($step == 1 && (!isset($_GET['error']) && ((isset($_GET['action']) && !($_GET['action'] === 'new')) || !isset($_GET['action']))))) {
	//if ($step > 0) {
	$authFile = dirname(__FILE__) . '/../login.txt';
	if (!file_exists($authFile)) {
		header('Location: index.php?step=1&error=nofile');
	} elseif (!is_readable($authFile)) {
		header('Location: index.php?step=1&error=noperms');
	} elseif (!isset($_SESSION['auth'])) {
		header('Location: index.php?step=1&error=nosession');
	} else {
		$fileAuth = trim(file_get_contents($authFile));
		if (!($fileAuth === $_SESSION['auth'])) {
			header('Location: index.php?step=1&error=nomatch');
		} else {
			$authenticated = true;
			if (isset($_SESSION['status'])) {
				$status = $_SESSION['status'];
			}
			$status[1] = true;
		}
	}
}

// items to include in HTTP headers
$errorMsg = array();
if ($step == 1) {
	if (isset($_GET['error'])) {
		$error = $_GET['error'];
		// uh oh...
		if ($error === 'nofile') {
			array_push($errorMsg, _('<b>Error:</b> could not locate <b>login.txt</b>. Please place it in your <tt>gallery</tt> directory.'));
			$keyGen = false;
		} elseif ($error === 'noperms') {
			array_push($errorMsg, _('<b>Error:</b> your <b>login.txt</b> file is not readable. Please give Gallery read permissions on the file.'));
			$keyGen = false;
		} elseif ($error === 'nosession') {
			array_push($errorMsg, _('<b>Error:</b> session expired. Please download a new authentication string from below and try again.'));
			$keyGen = true;
		} elseif ($error === 'nomatch') {
			array_push($errorMsg, _('<b>Error:</b> your <b>login.txt</b> key does not match correctly. Please download a new authentication string from below and try again.'));
			$keyGen = true;
		}
	} elseif ($authenticated) {
		$keyGen = false;
	} else {
		$keyGen = true;
	}

	if ($keyGen == true || !isset($_SESSION['auth'])) {
		for ($len=64, $rand=''; strlen($rand) < $len;
			 $rand .= chr(!mt_rand(0,2) ? mt_rand(48,57) : (!mt_rand(0,1) ? mt_rand(65,90) : mt_rand(97,122))));
		$rand = md5($rand);
		$_SESSION['auth'] = $rand;
	} else {
		$rand = $_SESSION['auth'];
	}
} elseif ($step == 4) {
	if (isset($_GET['action']) && $_GET['action'] === 'create') {
		$status[$step] = false;
	}
	if (isset($_POST['uname']) && isset($_POST['passA']) && isset($_POST['passB'])) {
		if (empty($_POST['uname'])) {
			array_push($errorMsg, _('Error: you must enter a username!'));
		} else {
			$_SESSION['uname'] = $_POST['uname'];
		}
		if (empty($_POST['passA']) || empty($_POST['passB'])) {
			if (empty($_POST['passA']) && empty($_POST['passB'])) {
				array_push($errorMsg, _('Error: you must enter a password!'));
			} else {
				array_push($errorMsg, _('Error: you must enter your password twice.'));
			}
		} elseif ($_POST['passA'] !== $_POST['passB']) {
			array_push($errorMsg, _('Error: passwords do not match. Please enter them again.'));
		} else {
			$_SESSION['pass'] = $_POST['passA'];
		}
		if (count($errorMsg) == 0) {
			$status[$step] = true;
		}
	}
}

printNavBar();

// this can be cleaned up
include(dirname(__FILE__) . '/head.inc');
if ($step < 1) {
	Welcome();
} elseif ($step == 1) {
	Authenticate($rand);
} elseif ($step == 2) {
	InstallCheck();
} elseif ($step == 3) {
	SystemCheck();
} elseif ($step == 4) {
	AdminSetup();
} elseif ($step == 5) {
	StorageSetup();
} elseif ($step == 6) {
	DatabaseSetup();
} elseif ($step == 7) {
	Finish();
} else {
	Welcome();
}

$_SESSION['status'] = $status;

function Welcome() {
	global $content, $navbar, $percentage, $step, $status;
	
	$content = 'welcome.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');
	
	$status[$step] = true;
}

function Authenticate($rand) {
	global $content, $navbar, $percentage, $step, $status, $errorMsg, $authenticated;

	$content = 'authenticate.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');
	
}

function InstallCheck() {
	global $content, $navbar, $percentage, $step, $status;
	
	$content = 'installCheck.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');

	$status[$step] = true;
}

function SystemCheck() {
	global $content, $navbar, $percentage, $step, $status;
	
	$errors = array();
	
	if (phpversion() < '4.1.0') {
		$error['oldPhp'] = true;
	}
	if (!CheckFileDirective()) {
		$error['brokenFile'] = true;
	}

	$content = 'systemCheck.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');

	$status[$step] = true;
}

function AdminSetup() {
	global $content, $navbar, $percentage, $step, $status, $errorMsg;

	$content = 'adminSetup.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');
}

function StorageSetup() {
	global $content, $navbar, $percentage, $step, $status;

	$content = 'storageSetup.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');
}

function DatabaseSetup() {
	global $content, $navbar, $percentage, $step, $status;

	$content = 'databaseSetup.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');
}

function Finish() {
	global $content, $navbar, $percentage, $step, $status;

	$content = 'finish.inc';
	include(dirname(__FILE__) . '/body.inc');
	include(dirname(__FILE__) . '/foot.inc');
}


function printNavBar() {
	
	global $navbar;
	global $navtext;
	global $status;
	
	// XXX need to modify for RTL
	$navbar .= "<center><div style=\"text-align: center; align: center; width: 85%; padding-bottom: 20px;\">\n";
	foreach (array_keys($navtext) as $step) {
		if ($step != 0) {
			$navbar .= "<div class=\"nav_arrow\">&rarr;</div>\n";
		}
		$navbar .= "<div class=\"navitem\">\n";
		if ($step == 0) {
			$num = '&nbsp;&nbsp;';
		} else {
			$num = $step;
		}
		$navbar .= "<span class=\"nav_num\">$num</span><span class=\"nav_text\">";
		if ($step == 0 || $status[$step-1]) {
			$navbar .= "<a href=\"index.php?step=$step\">$navtext[$step]</a>";
		} else {
			$navbar .= $navtext[$step];
		}
		$navbar .= "</span></div>\n";
	}
	$navbar .= "</div>\n";
}

function CheckFileDirective() {
	if (strstr(__FILE__, 'install/index.php') ||
		strstr(__FILE__, 'install\\install.php')) {
		return 1;
	} else {
		return 0;
	}
}

?>
