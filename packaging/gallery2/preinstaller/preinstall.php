<?php
/* Password: Make the pass phrase at least 6 characters long */
$passPhrase = "";

/*
 * $RCSfile$
 *
 *
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2006 Bharat Mediratta
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
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 */
/**
 * Script to:
 *    - download the gallery2.zip / tar.gz from a known server directly to the
 *      server where the script is running.
 *    - extract the gallery2.zip / tar.gz archive directly on the server
 * @version $Revision$ $Date$
 * @package Preinstaller
 * @author: Andy Staudacher <ast@gmx.ch>
 * @versionId 2.1
 */
error_reporting(E_ALL);
set_time_limit(900);

/*****************************************************************
 * C O N F I G U R A T I O N
 *****************************************************************/
/* Download Location */
$downloadUrls = array();
$mirrors = array(); /* TODO: add a mirror choice, right now it uses the first one in the list */
$mirrors[] = 'http://switch.dl.sourceforge.net/sourceforge/gallery/'; // Europe (CH)
$mirrors[] = 'http://easynews.dl.sourceforge.net/sourceforge/gallery/'; // Americas (USA)
/* Hardcoded defaults / fallbacks (we try to find out these URLs during runtime) */
/*   Latest Release Candidate */
$downloadUrls['rc'] = 'gallery-2.1-full';
/*   Latest stable release */
$downloadUrls['stable'] = 'gallery-2.1-full';
/*   Latest Nightly Snapshot */
$downloadUrls['nightly']= 'gallery-2.1-nightly';
$nightlySnapshotSite = 'http://galleryupdates.jpmullan.com/G2/';

/* The page on GMC that lists the latest versions */
/* FOR GR, we request pages from sf.net which then redirects to GMC, e.g. to /release, /beta, .. */
$versionCheckUrl = 'http://gallery.sourceforge.net/gallery2_version_check.php';

/* Local name of the gallery2 archive (without extension )*/
$archiveBaseName = 'gallery2';
/* A list of folder permissions that are available for chmodding */
$folderPermissionList = array('777', '755', '555');
/* Archive extensions available for download */
$availableExtensions = array('zip', 'tar.gz');
/* Available versions of G2 */
$availableVersions = array('stable', 'rc', 'nightly');


/*****************************************************************
 * M A I N
 *****************************************************************/
$preInstaller = new PreInstaller();
$preInstaller->main();

/*****************************************************************
 * C L A S S E S
 *****************************************************************/
class PreInstaller {

    function main() {
    	/* Authentication */
    	$this->authenticate();

	/* Register all extract / download methods */
	$this->_extractMethods =  array(new UnzipExtractor(),
					new PhpUnzipExtractor(),
					new TarGzExtractor(),
					new PhpTarGzExtractor());
	$this->_downloadMethods = array(new CurlDownloader(),
					new WgetDownloader(),
					new FopenDownloader(),
					new FsockopenDownloader());

	/* Make sure we can write to the current working directory */
	if (!Platform::isDirectoryWritable()) {
	    render('results', array('failure' => 'Local working directory' . dirname(__FILE__) .
				    ' is not writeable!',
				    'fix' => 'ftp> chmod 777 ' . basename(dirname(__FILE__))));
	    exit;
	}

	/* Handle the request */
	if (empty($_POST['command'])) $command = '';
	else $command = trim($_POST['command']);
	switch ($command) {
	    case 'extract':
	        /* Input validation / sanitation */
	    	if (empty($_POST['method'])) $method = '';
	    	else $method = trim($_POST['method']);
	    	if (!preg_match('/^[a-z]+extractor$/', $method)) $method = '';
	    	/* Handle the request */
	    	if (class_exists($method)) {
	    	    global $archiveBaseName;
	    	    $extractor = new $method;
	    	    if ($extractor->isSupported()) {
	    	    	$archiveName = dirname(__FILE__) . '/' .
				$archiveBaseName .  '.' . $extractor->getSupportedExtension();
	    	    	if (file_exists($archiveName)) {
	    	    	    $results = $extractor->extract($archiveName);
	    	    	    if ($results === true) {
	    	    	    	/* Make sure the dirs and files were extracted successfully */
				if (!$this->integrityCheck()) {
	    			    render('results', array('failure' => 'Extraction was successful, but coarse integrity check failed'));
				} else {
				    render('results', array('success' => 'Archive successfully extracted'));

				    /*
				     * Set the permissions in the gallery2 dir may be such that
				     * the user can modify login.txt
				     */
				    @chmod(dirname(__FILE__) . '/gallery2', 0777);
				}
	    	    	    } else {
	    	    	    	render('results', array('failure' => $results));
	    	    	    }
	    	        } else {
	    	            render('results', array('failure' => "Archive $archiveName does not exist in the current working directory"));
	    	    	}
	    	    } else {
	    	    	render('results', array('failure' => "Method $method is not supported by this platform!"));
	    	    }
	    	} else {
	    	    render('results', array('failure' => 'Extract method is not defined or does not exist!'));
	    	}
	    	break;
 	    case 'download':
 	        /* Input validation / sanitation */
 	        /* The download method */
	    	if (empty($_POST['method'])) $method = '';
	    	else $method = trim($_POST['method']);
	    	if (!preg_match('/^[a-z]+downloader$/', $method)) $method = '';
	    	/* ... archive extension */
	    	if (empty($_POST['extension'])) $extension = '';
	    	else $extension = trim($_POST['extension']);
	    	if (!preg_match('/^([a-z]{2,4}+\.)?[a-z]{2,4}$/', $extension)) {
	    	    render('results', array('failure' => 'Filetype for download not defined, please retry'));
	    	    exit;
	    	}
	    	global $availableExtensions, $availableVersions;
	    	if (!in_array($extension, $availableExtensions)) $extension = 'zip';
	    	/* Gallery 2 version (stable, rc, nightly snapshot) */
	    	if (empty($_POST['version'])) $version = '';
	    	else $version = trim($_POST['version']);
	    	if (!in_array($version, $availableVersions)) $version = 'stable';
	    	if (class_exists($method)) {
	    	    $downloader = new $method;
	    	    if ($downloader->isSupported()) {
	    	    	global $archiveBaseName;
	    	    	$archiveName = dirname(__FILE__) . '/' . $archiveBaseName . '.' . $extension;
	    	    	/* Assemble the downlod URL */
	    	    	$url = $this->getDownloadUrl($version, $extension, $downloader);
	    	    	$results = $downloader->download($url, $archiveName);
	    	    	if ($results === true) {
	    	    	    if (file_exists($archiveName)) {
	    	    	    	@chmod($archiveName, 0777);
	    	    	    	render('results', array('success' => 'File successfully downloaded'));
	    	    	    	$this->afterDownloadHandling($downloader, $version, $extension);
	    	    	    } else {
	    	    	    	render('results', array('failure' => "Download failed, local file $archiveName does not exist"));
	    	    	    }
	    	    	} else {
	    	    	    render('results', array('failure' => $results));
	    	    	}
	    	    } else {
	    	    	render('results', array('failure' => "Method $method is not supported by this platform!"));
	    	    }
	    	} else {
	    	    render('results', array('failure' => 'Method is not defined or does not exist!'));
	    	}
	   	break;
	   case 'chmod':
		/* Input validation / sanitation */
	   	if (empty($_POST['folderName'])) $folderName = '';
	    	else $folderName = trim($_POST['folderName']);
	    	/* Remove trailing / leading slashes */
	    	$folderName = str_replace(array('/', "\\", '..'), '', $folderName);
	    	if (!preg_match('/^\w+(\.\w+)*$/', $folderName)) {
	    	    render('results', array('failure' => "Folder $folderName has invalid characters. Can only change the permissions of folders in the current working directory."));
	    	    exit;
	    	}
	    	$folderName = dirname(__FILE__) . '/' .  $folderName;
	    	if (!file_exists($folderName)) {
	    	    render('results', array('failure' => "Folder $folderName does not exist!"));
	    	    exit;
	    	}
	    	if (empty($_POST['folderPermissions'])) $folderPermissions = '';
	    	else $folderPermissions= trim($_POST['folderPermissions']);
	    	/* Handle the request */
	    	global $folderPermissionList;
	    	if (in_array($folderPermissions, $folderPermissionList)) {
	    	    $folderPermissions = (string)('0' . (int)$folderPermissions);
	    	    $success = @chmod($folderName, octdec($folderPermissions));
	    	    if (!$success) {
	    	    	render('results', array('failure' => "Attempt to change permissions of folder $folderName to $folderPermissions failed!"));
	    	    } else {
	    	    	render('results', array('success' => "Successfully changed permissions of $folderName to $folderPermissions"));
	    	    }
		} else {
		    render('results', array('failure' => "Invalid permissions $folderPermissions"));
	    	}
	    	break;
	    case 'rename':
	   	if (empty($_POST['folderName'])) $folderName = '';
	    	else $folderName = trim($_POST['folderName']);
	    	/* Remove trailing / leading slashes */
	    	$folderName = str_replace(array('/', "\\", '.'), '', $folderName);
	    	if (!preg_match('/^\w+$/', $folderName)) {
	    	    render('results', array('failure' => "Folder name $folderName has invalid characters. Can only rename within the current working directory."));
	    	    exit;
	    	}
	    	$folderName = dirname(__FILE__) . '/' .  $folderName;
	    	$oldFolderName = $this->findGallery2Folder();
	    	if (empty($oldFolderName) || !file_exists(dirname(__FILE__) . '/' . $oldFolderName)) {
	    	    render('results', array('failure' => "No Gallery 2 folder found in  the current working directory."));
	    	    exit;
	    	}
	    	$oldFolderName = dirname(__FILE__) . '/' . $oldFolderName;
	    	$success = @rename($oldFolderName, $folderName);
	    	if (!$success) {
	    	    render('results', array('failure' => "Attempt to rename $oldFolderName to $folderName failed!"));
	    	} else {
	    	    render('results', array('success' => "Successfully renamed $oldFolderName to $folderName"));
	    	}
	    	break;
	    default:
	    	/* Discover the capabilities of this PHP installation / platform */
		$capabilities = $this->discoverCapabilities();
		$capabilities['gallery2FolderName'] = $this->findGallery2Folder();
		if (!empty($capabilities['gallery2FolderName'])) {
		    $statusMessage  = "Ready for installation (Gallery 2 folder '" .
		    	$capabilities['gallery2FolderName'] . "' found)";
		} else if (!empty($capabilities['anyArchiveExists'])) {
		    $statusMessage = 'Archive ready for extraction';
		} else {
		    $statusMessage =
			'No archive in current working directory, please start with step 1';
		}
		$capabilities['statusMessage'] = $statusMessage;
		/* Are we in RC stage?*/
		if (!empty($capabilities['downloadMethods'])) {
		    foreach ($capabilities['downloadMethods'] as $dMethod) {
		    	if ($dMethod['isSupported']) {
			    $capabilities['showRcVersion'] =
		    			$this->shouldShowRcVersion(new $dMethod['command']);
		    	    break;
		    	}
		    }
		}
 	        render('options', $capabilities);
	}
    }

