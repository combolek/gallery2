{* Jump through hoops because "$layout.imageViews.`$layout.imageViewsIndex`" doesn't work *}
{assign var="currentIndex" value=$layout.imageViewsIndex}
{assign var="image" value=$layout.imageViews.$currentIndex}

{gallery->main}
  {gallery->pathbar}
    {foreach from=$layout.parents item=parent}
      {gallery->item}
	{gallery->link url_view='core:ShowItem' url_itemId=$parent.id}
	  {$parent.title|default:$parent.pathComponent}
	{/gallery->link}
      {/gallery->item}
    {/foreach}
    {gallery->item}
      {gallery->link url_view='core:ShowItem' url_itemId=$layout.item.id}
	{$layout.item.title|default:$layout.item.pathComponent}
      {/gallery->link}
    {/gallery->item}
  {/gallery->pathbar}

  {gallery->sidebar side="right"}
    {gallery->component}
      {* Core system content *}
      {gallery->simplebox}
	{gallery->body}
	  {include file=$layout.moduleSystemContentFiles.core l10Domain="module_core"}
	{/gallery->body}
      {/gallery->simplebox}

      {* List of peer items *}

      {* Extra modules system content *}
      {foreach from=$layout.moduleSystemContentFiles key=moduleName item=moduleFile}
	{if ($moduleName != 'core')}
	  {gallery->simplebox}
	    {gallery->body}
	      {include file=$moduleFile l10Domain="module_$moduleName"}
	    {/gallery->body}
	  {/gallery->simplebox}
	{/if}
      {/foreach}
    {/gallery->component}
  {/gallery->sidebar}

  {gallery->component}
    {gallery->bannerbox}
      {gallery->title}
	{$layout.item.title}
      {/gallery->title}
      {gallery->description}
	{$layout.item.summary}
      {/gallery->description}

      {gallery->component}
	{gallery->infobox}
	  {gallery->item}
	    {capture name=creationTimestamp}
	      {gallery->date timestamp=$layout.item.creationTimestamp}
	    {/capture}
	    {gallery->text text="Date: %s" arg1=$smarty.capture.creationTimestamp}
	  {/gallery->item}

	  {gallery->item}
	    {gallery->text text="Current size: %d x %d" arg1=$image.width arg2=$image.height}
	  {/gallery->item}

	  {if !empty($layout.sourceImage)}
	    {gallery->item}
	      {gallery->text text="Full size: %d x %d" arg1=$layout.sourceImage.width arg2=$layout.sourceImage.height}
	    {/gallery->item}
	  {/if}
	{/gallery->infobox}

	{gallery->linksbox}
	  {gallery->item}
	    {gallery->link}
	      {gallery->text text="back"}
	    {/gallery->link}
	  {/gallery->item}
	  {gallery->item}
	    {gallery->link}
	      {gallery->text text="next"}
	    {/gallery->link}
	  {/gallery->item}
	{/gallery->linksbox}
      {/gallery->component}
    {/gallery->bannerbox}

    {gallery->simplebox}
      {gallery->body}
	{if ($image.inline)}
	  {gallery->thumbnail item=$layout.item thumbnail=$image}
	{else}
	  {gallery->link url_view="core:DownloadItem" url_itemId=$image.id}
	    {gallery->text text="Download this item"} 
	  {/gallery->link}
	{/if}
      {/gallery->body}
    {/gallery->simplebox}

    {if !empty($layout.moduleItemDetailFiles)}
      {foreach from=$layout.moduleItemDetailFiles key=moduleName item=detailFile}
	{gallery->simplebox}
	  {gallery->body}
	    {include file=$detailFile l10Domain="module_$moduleName"}
	  {/gallery->body}
	{/gallery->simplebox}
      {/foreach}
    {/if}

    {gallery->bannerbox}
      {gallery->component}
	{gallery->simplebox}
	  {gallery->body}
	    {foreach from=$layout.moduleItemLinks item=itemLinks key=loopId}
	      {if ($loopId == $layout.item.id)}
		{gallery->text text="Action: "}
		{gallery->select onChange="if (this.value) javascript:location.href=this.value"}
		  <option value=""> {gallery->text text="<< Action >>"}
		  {foreach from=$itemLinks item=module}
		    {foreach from=$module item=link}
		      <option value="{$link.url}"> {$link.text}
		    {/foreach}
		  {/foreach}
		{/gallery->select}
	      {/if}
	    {/foreach}
	  {/gallery->body}
	{/gallery->simplebox}

	{gallery->linksbox}
	  {gallery->item}
	    {gallery->link}
	      {gallery->text text="back"}
	    {/gallery->link}
	  {/gallery->item}
	  {gallery->item}
	    {gallery->link}
	      {gallery->text text="next"}
	    {/gallery->link}
	  {/gallery->item}
	{/gallery->linksbox}
      {/gallery->component}
    {/gallery->bannerbox}

  {/gallery->component}
{/gallery->main}

{*

  {gallery->lightFrame width="100%"}
    <table border="0" width="100%" cellspacing="0%" cellpadding="0%">
    <tr>
    <td>
    <table border="0" width="100%" cellspacing="0%" cellpadding="0%">
    <tr>
    <td colspan="2" align="right">
    </td>
    </tr>
    <tr>	
    <td>
    </td>
    <td align="right">
    {foreach from=$layout.moduleSystemLinks item=module}
      {foreach from=$layout.module item=link}
	<a href="{$link.url}">[{$link.text}]</a>
      {/foreach}
    {/foreach}
    </td>
    </tr>
    </table>
    </td>
    </tr>

    <tr>
    <td>
    {include file="parents.tpl"}
    </td>
    </tr>

    <tr>
    <td width="100%">
    {include file="itemNavigator.tpl"}
    </td>
    </tr>

    <tr>
    <td>
    &nbsp;
    </td>
    </tr>

    <tr>
    <td>
    <table border="0" width="100%" cellspacing="0%" cellpadding="0%">
    <tr>
    <td align=center>
    {strip}

      {if ($image.inline)}
	{gallery->thinFrame}
	  <img src="{gallery->url view=core:DownloadItem itemId=$image.id}"
	  {if ($image.width && $image.height)}
	    width="{$image.width}"
	    height="{$image.height}"
	  {/if}
	  border="0"
	  >
	{/gallery->thinFrame}
      {else}
	<a href="{gallery->url view=core:DownloadItem itemId=$image.id}">
	{gallery->text text="Download this item"} 
	</a>
      {/if}
    {/strip}
    </td>
    </tr>
    <tr>
    <td>
    &nbsp;
    </td>
    </tr>
    <tr>
    <td align="center">
    {strip}
      {section name=imageView loop=$imageViews}
	{if $smarty.section.imageView.index != $imageViewsIndex}
	  <a href="{gallery->url view=core:ShowItem itemId=$layout.item.id imageViewsIndex=$smarty.section.imageView.index}">
	{else}
	  <b>
	{/if}

	{if $imageViews[imageView].inline}
	  [
	  {if empty($imageViews[imageView].width)}
	    {gallery->text text="??? x ???"}
	  {else}
	    {gallery->text text="%d x %d" arg1=$imageViews[imageView].width arg2=$imageViews[imageView].height}
	  {/if}
	  ]
	{/if}

	{if $smarty.section.imageView.index == $imageViewsIndex}
	  </b>
	{else}
	  </a>
	{/if}

	{if empty($smarty.section.imageView.last)}
	  &nbsp;
	{/if}

{/section}
{/strip}
</td>
</tr>
</table>
</td>
</tr>

<tr>
<td>
&nbsp;
</td>
</tr>

<tr>
<td align="center">
{if !empty($layout.item.title)}
  <b>{$layout.item.title}</b>
  <p>
{/if}

{if !empty($layout.item.description)}
  {$layout.item.description}
{/if}
<p>
</td>
</tr>

<tr>
<td width="100%">
{include file="itemNavigator.tpl"}
</td>
</tr>

<tr>
<td>
{include file="parents.tpl"}
</td>
</tr>

<!-- Module Item Details for the active item -->
</table>
{/gallery->lightFrame}

*}