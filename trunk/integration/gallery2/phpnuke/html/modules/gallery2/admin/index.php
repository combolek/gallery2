<?php


/************************************************************************/
/* PHP-NUKE: Web Portal System                                          */
/* ===========================                                          */
/*                                                                      */
/* Copyright (c) 2002 by Francisco Burzi                                */
/* http://phpnuke.org                                                   */
/*                                                                      */
/* This program is free software. You can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation; either version 2 of the License.       */
/*                                                                      */
/************************************************************************/
/* Additional security checking code 2003 by chatserv                   */
/* http://www.nukefixes.com -- http://www.nukeresources.com             */
/************************************************************************/

if (!eregi("admin.php", $_SERVER['PHP_SELF'])) {
	die("Access Denied");
}
global $prefix, $db;

// --------------------------------------------------------
// Mapping between Phpnuke and Gallery2 language definition
// --------------------------------------------------------

	$Phpnuke2G2Lang = array ('danish' => 'da', 'dutch' => 'nl', 'german' => 'de', 'greek' => 'el', 'english' => 'en', 'american' => 'en', 'spanish' => 'es', 'finnish' => 'fi', 'french' => 'fr', 'irish' => 'ga', // not available
		'italian' => 'it', 'japanese' => 'ja', // not available
	'norwegian' => 'no', 'polish' => 'pl', 'portuguese' => 'pt', 'swedish' => 'sv', 'chinese' => 'zh',);

/*********************************************************/
/* Standalone Message Function                           */
/*********************************************************/

function g2_message($mess) {
	global $admin, $bgcolor2, $prefix, $db, $currentlang, $multilingual, $admin_file, $module_name;
	include ("header.php");
	OpenTable();
	echo "<br><center><a href=\"admin.php?op=gallery2\">
					<img alt='Gallery::your photos on your website' src='modules/$module_name/images/g2Logo.gif' border=0></a><H3>Gallery2 Module Administration</H3></center>";
	CloseTable();
	echo "<br/>";

	OpenTable();
	echo "<center><font class=\"option\">";
	echo $mess;
	echo "</font></center>";
	CloseTable();

	include ("footer.php");
}

/*********************************************************/
/* True if init() was called, else false                 */
/*********************************************************/

function isInitiated($newvalue = null) {
	static $initiated;
	if (!isset ($initiated)) {
		$initiated = false;
	}
	if (isset ($newvalue) && (is_bool($newvalue) || is_int($newvalue))) {
		$initiated = $newvalue;
	}
	return $initiated;
}

/*********************************************************/
/* Init G2 API                                           */
/*********************************************************/

