<?php
/* This file is automatically generated from Maps.xml by lib/tools/bin/generate-maps.php */
{foreach name=outer from=$maps key=mapName item=map}
$mapInfo['{$mapName}'] = array({foreach name=inner from=$map item=member}'{$member.name}'=>array('type'=>{$member.type},'size'=>{$member.size}{if !empty($member.notNull)},'notNull'=>true{/if}{if !empty($member.notNullEmptyAllowed)},'notNullEmptyAllowed'=>true{/if}){if !$smarty.foreach.inner.last},{/if}{/foreach});
{/foreach}
?>

