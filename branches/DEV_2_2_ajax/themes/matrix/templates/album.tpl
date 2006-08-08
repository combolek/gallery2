{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<table width="100%" cellspacing="0" cellpadding="0"><tr valign="top">
  {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {g->theme include="sidebar.tpl"}
    </td>
  {/if}
  <td>
    <div id="gsContent" class="gcBorder1">
      <div class="gbBlock gcBackground1">
	<table style="width: 100%"><tr>
	  <td>
	    {g->container type="core.EditItemBlock"
		templateId="title-`$theme.item.id`"
		EditItemBlock.item=$theme.item
		EditItemBlock.property="title"}
	      <h2> {$EditItemBlock.value} {$EditItemBlock.status} </h2>
	    {/g->container}

	    {g->container type="core.EditItemBlock"
		templateId="title-`$theme.item.id`"
		EditItemBlock.item=$theme.item
		EditItemBlock.property="description"}
	      <p class="giDescription">
		{$EditItemBlock.value} {$EditItemBlock.status}
	      </p>
	    {/g->container}
	  </td>
	  <td style="width: 30%">
	    {g->block type="core.ItemInfo" item=$theme.item showDate=true showSize=true showOwner=true class="giInfo"}
	  </td>
	</tr></table>
      </div>

      {if !empty($theme.navigator)}
	<div class="gbBlock gcBackground2 gbNavigator">
	  {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
	</div>
      {/if}

      {if !count($theme.children)}
	<div class="gbBlock giDescription gbEmptyAlbum">
	  <h3 class="emptyAlbum">
	    {g->text text="This album is empty"}
	    {if $theme.permissions.core_addDataItem}
	      <br/>
	      <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
	    {/if}
	  </h3>
	</div>
      {else}
	{assign childrenInColumnCount=0}
	<div class="gbBlock">
	  <table id="gsThumbMatrix"><tr valign="top">
	    {foreach from=$theme.children item=child}

	      {* Move to a new row *}
	      {if $childrenInColumnCount == $theme.params.columns}
		</tr><tr valign="top">
		{assign childrenInColumnCount=0}
	      {/if}

	      {assign childrenInColumnCount=`$childrenInColumnCount+1`}
	      <td class="{if $child.canContainChildren}giAlbumCell gcBackground1{else}giItemCell{/if}" style="width: {$theme.columnWidthPct}%">
		{if $child.canContainChildren || $child.entityType == 'GalleryLinkItem'}
		  {assign frameType="albumFrame"}
		  {capture assign="linkUrl"}{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}{/capture}
		{else}
		  {assign frameType="itemFrame"}
		  {capture assign="linkUrl"}{g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}{/capture}
		{/if}
		<div>
		  {if empty($child.thumbnail)}
		    <a href="{$linkUrl}" class="giMissingThumbnail"> {g->text text="no thumbnail"} </a>
		  {else}
		    {g->container type="imageframe.ImageFrame"
			frame=$theme.params.$frameType
			width=$child.thumbnail.width
			height=$child.thumbnail.height}
		      <a href="{$linkUrl}"> {g->block type="core.RotatePhotoBlock"
		        templateId=$child.id
			RotatePhotoBlock.item=$child
			RotatePhotoBlock.image=$child.thumbnail
			RotatePhotoBlock.class="giThumbnail"} </a>
		    {/g->container}

		    <span style="display: none"> {$smarty.RotatePhotoBlock.form} </span>
		    {merge child.itemLinks=$smarty.RotatePhotoBlock.links}
		  {/if}
		</div>

		{g->block type="core.ItemLinks" item=$child links=$child.itemLinks}

		{g->container type="core.EditItemBlock"
		    templateId="title-`$child.id`"
		    EditItemBlock.item=$child
		    EditItemBlock.property="title"}
		  <p class="giTitle">
		    {if $child.canContainChildren}
		      {g->text text="Album: %s" arg1=$EditItemBlock.value}
		    {else}
		      {$EditItemBlock.value}
		    {/if}
		    {$EditItemBlock.status}
		  </p>
		{/g->container}

		{g->container type="core.EditItemBlock"
		    templateId="summary-`$child.id`"
		    EditItemBlock.item=$child
		    EditItemBlock.property="summary"}
		  <p class="giDescription">
		    {$EditItemBlock.value} {$EditItemBlock.status}
		  </p>
		{/g->container}

		{g->block type="core.ItemInfo"
		  class="giInfo"
		  item=$child
		  showDate=true
		  showOwner=`($child.canContainChildren && $theme.params.showAlbumOwner) || (!$child.canContainChildren && $theme.params.showImageOwner)`
		  showSize=true
		  showViewCount=true
		  showSummaries=true}
	      </td>
	    {/foreach}

	    {* Flush the rest of the row with empty cells *}
	    {section name="flush" start=$childrenInColumnCount loop=$theme.params.columns}
	      <td>&nbsp;</td>
	    {/section}
	  </tr></table>
	</div>
      {/if}

      {if !empty($theme.navigator)}
	<div class="gbBlock gcBackground2 gbNavigator">
	  {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
	</div>
      {/if}

      {if !empty($theme.jumpRange)}
	<div id="gsPages" class="gbBlock gcBackground1">
	  {g->block type="core.Pager"}
	</div>
      {/if}

      {g->block type="core.GuestPreview" class="gbBlock"}

      {* Our emergency edit link, if the user removes all blocks containing edit links *}
      {g->block type="core.EmergencyEditItemLink"
	class="gbBlock"
	checkSidebarBlocks=true
	checkAlbumBlocks=true}

      {* Show any other album blocks (comments, etc) *}
      {foreach from=$theme.params.albumBlocks item=block}
	{g->block type=$block.0 params=$block.1}
      {/foreach}
    </div>
  </td>
</tr></table>