function init() {

	// only init if not already done so
	if (isInitiated()) 
	{
		return true;
	}

	include ("modules/gallery2/gallery2.cfg");
	require_once ($g2embedparams[embedphpfile]."/"._G2_EMBED_PHP_FILE);

	$g2currentlang = $Phpnuke2G2Lang[$currentlang];

	$ret = GalleryEmbed :: init(array ('embedUri' => $g2embedparams[embedUri], 'relativeG2Path' => $g2embedparams[relativeG2Path], 'loginRedirect' => $g2embedparams[loginRedirect], 'activeUserId' => '', 'activeLanguage' => $g2currentlang, 'fullInit' => $fullInit));

	if (!$ret->isSuccess()) {
		g2_message('G2 did not return a success status upon an init request. Here is the error message from G2: <br /> [#(1)]'.$ret->getAsHtml());
		return false;
	}
	isInitiated(true);
	return true;

}

	/**
	 * g2addexternalMapEntry: add an externalId map entry
	 *
	 * Add an entry in the G externalId, entityId map table
	 *
	 * @author Andy Staudacher
	 * @access public
	 * @param integer the uid
	 * @param integer the entityId from G2
	 * @param integer/string the roles type, 1 for groups, 0 for users, or the entityType string
	 * @return bool true or false
	 */
	function g2addexternalMapEntry($externalId, $entityId, $entityType) 
	{
		include ("modules/gallery2/gallery2.cfg");
		
		// init G2 transaction, load G2 API, if not already done so
		if (!init()) {
			return false;
		}
		if (is_int($entityType)) {
			$entityType = $entityType == 0 ? 'GalleryUser' : 'GalleryGroup';
		}
		
		require_once ($g2embedparams[embedphpfile]."/".'modules/core/classes/ExternalIdMap.class');
		
		$ret = ExternalIdMap :: addMapEntry(array ('externalId' => $externalId, 'entityType' => $entityType, 'entityId' => $entityId));
		if ($ret->isError()) {
			g2_message('Failed to create a extmap entry for role uid ['.$externalId.'] and entityId ['.$entityId.'], entityType ['.$entityType.']. Here is the error message from G2: <br />'.$ret->getAsHtml());
			return false;
		}
		return true;
	}



	/**
	 * g2getallexternalIdmappings: get all extId, entityId mappings
	 *
	 * get all extId, entityId mappings from G2
	 * useful, i.e. for import/export synchronization update
	 * used only by the import/export method
	 *
	 * @author Andy Staudacher
	 * @access public
	 * @param none
	 * @return array(bool success, array(entityId => array(externalId => integer,
	 *                             entityType => string, entityId => integer)),
	 *                             array(externalId => array(externalId => integer,
	 *                             entityType => string, entityId => integer)))
	 * @throws Systemexception if it failed
	 */
	function g2getallexternalIdmappings() {
		// init G2 transaction, load G2 API, if not already done so
		if (!init()) {
			return array (false, null, null);
		}
		global $gallery;

		$query = 'SELECT [ExternalIdMap::entityId], [ExternalIdMap::externalId], [ExternalIdMap::entityType]
				FROM [ExternalIdMap]';

		list ($ret, $results) = $gallery->search($query, array ());
		if ($ret->isError()) {
			g2_message('Failed to fetch a list of all extId maps fromG2. Here is the error message from G2: <br /> [#(1)]'.$ret->getAsHtml());
			return array (false, null, null);
		}
		$mapsbyentityid = array ();
		$mapsbyexternal = array ();
		while ($result = $results->nextResult()) {
			$entry = array ('externalId' => $result[1], 'entityId' => $result[0], 'entityType' => $result[2]);
			$mapsbyentityid[$result[0]] = $entry;
			$mapsbyexternal[$result[1]] = $entry;
		}

		return array (true, $mapsbyentityid, $mapsbyexternal);
	}



/*********************************************************/
/* Init G2 API                                           */
/* Exports phpnuke users to g2 and 			             */
/* Initial user/group management synchronization.        */
/*********************************************************/

function g2_phpnukeTog2UserExport() 
{
	global $db, $user_prefix,$Phpnuke2G2Lang;	
	
	// init G2 transaction, load G2 API, if not already done so
	if (!init()) 
	{
		return false;
	}

	// Load all existing phpnuke <-> G2 mappings
	list ($ret, $mapsbyentityid, $mapsbyexternalid) = g2getallexternalIdmappings();
	if (!$ret) 
	{
		return false;
	}

	// Export all phpnuke users (except anonymous) to G2 defaut group if non existant
	 
	$query='SELECT user_id, name, username, user_password, user_email, user_lang,  user_regdate FROM '.$user_prefix."_users WHERE `user_id`>'1'";
	$result=$db->sql_query($query);
	$numrows = $db->sql_numrows($result);
	
	$outputtext .="Number of PhpNuke User to export in G2: ".$numrows."<br/><br/>";
	
	for($i = 0;$i<$numrows;$i++)
	{
		$sqluserdata		= $db->sql_fetchrow($result);
		$nukeuser_id 		= $sqluserdata['user_id'];
		$nukeuser_name		= $sqluserdata['name'];
		$nukeuser_cryptpass	= $sqluserdata['user_password'];
		$nukeuser_uname		= $sqluserdata['username'];
		$nukeuser_email		= $sqluserdata['user_email'];
		$nukeuser_lang		= $sqluserdata['user_lang'];
		$g2nukeuser_lang 	= $Phpnuke2G2Lang[$nukeuser_lang];
		$nukeuser_regdate	= $sqluserdata['user_regdate'];
		
		list( $regmonth, $regday, $regyear ) = split( " ", $nukeuser_regdate );
		$regphpusertimestamp = mktime( 0, 0, 0, $regmonth, $regday, $regyear );
		
		// TODO: if the map exists, just update the user data
		if (isset ($mapsbyexternalid[$nukeuser_id])) 
		{
			$outputtext .= $nukeuser_uname.' (this user already exists in g2)<br/>';
		}
		else
		{
			// Get Arguments for the new user:
			$args['fullname']  	=	$nukeuser_name;
			$args['name']		=	$nukeuser_uname;
			$args['username'] 	= 	$nukeuser_uname;
			$args['hashedpassword'] =	$nukeuser_cryptpass; 
			$args['hashmethod'] = 	'md5';
			$args['email'] 		=	$nukeuser_email;
			$args['language']	=	$g2nukeuser_lang;
			$args['creationtimestamp']	=	$regphpusertimestamp;

			$ret = GalleryEmbed :: createUser($nukeuser_id, $args);
			if (!$ret->isSuccess()) 
			{
				g2_message('Failed to create G2 user with extId ['.$nukeuser_id.']. Here is the error message from G2: <br />'.$ret->getAsHtml());
				return false;
			}
			
			if (!g2addexternalMapEntry($nukeuser_uname, $nukeuser_id, 0)) 
			{
     			return false;
   			}
   			else
   			{
   				$outputtext .= $nukeuser_uname.' (added to g2 users)<br/>';
   			} 			
		}
	}
	
	g2_message($outputtext );
	return false;

	return true;
}

