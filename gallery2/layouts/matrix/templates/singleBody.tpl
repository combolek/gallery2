{* Jump through hoops because "$layout.imageViews.`$layout.imageViewsIndex`" doesn't work *}
{assign var="currentIndex" value=$layout.imageViewsIndex}
{assign var="image" value=$layout.imageViews.$currentIndex}

{g->main}
  {include file="layouts/matrix/templates/pathbar.tpl"}
  {include file="layouts/matrix/templates/sidebar.tpl"}

  {g->pagebox}

    {g->banner}
      {g->title}
	{$layout.item.title}
      {/g->title}
      {g->description}
	{$layout.item.summary}
      {/g->description}

      {g->infoset}
	{g->item}
	  {g->title}
	    {capture name=modificationTimestamp}
	      {g->date timestamp=$layout.item.modificationTimestamp}
	    {/capture}
	    {g->text text="Date: %s" arg1=$smarty.capture.modificationTimestamp}
	  {/g->title}
	{/g->item}

	{if sizeof($layout.imageViews) > 1}
	  {g->item}
	    {g->title}
	      {g->actionset}
		{g->title}
		  {g->text text="Size: "}
		{/g->title}

		{section name=imageView loop=$layout.imageViews}
		  {if $smarty.section.imageView.index != $layout.imageViewsIndex}
		    {assign var="selected" value=false}
		  {else}
		    {assign var="selected" value=true}
		  {/if}

		  {g->actionitem selected=$selected}
		    {g->title}
		      {if empty($layout.imageViews[imageView].width)}
			{g->text text="Unknown"}
		      {else}
			{g->text text="%dx%d" arg1=$layout.imageViews[imageView].width arg2=$layout.imageViews[imageView].height}
		      {/if}
		    {/g->title}
		    {g->value}
		      {g->url view="core:ShowItem" itemId=$layout.item.id imageViewsIndex=$smarty.section.imageView.index}
		    {/g->value}
		  {/g->actionitem}
		{/section}
	      {/g->actionset}
	    {/g->title}
	  {/g->item}
	{/if}

	{if !empty($layout.sourceImage)}
	  {g->item}
	    {g->title}
	      {g->text text="Full size: "}
	      {capture name="fullSize"}
		{if empty($layout.sourceImage.width)}
		  {g->text text="Unknown"}
		{else}
		  {g->text text="%dx%d" arg1=$layout.sourceImage.width arg2=$layout.sourceImage.height}
		{/if}
	      {/capture}
	      {if sizeof($layout.imageViews) > 1}
		{g->link url_view="core:ShowItem" url_itemId=$layout.item.id url_imageViewsIndex=$layout.sourceImageViewIndex}
		  {$smarty.capture.fullSize}
		{/g->link}
	      {else}
		{$smarty.capture.fullSize}
	      {/if}
	    {/g->title}
	  {/g->item}
	{/if}
	  
	  {g->item}
	    {g->title}
	      {g->text text="Owner: %s" arg1=$layout.owner.fullName|default:$layout.owner.userName}
	    {/g->title}
	  {/g->item}
	{/g->infoset}

	{include file="layouts/matrix/templates/itemNavigator.tpl"}
      {/g->banner}

      {g->box style="canvas"}
	{g->itemview}
	  {g->title}
	    {$layout.item.title}
	  {/g->title}
	  {g->description}
	    {$layout.item.description}
	  {/g->description}
	  {g->media}
	    {if ($layout.can.viewInline.$currentIndex)}
	      {g->image item=$layout.item image=$image}
	    {else}
	      {g->link url_view="core:DownloadItem" url_itemId=$image.id}
		{g->text text="Download this item"} 
	      {/g->link}
	    {/if}
	  {/g->media}
	{/g->itemview}
      {/g->box}

      {if !empty($layout.moduleItemDetailFiles)}
	{foreach from=$layout.moduleItemDetailFiles key=moduleName item=detailFile}
	  {include file=$detailFile l10Domain="modules_$moduleName"}
	{/foreach}
      {/if}

      {g->box}
	{assign var="id" value=$layout.item.id}
	{g->actionset}
	  {g->actionitem}
	    {g->title}
	      {g->text text="&laquo; actions &raquo;"}
	    {/g->title}
	    {g->value}
	      &nbsp;
	    {/g->value}
	  {/g->actionitem}

	  {foreach from=$layout.moduleItemLinks.$id item=link}
	    {g->actionitem}
	      {g->title}
		{$link.text}
	      {/g->title}
	      
	      {g->value}
		{$link.url}
	      {/g->value}
	    {/g->actionitem}
	  {/foreach}
	{/g->actionset}
      {/g->box}

      {g->banner}
	{include file="layouts/matrix/templates/itemNavigator.tpl"}
      {/g->banner}

    {/g->pagebox}
{/g->main}
