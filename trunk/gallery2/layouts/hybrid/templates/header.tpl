<title>{$layout.title|markup}</title>
<link rel="stylesheet" type="text/css" href="{$layout.layoutUrl}/templates/hybrid.css">
{g->style}
<script type="text/javascript">
var data_iw = new Array({$layout.imageWidths});
var data_ih = new Array({$layout.imageHeights});
var data_count = data_iw.length, data_name = '{$layout.item.id}';
var data_view = {$layout.viewIndex|default:-1};
var app_path = '{$layout.cookiePath}';
</script>
<script type="text/javascript" src="{$layout.layoutUrl}/templates/hybrid.js"></script>
