{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to pathbar.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div class="gbBreadCrumb">
  {section name=parent loop=$layout.parents}
  <span>
    {if ! $smarty.section.parent.last}
    <a href="{g->url arg1="view=core:ShowItem" arg2="itemId=`$layout.parents[parent].id`" arg3="highlightId=`$layout.parents[parent.index_next].id`"}">
      {$layout.parents[parent].title|default:$layout.parents[parent].pathComponent|markup}
    </a>
    {else}
    <a href="{g->url arg1="view=core:ShowItem" arg2="itemId=`$layout.parents[parent].id`" arg3="highlightId=`$layout.item.id`"}">
      {$layout.parents[parent].title|default:$layout.parents[parent].pathComponent|markup}
    </a>
    {/if}
  </span>
  {/section}

  <span>
    {$layout.item.title|default:$layout.item.pathComponent|markup}
  </span>
</div>
