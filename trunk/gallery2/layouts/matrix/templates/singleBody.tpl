    {* Jump through hoops because "$layout.imageViews.`$layout.imageViewsIndex`" doesn't work *}
      {assign var="currentIndex" value=$layout.imageViewsIndex}
      {assign var="image" value=$layout.imageViews.$currentIndex}
      
      <div id="gsHeader">
	<div class="gbTitleBanner">
	  <!-- img banner -->
	</div>
	
	{include file="layouts/matrix/templates/pathbar.tpl"}
      </div>
      
      <div id="gsSingleImageContents">
	<div class="gbTopFlag">
	  <div class="gbTitleBanner">
	    <div class="giTitle">
	      {$layout.item.title|markup}
	    </div>
	    <div class="giDescription">
	      {$layout.item.summary|markup}
	    </div>

	    <div class="giInfo">
	      <span>
		{capture name=modificationTimestamp}
		{g->date timestamp=$layout.item.modificationTimestamp}
		{/capture}
		{g->text text="Date: %s" arg1=$smarty.capture.modificationTimestamp}
	      </span>

	      {if sizeof($layout.imageViews) > 1}
	      <span>
		{g->text text="Size: "}
		<select onchange="javascript:if (this.value) location.href=this.value">
		  {section name=imageView loop=$layout.imageViews}
		  {if $smarty.section.imageView.index != $layout.imageViewsIndex}
		  {assign var="selected" value="selected=\"selected\""}
		  {else}
		  {assign var="selected" value=""}
		  {/if}

		  <option {$selected} value="{g->url view="core:ShowItem" itemId=$layout.item.id imageViewsIndex=$smarty.section.imageView.index}">
		    {if empty($layout.imageViews[imageView].width)}
		    {g->text text="Unknown"}
		    {else}
		    {g->text text="%dx%d" arg1=$layout.imageViews[imageView].width arg2=$layout.imageViews[imageView].height}
		    {/if}
		  </option>
		  {/section}
		</select>
	      </span>
	      {/if}

	      {if !empty($layout.sourceImage)}
	      <span>
		{g->text text="Full size: "}
		{capture name="fullSize"}
		{if empty($layout.sourceImage.width)}
		{g->text text="Unknown"}
		{else}
		{g->text text="%dx%d" arg1=$layout.sourceImage.width arg2=$layout.sourceImage.height}
		{/if}
		{/capture}
		{if sizeof($layout.imageViews) > 1}
		<a href="{g->url arg1="view=core:ShowItem" arg2="itemId=`$layout.item.id`" arg3="imageViewsIndex=`$layout.sourceImageViewIndex`"}">{$smarty.capture.fullSize}</a>
		{else}
		{$smarty.capture.fullSize}
		{/if}
	      </span>
	      {/if}
	  
	      <span>
		{g->text text="Owner: %s" arg1=$layout.owner.fullName|default:$layout.owner.userName}
	      </span>
	    </div>
	  </div>
	</div>

	{include file="layouts/matrix/templates/itemNavigator.tpl"}

	<div class="gsSingleImage">
	  <div class="giTitle">
	    {$layout.item.title|markup}
	  </div>
	  <div class="giDescription">
	    {$layout.item.description|markup}
	  </div>

	  {capture name="fallback"}
	  <a href="{g->url arg1="view=core:DownloadItem" arg2="itemId=`$image.id`"}">
	    {g->text text="Download this item"} 
	  </a>
	  {/capture}

	  {if ($layout.can.viewInline.$currentIndex)}
	  {g->image item=$layout.item image=$image fallback=$smarty.capture.fallback}
	  {else}
	  {$smarty.capture.fallback}
	  {/if}
	</div>

	{if !empty($layout.moduleItemDetailFiles)}
	{foreach from=$layout.moduleItemDetailFiles key=moduleId item=detailFile}
	{include file=$detailFile l10Domain="modules_$moduleId"}
	{/foreach}
	{/if}

	{assign var="id" value=$layout.item.id}
	{if !empty($layout.moduleItemLinks.$id)}
	<div class="giActionSelect">
	  <select onchange="javascript:if (this.value) location.href=this.value">
	    <option value="">{g->text text="&laquo; actions &raquo;"}</option>

	  {foreach from=$layout.moduleItemLinks.$id item=link}
	  <option value="{$link.url}">{$link.text}</option>
	  {/foreach}
	</select>
	</div>
	{/if}

	{include file="layouts/matrix/templates/itemNavigator.tpl"}
	{include file="layouts/matrix/templates/sidebar.tpl"}
      </div>
