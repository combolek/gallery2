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
<? require($GALLERY_BASEDIR . "init.php"); ?>
<?
// Hack check
if (!$gallery->user->canAddToAlbum($gallery->album)) {
    exit;
}


//-- file upload ---

$content = "
  <script language=\"javascript1.2\">
  // <!--
  //var statusWin;
  function showProgress() {
	//statusWin = open('".makeGalleryUrl("progress_uploading.php")."','Status',
    //                 'height=150,width=350,location=no,scrollbars=no,menubars=no,toolbars=no,resizable=yes');  
    document.theform.doit.value=\"Don't Click Me Again!!!\";
    document.theform.cancel.value=\"Upload in Progress...\";
  }

  // --> 
  </script>
";

$content .= makeFormIntro("album_save_items.php",
			array("name" => "theform",
				"enctype" => "multipart/form-data",
				"method" => "POST"));

$content .= "
    <br>
	<input type=\"hidden\" name=\"return\" value=\"$return\">
	<input type=\"hidden\" name=\"max_file_size\" value=\"10000000\">
	<span class=\"title\">Add Items to the Album: ".$gallery->session->albumName."</span>
	<br>
	<br>
	Add images and movies to this album.
	(Supported file types: " . join(", ", acceptableFormatList()) . ").
	<br>
	<br>
	<span class=\"admin\">From your computer</span>
	<br>
	Click the browse button to locate an item to
	upload. You may upload up to 8 in this manner at one time.
";		
if ($gallery->app->feature["zip"]) {
	$content .= "
		<i>Tip: Upload a ZIP file full of items!</i>
	";
}
$content .= "
	<br>
	<blockquote>
";
for ($i=0; $i<8; $i++) {
	$content .= "
		<input name=\"userfile[]\" type=\"file\" size=\"60\"><br>
	";	
}
$content .= "
	</blockquote>
";

//-- url upload ---
$content .= "
	<span class=\"admin\">From a web page</span>	
	<br>
	Enter an URL. All of the images/movies found on this
	page can be added to the Album (you will be prompted to select which ones).
	<br>
	<blockquote>
	Location: <input type=\"text\" name=\"urls_or_path[]\" size=\"60\"><br>
	</blockquote>
";

//-- local upload ---
$content .= "
	<span class=\"admin\">From the server</span>	
	<br>
	Enter the full path to a directory on the gallery
	server. All of the items found in this directory can be added 
	to the Album (you will be prompted to select which ones).
	<i>Tip: FTP images to a directory on your server then provide that path here!</i>
	<blockquote>
	Path: <input type=\"text\" name=\"urls_or_path[]\" size=\"60\"><br>
	</blockquote>
";

//-- options ---
$content .= "
	<span class=\"admin\">Item Addition Options</span>	
	<blockquote>
	<input type=\"checkbox\" name=\"set_caption\" checked 
	 value=\"1\">Insert original file names into photo captions.
	</blockquote>
";

$content .= "
	<input type=\"submit\" name=\"doit\" value=\"          Add          \" onClick=\"showProgress()\">
	<input type=\"submit\" name=\"cancel\" value=\"    Cancel    \">
    <br>
    <span class=\"fineprint\">[Do not hit the Add button more than once!]</span>
	</form>
";

//-------------------------------------------------------------------------
//-- The Layout of the Page ---
//

//-- first get the html for the header and footer and stick it in the GLO
//-- for use by the layout. The html_wrap template gets is own limited
//-- layout object.
$G['TITLE'] = $gallery->app->galleryTitle.":: Add Items";
$G['HEAD']['EXTRA'] = $pageHeadExtra;
$G['HEAD']['STYLESHEET_INCLUDE'] = getStyleSheetLink();
$G['BODYTAG']['EXTRA'] = $pageBodyTagExtra;
$G['GALLERY_PROJECT']['HREF'] = $gallery->url;
$G['GALLERY_PROJECT']['VERSION'] = $gallery->version;
$G['PIXEL_IMAGE'] = $GLO['pixelImage'];

list($header, $footer) = getLayoutWrapHeaderFooter($G);

//-- now do the layout, wrapped by the embed logic ---
includeHtmlWrap("wrapper.header");

echo($header);
echo($content);
echo($footer);

includeHtmlWrap("wrapper.footer");

?>
