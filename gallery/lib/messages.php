<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2008 Bharat Mediratta
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
 *
 * $Id$
 */

function gallery_error($message) {
	$html = infoBox(array(array(
		'type' => 'error',
		'text' => $message
	)));

	$html .= "\n";

	return $html;
}

function gallery_success($message) {
	$html = infoBox(array(array(
		'type' => 'success',
		'text' => $message
	)));

	$html .= "\n";

	return $html;
}

function gallery_info($message) {
	$html = infoBox(array(array(
		'type' => 'information',
		'text' => $message
	)));

	$html .= "\n";

	return $html;
}

function gallery_warning($message) {
	$html = infoBox(array(array(
		'type' => 'warning',
		'text' => $message
	)));

	$html .= "\n";

	return $html;
}

function infoLine($messages, $type = '') {
	$message = (is_array($messages)) ? implode("<br>\n", $messages) : $messages;

	if(!empty($message)) {
		return "<div class=\"$type\">Infoline: $message</div>\n";
	}
	else {
		return '';
	}
}

/**
 * Returns the HTML code for a nice notice box
 *
 * @param  array  $messages		Format is array('type' => ..., 'text' => ...)
 * @param  string $caption		An optional caption
 * @param  bool   $withOuterBorder	Whether to show an outlined border, or not
 * @return string $html
 * @author Jens Tkotz
 */
function infoBox($messages = array(), $caption = '', $withOuterBorder = true) {
	$html = '';
	$types = array('success', 'warning', 'error', 'information');

	if(!empty($messages)) {
		if($withOuterBorder) {
			$html .= "\n<div class=\"g-notice\">";
		}

		if(!empty($caption)) {
			$html .= "<span class=\"g-notice-caption\">$caption</span>";
		}

		ksort($messages);
		foreach ($messages as $message) {
			if(!isset($message['type']) || ! in_array($message['type'], $types)) {
				$message['type'] = 'information';
			}

			$html .= "\n  ". '<div class="g-'. $message['type'] .' left g-message">';
			$html .= gImage('icons/notice/'. $message['type'] .'.gif');
			$html .= ' '. $message['text'];
			$html .= "\n  </div>";
		}

		if($withOuterBorder) {
			$html .= "\n</div>";
		}
	}

	return $html;
}

/**
 * Just a wrapper around infoBox. (Prints an InfoBox). Has the same params
 *
 * @param  array  $messages		Format is array('type' => ..., 'text' => ...)
 * @param  string $caption		An optional caption
 * @param  bool   $withOuterBorder	Whether to show an outlined border, or not
 * @author Jens Tkotz
 */
function printInfoBox($messages = array(), $caption = '', $withOuterBorder = true) {
	if (!headers_sent() && (ob_get_length() == 0 || ! ob_get_length())) { ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <title>Message</title><?php echo getStyleSheetLink(); ?>
  </head>
<body>
<?php
	}
	echo infoBox($messages, $caption, $withOuterBorder);
}

function errorRow($key) {
	global $gErrors;

	if (!empty($gErrors[$key])) {
		echo "\n<tr>";
		echo "\n  <td colspan=\"2\">";
		echo "\n  ". gallery_error($gErrors[$key]);
		echo "  </td>";
		echo "\n</tr>";
	}
}

function processingMsg($buf) {
	echo "\n- $buf<br>";
	my_flush();
}

/* returns the offical name of the gallery */
function Gallery() {
	return "Gallery";
}

function poweredBy () {
	global $gallery;

	$addon = "\n<!-- {$gallery->version} -->";

	if (isDebugging() || $gallery->app->devMode == "yes" || $gallery->user->isAdmin()) {
		$version = $gallery->version;
	}
	else {
		$version = "1";
	}

	if ($gallery->session->offline) {
		$altText = sprintf(gTranslate('common', "Generated by %s v%s"), Gallery(), $version);
	}
	else {
		$altText = sprintf(gTranslate('common', "Powered by %s v%s"), Gallery(), $version);
	}

	$link = '<a href="'.$gallery->url.'" target="_blank">'. gImage('gallery1.gif', $altText) .'</a>';

	return $link . $addon;

}

function debugMessage($msg, $file, $line, $level = NULL) {
	global $gallery;

	if (isDebugging($level)) {
		echo "\n<div class=\"g-debugmessage\">". basename($file) ."::$line -> $msg</div>\n";
	}
}

function showDebugInfo() {
	global $gallery;
	global $GALLERY_EMBEDDED_INSIDE_TYPE;
	global $GALLERY_POSTNUKE_VERSION;

	if (isDebugging()) {
		$infoText = sprintf(_("Debug ON ! Level %s"), $gallery->app->debuglevel) . '<br>';
		if (empty($GALLERY_EMBEDDED_INSIDE_TYPE)) {
			$infoText .= 'Standalone';
			$infoText .= "; Skin: {$gallery->app->skinname}";
		}
		else {
			$infoText .= 'Embedded in: '. $GALLERY_EMBEDDED_INSIDE_TYPE;

			switch($GALLERY_EMBEDDED_INSIDE_TYPE) {
				case 'phpnuke':
					break;
				case 'postnuke':
					$infoText .= ' '. $GALLERY_POSTNUKE_VERSION;
					break;
				case 'cpgnuke':
					break;
				case 'phpBB2':
					break;
				case 'GeekLog':
					break;
			}
		}

		$infoText .= "; Theme: {$gallery->app->theme}";

		echo infoBox(array(array('text' => $infoText, 'type' => 'information')));
		echo "\n";
	}
}

function showInvalidReqMesg($text = '') {
	global $gallery;

	if (empty($text)) {
		$text = gTranslate('core', "Invalid Request.");
	}

	echo gallery_error(
		$text . ' ' .
//		sprintf(gTranslate('core', "Please go back to %s."),
//			galleryLink(makeGalleryUrl(), $gallery->app->galleryTitle))
		sprintf(gTranslate('core', "Please go back to %s."),
			$gallery->app->galleryTitle)
	);

	includeTemplate('overall.footer');
}
?>
