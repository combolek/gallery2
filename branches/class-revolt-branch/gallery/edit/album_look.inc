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
			"rows" => $f_rows,
			"cols" => $f_cols,
			"thumb_size" => $f_thumb_size,
			"resize_size" => $f_resize_size,
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
        <span class=\"admin\">Album Layout</span>
        <br>
        <span class=\"fineprint\">The <i>Layout</i> controls the overall structure of the album pages.</span> 
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Layout</td>
        	<td>
			<select name=\"f_layout\"> 
	    	" . getSelectOptions($album, "layout", getLayouts()) ."
			</select>
			</td>
		  </tr>
		</table>
		<br>
      
		<span class=\"admin\">Background, Fonts &amp; Colors</span>
        <br>
		<span class=\"fineprint\">If these values are left blank, defaults will be used.</span> 
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

        <span class=\"admin\">Item Thumbnails</span>
        <br>
		<span class=\"fineprint\">How many thumbnails down, and how many across.</span> 
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Rows</td>
		    <td><input type=\"text\" name=\"f_rows\" value=\"". $album->fields["rows"] ."\" size=\"4\"></td>
		    <td>Columns</td>
		    <td><input type=\"text\" name=\"f_cols\" value=\"". $album->fields["cols"] ."\" size=\"4\"></td>
		  </tr>
		</table>
		<span class=\"fineprint\">The size, in pixels, of the item thumbnails.</span> 
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Thumbnail Size</td>
		    <td>
			<input type=\"text\" name=\"f_thumb_size\" value=\"". $album->fields["thumb_size"] ."\" size=\"5\"> 
			</td>
		  </tr>
		</table>
		<br>

        <span class=\"admin\">Image Auto-Resize</span>
        <br>
		<span class=\"fineprint\">Images are resized to this size, in pixels, when added. <i>Choose 'off' to disable image resizing.</i></span> 
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Resize Size</td>
		    <td>
        	<select name=\"f_resize_size\">
        	" . getSelectOptions($album, "resize_size", array("off", 400, 500, 600, 700, 800)) ."
        	</select>
			</td>
		  </tr>
		</table>
		<br>

        <span class=\"admin\">Borders</span>
        <br>
		<span class=\"fineprint\">Size and color of the borders drawn around album items. The <i>Layout</i> may use these border settings for other purposes as well. <i>Choose a width of 0 to turn borders off.</i></span> 
		<table border=\"0\" cellspacing=\"0\" cellpadding=\"3\">
		  <tr>
		    <td>Border Width</td>
		    <td>
		      <select name=\"f_border\">
		      ". getSelectOptions($album, "border", array("0", 1, 2, 3, 4)) ."
			  </select>
            </td>
		    <td>Border Color</td>
		    <td><input type=\"text\" name=\"f_bordercolor\" value=\"". $album->fields["bordercolor"] ."\" size=\"7\"></td>
		  </tr>
		</table>
		<br>

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
