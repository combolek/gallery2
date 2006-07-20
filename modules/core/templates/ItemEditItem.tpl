{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<script>
  // <![CDATA[

  {* Template's client-side variables & functions *}
  var ItemEditItem = {ldelim}
    setOriginationTimestamp: function() {ldelim}
      var form = YAHOO.util.Dom.get("{"form"|elementId:"ItemAdmin"}");
      {g->formVars name="form[originationTimestampSplit]" value=$ItemEditItem.originationTimestampSplit}
      form.elements["{$name}"].value = "{$value}";
      {/g->formVars}
    {rdelim}
  {rdelim};

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"saveInput"|elementId}", "{"undoInput"|elementId}"], "click", ItemAdmin.submit, ItemAdmin);

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.title.missingRootTitle)}
	YAHOO.util.Dom.get("{"errorMissingRootTitle"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorMissingRootTitle"|elementId}").style.display = "";
      {/if}

      {if empty($form.error.originationTimestamp.invalid)}
	YAHOO.util.Dom.get("{"errorOriginationTimestampInvalid"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorOriginationTimestampInvalid"|elementId}").style.display = "none";
      {/if}
    {/capture}
  {/if}

  // ]]>
</script>

<div class="gbBlock">
  {if $ItemEditItem.can.changePathComponent}
  <div>
    <h2>
      {g->text text="Name"}
      <span class="giSubtitle">
	{g->text text="(required)"}
      </span>
    </h2>

    <p class="giDescription">
      {g->text text="The name of this item on your hard disk.  It must be unique in this album.  Only use alphanumeric characters, underscores or dashes."}
    </p>

    {strip}
    {foreach from=$ItemAdmin.parents item=parent}
    {if empty($parent.parentId)}
    /
    {else}
    {$parent.pathComponent}/
    {/if}
    {/foreach}
    {/strip}
    <input name="{"form[pathComponent]"|formVar}" size="40" type="text" value="{$form.pathComponent}"/>

    <div class="giError" id="{"errorPathComponentInvalid"|elementId}"{if empty($form.error.pathComponent.invalid)} style="display: none"{/if}> {g->text text="Your name contains invalid characters.  Please choose another"} </div>
    {if GalleryUtilities::isCallback()}
      {capture append="smarty.output"}
	{if empty($form.error.pathComponent.invalid)}
	  YAHOO.util.Dom.get("{"errorPathComponentInvalid"|elementId}").style.display = "none";
	{else}
	  YAHOO.util.Dom.get("{"errorPathComponentInvalid"|elementId}").style.display = "";
	{/if}
      {/capture}
    {/if}

    <div class="giError" id="{"errorPathComponentMissing"|elementId}"{if empty($form.error.pathComponent.missing)} style="display: none"{/if}> {g->text text="You must enter a name for this item"} </div>
    {if GalleryUtilities::isCallback()}
      {capture append="smarty.output"}
	{if empty($form.error.pathComponent.missing)}
	  YAHOO.util.Dom.get("{"errorPathComponentMissing"|elementId}").style.display = "none";
	{else}
	  YAHOO.util.Dom.get("{"errorPathComponentMissing"|elementId}").style.display = "";
	{/if}
      {/capture}
    {/if}

    <div class="giError" id="{"errorPathComponentCollision"|elementId}"{if empty($form.error.pathComponent.collision)} style="display: none"{/if}> {g->text text="The name you entered is already in use.  Please choose another"} </div>
    {if GalleryUtilities::isCallback()}
      {capture append="smarty.output"}
	{if empty($form.error.pathComponent.collision)}
	  YAHOO.util.Dom.get("{"errorPathComponentCollision"|elementId}").style.display = "none";
	{else}
	  YAHOO.util.Dom.get("{"errorPathComponentCollision"|elementId}").style.display = "";
	{/if}
      {/capture}
    {/if}

  </div>
  {/if}

  <div>
    <h4> {g->text text="Title"} </h4>

    <p class="giDescription">
      {g->text text="The title of this item."}
    </p>

    {include file="gallery:modules/core/templates/MarkupBar.tpl" viewL10domain="modules_core" element="title"|elementId firstMarkupBar=true}
    <input id="{"title"|elementId}" name="{"form[title]"|formVar}" size="60" type="text" value="{$form.title}"/>

    <div class="giError" id="{"errorMissingRootTitle"|elementId}"{if empty($form.error.title.missingRootTitle)} style="display: none"{/if}> {g->text text="The root album must have a title"} </div>
  </div>

  <div>
    <h4> {g->text text="Summary"} </h4>

    <p class="giDescription">
      {g->text text="The summary of this item."}
    </p>

    {include file="gallery:modules/core/templates/MarkupBar.tpl" viewL10domain="modules_core" element="summary"|elementId}
    <input id="{"summary"|elementId}" name="{"form[summary]"|formVar}" size="60" type="text" value="{$form.summary}"/>
  </div>

  <div>
    <h4> {g->text text="Keywords"} </h4>

    <p class="giDescription">
      {g->text text="Keywords are not visible, but are searchable."}
    </p>

    <textarea name="{"form[keywords]"|formVar}" rows="2" cols="60">{$form.keywords}</textarea>
  </div>

  <div>
    <h4> {g->text text="Description"} </h4>

    <p class="giDescription">
      {g->text text="This is the long description of the item."}
    </p>

    {include file="gallery:modules/core/templates/MarkupBar.tpl" viewL10domain="modules_core" element="description"|elementId}
    <textarea id="{"description"|elementId}" name="{"form[description]"|formVar}" rows="4" cols="60">{$form.description}</textarea>
  </div>
