{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock">
  <h2> {g->text text="Sort order"} </h2>

  <p class="giDescription">
    {g->text text="This sets the sort order for the album.  This applies to all current items, and any newly added items."}
  </p>

  <select name="{"form[orderBy]|formVar"}" onchange="ItemEditAlbum.pickOrder()">
    {html_options options=$ItemEditAlbum.orderByList selected=$form.orderBy}
  </select>
  <select name="{"form[orderDirection]"|formVar}">
    {html_options options=$ItemEditAlbum.orderDirectionList selected=$form.orderDirection}
  </select>
  {g->text text="with"}
  <select name="{"form[presort]"|formVar}">
    {html_options options=$ItemEditAlbum.presortList selected=$form.presort}
  </select><br/>
  {g->changeInDescendents module="sort" text="Apply to all subalbums"}
</div>

<div class="gbBlock">
  <h3> {g->text text="Thumbnails"} </h3>
  <p class="giDescription">
    {g->text text=" Every item requires a thumbnail. Set the default size in pixels here."}
  </p>

  <input name="{"form[thumbnail][size]"|formVar}" type="text" value="{$form.thumbnail.size}" size="6"/>

  <div class="giError" id="{"errorThumbnailSizeInvalid"|elementId}"{if empty($form.error.thumbnail.size.invalid)} style="display: none"{/if}> {g->text text="You must enter a number (greater than zero)"} </div>
  <br/>
  {g->changeInDescendents module="thumbnail" text="Use this thumbnail size in all subalbums"}
</div>

<div class="gbBlock">
  <h3> {g->text text="Resized Images"} </h3>
  <p class="giDescription">
    {g->text text="Each item in your album can have multiple sizes. Define the default sizes here."}
  </p>

  <table class="gbDataTable"><tr>
    <th align="center"> {g->text text="Active"} </th>
    <th> {g->text text="Target Size (pixels)"} </th>
  </tr>
  {counter start=0 assign=index}
  {foreach from=$form.resizes item=resize}
  <tr class="{cycle values="gbEven,gbOdd"}">
    <td align="center">
      <input name="{"form[resizes][$index][active]"|formVar}" type="checkbox"{if $form.resizes.$index.active} checked="checked"{/if}/>
    </td><td>
     {g->dimensions formVar="form[resizes][$index]" width=$form.resizes.$index.width
						    height=$form.resizes.$index.height}
    </td>
  </tr>

  <tr id="{"errorResizes`$index`SizeMissing"|elementId}"{if empty($form.error.resizes.$index.size.missing)} style="display: none"{/if}><td colspan="2" class="giError">
    {g->text text="You must enter a valid size"}
  </td></tr>
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.resizes.$index.size.missing)}
	YAHOO.util.Dom.get("{"errorResizes`$index`SizeMissing"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorResizes`$index`SizeMissing"|elementId}").style.display = "";
      {/if}
    {/capture}
  {/if}

  <tr id="{"errorResizes`$index`SizeMissing"|elementId}"{if empty($form.error.resizes.$index.size.invalid)} style="display: none"{/if}><td colspan="2" class="giError">
    {g->text text="You must enter a number (greater than zero)"}
  </td></tr>
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.resizes.$index.size.invalid)}
	YAHOO.util.Dom.get("{"errorResizes`$index`SizeMissing"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorResizes`$index`SizeMissing"|elementId}").style.display = "";
      {/if}
    {/capture}
  {/if}
  {counter}
  {/foreach}
  </table>
  {g->changeInDescendents module="resizes" text="Use these target sizes in all subalbums"}
</div>

<div class="gbBlock">
  <h3> {g->text text="Apply settings to existing items"} </h3>
  <p class="giDescription">
    {g->text text="The thumbnail and resized image settings are for all new items. To apply these settings to all the items in your album, check the appropriate box. Including subalbums will apply each album's own settings to its thumbnails/resizes, which may not match the settings above. Building images now makes this operation take longer, but saves the time to build and cache each file when it is first viewed."}
  </p>

<<<<<<< .working
  <input id="cbRecreateThumbs" name="{"form[recreateThumbnails]"|formVar}" type="checkbox"{if $form.recreateThumbnails} checked="checked"{/if}/>
  <label for="cbRecreateThumbs"> {g->text text="Recreate thumbnails"} </label>
  <br/>

  <input id="cbRecreateResizes" name="{"form[recreateResizes]"|formVar}" type="checkbox"{if $form.recreateResizes} checked="checked"{/if}/>
  <label for="cbRecreateResizes"> {g->text text="Recreate resized images"} </label>
=======
  <table><tr>
    <td>
      <input id="cbRecreateThumbs" name="{"form[recreateThumbnails]"|formVar}" type="checkbox"{if $form.recreateThumbnails} checked="checked"{/if}/>
      <label for="cbRecreateThumbs"> {g->text text="Apply album setting to thumbnails"} </label>
    </td><td>
      {g->changeInDescendents module="recreateThumbnails" text="... and for all subalbums"}
    </td><td>
      <input id="cbBuildThumbs" name="{g->formVar var="form[buildThumbnails]"}" type="checkbox"{if $form.buildThumbnails} checked="checked"{/if}/>
      <label for="cbBuildThumbs"> {g->text text="Build thumbnails too"} </label>
    </td>
  </tr><tr>
    <td>
      <input id="cbRecreateResizes" name="{g->formVar var="form[recreateResizes]"}" type="checkbox"{if $form.recreateResizes} checked="checked"{/if}/>
      <label for="cbRecreateResizes"> {g->text text="Apply album setting to resized images"} </label>
    </td><td>
      {g->changeInDescendents module="recreateResizes" text="... and for all subalbums"}
    </td><td>
      <input id="cbBuildResizes" name="{g->formVar var="form[buildResizes]"}" type="checkbox"{if $form.buildResizes} checked="checked"{/if}/>
      <label for="cbBuildResizes"> {g->text text="Build resizes too"} </label>
    </td>
  </tr></table>
</div>

{* Include our extra ItemEditOptions *}
{foreach from=$ItemEdit.options item=option}
  {include file="gallery:`$option.file`" l10Domain=$option.l10Domain}
{/foreach}

<div class="gbBlock gcBackground1">
  <input class="inputTypeSubmit" id="{"saveInput"|elementId}" name="{"form[action][save]"|formVar}" type="submit" value="{g->text text="Save"}"/>
  <input class="inputTypeSubmit" id="{"undoInput"|elementId}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Reset"}"/>
</div>

<script>
  // <![CDATA[

  {* Template's client-side variables & functions *}
  var ItemEditAlbum = {ldelim}
    pickOrder: function() {ldelim}
      var form = YAHOO.util.Dom.get("{"form"|elementId:"ItemAdmin"}");
      var index = form.elements["{"form[orderBy]"|formVar}"].selectedIndex;
      form.elements["{"form[orderDirection]"|formVar}"].disabled = (index <= 1) ? "disabled" : "";
      form.elements["{"form[presort]"|formVar}"].disabled = (index <= 1) ? "disabled" : "";
    {rdelim}
  {rdelim};

  ItemEditAlbum.pickOrder();

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"saveInput"|elementId}", "{"undoInput"|elementId}"], "click", ItemAdmin.submit, ItemAdmin);

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.thumbnail.size.invalid)}
	YAHOO.util.Dom.get("{"errorThumbnailSizeInvalid"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorThumbnailSizeInvalid"|elementId}").style.display = "";
      {/if}
    {/capture}
  {/if}

  // ]]>
</script>
