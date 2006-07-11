<?php
/*
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
 * @version $Revision$ $Date$
 * @package GalleryCore
 * @subpackage UserInterface
 * @author Jozef Selesi <selesi at gmail dot com>
 */

GalleryCoreApi::requireOnce('modules/core/classes/GalleryRepository.class');

/**
 * This controller will handle an administration request for a module
 *
 * @package GalleryCore
 * @subpackage UserInterface
 *
 */
class AdminRepositoryController extends GalleryController {

    /**
     * Repository.
     *
     * @var object GalleryRepository
     * @access private
     */
    var $_repository;

    function _getRepository() {
	if (!isset($this->_repository)) {
	    $this->_repository = new GalleryRepository();
	}
	return $this->_repository;
    }

    /**
     * @see GalleryController::handleRequest
     */
    function handleRequest($form) {
	global $gallery;

	$ret = GalleryCoreApi::assertUserIsSiteAdministrator();
	if ($ret) {
	    return array($ret, null);
	}

	/* Init repository. */
	$repository = $this->_getRepository();
	$ret = $repository->init();
	if ($ret) {
	    return array($ret, null);
	}

	$status = $error = array();

	if (isset($form['action']['update'])) {
	    /* Try to update the index. */
	    $ret = $repository->downloadIndex();
	    if ($ret) {
		$status['error'] = $ret->getErrorMessage();
	    } else {
		$status['indexUpdated'] = 1;
	    }

	    /* Scan all plugins. */
	    $ret = $this->_scanPlugins();
	    if ($ret) {
		$status['error'] = $ret->getErrorMessage();
	    }

            $redirect['view'] = 'core.SiteAdmin';
	    $redirect['subView'] = 'core.AdminRepository';
	} else if (isset($form['action']['upgradeAll'])) {
	    /* Get list of upgradeable packages. */
	    list ($ret, $packages) = $repository->getAllUpgradeablePackages();
	    if ($ret) {
		return array($ret, null);
	    }

	    if (empty($packages)) {
		$status['noUpgradeAvailable'] = 1;
	    } else {
		/* Start upgrade process and show progress bar. */
		$templateAdapter =& $gallery->getTemplateAdapter();
		$templateAdapter->registerTrailerCallback(
		    array($this, 'performDownloadAndInstallation'),
		    array($packages, 'commonTasks'));
		$delegate['view'] = 'core.ProgressBar';
		break;
	    }
	}

	if (!empty($redirect)) {
	    $results['redirect'] = $redirect;
	} else {
	    if (empty($delegate)) {
		$results['delegate']['view'] = 'core.SiteAdmin';
		$results['delegate']['subView'] = 'core.AdminRepository';
	    } else {
		$results['delegate'] = $delegate;
	    }
	}
	$results['status'] = $status;
	$results['error'] = $error;

	return array(null, $results);
    }

    /**
     * Scan all installed plugins and update GalleryPluginPackageMap with a complete
     * listing of everything that's installed.
     *
     * @return object GalleryStatus a status code
     * @access private
     */
    function _scanPlugins() {
	global $gallery;

	/* Start from a clean slate.  Inefficient, but very convenient. */
	$ret = GalleryCoreApi::removeAllMapEntries('GalleryPluginPackageMap');
	if ($ret) {
	    return $ret;
	}

	$platform =& $gallery->getPlatform();
	$util = new GalleryRepositoryUtilities();
	foreach (array('module', 'theme') as $type) {
	    list ($ret, $pluginStatus) = GalleryCoreApi::fetchPluginStatus($type, true);
	    if ($ret) {
		return $ret;
	    }

	    foreach ($pluginStatus as $pluginId => $status) {
		list($ret, $plugin) = GalleryCoreApi::loadPlugin($type, $pluginId, true);
		if ($ret) {
		    return $ret;
		}

		$pluginDir = sprintf(
		    '%s/%ss/%s', dirname(dirname(dirname(__FILE__))), $type, $pluginId);
		list ($ret, $tag) = $util->getFirstBytesFromFile("$pluginDir/MANIFEST", 128);
		if ($ret) {
		    return $ret;
		}

		list ($ret, $revision) = $util->extractRevision($tag);
		if ($ret) {
		    return $ret;
		}

		$ret = GalleryCoreApi::addMapEntry(
		    'GalleryPluginPackageMap',
		    array('pluginType' => $type,
			  'pluginId' => $pluginId,
			  'packageName' => 'base',
			  'packageVersion' => $plugin->getVersion(),
			  'packageBuild' => $revision));
		if ($ret) {
		    return $ret;
		}

		list ($ret, $tag) = $util->getFirstBytesFromFile("$pluginDir/po/strings.raw", 128);
		if ($ret) {
		    return $ret;
		}
		list ($ret, $stringsRevision) = $util->extractRevision($tag);
		if ($ret) {
		    return $ret;
		}

		$poFiles = $platform->glob("$pluginDir/po/*.po");
		if ($poFiles) {
		    foreach ($poFiles as $file) {
			list ($ret, $tag) = $util->getFirstBytesFromFile($file, 128);
			if ($ret) {
			    return $ret;
			}

			list ($ret, $revision) = $util->extractRevision($tag);
			if ($ret) {
			    return $ret;
			}
			$ret = GalleryCoreApi::addMapEntry(
			    'GalleryPluginPackageMap',
			    array('pluginType' => $type,
				  'pluginId' => $pluginId,
				  'packageName' => (
				      'lang-' . GalleryUtilities::getFileBase(basename($file))),
				  'packageVersion' => $stringsRevision,
				  'packageBuild' => $revision));
			if ($ret) {
			    return $ret;
			}
		    }
		}
	    }
	}
    }
}