    function authenticate() {
        global $passPhrase;

    	/* Check authentication */
    	if (empty($passPhrase)) {
    	    render('missingPassword');
    	    exit;
    	} else if (strlen($passPhrase) < 6) {
    	    render('passwordTooShort');
    	    exit;
    	} else if (!empty($_COOKIE['G2PREINSTALLER']) &&
    			trim($_COOKIE['G2PREINSTALLER']) == md5($passPhrase)) {
    	    /* Already logged in, got a cookie */
    	    return true;
    	} else if (!empty($_POST['g2_password'])) {
    	    /* Login attempt */
    	    if ($_POST['g2_password'] == $passPhrase) {
    	    	setcookie("G2PREINSTALLER",md5($passPhrase),0);
    		return true;
    	    } else {
    		render('passwordForm', array('incorrectPassword' => 1));
    		exit;
    	    }
    	} else {
    	    render('passwordForm');
    	    exit;
    	}
    }

    function discoverCapabilities() {
    	global $archiveBaseName;
        $capabilities = array();

        $extractMethods = array();
        $extensions = array();
        $anyExtensionSupported = 0;
        $anyArchiveExists = 0;
        foreach	($this->_extractMethods as $method) {
            $archiveName = $archiveBaseName . '.' . $method->getSupportedExtension();
            $archiveExists = file_exists(dirname(__FILE__) . '/' . $archiveName);
            $isSupported = $method->isSupported();
            $extractMethods[] = array('isSupported' => $isSupported,
            			      'name' => $method->getName(),
            			      'command' => strtolower(get_class($method)),
            			      'archiveExists' => $archiveExists,
            			      'archiveName' => $archiveName);
            if (empty($extensions[$method->getSupportedExtension()])) {
                $extensions[$method->getSupportedExtension()] = (int)$isSupported;
            }
            if ($isSupported) {
            	$anyExtensionSupported = 1;
            }
            if ($archiveExists) {
            	$anyArchiveExists = 1;
            }
        }
        $capabilities['extractMethods'] = $extractMethods;
	$capabilities['extensions'] = $extensions;
	$capabilities['anyExtensionSupported'] = $anyExtensionSupported;
	$capabilities['anyArchiveExists'] = $anyArchiveExists;

        $downloadMethods = array();
        foreach	($this->_downloadMethods as $method) {
            $downloadMethods[] = array('isSupported' => $method->isSupported(),
            			     'name' => $method->getName(),
            			     'command' => strtolower(get_class($method)));
        }
        $capabilities['downloadMethods'] = $downloadMethods;

        return $capabilities;
    }

    function findGallery2Folder() {
        /* Search in the current folder for a gallery2 folder */
        $basePath = dirname(__FILE__) . '/';
        if (file_exists($basePath . 'gallery2') &&
        	file_exists($basePath . 'gallery2/install/index.php')) {
            return 'gallery2';
        }

    	if (!Platform::isPhpFunctionSupported('opendir') ||
    	        !Platform::isPhpFunctionSupported('readdir')) {
    	    return false;
    	}

    	$handle = opendir($basePath);
    	if (!$handle) {
    	    return false;
    	}
    	while (($fileName = readdir($handle)) !== false) {
	    if ($fileName == '.' || $fileName == '..') {
		continue;
	    }
	    if (file_exists($basePath . $fileName . '/install/index.php')) {
	    	return $fileName;
	    }
    	}
    	closedir($handle);

    	return false;
    }

    function integrityCheck() {
    	/* TODO, check for the existence of modules, lib, themes, main.php */
        return true;
    }

    function getDownloadUrl($version, $extension, $downloader) {
    	global $mirrors, $nightlySnapshotSite;

    	$url = $this->_getDownloadFilename($version, $extension, $downloader);
    	if ($version != 'nightly') {
	    /* Prepend the mirror string */
	    $url = $mirrors[0] . $url;
    	} else {
    	    $url = $nightlySnapshotSite . $url;
    	}

    	return $url;
    }

    /* Returns the */
    function _getDownloadFilename($version, $extension, $downloader) {
    	global $downloadUrls;

    	/* Default to the last known good version */
	$filename = $downloadUrls[$version];

    	/* Try to get the latest version string */
    	$currentDownloadUrls = $this->getLatestVersions($downloader);
    	if (!empty($currentDownloadUrls[$version])) {
    	    $filename = $currentDownloadUrls[$version];
    	}

    	$filename .= '.' . $extension;

    	return $filename;
    }

    function getLatestVersions($downloader) {
	global $versionCheckUrl, $availableVersions;

	$tempFile = dirname(__FILE__) . '/availableVersions.txt';
	$currentVersions = array();
	/*
	 * Fetch the version information from a remote server and if we already have it,
	 * update it if it's older than an hour
	 */
	if (!file_exists($tempFile) || !(($stat = @stat($tempFile)) &&
		isset($stat['mtime']) && $stat['mtime'] > time() - 3600)) {
	    $downloader->download($versionCheckUrl, $tempFile);
	}
	/* Parse the fetched version information file */
	if (file_exists($tempFile)) {
	    $contents = @file($tempFile);
	    if (is_array($contents)) {
		foreach ($contents as $line) {
		    /* Each line is of the format key=value */
		    $versionStrings = implode('|', $availableVersions);
		    if (preg_match('/^(' . $versionStrings .
				')=((?:[A-Za-z0-9-_]+\.?)+)$/',
		    		   $line, $match)) {

			$currentVersions[$match[1]] = $match[2];
		    }
		}
	    }
	}

	return $currentVersions;
    }

    function shouldShowRcVersion($downloader) {
	/*
	 * Only show the rc version (along with the stable and nightly) if we're in a
	 * release candidate stage
	 */

	 $currentDownloadUrls = $this->getLatestVersions($downloader);
	 return isset($currentDownloadUrls['rc']);
    }

