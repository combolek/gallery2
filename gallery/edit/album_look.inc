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
		array("layout" => $f_layout,
			"textcolor" => $f_textcolor,
			"linkcolor" => $f_linkcolor,
			"bgcolor" => $f_bgcolor,
			"bgcolor2" => $f_bgcolor2,
			"background" => $f_background,
			"border" => $f_border,
			"bordercolor" => $f_bordercolor
		), 
		$f_recursive
	);	

	return;
} else {

	//-- build up some html for output ---
	$content = "

		<span class=\"title\">Edit the album's Look &amp; Feel</span>
		<br>
        <br>
        <span class=\"admin\">Album Theme</span>
        <br>
         <span class=\"fineprint\">The Theme controls the overall structure of the album pages.</span> 
        <br>
        <select name=\"f_layout\"> 
	    " . getSelectOptions($album, "layout", getLayouts()) ."
		</select>
		<br>
		<br>
      
		<span class=\"admin\">Background, Fonts &amp; Colors</span>
        <br>
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Font Color</td>
		    <td><input type=\"text\" name=\"f_textcolor\" value=\"". $album->fields["textcolor"] ."\" size=\"7\"></td>
		    <td>Link Color</td>
		    <td><input type=\"text\" name=\"f_linkcolor\" value=\"". $album->fields["linkcolor"] ."\" size=\"7\"></td>
		  </tr>
		  <tr>
		    <td>Background Color</td>
		    <td><input type=\"text\" name=\"f_bgcolor\" value=\"". $album->fields["bgcolor"] ."\" size=\"7\"></td>
		    <td>Background Color 2</td>
		    <td><input type=\"text\" name=\"f_bgcolor2\" value=\"". $album->fields["bgcolor2"] ."\" size=\"7\"></td>
		  </tr>
		  <tr>
		    <td>Background Image</td>
		    <td colspan=\"3\"><input type=\"text\" name=\"f_background\" value=\"". $album->fields["background"] ."\" size=\"40\"></td>
		  </tr>
        </table>
        <br>

        <span class=\"admin\">Borders</span>
        <br>
		<span class=\"fineprint\">Size and color of the borders drawn around album items. The Theme may use these border settings for other purposes as well.</span> 
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Border Width</td>
		    <td>
		      <select name=\"f_border\">
		      ". getSelectOptions($album, "border", array("0 (no borders)", 1, 2, 3, 4)) ."
			  </select>
            </td>
		    <td>Border Color</td>
		    <td><input type=\"text\" name=\"f_bordercolor\" value=\"". $album->fields["bordercolor"] ."\" size=\"7\"></td>
		  </tr>
		</table>
		<br>
		<br>

		<input type=\"checkbox\" name=\"f_recursive\">
		Apply these properties to all albums contained within this album.

	";

	return $content;

}
?>
