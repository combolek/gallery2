<?

//-------------------------------------------------------------------
//-- First assemble the pieces and dump them into the GLO structure


//-------------------------------------------------------------------
//-- Finally do the main template ---
//--   Note: only parse the header/footer if we are not embedded.

$xtpl = getLayoutXTemplate("xtpl/edit.xtpl");
$xtpl->assign('GLO', $GLO);

foreach ($GLO['commands'] as $command) {
	$xtpl->assign('command', $command);
	if ($command['selected'] == 1) {
		$xtpl->parse('edit.tab.selected');
	} else {
		$xtpl->parse('edit.tab.not_selected');
	}
	$xtpl->parse("edit.tab");
}

$xtpl->parse("edit");
$xtpl->out("edit");

?>

