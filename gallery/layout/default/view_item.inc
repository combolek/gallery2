<?

//-------------------------------------------------------------------
//-- First assemble the pieces and dump them into the GLO structure

//-- the blocks ---
$xtpl_blocks = getLayoutXTemplate("blocks.xtpl");
$xtpl_blocks->assign('GLO', $GLO);

//-- This divider goes between any of the blocks ---
$xtpl_blocks->parse("divider");

//-- The navigator block ---
if ($GLO['navigator']['pageNumber'] > 1) {
	$xtpl_blocks->assign('page', $GLO['navigator']['pages'][1]);
	$xtpl_blocks->parse("navigator.first");
	$xtpl_blocks->assign('page', $GLO['navigator']['pages'][$GLO['navigator']['pageNumber']-1]);
	$xtpl_blocks->parse("navigator.previous");
} else {
	$xtpl_blocks->parse("navigator.no_first");
	$xtpl_blocks->parse("navigator.no_previous");
}
$xtpl_blocks->parse("navigator.pages");
if ($GLO['navigator']['pageNumber'] < $GLO['navigator']['pageCount']) {
	$xtpl_blocks->assign('page', $GLO['navigator']['pages'][$GLO['navigator']['pageNumber']+1]);
	$xtpl_blocks->parse("navigator.next");
	$xtpl_blocks->assign('page', $GLO['navigator']['pages'][$GLO['navigator']['pageCount']]);
	$xtpl_blocks->parse("navigator.last");
} else {
	$xtpl_blocks->parse("navigator.no_next");
	$xtpl_blocks->parse("navigator.no_last");
}
$xtpl_blocks->parse("navigator");


//$xtpl_blocks->parse("toolbox.left");
if ($GLO['toolbox']['toolCount'] > 0) {
	for ($i=1; $i <=  $GLO['toolbox']['toolCount']; $i++) {
		$xtpl_blocks->assign("tool", $GLO['toolbox']['tools'][$i]);
		$xtpl_blocks->parse("toolbox.tools.tool");
	}
	$xtpl_blocks->parse("toolbox.tools");
}
$xtpl_blocks->parse("toolbox");

$xtpl_blocks->parse("breadcrumb");
$GLO['divider'] = $xtpl_blocks->text("divider");
$GLO['blockNavigation'] = $xtpl_blocks->text("navigator");
$GLO['blockTools'] = $xtpl_blocks->text("toolbox");
$GLO['blockBreadcrumb'] = $xtpl_blocks->text("breadcrumb");

//-------------------------------------------------------------------
//-- The gallerywide headers and footers ---

//-- modify page title here as the title tag is in global template ---
$GLO['pagetitle'] = $GLO['gallery']['title'] . " :: " .
                    $GLO['album']['title'] . " :: " . 
                    $GLO['item']['id'];

$xtpl_hf = getLayoutXTemplate("header_footer.xtpl");
$xtpl_hf->assign('GLO', $GLO);

if (!$GALLERY_EMBEDDED_INSIDE) {
    $xtpl_hf->parse("header.not_embedded_inside");
    $xtpl_hf->parse("footer.not_embedded_inside");
}
$xtpl_hf->parse("header");
$xtpl_hf->parse("footer");
$GLO['header'] = $xtpl_hf->text("header");
$GLO['footer'] = $xtpl_hf->text("footer");
//-------------------------------------------------------------------
//-- Finally do the main template ---
//--   Note: only parse the header/footer if we are not embedded.

$xtpl = getLayoutXTemplate("view_item.xtpl");
$xtpl->assign('GLO', $GLO);
$xtpl->parse("view_photo");
$xtpl->out("view_photo");

?>

