{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<title>
  {$layout.item.title|default:$layout.item.pathComponent|markup:stripBbcodeAndHtml}
</title>
<link rel="stylesheet" type="text/css" href="{$layout.layoutUrl}/templates/hybrid.css"/>
<script type="text/javascript">
{if $layout.imageCount==1}
var data_iw = new Array(1); data_iw[0] = {$layout.imageWidths};
var data_ih = new Array(1); data_ih[0] = {$layout.imageHeights};
{else}
var data_iw = new Array({$layout.imageWidths});
var data_ih = new Array({$layout.imageHeights});
{/if}
var data_count = data_iw.length, data_name = '{$layout.item.id}';
var data_view = {$layout.viewIndex|default:-1};
var app_path = '{$layout.cookiePath}';
</script>
<script type="text/javascript" src="{$layout.layoutUrl}/templates/hybrid.js"></script>
