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

//-- modify page title here as the title tag is in global template ---
$GLO['pagetitle'] = $GLO['gallery']['title'] . " :: " .
                    $GLO['album']['title']; 

//-------------------------------------------------------------------
//-- Finally do the main template ---

$xtpl = getLayoutXTemplate("xtpl/view_album.xtpl");
$xtpl->assign('GLO', $GLO);

$xtpl->assign('blockDivider', $xtpl_blocks->text("divider"));
$xtpl->assign('blockNavigation', $xtpl_blocks->text("navigator"));
$xtpl->assign('blockTools', $xtpl_blocks->text("toolbox"));
$xtpl->assign('blockBreadcrumb', $xtpl_blocks->text("breadcrumb"));

//-- construct the items section ---
$index=0;
$itemCount = count($GLO['album']['items']);

//-- build the item grid ---
$xtpl->assign('thumbCellSize', $GLO['album']['thumbnailSize'] + (2 * $GLO['album']['borderSize']));
for ($row=1; $row <= $GLO['album']['rows']; $row++) {
	for ($col=1; $col <= $GLO['album']['cols']; $col++) {
		$index++;
		$item = $GLO['album']['items'][$index];

		if ($item) {
			//-- blank out the click count text if we're not supposed to see it ---
			if (!$GLO['album']['displayClicks']) {
				$item['clickCountText'] = "";
			}
			if ($item['commentCount'] > 0) {
				$item['commentCountText'] = "*";
				$anItemHasAComment = true;
			}
			if ($item['hidden']) {
				$item['hiddenText'] = "[HIDDEN]";
			}
			$xtpl->assign('item', $item);
	
			//-- dynamically decide which cell block to use ---
			$cellTypeBlock = "view_album.items.row.cell." . $item['type'];	
		}
		else {
			$cellTypeBlock = "view_album.items.row.cell.blank";
		}
		$xtpl->parse($cellTypeBlock);

		//-- do the command row --
		if ($item && $item['commandCount']) {
			$xtpl->parse("view_album.items.row.cell.commands");
		}

	
		//-- finish up the item cell ---
		$xtpl->parse("view_album.items.row.cell");
	}

	//-- finish up the item row ---
	$xtpl->parse("view_album.items.row");

	//-- if the rest of the rows are gonna be blank, don't do 'em ---
	if ($index > $itemCount) {
		break;
	}
}

//-- finish up the item grid block ---
$xtpl->parse("view_album.items");

if ($anItemHasAComment) {
	$xtpl->assign('footnoteComment', "* Comments available for this item.");
}

//-- last but not least ---
$xtpl->parse("view_album");
$xtpl->out("view_album");

?>

