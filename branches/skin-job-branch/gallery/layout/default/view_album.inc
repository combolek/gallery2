<?

//-------------------------------------------------------------------
//-- First assemble the pieces and dump them into the GLO structure

//-- the blocks ---
$pageCount = count($GLO['navigator']['pages']);
$GLO['navigator']['pageCount'] = $pageCount;

$xtpl_blocks = getLayoutXTemplate("xtpl/blocks.xtpl");
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
if ($GLO['navigator']['pageNumber'] < $pageCount) {
	$xtpl_blocks->assign('page', $GLO['navigator']['pages'][$GLO['navigator']['pageNumber']+1]);
	$xtpl_blocks->parse("navigator.next");
	$xtpl_blocks->assign('page', $GLO['navigator']['pages'][$pageCount]);
	$xtpl_blocks->parse("navigator.last");
} else {
	$xtpl_blocks->parse("navigator.no_next");
	$xtpl_blocks->parse("navigator.no_last");
}
$xtpl_blocks->parse("navigator");

//-- the breadcrumb block ---
for ($i=0; $i < count($GLO['breadcrumb']['levels']); $i++) {
    $xtpl_blocks->assign('crumb', $GLO['breadcrumb']['levels'][$i]);
	if ($i == count($GLO['breadcrumb']['levels'])) {
		$xtpl_blocks->parse("breadcrumb.last_crumb");
	} else {
		$xtpl_blocks->parse("breadcrumb.crumb");
	}
}
$xtpl_blocks->parse("breadcrumb");


//$xtpl_blocks->parse("toolbox.left");
if (count($GLO['toolbox']['commands']) > 0) {
	for ($i=1; $i <=  count($GLO['toolbox']['commands']); $i++) {
		$xtpl_blocks->assign("command", $GLO['toolbox']['commands'][$i]);
		$xtpl_blocks->parse("toolbox.commands.command");
	}
	$xtpl_blocks->parse("toolbox.commands");
}
$xtpl_blocks->parse("toolbox");

$GLO['divider'] = $xtpl_blocks->text("divider");
$GLO['blockNavigation'] = $xtpl_blocks->text("navigator");
$GLO['blockTools'] = $xtpl_blocks->text("toolbox");
$GLO['blockBreadcrumb'] = $xtpl_blocks->text("breadcrumb");




//-------------------------------------------------------------------
//-- The gallerywide headers and footers ---

//-- modify page title here as the title tag is in global template ---
$GLO['pagetitle'] = $GLO['gallery']['title'] . " :: " .
                    $GLO['album']['title']; 

$xtpl_hf = getLayoutXTemplate("xtpl/header_footer.xtpl");
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

$xtpl = getLayoutXTemplate("xtpl/view_album.xtpl");
$xtpl->assign('GLO', $GLO);

//-- construct the items section ---
$index=0;
$itemCount = count($GLO['album']['items']);

for ($row=1; $row <= $GLO['album']['rows']; $row++) {
	for ($col=1; $col <= $GLO['album']['cols']; $col++) {
		$index++;
		$item = $GLO['album']['items'][$index];

		if ($item['clickCount'] > 0) {
			$item['clickCountText'] = "<br>Viewed ".$item['clickCount']." times";
		}
		if ($item['commentCount'] > 0) {
			$item['commentCountText'] = "*";
			$anItemHasAComment = true;
		}
		if ($item['hidden']) {
			$item['hiddenText'] = "[HIDDEN]";
		}
		$xtpl->assign('item', $item);
		
		switch ($item['type']) {
			case 'album':
				$xtpl->parse("view_album.items.row.album_cell");
				break;
			case 'movie':
				$xtpl->parse("view_album.items.row.movie_cell");
				break;
			case 'photo':
				$xtpl->parse("view_album.items.row.photo_cell");
				break;
			default:
				$xtpl->parse("view_album.items.row.blank_cell");
				break;
		}
	}
	$xtpl->parse("view_album.items.row");

	//-- don't do empty rows ---
	if ($index > $itemCount) {
		break;
	}
}
$xtpl->parse("view_album.items");

if ($anItemHasAComment) {
	$xtpl->assign('footnoteComment', "* Comments available for this item.");
}

//-- last but not least ---
$xtpl->parse("view_album");
$xtpl->out("view_album");

?>

