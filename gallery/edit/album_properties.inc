<?
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000 Bharat Mediratta
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
?>
<?
if ($doit) {

	//-- set this one seperately because it does not make sense to go recursive here ---
	$album->setFields(
		array("returnto" => $f_returnto)
	);

    $album->setFields(
        array("fit_to_window" => $f_fit_to_window,
            "use_fullOnly" => $f_use_fullOnly,
            "print_photos" => $f_print_photos,
            "display_clicks" => $f_display_clicks,
            "public_comments" => $f_public_comments,
        ),
        $f_recursive
    );

	if ($gallery->app->use_exif) {
		$album->setFields(
			array("returnto" => $f_returnto),
			$f_recursive
		);
	}

	return;
} else {

	//-- build up some html for output ---
	$content = "

		<span class=\"title\">Album Options</span>
		<br>
		<br>

        <span class=\"admin\">Show Navigation to Parent Album</span>
        <br>
        <span class=\"fineprint\">Turning this off with make this album appear to be <i>stand-alone.</i></span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>Show Up Navigation</td>
            <td>
            <select name=\"f_returnto\">
            " . getSelectOptions($album, "returnto", array("yes", "no")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>

        <span class=\"admin\">Auto fit-to-window for images without a resized copy</span>
        <br>
        <span class=\"fineprint\">Images will be dynamically resized (using JavaScript) to fit within the browser window.</span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>Auto fit-to-window</td>
            <td>
            <select name=\"f_fit_to_window\">
            " . getSelectOptions($album, "fit_to_window", array("yes", "no")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>

        <span class=\"admin\">User selected full or resized preference</span>
        <br>
        <span class=\"fineprint\">Offer visiters the ability to specify a preference for full-size or resized images.</span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>User selected full or resized</td>
            <td>
            <select name=\"f_use_fullOnly\">
            " . getSelectOptions($album, "use_fullOnly", array("yes", "no")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>

        <span class=\"admin\">Photo Printing Service</span>
        <br>
        <span class=\"fineprint\">Which photo printing service do you want to let visitors use?</span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>Photo Printing</td>
            <td>
            <select name=\"f_print_photos\">
            " . getSelectOptions($album, "print_photos", array("none", "shutterfly")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>

        <span class=\"admin\">Click Counters</span>
        <br>
        <span class=\"fineprint\">Display click counter for this album and its items.</span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>Show Click Counts</td>
            <td>
            <select name=\"f_display_clicks\">
            " . getSelectOptions($album, "display_clicks", array("yes", "no")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>

        <span class=\"admin\">Public Comments</span>
        <br>
        <span class=\"fineprint\">Allow public commenting for items in this album.</span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>Public Comments</td>
            <td>
            <select name=\"f_public_comments\">
            " . getSelectOptions($album, "public_comments", array("yes", "no")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>
	";
	if ($gallery->app->use_exif) {
		$content .= "

        <span class=\"admin\">Display JPEG EXIF Data</span>
        <br>
        <span class=\"fineprint\">Give visitors the option of seeing image properties stored in JPEG EXIF headers.</span>
        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td>Display EXIF Data</td>
            <td>
            <select name=\"f_use_exif\">
            " . getSelectOptions($album, "use_exif", array("yes", "no")) ."
            </select>
            </td>
          </tr>
        </table>
        <br>
		";
	}

	$content .= "

        <table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
          <tr>
            <td valign=\"top\">
            <input type=\"checkbox\" name=\"f_recursive\">
            </td>
            <td>
            Apply the above properties to all albums contained within this album.
            </td>
          </tr>
        </table>

	";

	return $content;

}
?>