/*********************************************************/
/* Main Function                                         */
/*********************************************************/

function SaveG2Config($var) {
	if (file_exists("modules/".MOD_NAME."/gallery2.cfg")) {
		if (!is_writable("modules/".MOD_NAME."/gallery2.cfg")) {
			g2_message("<b>"._G2_ERROR."</b>: gallery2.cfg "._NOTWRITABLE);
		}
	}
	elseif (!is_writable("modules/".MOD_NAME."/")) {
		g2_message("<b>"._G2_ERROR."</b>: modules/gallery2/ "._NOTWRITABLE);
	}
	include ("modules/".MOD_NAME."/gallery2.cfg");

	extract($var);

	if (!$g2embedparams) {
		$g2embedparams = array ();
	}
	if (!$g2mainparams) {
		$g2mainparams = array ();
	}

	$content = "<?\n".'$g2embedparams = '.var_export($g2embedparams, TRUE).";\n".'$g2mainparams = '.var_export($g2mainparams, TRUE).";\n".'$g2configurationdone = "true"';

	$content .= "?>";

	$handle = fopen("modules/".MOD_NAME."/gallery2.cfg", "w");
	fwrite($handle, $content);
	fclose($handle);

}

/*********************************************************/
/* Display Main Admin Page                               */
/*********************************************************/

function DisplayMainPage() {
	global $admin, $bgcolor2, $prefix, $db, $currentlang, $multilingual, $admin_file, $module_name;
	include ("header.php");
	OpenTable();
	echo "<br><center><a href=\"admin.php?op=gallery2\">
							<img alt='Gallery::your photos on your website' src='modules/$module_name/images/g2Logo.gif' border=0></a><H3>Gallery2 Module Administration</H3></center>";
	CloseTable();
	echo "<br/>";

	// display embed settings

	include ("modules/gallery2/gallery2.cfg");

	$path_found = false;

	if (file_exists($g2embedparams[embedphpfile])) {
		$path_found = true;
	}

	// --------------  embed settings

	OpenTable();
	echo "<center><font class=\"option\"><b>Gallery2 Embeding Settings</b></font></center><br/>";
	echo "<form action=\"admin.php\" method=\"post\">"."<table border=\"0\">"."<tr><td>"._PHPEMBEDFILE.":</td>"."<td colspan=\"3\"><input type=\"text\" name=\"embedphpfile\" size=\"60\" value=\"".$g2embedparams[embedphpfile]."\" maxlength=\"90\"> <font class=\"tiny\"></font></td></tr>"."<tr><td>"._EMBEDURI.":</td>"."<td colspan=\"3\"><input type=\"text\" name=\"embedUri\" size=\"60\" value=\"".$g2embedparams[embedUri]."\" maxlength=\"90\"> <font class=\"tiny\"></font></td></tr>"."<tr><td>"._RELATIVEG2PATH.":</td>"."<td colspan=\"3\"><input type=\"text\" name=\"relativeG2Path\" size=\"60\" value=\"".$g2embedparams[relativeG2Path]."\" maxlength=\"90\"> <font class=\"tiny\"></font></td></tr>"."<tr><td>"._LOGINREDIRECT.":</td>"."<td colspan=\"3\"><input type=\"text\" name=\"loginRedirect\" size=\"60\" value=\"".$g2embedparams[loginRedirect]."\" maxlength=\"90\"> <font class=\"tiny\"></font></td></tr>"."<tr><td>"._ACTIVEUSERID.":</td>"."<td colspan=\"3\"><input type=\"text\" name=\"activeUserId\" size=\"60\" value=\"".$g2embedparams[activeUserId]."\" maxlength=\"90\"> <font class=\"tiny\"></font></td></tr>";

	if ($path_found == false) {
		echo "<tr><td colspan=\"2\"><align=center><br/><center><b>"._G2_ERROR." : "._PHPEMBEDFILE."</b><br/>"._PHPEMBEDFILE_ERROR."</center></td></tr>";
	}
	echo "<tr><td>&nbsp;</td></tr>"."<input type=\"hidden\" name=\"op\" value=\"gallery2_update_embed\">"."<tr><td><input type=\"submit\" value=\""._UPDATEEMBEDSETTINGSG2."\"></td></tr>"."</table></form>";
	CloseTable();

	// --------------  main settings

	OpenTable();
	echo "<center><font class=\"option\"><b>Gallery2 Main Settings</b></font></center><br/>";
	echo "<form action=\"admin.php\" method=\"post\">"."<table border=\"0\">"."<td><input type=\"checkbox\" name=\"showsidebar\" value=\"true\"";
	if ($g2mainparams[showSidebar] == "true") {
		echo "checked=\"true\"";
	}
	echo ">"._SHOWSIDEBAR."</td>";
	echo "<tr><td>&nbsp;</td></tr>"."<input type=\"hidden\" name=\"op\" value=\"gallery2_update_main\">"."<tr><td><input type=\"submit\" value=\""._UPDATEMAINSETTINGSG2."\"></td></tr>"."</table></form>";
	CloseTable();

	// -------------- group settings

	OpenTable();
	echo "<center><font class=\"option\"><b>Export Users to Gallery2</b></font></center><br/>";
	echo "<form action=\"admin.php\" method=\"post\">"."<table border=\"0\">";
	echo "<input type=\"hidden\" name=\"op\" value=\"gallery2_user_export\">"."<tr><td><input type=\"submit\" value=\""._G2USEREXPORT."\"></td></tr>"."</table></form>";
	CloseTable();

	include ("footer.php");

}

