<?php
if (!isset ($included)) {
	die ('Must be included');
}

$modPage = 'modules.php?op=modload&name=GalleryDocs&file=index&action=manage-note';

if (!$noteadmin) {
	throwError ('You must be a note admin to do this');
}

$action = $_GET['do'] ? $_GET['do'] : $_POST['do'];

switch ($action) {
	case 'edit':
		handle_edit();
		break;
	case 'edit-post':
		handle_edit_post();
		break;		
	case 'delete':
		handle_delete();
		break;
	default:
		throwError ('Invalid Action');
		break;
}

function handle_edit () {
	global $modPage;

	$note = getNoteByID ($_GET['id']);
	
	if (!$note) {
		throwError ('No note with that ID');
	}
	
	printNotesForm ($modPage, $note['id'], $note['sect'], $note['user'], $note['note'], array ('do' => 'edit-post'));
}

function handle_edit_post () {
	if (editNote ($_POST['id'], $_POST['user'], $_POST['note'])) {
		print 'Note successfully edited.  ';
		print '<a href="modules.php?op=modload&name=GalleryDocs&file=index&page='.$_POST['sect'].'">Back to where you came from</a>';
	} else {
		throwError ('Could not edit note.  Probably means this note doesn\'t exist');
	}
}

function handle_delete () {
	if (!$note = getNoteByID ($_GET['id'])) {
		throwError ('Could not fetch note');
	}
	
	if (removeNote ($_GET['id'])) {
		print 'Note sucessfully deleted.  ';
		print '<a href="modules.php?op=modload&name=GalleryDocs&file=index&page='.$note['sect'].'">Back to where you came from</a>';
	} else {
		throwError ('Could not remove note.  Probably means this note doesn\'t exist');
	}
}
?>
