{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !empty($theme.imageViews)}
  {assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

{* Evaluate early to modify $theme.itemLinks.  TODO Find a cleaner way to do this *}
{capture name="imageView"}
  {if empty($theme.imageViews)}
    {g->text text="There is nothing to view for this item"}
  {else}
    {capture name="fallback"}
      <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`" forceFullUrl=true forceSessionId=true}"> {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1} </a>
    {/capture}

    {if !$image.viewInline}
      {$smarty.capture.fallback}
    {else}
      {g->container type="imageframe.ImageFrame"
	  frame=$theme.photoFrame
	  width=$image.width
	  height=$image.height}
	{if count($theme.imageViews) > 1}
	  {if $theme.imageViewsIndex == 1 && $theme.imageViews|@count == 2}
	    <a href="{g->url params=$theme.pageUrl arg1="itemId=`$theme.item.id`"}">
	  {else}
	    {assign var="imageViewsLink" value=$theme.imageViewsIndex+1}
	    {if $imageViewsLink == $theme.imageViews|@count}
	      {assign var="imageViewsLink" value=$theme.imageViewsIndex-1}
	    {/if}
	    <a href="{g->url params=$theme.pageUrl arg1="itemId=`$theme.item.id`" arg2="imageViewsIndex=`$imageViewsLink`"}">
	  {/if}
	{/if}
	{g->block type="core.RotatePhotoBlock"
	  RotatePhotoBlock.item=$theme.item
	  RotatePhotoBlock.image=$image
	  RotatePhotoBlock.fallback=$smarty.capture.fallback} {$smarty.RotatePhotoBlock.status}
	{if count($theme.imageViews) > 1}
	  </a>
	{/if}
      {/g->container}

      <span style="display: none"> {$smarty.RotatePhotoBlock.form} </span>
    {/if}
  {/if}
{/capture}
{merge theme.itemLinks=$smarty.RotatePhotoBlock.links}

<table width="100%" cellspacing="0" cellpadding="0"><tr valign="top">
  {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {g->theme include="sidebar.tpl"}
    </td>
  {/if}
  <td>
    <div id="gsContent">
      <div class="gbBlock gcBackground1">
	<table width="100%"><tr>
	  <td>
	    {g->container type="core.EditItemBlock"
	        templateId="title"
		EditItemBlock.item=$theme.item
		EditItemBlock.property="title"}
	      <h2> {$EditItemBlock.value} </h2>
	    {/g->container}

	    {g->container type="core.EditItemBlock"
	        templateId="description"
		EditItemBlock.item=$theme.item
		EditItemBlock.property="description"}
	      <p class="giDescription">
		{$EditItemBlock.value}
	      </p>
	    {/g->container}
	  </td><td style="width: 30%">
	    {g->block type="core.ItemInfo"
	      class="giInfo"
	      item=$theme.item
	      showDate=true
	      showOwner=true}
	    {g->block type="core.PhotoSizes" class="giInfo"}
	  </td>
	</tr></table>
      </div>

      {if !empty($theme.navigator)}
	<div class="gbBlock gcBackground2 gbNavigator">
	  {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
	</div>
      {/if}

      <div id="gsImageView" class="gbBlock">
        {$smarty.capture.imageView}
      </div>

      {if $theme.pageUrl.view != 'core.ShowItem' && $theme.params.dynamicLinks == 'jumplink'}
	<div class="gbBlock">
	  <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$theme.item.id`"}"> {g->text text="View in original album"} </a>
      </div>
      {/if}

      {* Download link for item in original format *}
      {if !empty($theme.sourceImage) && $theme.sourceImage.mimeType != $theme.item.mimeType}
	<div class="gbBlock">
	  <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}"> {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1} </a>
	</div>
      {/if}

      {* Show any other photo blocks (comments, exif etc.) *}
      {foreach from=$theme.params.photoBlocks item=block}
	{g->block type=$block.0 params=$block.1}
      {/foreach}

      {if !empty($theme.navigator)}
	<div class="gbBlock gcBackground2 gbNavigator">
	  {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
	</div>
      {/if}

      {g->block type="core.GuestPreview" class="gbBlock"}

      {* Our emergency edit link, if the user removes all blocks containing edit links *}
      {g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="sidebar,photo"}
    </div>
  </td>
</tr></table>
