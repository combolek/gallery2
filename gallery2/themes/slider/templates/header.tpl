{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<script type="text/javascript">
{if $theme.imageCount==1}
var data_iw = new Array(1); data_iw[0] = {$theme.imageWidths};
var data_ih = new Array(1); data_ih[0] = {$theme.imageHeights};
{else}
var data_iw = new Array({$theme.imageWidths}),
    data_ih = new Array({$theme.imageHeights});
{/if}
var data_count = data_iw.length, data_name = '{$theme.item.id}',
    data_view = {$theme.viewIndex|default:0},
    image_map = '{if $theme.params.enableImageMap} usemap="#prevnext"{/if}';
</script>
<script type="text/javascript" src="{$theme.themeUrl}/slider.js"></script>
