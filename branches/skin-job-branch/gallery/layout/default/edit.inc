<?

//-------------------------------------------------------------------
//-- First assemble the pieces and dump them into the GLO structure


//-------------------------------------------------------------------
//-- Finally do the main template ---
//--   Note: only parse the header/footer if we are not embedded.

$xtpl = getLayoutXTemplate("xtpl/edit.xtpl");
$xtpl->assign('GLO', $GLO);


$xtpl->parse("edit");
$xtpl->out("edit");

?>

