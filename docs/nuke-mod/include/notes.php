<?php
if (!isset ($included)) {
	die ('Must be included');
}

require_once ('db.php');

function getNotes ($section) {
        $result = dbQuery ('SELECT * FROM doc_notes WHERE sect="??"', array ($section));
        
        $arr = array ();
        while ($row = mysql_fetch_array ($result, MYSQL_ASSOC)) {
                array_push ($arr, $row);
        }
        
        return $arr;
}

function printNotesHeader () {
        global $data, $navigation;
?>
<table bgcolor="#dadada" border="0" bordercolor="#cccccc" width="100%" cellspacing="4" cellspacing="0">
 <tr>
  <td colspan="2">
  <table bgcolor="#cccccc" width="100%">
   <tr>
    <td width="50%">
     User Contributed Notes
    </td>
    <td width="50%" align="right">
     <a href="modules.php?op=modload&amp;name=GalleryDocs&amp;file=index&amp;action=add-note&amp;sect=<?php echo $navigation['this'];?>" style="color: #000000">[add a note]</a>
    </td>
   </tr>
  </table>
  </td>
 </tr>
 <tr>
  <td colspan="2">
   <b>
    <?php echo ($data['parent_title'] ? $data['parent_title'].' :: ' : '').$data['title'];?>
   </b>
  </td>
 </tr>
<?php
}

function printNotesFooter () {
?>
</table>
<?php
}

function printNotes () {
	global $navigation, $noteadmin;
	
	$notes = getNotes ($navigation['this']);
	
	foreach ($notes as $note) {
?>
<tr>
 <td colspan="2" width="100%">
 <table bgcolor="#bbbbbb" width="100%">
  <tr>
   <td>
     <b>
      <?php echo spamProtectEmail ($note['user']);?>
     </b>
     <br/>
      <?php echo gmdate ('M d, Y H:i:s A \G\M\T', $note['ts']);?>
   </td>
   <td align="right" valign="top">
<?php
if ($noteadmin) {
?>
   <small>
    <a href="modules.php?op=modload&name=GalleryDocs&file=index&action=manage-note&do=edit&id=<?php echo $note['id'];?>">[Edit]</a> |
    <a href="modules.php?op=modload&name=GalleryDocs&file=index&action=manage-note&do=delete&id=<?php echo $note['id'];?>">[Delete]</a>
   </small>
<?php
}
?>
   </td>
  </tr>
 </table>
 </td>
</tr>
<tr>
 <td colspan="2">
  <code>
   <?php echo nl2br ($note['note']);?>
  </code>
 </td>
</tr>
<!-- TODO: Admin stuff -->
<?php
	}
}

function addNote ($sect, $user, $note, $status = '') {
	$note = htmlentities ($note); //no html allowed

	dbQuery ('INSERT into doc_notes SET sect="??", user="??", note="??", status="??", ts="??"', array ($sect, $user, $note, $status, time()));
	
	//TODO: Send to mailing list
}

function removeNote ($id) {
	dbQuery ('DELETE from doc_notes WHERE id="??"', array ($id));

	//TODO: Send to mailing list
	
	return (mysql_affected_rows () ? true : false);
}

function editNote ($id, $user, $note, $status = '') {
	$note = htmlentities ($note); //no html again

	dbQuery ('UPDATE doc_notes SET user="??", note="??", status="??" WHERE id="??"', array ($user, $note, $status, $id));
	
	//TODO: Send to mailing list
	
	return (mysql_affected_rows () ? true : false);	
}

function getNoteByID ($id) {
	$result = dbQuery ('SELECT * from doc_notes WHERE id="??"', array ($id));
	
	return ( (mysql_num_rows ($result)) ? (mysql_fetch_array ($result, MYSQL_ASSOC)) : false);
}	
   
function doNotes () {
        printNotesHeader();
	printNotes();
	printNotesFooter();
}

function printNotesForm ($action, $id = false, $sect = false, $user = false, $note = false, $extraFields = false) {
	if (!$id) {
?>
<font color="#ff0000"><b>Note: Do <i>not</i> submit support questions here.  Please use the
<a href="http://gallery.sf.net/forums.php">forums</a> for support questions.  Your note will
be deleted if you ask a support question.</b></font>
<?php
	}
?>

<form method="post" action="<?php echo $action;?>">
<?php
if (is_array ($extraFields)) {
	foreach ($extraFields as $key => $value) {
		print "<input type=\"hidden\" name=\"$key\" value=\"$value\">";
	}
}
?>

<input type="hidden" name="id" value="<?php echo $id;?>">
<input type="hidden" name="sect" value="<?php echo $sect;?>">
<input type="hidden" name="action" value="<?php echo ($id ? 'edit' : 'add');?>-note">

<table bgcolor="#cfcfcf">
 <tr>
  <th>
   Email Address<br/>
   (will be spam proofed)
  </th>
  <td>
   <input type="text" name="user" value="<?php echo $user;?>" size="50">
  </td>
 </tr>
 <tr>
  <th>
   Note
  </th>
  <td>
   <textarea name="note" rows="15" cols="60"><?php echo $note;?></textarea>
  </td>
 </tr>
 <tr>
  <td colspan="2">
   <input type="submit" name="submit" value="<?php echo ($id ? "Edit" : "Add");?> Note!">
  </td>
 </tr>
</table>
<?php
}

function spamProtectEmail ($email) {
	$email = str_replace ('@', ' [at] ', $email);
	$email = str_replace ('.', ' [dot] ', $email);
	
	return $email;
}
