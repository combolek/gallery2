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

	$album->setFields(
		array("html_header" => $f_html_header,
			"html_footer" => $f_html_footer
		)
	);

	return;
} else {

	//-- build up some html for output ---
	$content = "

		<span class=\"title\">Edit the Album's Custom HTML</span>
		<br>
        <br>

		<span class=\"admin\">Album Header &amp; Footer HTML snippets</span>
        <br>
        <span class=\"fineprint\">These optional snippets are used above and below the album content, but within the overall gallery structure.</span> 
		<br>
		Header HTML:<br>
		<textarea name=\"f_html_header\" rows=\"5\" cols=\"50\">". $album->fields["html_header"] ."</textarea>
        <br>
		Footer HTML:<br>
		<textarea name=\"f_html_footer\" rows=\"5\" cols=\"50\">". $album->fields["html_footer"] ."</textarea>
		<br>
		<br>

	";

	return $content;

}
?>
