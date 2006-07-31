{*
 * $Revision: 12540 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="{$class}">
  {if !empty($EditItemBlock.item[$EditItemBlock.property])}
    {if !$EditItemBlock.item.permissions.core_edit}
      <p class="{if $EditItemProperty == 'title'}giTitle{else}giDescription{/if}">
	{if !empty($EditItemBlock.text)}
	  {$EditItemBlock.text}
	{else}
	  {$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256}
	{/if}
      </p>
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

      <p class="{if $EditItemBlock.property == 'title'}giTitle{else}giDescription{/if}" id="{"text"|elementId}">

	{* TODO Fix CSS *}
        <a id="{"link"|elementId}" style="color: black{if $EditItemBlock.property != 'title'}; font-weight: normal{/if}; text-decoration: none" href="javascript:GalleryUtilities.hide('{"status"|elementId}'); GalleryUtilities.hide('{"text"|elementId}'); GalleryUtilities.show('{"form"|elementId}')">
	  {if !empty($EditItemBlock.text)}
	    {$EditItemBlock.text}
	  {else}
	    {$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256}
	  {/if}
	</a>
      </p>

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

  {* Template's client-side variables & functions *}
  var EditItemBlock_{$templateId|replace:"-":"_"} = {ldelim}

    {* Submit template's form using Ajax *}
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
      YAHOO.util.Dom.get("{"link"|elementId}").innerHTML = "{g->text text="Saving..."}";
      GalleryUtilities.hide("{"form"|elementId}");
      GalleryUtilities.show("{"text"|elementId}");

      {* Serialize form elements *}
      var args = GalleryUtilities.serializeForm(form, YAHOO.util.Event.getTarget(event));
      args.push("{"callback"|formVar}=callback");

      {g->formVars name="delegate" value=$EditItemBlock.navigationReturnUrl}
      args.push("{$name}={$value}");
      {/g->formVars}

      {* Make Ajax callback request *}
      GalleryUtilities.callbackRequest("{g->url}", args);

      YAHOO.util.Event.preventDefault(event);
    {rdelim}
  {rdelim};

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"saveInput"|elementId}", "{"undoInput"|elementId}"], "click", EditItemBlock_{$templateId|replace:"-":"_"}.submit, EditItemBlock_{$templateId|replace:"-":"_"});

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if !empty($EditItemBlock.text)}
	YAHOO.util.Dom.get("{"link"|elementId}").innerHTML = "{$EditItemBlock.text}";
      {else}
	YAHOO.util.Dom.get("{"link"|elementId}").innerHTML = "{$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256}";
      {/if}

      {* TODO Move to Ajax event listener so form is also enabled on failure *}
      {* Enable template's form *}
      YAHOO.util.Dom.batch(YAHOO.util.Dom.get("{"form"|elementId}").elements,
          function(element) {ldelim}
	element.disabled = "";
      {rdelim});

      YAHOO.util.Dom.get("{"serialNumberInput"|elementId}").value = {$EditItemBlock.item.serialNumber};

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
	YAHOO.util.Dom.get("{"warning"|elementId}").style.display = "none";
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
  {/if}
</div>
