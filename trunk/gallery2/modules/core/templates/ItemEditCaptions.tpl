{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <h2 class="giTitle">
	{g->text text="Edit Captions"}
        {if ($ItemEditCaptions.numPages > 1) }
        {g->text text="(page %d of %d)"
	         arg1=$ItemEditCaptions.page
	         arg2=$ItemEditCaptions.numPages}
	{/if}
      </h2>
    </div>
  </div>

  {if !empty($status)}
  <div id="gsStatus">
    {if $status.errorCount > 0}
    <div class="giError">
    {if $status.successCount > 0}
      {g->text text="There errors saving some items"}
    {else}
      {g->text text="There errors saving all items"}
    {/if}
    </div>
    {elseif $status.successCount > 0}
    <div class="giStatus">
      {g->text text="Successfully saved all items"}
    </div>
    {/if}
  </div>
  {/if}

  {if !empty($form.items)}
  <input type="hidden" name="{g->formVar var="page"}" value="{$ItemEditCaptions.page}"/>
  <input type="hidden" name="{g->formVar var="form[formname]"}" value="EditCaption"/>
  <input type="hidden" name="{g->formVar var="form[numPerPage]"}" value="{$form.numPerPage}"/>

  {foreach name=itemLoop from=$form.items item=item}
  <div class="gbAdmin">
    <input type="hidden" name="{g->formVar var="form[items][`$item.id`][serialNumber]"}" value="{$item.serialNumber}"/>

    {if isset($item.thumbnail)}
    <div class="giThumbImage" style="float: right">
      {strip}
      <a href="{g->url arg1="view=core:ShowItem" arg2="itemId=`$item.id`"}">
        {g->image item=$item image=$item.thumbnail maxSize=150}
      </a>
      {/strip}
    </div>
    {/if}

    <div class="gbDataEntry">
      <h3 class="giTitle">
        {g->text text="Title"}
      </h3>
      {include file="gallery:modules/core/templates/MarkupBar.tpl" 
               viewL10domain="modules_core" 
               element="title_`$item.id`"
               firstMarkupBar=$smarty.foreach.itemLoop.first}
      <input id="title_{$item.id}" type="text" size="60" name="{g->formVar var="form[items][`$item.id`][title]"}" value="{$item.title}"/>
    </div>

    <div class="gbDataEntry">
      <h3 class="giTitle">
        {g->text text="Summary"}
      </h3>
      {include file="gallery:modules/core/templates/MarkupBar.tpl" 
               viewL10domain="modules_core" 
               element="summary_`$item.id`"
               firstMarkupBar=false}
      <input id="summary_{$item.id}" type="text" size="60" name="{g->formVar var="form[items][`$item.id`][summary]"}" value="{$item.summary}"/>
    </div>

    <div class="gbDataEntry">
      <h3 class="giTitle">
        {g->text text="Keywords"}
      </h3>
      {include file="gallery:modules/core/templates/MarkupBar.tpl" 
               viewL10domain="modules_core" 
               element="keywords_`$item.id`"
               firstMarkupBar=false}
      <textarea id="keywords_{$item.id}" rows="2" cols="60" name="{g->formVar var="form[items][`$item.id`][keywords]"}">{$item.keywords}</textarea>
    </div>

    <div class="gbDataEntry">
      <h3 class="giTitle">
        {g->text text="Description"}
      </h3>
      {include file="gallery:modules/core/templates/MarkupBar.tpl" 
               viewL10domain="modules_core" 
               element="description_`$item.id`"
               firstMarkupBar=false}
      <textarea id="description_{$item.id}" rows="4" cols="60" name="{g->formVar var="form[items][`$item.id`][description]"}">{$item.description}</textarea>
    </div>

    {if isset($status[$item.id].saved)}
    <div class="giSuccess">
      {g->text text="Saved successfully."}
    </div>
    {/if}

    {if isset($status[$item.id].obsolete)}
    <div class="giError">
      {g->text text="This item was modified by somebody else at the same time.  Your changes were lost."}
    </div>
    {/if}

    {* We will probably  never see this message because the view won't show us items for which we have no permissions *}
    {if isset($status[$item.id].permissionDenied)}
    <div class="giError">
      {g->text text="You do not have permissions to modify this item."}
    </div>
    {/if}
  </div>
  {/foreach}

  <div class="gbButtons">
    {if $ItemEditCaptions.canCancel}
    <input type="submit" name="{g->formVar var="form[action][save][done]"}" value="{g->text text="Save and Done"}"/>
    {else}
    <input type="submit" name="{g->formVar var="form[action][save][stay]"}" value="{g->text text="Save"}"/>
    {/if}

    {if ($ItemEditCaptions.page > 1)}
    <input type="submit" name="{g->formVar var="form[action][save][previous]"}" value="&laquo; {g->text text="Save and Edit Previous %s" arg1=$form.numPerPage}"/>
    {/if}

    {if ($ItemEditCaptions.page < $ItemEditCaptions.numPages)}
    <input type="submit" name="{g->formVar var="form[action][save][next]"}" value="{g->text text="Save and Edit Next %s" arg1=$form.numPerPage} &raquo;"/>
    {/if}

    {if $ItemEditCaptions.canCancel}
      <input type="submit" name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}"/>
    {/if}
  </div>
  {else}
  <div class="gbAdmin">
    <p class="giDescription">
      {g->text text="This album contains no items"}
    </p>
  </div>
  {/if}
</div>