    function afterDownloadHandling($downloader, $version, $extension) {
	if ($version == 'nightly') return;
	$filename = $this->_getDownloadFilename($version, $extension, $downloader);
	@$download->download('http://prdownloads.sourceforge.net/gallery/' . $filename,
			     dirname(__FILE__) . '/tmp' . rand() . '.txt');
    }
}

class Platform {
    /* Check if a specific php function is available */
    function isPhpFunctionSupported($functionName) {
	if (in_array($functionName, split(',\s*', ini_get('disable_functions'))) || !function_exists($functionName)) {
	    return false;
	} else {
	    return true;
	}
    }

    /* Check if a specific command line tool is available */
    function isBinaryAvailable($binaryName) {
	$binaryPath = Platform::getBinaryPath($binaryName);
	return !empty($binaryPath);
    }

    /* Return the path to a binary or false if it's not available */
    function getBinaryPath($binaryName) {
    	if (!Platform::isPhpFunctionSupported('exec')) {
	    return false;
	}

	/* First try 'which' */
	$ret = array();
	exec('which ' . $binaryName, $ret);
	if (strpos(join(' ',$ret), $binaryName) !== false && is_executable(join('',$ret))) {
	    return $binaryName; // it's in the path
	}

	/* Try a bunch of likely seeming paths to see if any of them work. */
	$paths = array();
	if (!strncasecmp(PHP_OS, 'win', 3)) {
	    $separator = ';';
	    $slash = "\\";
	    $extension = '.exe';
	    $paths[] = "C:\\Program Files\\$binaryName\\";
	    $paths[] = "C:\\apps\$binaryName\\";
	    $paths[] = "C:\\$binaryName\\";
	} else {
	    $separator = ':';
	    $slash = "/";
	    $extension = '';
	    $paths[] = '/usr/bin/';
	    $paths[] = '/usr/local/bin/';
	    $paths[] = '/bin/';
	    $paths[] = '/sw/bin/';
	}
	$paths[] = './';

	foreach (explode($separator, getenv('PATH')) as $path) {
	    $path = trim($path);
	    if (empty($path)) {
		continue;
	    }
	    if ($path{strlen($path)-1} != $slash) {
		$path .= $slash;
	    }
	    $paths[] = $path;
	}

	/* Now try each path in turn to see which ones work */
	foreach ($paths as $path) {
	    $execPath = $path . $binaryName . $extension;
	    if (file_exists($execPath) && is_executable($execPath)) {
		/* We have a winner */
		return $execPath;
	    }
	}

	return false;
    }

    /* Check if we can write to this directory (download, extract) */
    function isDirectoryWritable() {
	return is_writable(dirname(__FILE__));
    }

    function extendTimeLimit() {
    	if (function_exists('apache_reset_timeout')) {
    	    @apache_reset_timeout();
    	}
    	@set_time_limit(600);
    }
}

class DownloadMethod {
    function download($url, $outputFile) {
	return false;
    }

    function isSupported() {
	return false;
    }

    function getName() {
    	return '';
    }
}

class WgetDownloader extends DownloadMethod {
    function download($url, $outputFile) {
    	$status = 0;
    	$output = array();
    	$wget = Platform::getBinaryPath('wget');
	exec("$wget -O$outputFile $url ", $output, $status);
	if ($status) {
	    $msg = 'exec returned an error status ';
	    $msg .= is_array($output) ? implode('<br>', $output) : '';
	    return $msg;
	}
	return true;
    }

    function isSupported() {
	return Platform::isBinaryAvailable('wget');
    }

    function getName() {
    	return 'Download with Wget';
    }
}

class FopenDownloader extends DownloadMethod {
    function download($url, $outputFile) {
	if (!Platform::isDirectoryWritable()) {
	    return 'Unable to write to current working directory';
	}
	$start =time();

	$fh = fopen($url, 'rb');
	if (empty($fh)) {
	    return 'Unable to open url';
	}
	$ofh = fopen($outputFile, 'wb');
	if (!$ofh) {
	    fclose($fh);
	    return 'Unable to open output file in writing mode';
	}

	$failed = $results = false;
	while (!feof($fh) && !$failed) {
           $buf = fread($fh, 4096);
           if (!$buf) {
               $results = 'Error during download';
               $failed = true;
               break;
           }
           if (fwrite($ofh, $buf) != strlen($buf)) {
               $failed = true;
               $results = 'Error during writing';
               break;
           }
           if (time() - $start > 55) {
           	Platform::extendTimeLimit();
           	$start = time();
           }
	}
	fclose($ofh);
	fclose($fh);
	if ($failed) {
	    return $results;
	}

	return true;
    }

    function isSupported() {
	$actual = ini_get('allow_url_fopen');
    	if (in_array($actual, array(1, 'On', 'on')) && Platform::isPhpFunctionSupported('fopen')) {
	    return true;
	}

	return false;
    }

    function getName() {
    	return 'Download with PHP fopen()';
    }
}

class FsockopenDownloader extends DownloadMethod {
    function download($url, $outputFile) {
    	/* Code from WebHelper_simple.class */

	$components = parse_url($url);
	$port = empty($components['port']) ? 80 : $components['port'];

	$errno = $errstr = null;
	$fd = @fsockopen($components['host'], $port, $errno, $errstr, 2);
	if (empty($fd)) {
	    return "Error $errno: '$errstr' retrieving $url";
	}

	$get = $components['path'];
	if (!empty($components['query'])) {
	    $get .= '?' . $components['query'];
	}

	$start = time();

	/* Read the web file into a buffer */
	$ok = fwrite($fd, sprintf("GET %s HTTP/1.0\r\n" .
				       "Host: %s\r\n" .
				       "\r\n",
				       $get,
				       $components['host']));
	if (!$ok) {
	    return 'Download request failed (fwrite)';
	}
	$ok = fflush($fd);
	if (!$ok) {
	    return 'Download request failed (fflush)';
	}

	/*
	 * Read the response code. fgets stops after newlines.
	 * The first line contains only the status code (200, 404, etc.).
	 */
	$headers = array();
	$response = trim(fgets($fd, 4096));

	/* Jump over the headers */
	while (!feof($fd)) {
	    $line = trim(fgets($fd, 4096));
	    if (empty($line)) {
		break;
	    }
	}

	$success = false;
	$ofd = fopen($outputFile, 'wb');
	if ($ofd) {
	    /* Read the body */
	    $failed = false;
	    while (!feof($fd) && !$failed) {
		$buf = fread($fd, 4096);
		if (fwrite($ofd, $buf) != strlen($buf)) {
		    $failed = true;
		    break;
		}
		if (time() - $start > 55) {
           	    Platform::extendTimeLimit();
           	    $start = time();
           	}
	    }
	    fclose($ofd);
	    if (!$failed) {
		$success = true;
	    }
	} else {
	    return "Could not open $outputFile in write mode";
	}
	fclose($fd);

        /* if the HTTP response code did not begin with a 2 this request was not successful */
	if (!preg_match("/^HTTP\/\d+\.\d+\s2\d{2}/", $response)) {
	    return "Download failed with HTTP status: $response";
	}

	return true;
    }

    function isSupported() {
    	return Platform::isPhpFunctionSupported('fsockopen');
    }

    function getName() {
    	return 'Download with PHP fsockopen()';
    }
}

class CurlDownloader extends DownloadMethod {
    function download($url, $outputFile) {
	$ch = curl_init();
	$ofh = fopen($outputFile, 'wb');
	if (!$ofh) {
	    fclose($ch);
	    return 'Unable to open output file in writing mode';
	}

	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_FILE, $ofh);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
	curl_setopt($ch, CURLOPT_FAILONERROR, true);
	curl_setopt($ch, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_TIMEOUT, 20 * 60);
	curl_exec($ch);

	$errorString = curl_error($ch);
	$errorNumber = curl_errno($ch);
	curl_close($ch);

	if ($errorNumber != 0) {
	    if (!empty($errorString)) {
		return $errorString;
	    } else {
		return 'CURL download failed';
	    }
	}

	return true;
    }

    function isSupported() {
	foreach (array('curl_init', 'curl_setopt', 'curl_exec', 'curl_close', 'curl_error')
			as $functionName) {
	    if (!Platform::isPhpFunctionSupported($functionName)) {
	    	return false;
	    }
	}
	return true;
    }

    function getName() {
    	return 'Download with PHP CURL()';
    }
}

