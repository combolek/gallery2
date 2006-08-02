{*
 * $Revision: 12540 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !isset($content)}
  {capture assign="EditItemBlock.value"}
    <span id="{"value"|elementId}"> {$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256} </span>
  {/capture}
{else}
  <div class="{$class}">
    {if !empty($EditItemBlock.item[$EditItemBlock.property])}
      {if !$EditItemBlock.item.permissions.core_edit}
	{$content}
      {else}
	<div class="gbBlock" id="{"status"|elementId}"{if empty($status.editMessage) && empty($status.warning) && empty($form.error)} style="display: none"{/if}>
	  <h2 class="giSuccess" id="{"success"|elementId}"{if empty($status.editMessage)} style="display: none"{/if}> {$status.editMessage} </h2>

	  <div class="giWarning" id="{"warning"|elementId}"{if empty($status.warning)} style="display: none"{/if}>
	    {foreach from=$status.warning item=warning}
	      {$warning}
	    {/foreach}
	  </div>

	  <h2 class="giError" id="{"error"|elementId}"{if empty($form.error)} style="display: none"{/if}> {g->text text="There was a problem processing your request"} </h2>
	</div>

	{* TODO Fix CSS *}
	<a id="{"link"|elementId}" style="color: black{if $EditItemBlock.property != 'title'}; font-weight: normal{/if}" href="javascript:GalleryUtilities.hide('{"status"|elementId}'); GalleryUtilities.hide('{"link"|elementId}'); GalleryUtilities.show('{"form"|elementId}')">
	  {$content}
	</a>

	<form id="{"form"|elementId}" style="display: none" action="{g->url}" method="post" enctype="{$EditItemBlock.enctype|default:"application/x-www-form-urlencoded"}">
	  {g->hiddenFormVars}
	  <input name="{"controller"|formVar}" type="hidden" value="core.ItemEdit"/>
	  <input name="{"itemId"|formVar}" type="hidden" value="{$EditItemBlock.item.id}"/>
	  <input name="{"editPlugin"|formVar}" type="hidden" value="ItemEditItem"/>
	  <input id="{"serialNumberInput"|elementId}" name="{"form[serialNumber]"|formVar}" type="hidden" value="{$EditItemBlock.item.serialNumber}"/>
	  {include file="gallery:modules/core/templates/MarkupBar.tpl" viewL10domain="modules_core" element="textInput"|elementId}
	  <input id="{"textInput"|elementId}" name="{"form[`$EditItemBlock.property`]"|formVar}" type="text" value="{$EditItemBlock.item[$EditItemBlock.property]}"/>

	  <div class="gbBlock gcBackground1">
	    <input class="inputTypeSubmit" id="{"saveInput"|elementId}" name="{"form[action][save]"|formVar}" type="submit" value="{g->text text="Save"}"/>
	    <input class="inputTypeSubmit" id="{"undoInput"|elementId}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Reset"}"/>
	  </div>
	</form>

  <script type="text/javascript">
    // <![CDATA[

    {**
     * Template's client-side variables & functions
     *}
    var EditItemBlock_{$templateId|replace:"-":"_"} = {ldelim}

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
	YAHOO.util.Dom.get("{"value"|elementId}").innerHTML = "Saving...";
	GalleryUtilities.hide("{"form"|elementId}");
	GalleryUtilities.show("{"link"|elementId}");

	{* Serialize form elements *}
	var args = GalleryUtilities.serializeForm(form, YAHOO.util.Event.getTarget(event));
	args.push("{"callback"|formVar}=callback");

	args.push("{"delegate[view]"|formVar}=core.EditItemBlock");
	args.push("{"delegate[templateId]"|formVar}={$templateId}");
	args.push("{"delegate[itemId]"|formVar}={$EditItemBlock.item.id}");
	args.push("{"delegate[property]"|formVar}={$EditItemBlock.property}");

	{* Make Ajax callback request *}
	GalleryUtilities.callbackRequest("{g->url}", args);

	YAHOO.util.Event.preventDefault(event);
      {rdelim}
    {rdelim};

    {* Register template's submit function with submit buttons *}
    YAHOO.util.Event.addListener(["{"saveInput"|elementId}", "{"undoInput"|elementId}"], "click", EditItemBlock_{$templateId|replace:"-":"_"}.submit, EditItemBlock_{$templateId|replace:"-":"_"});

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

    // ]]>
  </script>
      {/if}
    {/if}
  </div>
{/if}

    {* Ajax callback output *}
    {if GalleryUtilities::isCallback()}
      {capture append="smarty.output"}
	YAHOO.util.Dom.get("{"serialNumberInput"|elementId}").value = {$EditItemBlock.item.serialNumber};
	YAHOO.util.Dom.get("{"value"|elementId}").innerHTML = "{$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256}";

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
