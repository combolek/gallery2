{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<script>
  // <![CDATA[

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"saveInput"|elementId}", "{"undoInput"|elementId}"], "click", ItemAdmin.submit, ItemAdmin);

  // ]]>
</script>

<div class="gbBlock">
  <h3> {g->text text="Resized Photos"} </h3>

  <p class="giDescription">
    {g->text text="These sizes are alternate resized versions of the original you would like to have available for viewing."}
  </p>

  {if empty($ItemEditPhoto.editSizes.can.createResizes)}
  <b>
    {g->text text="There are no graphics toolkits enabled that support this type of photo, so we cannot create or modify resized versions."}
    {if $user.isAdmin}
      <a href="{g->url arg1="view=core.SiteAdmin" arg2="subView=core.AdminPlugins"}"> {g->text text="site admin"} </a>
    {/if}
  </b>
  {else}
    {counter start=0 assign=index}
    {foreach from=$form.resizes item=resize}
      <input name="{"form[resizes][$index][active]"|formVar}" type="checkbox"{if $form.resizes.$index.active} checked="checked"{/if}/>
      {g->dimensions formVar="form[resizes][$index]" width=$form.resizes.$index.width height=$form.resizes.$index.height}
      <br/>

      <div class="giError" id="{"errorResizes`$index`SizeMissing"|elementId}"{if empty($form.error.resizes.$index.size.missing)} style="display: none"{/if}> {g->text text="You must enter a valid size"} </div>
      {if GalleryUtilities::isCallback()}
	{capture append="smarty.output"}
	  {if empty($form.error.resizes.$index.size.missing)}
	    YAHOO.util.Dom.get("{"errorResizes`$index`SizeMissing"|elementId}").style.display = "none";
	  {else}
	    YAHOO.util.Dom.get("{"errorResizes`$index`SizeMissing"|elementId}").style.display = "";
	  {/if}
	{/capture}
      {/if}

      <div class="giError" id="{"errorResizes`$index`SizeInvalid"|elementId}"{if empty($form.error.resizes.$index.size.invalid)} style="display: none"{/if}> {g->text text="You must enter a number (greater than zero)"} </div>
      {if GalleryUtilities::isCallback()}
	{capture append="smarty.output"}
	  {if empty($form.error.resizes.$index.size.invalid)}
	    YAHOO.util.Dom.get("{"errorResizes`$index`SizeInvalid"|elementId}").style.display = "none";
	  {else}
	    YAHOO.util.Dom.get("{"errorResizes`$index`SizeInvalid"|elementId}").style.display = "";
	  {/if}
	{/capture}
      {/if}

      {counter}
    {/foreach}
  {/if}
</div>

{* Include our extra ItemEditOptions *}
{foreach from=$ItemEdit.options item=option}
  {include file="gallery:`$option.file`" l10Domain=$option.l10Domain}
{/foreach}

<div class="gbBlock gcBackground1">
  <input name="{"mode"|formVar}" type="hidden" value="editSizes"/>
  <input class="inputTypeSubmit" id="{"saveInput"|elementId}" name="{"form[action][save]"|formVar}" type="submit" value="{g->text text="Save"}"/>
  <input class="inputTypeSubmit" id="{"undoInput"|elementId}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Reset"}"/>
</div>
