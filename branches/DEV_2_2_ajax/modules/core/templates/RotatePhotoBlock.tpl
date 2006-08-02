{*
 * $Revision: 12540 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !isset($content)}
  {assign smarty.Gallery.image.ids.0="thumbnail-$RotatePhotoBlock.item.id"}
{else}
<div class="{$class}">
  {$content}

  {if $RotatePhotoBlock.item.permissions.core_edit}
    {capture assign="smarty.RotatePhotoBlock.form"}
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
    {/capture}

    {capture assign="smarty.RotatePhotoBlock.links.0.text"}
      {g->text text="Rotate -90&deg;"}
    {/capture}
    {capture assign="smarty.RotatePhotoBlock.links.0.script"}
      YAHOO.util.Dom.get('{"rotate-90Input"|elementId}').click()
    {/capture}
    {capture assign="smarty.RotatePhotoBlock.links.1.text"}
      {g->text text="Rotate 180&deg;"}
    {/capture}
    {capture assign="smarty.RotatePhotoBlock.links.1.script"}
      YAHOO.util.Dom.get('{"rotate180Input"|elementId}').click()
    {/capture}
    {capture assign="smarty.RotatePhotoBlock.links.2.text"}
      {g->text text="Rotate 90&deg;"}
    {/capture}
    {capture assign="smarty.RotatePhotoBlock.links.2.script"}
      YAHOO.util.Dom.get('`"rotate90Input"|elementId`').click()
    {/capture}

<script type="text/javascript">
  // <![CDATA[

  {**
   * Template's client-side variables & functions
   *}
  var RotatePhotoBlock_{$templateId|replace:"-":"_"} = {ldelim}

    {**
     * Submit template's form using Ajax
     *
     * @param {event} event which triggered the form's submision
     * @param {Object} self reference, since function will be executed in scope of the event target
     *}
    submit: function(event, self) {ldelim}
      if (!GalleryUtilities.isCallbackSupported()) {ldelim}
	return;
      {rdelim}

      var form = YAHOO.util.Dom.get("{"form"|elementId}");

      {* Disable template's form *}
      YAHOO.util.Dom.batch(form.elements, function(element) {ldelim}
	element.blur();
	element.disabled = "disabled";
      {rdelim});

      {* Give immediate feedback if possible *}
      if (YAHOO.util.Event.getTarget(event).name ==
	  "{"form[action][rotate][-90]"|formVar}") {ldelim}
	YAHOO.util.Dom.get("{$smarty.Gallery.image.ids.1}").style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";
      {rdelim} else if (YAHOO.util.Event.getTarget(event).name ==
	  "{"form[action][rotate][180]"|formVar}") {ldelim}
	YAHOO.util.Dom.get("{$smarty.Gallery.image.ids.1}").style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";
      {rdelim} else if (YAHOO.util.Event.getTarget(event).name ==
	  "{"form[action][rotate][90]"|formVar}") {ldelim}
	YAHOO.util.Dom.get("{$smarty.Gallery.image.ids.1}").style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
      {rdelim}

      {* Serialize form elements *}
      var args = GalleryUtilities.serializeForm(form, YAHOO.util.Event.getTarget(event));
      args.push("{"callback"|formVar}=callback");

      {g->formVars name="delegate" value=$RotatePhotoBlock.delegate}
      args.push("{$name}={$value}");
      {/g->formVars}

      {* Make Ajax callback request *}
      GalleryUtilities.callbackRequest("{g->url}", args);

      YAHOO.util.Event.preventDefault(event);
    {rdelim}
  {rdelim};

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"rotate-90Input"|elementId}", "{"rotate180Input"|elementId}", "{"rotate90Input"|elementId}"], "click", RotatePhotoBlock_{$templateId|replace:"-":"_"}.submit("{$templateId}"), RotatePhotoBlock_{$templateId|replace:"-":"_"});

  {* Register with all callback responses *}
  GalleryUtilities.callbackEvent.subscribe(function(type, args) {ldelim}
    var response = args[0];

    {* Enable template's form *}
    YAHOO.util.Dom.batch(YAHOO.util.Dom.get("{"form"|elementId}").elements,
	function(element) {ldelim}
      element.disabled = "";
    {rdelim});

    if (!GalleryUtilities.isResponseSuccessful(response)) {ldelim}
      GalleryUtilities.show("{"status"|elementId}");
      GalleryUtilities.hide("{"success"|elementId}");
      GalleryUtilities.hide("{"warning"|elementId}");
      GalleryUtilities.show("{"error"|elementId}");
    {rdelim}
  {rdelim});

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      YAHOO.util.Dom.get("{"serialNumberInput"|elementId}").value = {$RotatePhotoBlock.item.serialNumber};

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
	GalleryUtilities.hide("{"warning"|elementId}").style.display = "none";
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

  // ]]>
</script>
  {/if}
</div>
{/if}
