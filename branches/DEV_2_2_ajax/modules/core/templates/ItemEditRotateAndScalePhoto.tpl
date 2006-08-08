{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock">
  <h3> {g->text text="Rotate"} </h3>

  <p class="giDescription">
    {g->text text="You can only rotate the photo in 90 degree increments."}
  </p>

  {if empty($ItemEditRotateAndScalePhoto.editPhoto.can.rotate)}
    <b>
      {g->text text="There are no graphics toolkits enabled that support this type of photo, so we cannot rotate it."}
      {if !empty($user.isAdmin)}
	<a href="{g->url arg1="view=core.SiteAdmin" arg2="subView=core.AdminPlugins"}"> {g->text text="site admin"} </a>
      {/if}
    </b>
  {else}
    <input class="inputTypeSubmit" id="{"rotate-90Input"|elementId}" name="{"form[action][rotate][-90]"|formVar}" type="submit" value="{g->text text="-90&deg;"}"/> &nbsp;
    <input class="inputTypeSubmit" id="{"rotate180Input"|elementId}" name="{"form[action][rotate][180]"|formVar}" type="submit" value="{g->text text="180&deg;"}"/> &nbsp;
    <input class="inputTypeSubmit" id="{"rotate90Input"|elementId}" name="{"form[action][rotate][90]"|formVar}" type="submit" value="{g->text text="90&deg;"}"/>
  {/if}
</div>

<div class="gbBlock">
  <h3> {g->text text="Scale"} </h3>

  <p class="giDescription">
    {g->text text="Shrink or enlarge the original photo.  When Gallery scales a photo, it maintains the same aspect ratio (height to width) of the original photo to avoid distortion.  Your photo will be scaled until it fits inside a bounding box with the size you enter here."}
  </p>

  {if empty($ItemEditRotateAndScalePhoto.editPhoto.can.resize)}
    <b>
      {g->text text="There are no graphics toolkits enabled that support this type of photo, so we cannot scale it."}
      {if !empty($user.isAdmin)}
	<a href="{g->url arg1="view=core.SiteAdmin" arg2="subView=core.AdminPlugins"}"> {g->text text="site admin"} </a>
      {/if}
    </b>
  {else}
    {g->dimensions formVar="form[resize]" width=$form.resize.width height=$form.resize.height}
    <input class="inputTypeSubmit" id="{"resizeInput"|elementId}" name="{"form[action][resize]"|formVar}" type="submit" value="{g->text text="Scale"}"/>
  {/if}

  <div class="giError" id="{"errorSizeMissing"|elementId}"{if empty($form.error.resize.size.missing)} style="display: none"{/if}>
    {g->text text="You must enter a size"}
  </div>

  <div class="giError" id="{"errorSizeInvalid"|elementId}"{if empty($form.error.resize.size.invalid)} style="display: none"{/if}>
    {g->text text="You must enter a number (greater than zero)"}
  </div>
</div>

{* Include our extra ItemEditOptions *}
{foreach from=$ItemEdit.options item=option}
  {include file="gallery:`$option.file`" l10Domain=$option.l10Domain}
{/foreach}

{if !empty($ItemEditRotateAndScalePhoto.editPhoto.can.rotate) ||
    !empty($ItemEditRotateAndScalePhoto.editPhoto.can.resize)}
  <div class="gbBlock" id="{"preserveOriginal"|elementId}"{if !empty($ItemEditRotateAndScalePhoto.editPhoto.hasPreferredSource)} style="display: none"{/if}>
    <h3> {g->text text="Preserve Original"} </h3>

    <p class="giDescription">
      {g->text text="Gallery does not modify your original photo when rotating and scaling.  Instead, it duplicates your photo and works with copies.  This requires a little extra disk space but prevents your original from getting damaged.  Disabling this option will cause any actions (rotating, scaling, etc) to modify the original."}
    </p>

    {if !empty($ItemEditRotateAndScalePhoto.editPhoto.isLinked)}
      <b> {g->text text="This is a link to another photo, so you cannot change the original"} </b>
    {elseif !empty($ItemEditRotateAndScalePhoto.editPhoto.isLinkedTo)}
      <b> {g->text text="There are links to this photo, so you cannot change the original"} </b>
    {elseif $ItemEditRotateAndScalePhoto.editPhoto.noToolkitSupport}
      <b> {g->text text="There is no toolkit support to modify the original so operations may only be applied to the copies"} </b>
    {else}
      <input id="cbPreserve" name="{"form[preserveOriginal]"|formVar}" type="checkbox"{if $form.preserveOriginal} checked="checked"{/if}/>
      <label for="cbPreserve"> {g->text text="Preserve Original Photo"} </label>
    {/if}
  </div>
  {capture append="ItemEditRotateAndScalePhoto.update"}
    if (ItemEditRotateAndScalePhoto != null &&
	ItemEditRotateAndScalePhoto.editPhoto != null) {ldelim}
      if (ItemEditRotateAndScalePhoto.editPhoto.hasPreferredSource) {ldelim}
	GalleryUtilities.hide("{"preserveOriginal"|elementId}");
      {rdelim} else {ldelim}
	GalleryUtilities.show("{"preserveOriginal"|elementId}");
      {rdelim}
    {rdelim}
  {/capture}

  <div class="gbBlock" id="{"modifiedPhoto"|elementId}"{if empty($ItemEditRotateAndScalePhoto.editPhoto.hasPreferredSource)} style="display: none"{/if}>
    <h3> {g->text text="Modified Photo"} </h3>

    <p class="giDescription">
      {g->text text="You are using a copy of the original photo that has been scaled or rotated.  The original photo is still available, but is no longer being used.  Any changes you make will be applied to the copy instead."}
    </p>

    <input class="inputTypeSubmit" id="{"revertInput"|elementId}" name="{"form[action][revertToOriginal]"|formVar}" type="submit" value="{g->text text="Restore original"}"/>
  </div>
  {capture append="ItemEditRotateAndScalePhoto.update"}
    if (ItemEditRotateAndScalePhoto != null &&
	ItemEditRotateAndScalePhoto.editPhoto != null) {ldelim}
      if (!ItemEditRotateAndScalePhoto.editPhoto.hasPreferredSource) {ldelim}
	GalleryUtilities.hide("{"modifiedPhoto"|elementId}");
      {rdelim} else {ldelim}
	GalleryUtilities.show("{"modifiedPhoto"|elementId}");
      {rdelim}
    {rdelim}
  {/capture}
{/if}

<script>
  // <![CDATA[

  {**
   * Template's client-side variables & functions
   *}
  var ItemEditRotateAndScalePhoto = {ldelim}

    {**
     * Update template's dynamic elements
     *
     * @param {Object} scope from which to import new values
     *}
    update: function(ItemEditRotateAndScalePhoto) {ldelim}
      {$ItemEditRotateAndScalePhoto.update}
    {rdelim}
  {rdelim};

  {if !empty($head.javascript['lib/javascript/ItemAdmin.js'])}
  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"rotate-90Input"|elementId}",
      "{"rotate180Input"|elementId}",
      "{"rotate90Input"|elementId}",
      "{"resizeInput"|elementId}",
      "{"revertInput"|elementId}"], "click", ItemAdmin.submit, ItemAdmin);
  {/if}

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.resize.size.missing)}
	GalleryUtilities.hide("{"errorSizeMissing"|elementId}");
      {else}
	GalleryUtilities.show("{"errorSizeMissing"|elementId}");
      {/if}

      {if empty($form.error.resize.size.invalid)}
	GalleryUtilities.hide("{"errorSizeInvalid"|elementId}");
      {else}
	GalleryUtilities.show("{"errorSizeInvalid"|elementId}");
      {/if}

      {* |var_export is cheaper than |json *}
      ItemEditRotateAndScalePhoto.update({ldelim}editPhoto: {ldelim}hasPreferredSource:
	{$ItemEditRotateAndScalePhoto.editPhoto.hasPreferredSource|var_export}{rdelim}{rdelim});
    {/capture}
  {/if}

  // ]]>
</script>