class ExtractMethod {
    /* Extract the archive, add the file_exists() in the calling function */
    function extract() {
	return false;
    }

    /* What archive types can we extract */
    function getSupportedExtension() {
	return null;
    }

    /* Check if we can use this method (e.g. if exec is available) */
    function isSupported() {
	return false;
    }

    function getName() {
    	return '';
    }
}

class UnzipExtractor extends ExtractMethod {
    function extract($fileName) {
    	$output = array();
    	$status = 0;
    	$unzip = Platform::getBinaryPath('unzip');
	exec($unzip . ' ' . $fileName, $output, $status);
	if ($status) {
	    $msg = 'exec returned an error status ';
	    $msg .= is_array($output) ? implode('<br>', $output) : '';
	    return $msg;
	}
	return true;
    }

    function getSupportedExtension() {
	return 'zip';
    }

    function isSupported() {
	return Platform::isBinaryAvailable('unzip');
    }

    function getName() {
    	return 'Extract .zip with unzip';
    }
}

class TargzExtractor extends ExtractMethod {
    function extract($fileName) {
    	$output = array();
    	$status = 0;
    	$tar = Platform::getBinaryPath('tar');
	exec($tar . ' -xzf' . $fileName, $output, $status);
	if ($status) {
	    $msg = 'exec returned an error status ';
	    $msg .= is_array($output) ? implode('<br>', $output) : '';
	    return $msg;
	}
	return true;
    }

    function getSupportedExtension() {
	return 'tar.gz';
    }

    function isSupported() {
	return Platform::isBinaryAvailable('tar');
    }

    function getName() {
    	return 'Extract .tar.gz with tar';
    }
}

class PhpTargzExtractor extends ExtractMethod {
    function extract($fileName) {
	return PclTarExtract($fileName);
    }

    function getSupportedExtension() {
	return 'tar.gz';
    }

    function isSupported() {
    	foreach (array('gzopen', 'gzclose', 'gzseek', 'gzread',
		       'touch', 'gzeof') as $functionName) {
    	    if (!Platform::isPhpFunctionSupported($functionName)) {
	    	return false;
	    }
    	}

	return true;
    }

    function getName() {
    	return 'Extract .tar.gz with PHP functions';
    }
}

class PhpUnzipExtractor extends ExtractMethod {
    function extract($fileName) {
    	$baseFolder = dirname($fileName);
	if (!($zip = zip_open($fileName))) {
	    return "Could not open the zip archive $fileName";
	}
	$start = time();
	while ($zip_entry = zip_read($zip)) {
            if (zip_entry_open($zip, $zip_entry, 'r')) {
		$buf = zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));
		$dir_name = dirname(zip_entry_name($zip_entry));
		if ($dir_name != ".") {
		    $dir = $baseFolder . '/';
		    foreach ( explode('/', $dir_name) as $folderName) {
                 	$dir .= $folderName;
                 	if (is_file($dir)) unlink($dir);
                 	if (!is_dir($dir)) mkdir($dir);
                 	$dir .=  '/';
                    }
                }
		$fp = fopen($baseFolder . '/' . zip_entry_name($zip_entry), 'w');
		if (!$fp) {
		    return 'Error during php unzip: trying to open a file for writing';
		}
           	if (fwrite($fp,$buf) != strlen($buf)) {
           	    return 'Error during php unzip: could not write the whole buffer length';
           	}
           	zip_entry_close($zip_entry);

           	if (time() - $start > 55) {
           	    Platform::extendTimeLimit();
           	    $start = time();
           	}
	    } else {
		return false;
            }
       }
       zip_close($zip);

       return true;
    }

    function getSupportedExtension() {
	return 'zip';
    }

    function isSupported() {
	foreach (array('mkdir', 'zip_open', 'zip_entry_name', 'zip_read', 'zip_entry_read',
			'zip_entry_filesize', 'zip_entry_close', 'zip_close', 'zip_entry_close')
			as $functionName) {
	    if (!Platform::isPhpFunctionSupported($functionName)) {
	    	return false;
	    }
	}
	return true;
    }

    function getName() {
    	return 'Extract .zip with PHP functions';
    }
}


