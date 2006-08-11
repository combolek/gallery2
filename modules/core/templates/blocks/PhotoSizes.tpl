{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="{$class}">
  {if $theme.imageViews|@count > 1}
    {g->text text="Size: "} <select onchange="var value = this.value; this.options[{$theme.imageViewsIndex}].selected = true; eval(value)">

      {assign imageViewIndex=0}
      {foreach from=$theme.imageViews item="imageView"}
	<option value="window.location = '{g->url params=$theme.pageUrl arg1="itemId=`$theme.item.id`" arg2="imageViewsIndex=$imageViewIndex"}'"{if $imageViewIndex == $theme.imageViewsIndex} selected="selected"{/if}>
	  {if empty($imageView.width)}
	    {if !empty($imageView.isSource)}
	      {g->text text="Source"}
	    {else}
	      {g->text text="Unknown"}
	    {/if}
	  {else}
	    {g->text text="%dx%d" arg1=$imageView.width arg2=$imageView.height}
	  {/if}
	</option>
	{assign imageViewIndex=$imageViewIndex+1}
      {/foreach}
    </select>
    <br/>
  {/if}

  {if !empty($theme.sourceImage)}
    {capture name="fullSize"}
      {if empty($theme.sourceImage.width)}
	{$theme.sourceImage.itemTypeName.0}
      {else}
	{g->text text="%dx%d" arg1=$theme.sourceImage.width arg2=$theme.sourceImage.height}
      {/if}
    {/capture}

    {g->text text="Full size: "} {if $theme.imageViews|@count > 1}
      <a href="{g->url params=$theme.pageUrl arg1="itemId=`$theme.item.id`" arg2="imageViewsIndex=`$theme.sourceImageViewIndex`"}"> {$smarty.capture.fullSize} </a>
     {else}
       {$smarty.capture.fullSize}
     {/if}
   {/if}
</div>