/*********************************************************/
/* Update Embed Settings                                  */
/*********************************************************/

function form_g2UpdateEmbedSettings() {
	$g2embedparams = array ();

	$g2embedparams[embedphpfile] = $_POST['embedphpfile'];
	$g2embedparams[embedUri] = $_POST['embedUri'];
	$g2embedparams[relativeG2Path] = $_POST['relativeG2Path'];
	$g2embedparams[loginRedirect] = $_POST['loginRedirect'];
	$g2embedparams[activeUserId] = $_POST['activeUserId'];

	//$g2mainparams = array();
	//$g2mainparams[showSidebar] = 'false';
	//$vars = compact("g2embedparams","g2mainparams");

	$vars = compact("g2embedparams");

	SaveG2Config($vars);

	g2_message(_CFG_UPDATED);
}

/*********************************************************/
/* Update Main Settings                                  */
/*********************************************************/

function form_g2UpdateMainSettings() {
	$g2mainparams = array ();

	$g2mainparams[showSidebar] = $_POST['showsidebar'];

	$vars = compact("g2mainparams");
	SaveG2Config($vars);

	g2_message(_CFG_UPDATED);
}

/*********************************************************/
/* Export phpNuke users to Gallery2                      */
/*********************************************************/

function form_g2UserExportSettings() {
	include ("modules/gallery2/gallery2.cfg");

	if ($g2configurationdone != "true") {
		g2_message(_G2_CONFIGURATION_NOT_DONE);
		return;
	}

	if (!g2_phpnukeTog2UserExport()) {
		g2_message(_USER_EXPORT_FAILED);
		return;
	}

	g2_message(_USER_EXPORT_UPDATED);
}

/// ------------------------------------------------------------------------------------------
/// ---------------------------------- Admin Page Start Here ---------------------------------
/// ------------------------------------------------------------------------------------------

// ---- TODO: Allow G2 control Admin panel access on a per admin basis (from database)

$aid = substr("$aid", 0, 25);
$row = $db->sql_fetchrow($db->sql_query("SELECT radminsuper FROM ".$prefix."_authors WHERE aid='$aid'"));
if ($row['radminsuper'] == 1) {

	switch ($op) {
		case "gallery2" :
			DisplayMainPage();
			break;

		case "gallery2_update_embed" :
			form_g2UpdateEmbedSettings();
			break;

		case "gallery2_update_main" :
			form_g2UpdateMainSettings();
			break;

		case "gallery2_user_export" :
			form_g2UserExportSettings();
			break;
	}

} else {
	include ("header.php");

	OpenTable();
	echo "<center><b>"._ERROR."</b><br><br>You do not have administration permission for module \"$module_name\"</center>";
	CloseTable();
	include ("footer.php");
}
?>