function render($renderType, $args=array()) {
    global $archiveBaseName, $folderPermissionList;
    $self = basename(__FILE__);
?>
<?php print '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" ' .
		'"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">'; ?>
<html>
  <head>
    <title>Gallery 2 Pre-Installer</title>
    <?php printHtmlStyle(); ?>
    <?php printJs(); ?>
  </head>
  <body>
     <h1> Gallery 2 Pre-Installer</h1>

     <div class="box important">
       <p>
         Do not forget to <b>delete this <?php print $self; ?> file once you are done!</b> If other
         users guess the password, they can seriously harm your installation with this script!
       <p>
     </div>

     <div class="box">
     <h2>Instructions</h2>
     <span id="instructions-toggle" class="blockToggle"
          onclick="BlockToggle('instructions', 'instructions-toggle', 'instructions')">
          Show instructions
     </span>
     <div id="instructions" style="display: none;">
       <p>
         Gallery 2 is a web application with thousands of files and hundreds of folders.
         Uploading these files and folders with an FTP program can take more than an hour and
         is error-prone depending on the quality of your connection to your webhost and the
         quality of the server itself.
       </p>
       <p>
         In short, <b>this pre-installer gets the Gallery 2 software on your server</b>. It is an
         alternative to uploading all files via FTP or extracting the archive yourself if you
         have ssh access. In detail, this pre-installer does for you the following:
       </p>
       <ol>
         <li>
           <b>Download/transfer</b> the archived gallery2.tar.gz or gallery2.zip from the official
           download server directly to your webserver. No need to download / upload the file
           yourself.
         </li>
         <li>
           <b>Extract</b> the gallery2.tar.gz / gallery2.zip archive directly on your server. No
           need to upload thousands of files.
         </li>
         <li>
           <b>Install</b> Gallery 2 by following the link to the Gallery 2 installation wizard
           which will guide you through the database creation and the other steps involved to get
           Gallery 2 running on this server.
         </li>
       </ol>
       <p>
         Once Gallery 2 is extracted, you can also use these convenience functions:
       </p>
       <ul>
         <li>
           <b>Change permissions</b>: Since the gallery2 files have been extracted by the webserver
            and not by yourself, these files and folders are not owned by you. That means that you
            are not allowed to rename the gallery2 folder or to do much else with it unless you use
            this script to change the permissions.
         </li>
         <li>
           <b>Rename</b> the Gallery 2 folder if you want it to be rather &quot;photos/&quot; or
           &quot;gallery/&quot;, etc. than the default folder name which is &quot;gallery2/&quot;.
         </li>
       </ul>
       <p>
         <b>Upgrade notes:</b> If you need to upgrade a Gallery 2 installation that was extracted
         with this script (the gallery2 folder is owned by the webserver in this case) you need
         just to make sure the gallery2 folder is named &quot;gallery2&quot; and that it has
         permissions 755 or 777. Then download the latest release and extract it. It will just
         extract the new files over the existing installation. Then run the Gallery 2 upgrader.
       </p>
       <p>
         <b>Deleting Gallery 2:</b> If you want to delete a Gallery 2 installation that was
         extracted by this script (read: if you want to lose all your albums and remove Gallery 2
         from your website), then use Bharat&quot;s cleanup script which can be found at:
         <a href="http://codex.gallery2.org/index.php/Downloads:Cleanup_Script">Gallery Codex:
         Downloads:Cleanup_Script</a>.
       </p>
     </div>
     </div>

     <?php if (!empty($args['statusMessage'])): ?>
     <div class="box"><b>Status:</b> <?php print $args['statusMessage']; ?></div>
     <?php endif; ?>


     <?php if ($renderType == 'missingPassword' || $renderType == 'passwordForm'): ?>
     <h2>
	You are attempting to access a secure section.  You can't
	proceed until you pass the security check.
     </h2>
     <?php endif; ?>

     <?php if ($renderType == 'missingPassword'): ?>
     <div class="error">
       You must enter a setup password in your <?php print $self; ?> file in order
       to be able to access this script.
     </div>
     <?php elseif ($renderType == 'passwordTooShort'): ?>
     <div class="error">
       The setup password in your <?php print $self; ?> file is too short. It must be at least
       6 characters long.
     </div>
     <?php elseif ($renderType == 'passwordForm'): ?>
     <div class="password_form">
       <div class="box">
	 <span class="message">
	   In order to verify you, we require you to enter your pre-install setup password.  This is
	   the password that is stored in the config section at the top of this script.
	 </span>
	 <form id="loginForm" method="post">
	   Password:
	   <input type="password" name="g2_password"/>
	   <script type="text/javascript">document.getElementById('loginForm')['g2_password'].focus();</script>
	   <input type="submit" value="Verify Me" onclick="this.disabled=true;this.form.submit();"/>
	 </form>
	 <?php if (!empty($args['incorrectPassword'])): ?>
	 <div class="error">
	   Password incorrect!
	 </div>
	 <?php endif; ?>
       </div>
     </div>

     <?php elseif ($renderType == 'options'): ?>
       <!-- Show available and unavailable options -->
       <?php if (empty($args['anyExtensionSupported'])): ?>
       <div class="error">
           <h2>This platform has not the ability to extract any of our archive types!</h2>
       <span>
          <?php $first = true; foreach ($args['extensions'] as $ext => $supported): ?>
            <?php if (!$supported): ?><span class="disabled"><?php endif; ?>
            <?php if (!$first) print ', '; else $first = false; ?>
            <?php print $ext; ?>
            <?php if (!$supported): ?></span><?php endif; ?>
          <?php endforeach; ?>
       </span>
       </div>
       <?php endif; ?>

       <!-- DOWNLOAD SECTION -->
       <?php
       $label = empty($args['anyArchiveExists']) && empty($args['gallery2FolderName']) ? 'Hide ' : 'Show ';
       $display = empty($args['anyArchiveExists']) && empty($args['gallery2FolderName']) ? '' : 'style="display: none;"';
       ?>
       <div class="box">
       <h2>[1] Download / Transfer Methods (download G2 from another server directly to this server)</h2>
       <span id="download-toggle" class="blockToggle"
            onclick="BlockToggle('download', 'download-toggle', 'download methods')">
            <?php print $label . 'download methods'; ?>
       </span>
       <div id="download" <?php print $display; ?>>
         <br/>
         <?php if (!empty($args['downloadMethods']) && !empty($args['anyExtensionSupported'])): ?>
         <form id="downloadForm" method="post">
         <span class="subtitle">Select the Gallery 2 version:</span>
         <table class="choice">
           <tr><td><select name="version">
             <option value="stable" selected="selected">Latest stable version (recommended)</option>
             <?php if (!empty($args['showRcVersion'])): ?>
             <option value="rc">Latest release candidate for the next stable version</option>
             <?php endif; ?>
             <option value="nightly">Latest nightly snapshot (bleeding edge)</option>
           </select></td></tr>
         </table>
         <span class="subtitle">Select a download method:</span>
         <table class="choice">
         <?php $first = true;
               foreach ($args['downloadMethods'] as $method):
           $disabled = empty($method['isSupported']) ? 'disabled="true"' : '';
           $notSupported = empty($method['isSupported']) ? 'not supported by this platform' : '&nbsp;';
           $checked = '';
           if ($first && !empty($method['isSupported'])) {
           	$checked = 'checked'; $first = false;
           }
           printf('<tr><td><input type="radio" name="method" %s value="%s" %s/></td><td>%s</td><td>%s</td></tr>',
           		$disabled, $method['command'], $checked, $method['name'], $notSupported);
         endforeach; ?>
         </table>
         <span class="subtitle">Select an archive type:</span>
         <table class="choice">
         <?php $first = true; foreach ($args['extensions'] as $ext => $supported):
           $disabled = empty($supported) ? 'disabled="true"' : '';
           $message = empty($supported) ? 'not supported by this platform' : '&nbsp;';
           $checked = '';
           if ($first && $supported) {
           	$checked = 'checked'; $first = false;
           }
           printf('<tr><td><input type="radio" name="extension" value="%s" %s %s/></td><td>%s</td><td>%s</td></tr>',
            $ext, $disabled, $checked, $archiveBaseName . '.' . $ext, $message);
         endforeach; ?>
         </table>
         <input type="hidden" name="command" value="download"/>
         <input type="submit" value="Download"
         	onclick="this.disabled=true;this.form.submit();"/>
         </form>
         <?php elseif (!empty($args['anyExtensionSupported'])): ?>
         <div class="warning">
           This platform does not support any of our download / transfer methods. You can upload
           the gallery2.tar.gz / gallery2.zip archive via FTP and extract it then with this tool.
         </div>
         <?php elseif (!empty($args['downloadMethods'])): ?>
         <div class="warning">
           This platform cannot extract archives, therefore downloading is also disabled.
         </div>
         <?php else: ?>
         <div class="warning">
           This platform does not support any of our download / transfer methods.
         </div>
         <?php endif; ?>
       </div>
       </div>

       <!-- EXTRACTION METHODS -->
       <?php
       $label = !empty($args['anyArchiveExists']) && empty($args['gallery2FolderName']) ? 'Hide ' : 'Show ';
       $display = !empty($args['anyArchiveExists']) && empty($args['gallery2FolderName']) ? '' : 'style="display: none;"';
       ?>
       <div class="box">
       <h2>[2] Extract Methods (extract a gallery2.zip / gallery2.tar.gz file in the current working directory)</h2>
       <span id="extract-toggle" class="blockToggle"
            onclick="BlockToggle('extract', 'extract-toggle', 'extraction methods')">
            <?php print $label .  'extraction methods'; ?>
       </span>
       <div id="extract" <?php print $display; ?>>
       <?php if (!empty($args['anyExtensionSupported'])): ?>
       <form id="extractForm" method="post">
         <table class="choice">
         <?php $first = true; foreach ($args['extractMethods'] as $method):
           $disabled = 'disabled="true"';
           if (empty($method['isSupported'])) {
               $message = 'not supported by this platform';
           } else if (!$method['archiveExists']){
               $message = '<span class="warning">first download the ' . $method['archiveName'] .
				' archive</span>';
	   } else {
	       $message = '<span class="success">ready for extraction!</span>';
	       $disabled = '';
           }
           $checked = '';
           if ($first && empty($disabled) && !empty($method['isSupported'])) {
           	$checked = 'checked'; $first = false;
           }
           printf('<tr><td><input type="radio" name="method" %s value="%s" %s/></td><td>%s</td><td>%s</td></tr>',
           $disabled, $method['command'], $checked, $method['name'], $message);
         endforeach; ?>
         </table>
         <input type="hidden" name="command" value="extract"/>
         <input type="submit" value="Extract"
          	 onclick="this.disabled=true;this.form.submit();"/>
       </form>
       <?php else: ?>
         <div class="warning">
           This platform cannot extract archives. Ask your webhost to extract the archive for you
           or if that is not an option you will have to extract the archive on your
           computer and upload the thousands of files and folders via FTP.
         </div>
       <?php endif; ?>
       </div>
       </div>

       <!-- LINK TO INSTALLER -->
       <?php
       $label = !empty($args['gallery2FolderName']) ? 'Hide ' : 'Show ';
       $display = !empty($args['gallery2FolderName']) ? '' : 'style="display: none;"';
       ?>
       <div class="box">
       <h2>[3] Install Gallery 2!</h2>
       <span id="install-toggle" class="blockToggle"
            onclick="BlockToggle('install', 'install-toggle', 'link to install wizard')">
            <?php print $label .  'link to install wizard'; ?>
       </span>
       <div id="install" <?php print $display; ?>>
       <?php if (!empty($args['gallery2FolderName'])): ?>
         <span>
           Follow this link to start the <a href="<?php print $args['gallery2FolderName'] .
								'/install/index.php'; ?>">
           Gallery 2 installation wizard</a>!
         </span>
       <?php else: ?>
         <div class="warning">
           Please first download and extract the Gallery 2 archive (steps 1 and 2).
         </div>
       <?php endif; ?>
       </div>
       </div>

       <!-- CHANGE PERMISSIONS -->
       <?php $folderName = empty($args['gallery2FolderName']) ? 'gallery2' : $args['gallery2FolderName']; ?>
       <div class="box">
       <h2>Change the permissions of your gallery2 Folder</h2>
       <span id="chmod-toggle" class="blockToggle"
            onclick="BlockToggle('chmod', 'chmod-toggle', 'change permissions form')">
            <?php print $label .  'change permissions form'; ?>
       </span>
       <div id="chmod" <?php print $display; ?>>
       <?php if (!empty($args['gallery2FolderName'])): ?>
         <p>
           777 makes the folder writeable for everybody. That is needed such that you can move
           gallery2 or rename the directory with an FTP program. 555 makes it readable for
           everybody, which is required to have an operational Gallery 2 installation.
         </p><p>
           For <b>security</b> purposes, it is recommended that you change the folder permissions
           back to <b>555</b> once Gallery 2 is running. Only if you are running PHP-CGI, gallery2
           might already owned by your user and no permission changes are required.
         </p>
       <form id="chmodForm" method="post">
       Folder name: <input type="text" name="folderName" size="20" value="<?php print $folderName; ?>"/>
       Permissions:
       <select name="folderPermissions">
         <?php foreach($folderPermissionList as $perm): ?>
           <option value="<?php print $perm; ?>"><?php print $perm; ?></option>
         <?php endforeach; ?>
       </select>
       <input type="hidden" name="command" value="chmod"/>
       <input type="submit" value="Change Permissions"
       	      onclick="this.disabled=true;this.form.submit();"/>
       </form>
       <?php else: ?>
       <div class="warning">
         There is no Gallery 2 folder in the current working directory.
       </div>
       <?php endif; ?>
       </div>
       </div>

       <!-- RENAME FOLDER-->
       <div class="box">
       <h2>Rename the Gallery 2 folder</h2>
       <span id="rename-toggle" class="blockToggle"
            onclick="BlockToggle('rename', 'rename-toggle', 'rename folder form')">
            <?php print $label .  'rename folder form'; ?>
       </span>
       <div id="rename" <?php print $display; ?>>
       <?php if (!empty($args['gallery2FolderName'])): ?>
         <p>
           Quickly rename the gallery2 folder. You can do that with your FTP program as well.
         </p>
       <form id="renameForm" method="post">
       Rename folder to: <input type="text" name="folderName" size="20" value="<?php print $folderName; ?>"/>
       <input type="hidden" name="command" value="rename"/>
       <input type="submit" value="Rename Folder"
       	      onclick="this.disabled=true;this.form.submit();"/>
       </form>
       <?php else: ?>
       <div class="warning">
         There is no Gallery 2 folder in the current working directory.
       </div>
       <?php endif; ?>
       </div>
       </div>

     <?php elseif ($renderType == 'results'): ?>
     <h2> Results </h2>
     <?php if (!empty($args['failure'])): ?>
     <div class="error">
       <?php print $args['failure']; ?>
       <?php if (!empty($args['fix'])): ?>
       <div class="suggested_fix">
         <h2> Suggested fix: </h2>
         <?php print $args['fix']; ?>
       </div>
     </div>
     <?php endif; ?>
     <?php endif; ?>
     <?php if (!empty($args['success'])): ?>
     <div class="success">
       <?php print $args['success']; ?>
     </div>
     <?php endif; ?>
     <div>
       <a href="<?php print $self; ?>">Go back to the overview</a>
     </div>
     <?php endif; ?>

     <div class="box important">
       <p>
         Do not forget to <b>delete this <?php print $self; ?> file once you are done!</b> If other
         users guess the password, they can seriously harm your installation with this script!
       <p>
     </div>
  </body>
</html>
<?php
}