</div>

<div class="gbBlock">
  <h3> {g->text text="%s Date and Time" arg1=$ItemEditItem.typeName.0} </h3>

  <p class="giDescription">
    {if !empty($ItemEditItem.isItemPhoto)}
      {g->text text="Set the date and time when this image was captured."}
    {elseif !empty($ItemEditItem.isItemUnknown)}
      {g->text text="Set the date and time to be displayed for this item."}
    {else}
      {g->text text="Set the date and time to be displayed for this %s."
	       arg1=$ItemEditItem.typeName.1}
    {/if}
  </p>

  <p>
    {g->text text="Date:"}
    {capture assign="ItemEditItem.htmlSelectDate"}
      {html_select_date time=$form.originationTimestamp field_array="form[originationTimestampSplit]"|formVar start_year="1970" end_year="+0"}
    {/capture}
    {$ItemEditItem.htmlSelectDate|utf8}
    {g->text text="Time:"}
    {html_select_time time=$form.originationTimestamp field_array="form[originationTimestampSplit]"|formVar}
    <br/>
  </p>

  {if !empty($ItemEditItem.originationTimestamp)}
  <p>
    {g->text text="Use the original capture date and time from file information (e.g. Exif tag):"}
    <br/>
    <a href="javascript:ItemEditItem.setOriginationTimestamp()"> {g->date timestamp=$ItemEditItem.originationTimestamp style="datetime"} </a>
  </p>
  {/if}

  <div class="giError" id="{"errorOriginationTimestampInvalid"|elementId}"{if empty($form.error.originationTimestamp.invalid)} style="display: none"{/if}> {g->text text="You must enter a valid date and time"} </div>
</div>

{if $ItemEditItem.can.editThumbnail}
<div class="gbBlock">
  <h3> {g->text text="Thumbnail"} </h3>

  <p class="giDescription">
    {g->text text="Set the size of the thumbnail.  The largest side of the thumbnail will be no larger than this value.  Leave this field blank if you don't want a thumbnail."}
  </p>

  {if empty($ItemEditItem.can.createThumbnail)}
  <b>
    {g->text text="There are no graphics toolkits enabled that support this type of item, so we cannot create or modify a thumbnail."}
    {if !empty($user.isAdmin)}
      <a href="{g->url arg1="view=core.SiteAdmin" arg2="subView=core.AdminPlugins"}"> {g->text text="site admin"} </a>
    {/if}
  </b>
  {else}
    <input name="{"form[thumbnail][size]"|formVar}" size="6" type="text" value="{$form.thumbnail.size}"/>
  {/if}

  <div class="giError" id="{"errorThumbnailSizeInvalid"|elementId}"{if empty($form.error.thumbnail.size.invalid)} style="display: none"{/if}> {g->text text="You must enter a number (greater than zero)"} </div>
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.thumbnail.size.invalid)}
	YAHOO.util.Dom.get("{"errorThumbnailSizeInvalid"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorThumbnailSizeInvalid"|elementId}").style.display = "";
      {/if}
    {/capture}
  {/if}

  <div class="giError" id="{"errorThumbnailCreate"|elementId}"{if empty($form.error.thumbnail.create)} style="display: none"{/if}> {g->text text="Unable to create a thumbnail for this item"} </div>
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.thumbnail.create)}
	YAHOO.util.Dom.get("{"errorThumbnailCreate"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorThumbnailCreate"|elementId}").style.display = "";
      {/if}
    {/capture}
  {/if}

</div>
{/if}

{* Include our extra ItemEditOptions *}
{foreach from=$ItemEdit.options item=option}
  {include file="gallery:`$option.file`" l10Domain=$option.l10Domain}
{/foreach}

<div class="gbBlock gcBackground1">
  <input class="inputTypeSubmit" id="{"saveInput"|elementId}" name="{"form[action][save]"|formVar}" type="submit" value="{g->text text="Save"}"/>
  <input class="inputTypeSubmit" id="{"undoInput"|elementId}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Reset"}"/>
</div>