/**
 * This view will show all repository-related features.
 *
 * @package GalleryCore
 * @subpackage UserInterface
 */
class AdminRepositoryView extends GalleryView {

    /**
     * Repository.
     *
     * @var object GalleryRepository
     * @access private
     */
    var $_repository;

    function _getRepository() {
	if (!isset($this->_repository)) {
	    $this->_repository = new GalleryRepository();
	}
	return $this->_repository;
    }

    /**
     * @see GalleryView::loadTemplate
     */
    function loadTemplate(&$template, &$form) {
	global $gallery;

	$ret = GalleryCoreApi::assertUserIsSiteAdministrator();
	if ($ret) {
	    return array($ret, null);
	}

	/* Init repository. */
	$repository = $this->_getRepository();
	$ret = $repository->init();
	if ($ret) {
	    return array($ret, null);
	}

	$localIndexExists = $repository->localIndexExists();
	if (!$localIndexExists) {
	    /* Make sure the plugins directory is properly set up. */
	    list ($isSetUp, $errorMessage) = GalleryRepository::createPluginsDirectory();
	    if (!$isSetUp) {
		$platform =& $gallery->getPlatform();

		$redirect['view'] = 'core.SiteAdmin';
		$redirect['subView'] = 'core.AdminRepositorySetup';
		$template->setVariable('galleryBaseDirectory',
		    $platform->realpath(dirname(__FILE__) . '/../..'));
		$template->setVariable('errorMessage', $errorMessage);

		return array(null,
			     array('body' => 'modules/core/templates/AdminRepositorySetup.tpl'));
	    }
	}

	/* Check if incompatible plugins should be shown. */
	$coreApis = array();
	$showIncompatible = GalleryUtilities::getRequestVariables('showIncompatible');
	if ($showIncompatible == 'true') {
	    list ($coreApiVersion, $themeApiVersion, $moduleApiVersion) =
		GalleryUtilities::getRequestVariables('coreApi', 'themeApi', 'moduleApi');
	    if (empty($coreApiVersion) || empty($themeApiVersion) || empty($moduleApiVersion)) {
		return array(GalleryCoreApi::error(
				 ERROR_BAD_PARAMETER, __FILE__, __LINE__,
				 "[$coreApiVersion] [$themeApiVersion] [$moduleApiVersion]"),
			     null);
	    }
	    $coreApis['core'] = explode('.', $coreApiVersion);
	    $coreApis['module'] = explode('.', $moduleApiVersion);
	    $coreApis['theme'] = explode('.', $themeApiVersion);
	    $template->setVariable('showIncompatible', 1);
	}

	if ($localIndexExists) {
	    foreach (array('module', 'theme') as $pluginType) {
		/* Get list of plugins to show in the repository browser. */
		list ($ret, $browseData[$pluginType]) = $repository->getRepositoryPluginList(
		    $pluginType, $showIncompatible, $coreApis);
		if ($ret) {
		    return array($ret, null);
		}
	    }

	    /* TODO: merge these group-wise instead of just appending themes to groups */
	    $browseData = array_merge($browseData['module'], $browseData['theme']);

	    $template->setVariable('browseData', $browseData);

	    /* Get local index meta data. */
	    list ($ret, $indexMetaData) = $repository->getIndexMetaData();
	    if ($ret) {
		return array($ret, null);
	    }
	    $template->setVariable('indexMetaData', $indexMetaData);

	    /* Get core upgrade info. */
	    list ($ret, $isCoreUpgradeAvailable, $apiVersions) =
		$repository->isCoreUpgradeAvailable();
	    if ($ret) {
		return array($ret, null);
	    }
	    if ($isCoreUpgradeAvailable) {
		$template->setVariable('latestCoreApiVersion', $apiVersions['core']);
		$template->setVariable('latestThemeApiVersion', $apiVersions['theme']);
		$template->setVariable('latestModuleApiVersion', $apiVersions['module']);
	    }
	    $template->setVariable('coreUpgradeAvailable', $isCoreUpgradeAvailable);
	}

	/* Render the HTML body */
	$template->setVariable('controller', 'core.AdminRepository');

	return array(null,
		     array('body' => 'modules/core/templates/AdminRepository.tpl'));
    }
}
?>
