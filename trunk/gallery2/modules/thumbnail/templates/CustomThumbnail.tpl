{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock">
  <h3> {g->text text="Custom Thumbnail"} </h3>

  <p class="giDescription">
  {if isset($CustomThumbnailOption.thumbnail)}
    <input type="checkbox" id="CustomThumbnailOption.delete"
	   name="{g->formVar var="form[CustomThumbnailOption][delete]"}"/>
    <label for="CustomThumbnailOption.delete">
      {g->text text="Remove custom thumbnail for this item"}
    </label>
  </p>
  {else}
    {g->text text="Upload a JPEG image to use as the thumbnail for this item."} <br/>
    {g->text text="Image does not need to be thumbnail size; it will be resized as needed."}
  </p>

  <input type="file" size="45" name="{g->formVar var="form[1]"}"/>

  {if !empty($form.CustomThumbnailOption.error.missingFile)}
  <div class="giError">
    {g->text text="Missing image file"}
  </div>
  {/if}
  {if !empty($form.CustomThumbnailOption.error.imageMime)}
  <div class="giError">
    {g->text text="Thumbnail image must be a JPEG"}
  </div>
  {/if}
  {/if}
</div>
