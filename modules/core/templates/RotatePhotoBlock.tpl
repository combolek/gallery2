{*
 * $Revision: 12540 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="{$class}">
  {assign smarty.Gallery.image.ids.0="image"|elementId}
  {g->image item=$RotatePhotoBlock.item
    image=$RotatePhotoBlock.image
    class=$RotatePhotoBlock.class
    id=$RotatePhotoBlock.id}

  {assign smarty.RotatePhotoBlock.form=null}
  {assign smarty.RotatePhotoBlock.links=null}
  {if $RotatePhotoBlock.item.permissions.core_edit}
    {capture assign="smarty.RotatePhotoBlock.form"}
      <span id="{"hidden"|elementId}" style="display: none"></span>
      <div class="gbBlock" id="{"status"|elementId}"{if empty($status.editMessage) && empty($status.warning) && empty($form.error)} style="display: none"{/if}>
	<h2 class="giSuccess" id="{"success"|elementId}"{if empty($status.editMessage)} style="display: none"{/if}> {$status.editMessage} </h2>

	<div class="giWarning" id="{"warning"|elementId}"{if empty($status.warning)} style="display: none"{/if}>
	  {foreach from=$status.warning item=warning}
	    {$warning}
	  {/foreach}
	</div>

	<h2 class="giError" id="{"error"|elementId}"{if empty($form.error)} style="display: none"{/if}> {g->text text="There was a problem processing your request"} </h2>
      </div>

      <form id="{"form"|elementId}" action="{g->url}" method="post" enctype="{$RotatePhotoBlock.enctype|default:"application/x-www-form-urlencoded"}">
	{g->hiddenFormVars}
	<input name="{"controller"|formVar}" type="hidden" value="core.ItemEdit"/>
	<input name="{"itemId"|formVar}" type="hidden" value="{$RotatePhotoBlock.item.id}"/>
	<input name="{"editPlugin"|formVar}" type="hidden" value="ItemEditRotateAndScalePhoto"/>
	<input id="{"serialNumberInput"|elementId}" name="{"form[serialNumber]"|formVar}" type="hidden" value="{$RotatePhotoBlock.item.serialNumber}"/>
	{*{if empty($ItemEditRotateAndScalePhoto.editPhoto.can.rotate)}
	  <b>
	    {g->text text="There are no graphics toolkits enabled that support this type of photo, so we cannot rotate it."}
	    {if !empty($user.isAdmin)}
	      <a href="{g->url arg1="view=core.SiteAdmin" arg2="subView=core.AdminPlugins"}"> {g->text text="site admin"} </a>
	    {/if}
	  </b>
	{else}*}
	  <input class="inputTypeSubmit" id="{"rotate-90Input"|elementId}" name="{"form[action][rotate][-90]"|formVar}" type="submit" value="{g->text text="-90&deg;"}"/> &nbsp;
	  <input class="inputTypeSubmit" id="{"rotate180Input"|elementId}" name="{"form[action][rotate][180]"|formVar}" type="submit" value="{g->text text="180&deg;"}"/> &nbsp;
	  <input class="inputTypeSubmit" id="{"rotate90Input"|elementId}" name="{"form[action][rotate][90]"|formVar}" type="submit" value="{g->text text="90&deg;"}"/>
	{*{/if}*}
      </form>

      <script type="text/javascript">
	// <![CDATA[

	{* Register template's submit function with submit buttons *}
	YAHOO.util.Event.addListener(["{"rotate-90Input"|elementId}",
	    "{"rotate180Input"|elementId}",
	    "{"rotate90Input"|elementId}"], "click",
	  RotatePhotoBlock.submit("{g->url}", "{$templateId}", {ldelim}
	    item: {ldelim}id: {$RotatePhotoBlock.item.id}{rdelim},
	    image: {ldelim}id: {$RotatePhotoBlock.image.id}{rdelim},
	    class: "{$smarty.Gallery.image.classes.1}",
	    id: "{$smarty.Gallery.image.ids.1}"{rdelim}), RotatePhotoBlock);

	// ]]>
      </script>
    {/capture}

    {capture assign="smarty.RotatePhotoBlock.links.0.script"}YAHOO.util.Dom.get('{"rotate-90Input"|elementId}').click(){/capture}
    {capture assign="smarty.RotatePhotoBlock.links.0.text"}{g->text text="Rotate -90&deg;"}{/capture}
    {capture assign="smarty.RotatePhotoBlock.links.1.script"}YAHOO.util.Dom.get('{"rotate180Input"|elementId}').click(){/capture}
    {capture assign="smarty.RotatePhotoBlock.links.1.text"}{g->text text="Rotate 180&deg;"}{/capture}
    {capture assign="smarty.RotatePhotoBlock.links.2.script"}YAHOO.util.Dom.get('{"rotate90Input"|elementId}').click(){/capture}
    {capture assign="smarty.RotatePhotoBlock.links.2.text"}{g->text text="Rotate 90&deg;"}{/capture}
  {/if}
</div>

{* Ajax callback output *}
{if GalleryUtilities::isCallback()}
  {capture append="smarty.output"}
    YAHOO.util.Dom.get("{"serialNumberInput"|elementId}").value =
      {$RotatePhotoBlock.item.serialNumber};
    YAHOO.util.Dom.get("{"hidden"|elementId}").innerHTML =
      '{g->image item=$RotatePhotoBlock.item
        image=$RotatePhotoBlock.image
	class=$RotatePhotoBlock.class
	id="hiddenImage"|elementId}';
    var hiddenImage = YAHOO.util.Dom.get("{"hiddenImage"|elementId}");
    YAHOO.util.Event.addListener(hiddenImage, "load", function(event, self) {ldelim}
      var image = YAHOO.util.Dom.get("{$RotatePhotoBlock.id}");
      image.parentNode.replaceChild(hiddenImage, image);
      hiddenImage.id = "{$RotatePhotoBlock.id}";
    {rdelim}, RotatePhotoBlock);

    {if empty($status.editMessage) && empty($status.warning) && empty($form.error)}
      GalleryUtilities.hide("{"status"|elementId}");
    {else}
      GalleryUtilities.show("{"status"|elementId}");
    {/if}

    {if empty($status.editMessage)}
      GalleryUtilities.hide("{"success"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"success"|elementId}").innerHTML = "{$status.editMessage}";
      GalleryUtilities.show("{"success"|elementId}");
    {/if}

    {if empty($status.warning)}
      GalleryUtilities.hide("{"warning"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"warning"|elementId}").innerHTML = "{$status.warning|@implode:""}";
      GalleryUtilities.show("{"warning"|elementId}");
    {/if}

    {if empty($form.error)}
      GalleryUtilities.hide("{"error"|elementId}");
    {else}
      GalleryUtilities.show("{"error"|elementId}");
    {/if}
  {/capture}
{/if}