function printHtmlStyle() {
    ?>
    <style type="text/css">
	html {
  		font-family: "Lucida Grande", Verdana, Arial, sans-serif;
  		font-size: 62.5%;
	}

	body {
  		font-size: 1.2em;
  		margin: 16px 16px 0px 16px;
  		background: white;
	}

	h1, h2 {
  		font-family: "Gill Sans", Verdana, Arial, sans-serif;
  		color: #333;
		  margin: 0;
  		padding: 1.0em 0 0.15em 0;
	}

	h1 { font-size: 1.5em; border-bottom: 1px solid #ddd; }
	h2 { font-size: 1.3em; padding: 2px;}

	span.subtext {
  		font-size: 0.9em;
	}

	span.disabled, td.disabled {
		color: #ddd;
	}

	span.subtitle {
		font-size: 1.2em;
	}

	div.error {
  		border: solid red 1px;
  		margin: 20px;
  		padding: 10px;
	}

	div.suggested_fix {
                background: #eee;
  		margin: 20px;
  		padding: 10px;
	}

	div.success {
  		border: solid green 1px;
  		margin: 20px;
  		padding: 10px;
	}

	div.warning {
  		border: solid orange 1px;
  		margin: 20px;
  		padding: 10px;
	}

	.blockToggle {
		padding: 0 0.4em 0.1em;
		background-color: #eee;
		border-width: 1px;
		border: 1px solid #888;
		line-height: 2;
	}

	.blockToggle:hover {
    		cursor: pointer;
	}

	span.warning {
  		color: orange;
	}

	span.success {
  		color: green;
	}

	div.box {
  		border: solid #ddd 1px;
  		margin: 15px;
  		padding: 10px;
	}

        div.important {
                background: #fdc;
        }

	div.status {
  		border: solid #d8d 1px;
  		margin: 20px;
  		padding: 10px;
	}

	div.status span.line_error {
  		display: block;
  		color: #C00;
	}

	div.status span.line_info {
  		display: block;
  		color: #0C0;
	}

	table.choice {
		position: relative;
		left: 20px;
	}

	pre {
  		font-size: 1.2em;
	}
	</style>
<?php
}

function printJs() {
?>
<script type="text/javascript">
function BlockToggle(objId, togId, text) {
    var o = document.getElementById(objId), t = document.getElementById(togId);
    if (o.style.display == 'none') {
	o.style.display = 'block';
	t.innerHTML = 'Hide ' + text;
    } else {
	o.style.display = 'none';
	t.innerHTML = 'Show ' + text;
    }
}
</script>
<?php
}

/* ---------- START 3rd Party code for tar.gz extraction --------------------- */

// --------------------------------------------------------------------------------
// PhpConcept Library - Tar Module 1.3
// --------------------------------------------------------------------------------
// License GNU/GPL - Vincent Blavet - August 2001
// http://www.phpconcept.net
// --------------------------------------------------------------------------------
// Note:
//    Small changes have been made by Andy Staudacher <ast@gmx.ch> to incorporate
//    the code in this script. Code to create new archives has been removed,
//    we only need to extract archives. Date: 2006/02/03
// --------------------------------------------------------------------------------
  // ----- Global variables
  $g_pcltar_version = "1.3";

  // --------------------------------------------------------------------------------
  // Function : PclTarExtract()
  // Description :
  //   Extract all the files present in the archive $p_tarname, in the directory
  //   $p_path. The relative path of the archived files are keep and become
  //   relative to $p_path.
  //   If a file with the same name already exists it will be replaced.
  //   If the path to the file does not exist, it will be created.
  //   Depending on the $p_tarname extension (.tar, .tar.gz or .tgz) the
  //   function will determine the type of the archive.
  // Parameters :
  //   $p_tarname : Name of an existing tar file.
  //   $p_path : Path where the files will be extracted. The files will use
  //             their memorized path from $p_path.
  //             If $p_path is "", files will be extracted in "./".
  //   $p_remove_path : Path to remove (from the file memorized path) while writing the
  //                    extracted files. If the path does not match the file path,
  //                    the file is extracted with its memorized path.
  //                    $p_path and $p_remove_path are commulative.
  //   $p_mode : 'tar' or 'tgz', if not set, will be determined by $p_tarname extension
  // Return Values :
  //   Same as PclTarList()
  // --------------------------------------------------------------------------------
  function PclTarExtract($p_tarname, $p_path="./", $p_remove_path="", $p_mode="")
  {
    $v_result=1;

    // ----- Extract the tar format from the extension
    if (($p_mode == "") || (($p_mode!="tar") && ($p_mode!="tgz")))
    {
      if (($p_mode = PclTarHandleExtension($p_tarname)) == "")
      {
        return 'Extracting tar/gz failed, cannot handle extension';
      }
    }

    // ----- Call the extracting fct
    $p_list = array();
    if (($v_result = PclTarHandleExtract($p_tarname, 0, $p_list, "complete", $p_path, $p_mode, $p_remove_path)) != 1)
    {
      return 'Extracting Tar.gz failed';
    }

    return true;
  }
  // --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// ***** UNDER THIS LINE ARE DEFINED PRIVATE INTERNAL FUNCTIONS *****
// *****                                                        *****
// *****       THESES FUNCTIONS MUST NOT BE USED DIRECTLY       *****
// --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // Function : PclTarHandleExtract()
  // Description :
  // Parameters :
  //   $p_tarname : Filename of the tar (or tgz) archive
  //   $p_file_list : An array which contains the list of files to extract, this
  //                  array may be empty when $p_mode is 'complete'
  //   $p_list_detail : An array where will be placed the properties of  each extracted/listed file
  //   $p_mode : 'complete' will extract all files from the archive,
  //             'partial' will look for files in $p_file_list
  //             'list' will only list the files from the archive without any extract
  //   $p_path : Path to add while writing the extracted files
  //   $p_tar_mode : 'tar' for GNU TAR archive, 'tgz' for compressed archive
  //   $p_remove_path : Path to remove (from the file memorized path) while writing the
  //                    extracted files. If the path does not match the file path,
  //                    the file is extracted with its memorized path.
  //                    $p_remove_path does not apply to 'list' mode.
  //                    $p_path and $p_remove_path are commulative.
  // Return Values :
  // --------------------------------------------------------------------------------
  function PclTarHandleExtract($p_tarname, $p_file_list, &$p_list_detail, $p_mode, $p_path, $p_tar_mode, $p_remove_path)
  {
    $v_result=1;
    $v_nb = 0;
    $v_extract_all = TRUE;
    $v_listing = FALSE;

    // ----- Check the path
    /*
    if (($p_path == "") || ((substr($p_path, 0, 1) != "/") && (substr($p_path, 0, 3) != "../")))
      $p_path = "./".$p_path;
	*/

	$isWin = (substr(PHP_OS, 0, 3) == 'WIN');

	if(!$isWin)
	{
	    if (($p_path == "") || ((substr($p_path, 0, 1) != "/") && (substr($p_path, 0, 3) != "../")))
    	  $p_path = "./".$p_path;
	}
    // ----- Look for path to remove format (should end by /)
    if (($p_remove_path != "") && (substr($p_remove_path, -1) != '/'))
    {
      $p_remove_path .= '/';
    }
    $p_remove_path_size = strlen($p_remove_path);

    // ----- Study the mode
    switch ($p_mode) {
      case "complete" :
        // ----- Flag extract of all files
        $v_extract_all = TRUE;
        $v_listing = FALSE;
      break;
      case "partial" :
          // ----- Flag extract of specific files
          $v_extract_all = FALSE;
          $v_listing = FALSE;
      break;
      case "list" :
          // ----- Flag list of all files
          $v_extract_all = FALSE;
          $v_listing = TRUE;
      break;
      default :
        return false;
    }

    // ----- Open the tar file
    if ($p_tar_mode == "tar")
    {
      $v_tar = fopen($p_tarname, "rb");
    }
    else
    {
      $v_tar = @gzopen($p_tarname, "rb");
    }

    // ----- Check that the archive is open
    if ($v_tar == 0)
    {
      return false;
    }

    $start = time();

    // ----- Read the blocks
    while (!($v_end_of_file = ($p_tar_mode == "tar"?feof($v_tar):gzeof($v_tar))))
    {
      // ----- Clear cache of file infos
      clearstatcache();

	if (time() - $start > 55) {
           Platform::extendTimeLimit();
           $start = time();
        }

      // ----- Reset extract tag
      $v_extract_file = FALSE;
      $v_extraction_stopped = 0;

      // ----- Read the 512 bytes header
      if ($p_tar_mode == "tar")
        $v_binary_data = fread($v_tar, 512);
      else
        $v_binary_data = gzread($v_tar, 512);

      // ----- Read the header properties
      $v_header = array();
      if (($v_result = PclTarHandleReadHeader($v_binary_data, $v_header)) != 1)
      {
        // ----- Close the archive file
        if ($p_tar_mode == "tar")
          fclose($v_tar);
        else
          gzclose($v_tar);

        // ----- Return
        return $v_result;
      }

      // ----- Look for empty blocks to skip
      if ($v_header["filename"] == "")
      {
        continue;
      }

      // ----- Look for partial extract
      if ((!$v_extract_all) && (is_array($p_file_list)))
      {
        // ----- By default no unzip if the file is not found
        $v_extract_file = FALSE;

        // ----- Look into the file list
        for ($i=0; $i<sizeof($p_file_list); $i++)
        {
          // ----- Look if it is a directory
          if (substr($p_file_list[$i], -1) == "/")
          {
            // ----- Look if the directory is in the filename path
            if ((strlen($v_header["filename"]) > strlen($p_file_list[$i])) && (substr($v_header["filename"], 0, strlen($p_file_list[$i])) == $p_file_list[$i]))
            {
              // ----- The file is in the directory, so extract it
              $v_extract_file = TRUE;

              // ----- End of loop
              break;
            }
          }

          // ----- It is a file, so compare the file names
          else if ($p_file_list[$i] == $v_header["filename"])
          {
            // ----- File found
            $v_extract_file = TRUE;

            // ----- End of loop
            break;
          }
        }

        // ----- Trace
        if (!$v_extract_file)
        {
        }
      }
      else
      {
        // ----- All files need to be extracted
        $v_extract_file = TRUE;
      }

      // ----- Look if this file need to be extracted
      if (($v_extract_file) && (!$v_listing))
      {
        // ----- Look for path to remove
        if (($p_remove_path != "")
            && (substr($v_header["filename"], 0, $p_remove_path_size) == $p_remove_path))
        {
          // ----- Remove the path
          $v_header["filename"] = substr($v_header["filename"], $p_remove_path_size);
        }

        // ----- Add the path to the file
        if (($p_path != "./") && ($p_path != "/"))
        {
          // ----- Look for the path end '/'
          while (substr($p_path, -1) == "/")
          {
            $p_path = substr($p_path, 0, strlen($p_path)-1);
          }

          // ----- Add the path
          if (substr($v_header["filename"], 0, 1) == "/")
              $v_header["filename"] = $p_path.$v_header["filename"];
          else
            $v_header["filename"] = $p_path."/".$v_header["filename"];
        }

        // ----- Check that the file does not exists
        if (file_exists($v_header["filename"]))
        {
          // ----- Look if file is a directory
          if (is_dir($v_header["filename"]))
          {
            // ----- Change the file status
            $v_header["status"] = "already_a_directory";

            // ----- Skip the extract
            $v_extraction_stopped = 1;
            $v_extract_file = 0;
          }
          // ----- Look if file is write protected
          else if (!is_writeable($v_header["filename"]))
          {
            // ----- Change the file status
            $v_header["status"] = "write_protected";

            // ----- Skip the extract
            $v_extraction_stopped = 1;
            $v_extract_file = 0;
          }
          // ----- Look if the extracted file is older
          else if (filemtime($v_header["filename"]) > $v_header["mtime"])
          {
            // ----- Change the file status
            $v_header["status"] = "newer_exist";

            // ----- Skip the extract
            $v_extraction_stopped = 1;
            $v_extract_file = 0;
          }
        }

        // ----- Check the directory availability and create it if necessary
        else
        {
          if ($v_header["typeflag"]=="5")
            $v_dir_to_check = $v_header["filename"];
          else if (!strstr($v_header["filename"], "/"))
            $v_dir_to_check = "";
          else
            $v_dir_to_check = dirname($v_header["filename"]);

          if (($v_result = PclTarHandlerDirCheck($v_dir_to_check)) != 1)
          {
            // ----- Change the file status
            $v_header["status"] = "path_creation_fail";

            // ----- Skip the extract
            $v_extraction_stopped = 1;
            $v_extract_file = 0;
          }
        }

        // ----- Do the extraction
        if (($v_extract_file) && ($v_header["typeflag"]!="5"))
        {
          // ----- Open the destination file in write mode
          if (($v_dest_file = @fopen($v_header["filename"], "wb")) == 0)
          {
            // ----- Change the file status
            $v_header["status"] = "write_error";

            // ----- Jump to next file
            if ($p_tar_mode == "tar")
              fseek($v_tar, ftell($v_tar)+(ceil(($v_header['size']/512))*512));
            else
              gzseek($v_tar, gztell($v_tar)+(ceil(($v_header['size']/512))*512));
          }
          else
          {
            // ----- Read data
            $n = floor($v_header["size"]/512);
            for ($i=0; $i<$n; $i++)
            {
              if ($p_tar_mode == "tar")
                $v_content = fread($v_tar, 512);
              else
                $v_content = gzread($v_tar, 512);
              fwrite($v_dest_file, $v_content, 512);
            }
            if (($v_header["size"] % 512) != 0)
            {
              if ($p_tar_mode == "tar")
                $v_content = fread($v_tar, 512);
              else
                $v_content = gzread($v_tar, 512);
              fwrite($v_dest_file, $v_content, ($v_header["size"] % 512));
            }

            // ----- Close the destination file
            fclose($v_dest_file);

            // ----- Change the file mode, mtime
            @touch($v_header["filename"], $v_header["mtime"]);
            //chmod($v_header[filename], DecOct($v_header[mode]));
          }

          // ----- Check the file size
          clearstatcache();
          if (filesize($v_header["filename"]) != $v_header["size"])
          {
            // ----- Close the archive file
            if ($p_tar_mode == "tar")
              fclose($v_tar);
            else
              gzclose($v_tar);

            // ----- Return
            return false;
          }
        }

        else
        {
          // ----- Jump to next file
          if ($p_tar_mode == "tar")
            fseek($v_tar, ftell($v_tar)+(ceil(($v_header["size"]/512))*512));
          else
            gzseek($v_tar, gztell($v_tar)+(ceil(($v_header["size"]/512))*512));
        }
      }

      // ----- Look for file that is not to be unzipped
      else
      {
        // ----- Jump to next file
        if ($p_tar_mode == "tar")
          fseek($v_tar, ($p_tar_mode=="tar"?ftell($v_tar):gztell($v_tar))+(ceil(($v_header[size]/512))*512));
        else
          gzseek($v_tar, gztell($v_tar)+(ceil(($v_header[size]/512))*512));
      }

      if ($p_tar_mode == "tar")
        $v_end_of_file = feof($v_tar);
      else
        $v_end_of_file = gzeof($v_tar);

      // ----- File name and properties are logged if listing mode or file is extracted
      if ($v_listing || $v_extract_file || $v_extraction_stopped)
      {
        // ----- Log extracted files
        if (($v_file_dir = dirname($v_header["filename"])) == $v_header["filename"])
          $v_file_dir = "";
        if ((substr($v_header["filename"], 0, 1) == "/") && ($v_file_dir == ""))
          $v_file_dir = "/";

        // ----- Add the array describing the file into the list
        $p_list_detail[$v_nb] = $v_header;

        // ----- Increment
        $v_nb++;
      }
    }

    // ----- Close the tarfile
    if ($p_tar_mode == "tar")
      fclose($v_tar);
    else
      gzclose($v_tar);

    // ----- Return
    return $v_result;
  }
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // Function : PclTarHandleReadHeader()
  // Description :
  // Parameters :
  // Return Values :
  // --------------------------------------------------------------------------------
  function PclTarHandleReadHeader($v_binary_data, &$v_header)
  {
    $v_result=1;

    // ----- Read the 512 bytes header
    /*
    if ($p_tar_mode == "tar")
      $v_binary_data = fread($p_tar, 512);
    else
      $v_binary_data = gzread($p_tar, 512);
    */

    // ----- Look for no more block
    if (strlen($v_binary_data)==0)
    {
      $v_header['filename'] = "";
      $v_header['status'] = "empty";

      return $v_result;
    }

    // ----- Look for invalid block size
    if (strlen($v_binary_data) != 512)
    {
      $v_header['filename'] = "";
      $v_header['status'] = "invalid_header";

      // ----- Return
      return false;
    }

    // ----- Calculate the checksum
    $v_checksum = 0;
    // ..... First part of the header
    for ($i=0; $i<148; $i++)
    {
      $v_checksum+=ord(substr($v_binary_data,$i,1));
    }
    // ..... Ignore the checksum value and replace it by ' ' (space)
    for ($i=148; $i<156; $i++)
    {
      $v_checksum += ord(' ');
    }
    // ..... Last part of the header
    for ($i=156; $i<512; $i++)
    {
      $v_checksum+=ord(substr($v_binary_data,$i,1));
    }

    // ----- Extract the values
    $v_data = unpack("a100filename/a8mode/a8uid/a8gid/a12size/a12mtime/a8checksum/a1typeflag/a100link/a6magic/a2version/a32uname/a32gname/a8devmajor/a8devminor", $v_binary_data);

    // ----- Extract the checksum for check
    $v_header["checksum"] = OctDec(trim($v_data["checksum"]));
    if ($v_header["checksum"] != $v_checksum)
    {
      $v_header["filename"] = "";
      $v_header["status"] = "invalid_header";

      // ----- Look for last block (empty block)
      if (($v_checksum == 256) && ($v_header["checksum"] == 0))
      {
        $v_header["status"] = "empty";
        // ----- Return
        return $v_result;
      }

      // ----- Return
      return false;
    }
    // ----- Extract the properties
    $v_header["filename"] = trim($v_data["filename"]);
    $v_header["mode"] = OctDec(trim($v_data["mode"]));
    $v_header["uid"] = OctDec(trim($v_data["uid"]));
    $v_header["gid"] = OctDec(trim($v_data["gid"]));
    $v_header["size"] = OctDec(trim($v_data["size"]));
    $v_header["mtime"] = OctDec(trim($v_data["mtime"]));
    if (($v_header["typeflag"] = $v_data["typeflag"]) == "5")
    {
      $v_header["size"] = 0;
    }
    /* ----- All these fields are removed form the header because they do not carry interesting info
    $v_header[link] = trim($v_data[link]);
    TrFctMessage(__FILE__, __LINE__, 2, "Linkname : $v_header[linkname]");
    $v_header[magic] = trim($v_data[magic]);
    TrFctMessage(__FILE__, __LINE__, 2, "Magic : $v_header[magic]");
    $v_header[version] = trim($v_data[version]);
    TrFctMessage(__FILE__, __LINE__, 2, "Version : $v_header[version]");
    $v_header[uname] = trim($v_data[uname]);
    TrFctMessage(__FILE__, __LINE__, 2, "Uname : $v_header[uname]");
    $v_header[gname] = trim($v_data[gname]);
    TrFctMessage(__FILE__, __LINE__, 2, "Gname : $v_header[gname]");
    $v_header[devmajor] = trim($v_data[devmajor]);
    TrFctMessage(__FILE__, __LINE__, 2, "Devmajor : $v_header[devmajor]");
    $v_header[devminor] = trim($v_data[devminor]);
    TrFctMessage(__FILE__, __LINE__, 2, "Devminor : $v_header[devminor]");
    */

    // ----- Set the status field
    $v_header["status"] = "ok";

    // ----- Return
    return $v_result;
  }
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // Function : PclTarHandlerDirCheck()
  // Description :
  //   Check if a directory exists, if not it creates it and all the parents directory
  //   which may be useful.
  // Parameters :
  //   $p_dir : Directory path to check (without / at the end).
  // Return Values :
  //    1 : OK
  //   -1 : Unable to create directory
  // --------------------------------------------------------------------------------
  function PclTarHandlerDirCheck($p_dir)
  {
    $v_result = 1;

    // ----- Check the directory availability
    if ((is_dir($p_dir)) || ($p_dir == ""))
    {
      return 1;
    }

    // ----- Look for file alone
    /*
    if (!strstr("$p_dir", "/"))
    {
      TrFctEnd(__FILE__, __LINE__,  "'$p_dir' is a file with no directory");
      return 1;
    }
    */

    // ----- Extract parent directory
    $p_parent_dir = dirname($p_dir);

    // ----- Just a check
    if ($p_parent_dir != $p_dir)
    {
      // ----- Look for parent directory
      if ($p_parent_dir != "")
      {
        if (($v_result = PclTarHandlerDirCheck($p_parent_dir)) != 1)
        {
          return $v_result;
        }
      }
    }

    // ----- Create the directory
    if (!@mkdir($p_dir, 0777))
    {
      // ----- Return
      return false;
    }

    // ----- Return
    return $v_result;
  }
  // --------------------------------------------------------------------------------

  // --------------------------------------------------------------------------------
  // Function : PclTarHandleExtension()
  // Description :
  // Parameters :
  // Return Values :
  // --------------------------------------------------------------------------------
  function PclTarHandleExtension($p_tarname)
  {
    // ----- Look for file extension
    if ((substr($p_tarname, -7) == ".tar.gz") || (substr($p_tarname, -4) == ".tgz"))
    {
      $v_tar_mode = "tgz";
    }
    else if (substr($p_tarname, -4) == ".tar")
    {
      $v_tar_mode = "tar";
    }
    else
    {
           $v_tar_mode = "";
    }

    return $v_tar_mode;
  }
  // --------------------------------------------------------------------------------

/* ---------- END 3rd Party code for tar.gz extraction --------------------- */
?>