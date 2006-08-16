{*
 * $Revision: 12540 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !isset($content)}
  {capture assign="EditItemBlock.value"}<span id="{"value"|elementId}"> {$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256} </span>{/capture}

  {capture assign="EditItemBlock.status"}
    <span id="{"status"|elementId}"{if empty($status.editMessage) && empty($status.warning) && empty($form.error)} style="display: none"{/if}>
      <img class="giWorking" id="{"working"|elementId}" style="display: none" src="{g->url href="themes/ajaxian/images/working-hard.gif"}" title="{g->text text="Saving changes..."}"/>

      <img class="giSuccess" id="{"success"|elementId}"{if empty($status.editMessage)} style="display: none"{/if} src="{g->url href="install/images/ico_success.gif"}" title="{$status.editMessage}"/>

      <img class="giWarning" id="{"warning"|elementId}"{if empty($status.warning)} style="display: none"{/if} src="{g->url href="install/images/ico_warning.gif"}" title="{$status.warning|@implode:""}"/>

      <img class="giError" id="{"error"|elementId}"{if empty($form.error)} style="display: none"{/if} src="{g->url href="install/images/ico_error.gif"}" title="{g->text text="There was a problem processing your request"}"/>
    </span>
  {/capture}
{else}
  <div class="{$class}">
    {if !empty($EditItemBlock.item[$EditItemBlock.property])}
      {if !$EditItemBlock.item.permissions.core_edit}
	{$content}
      {else}
	<span id="{"link"|elementId}" title="{g->text text="Click to edit"}"> {$content} </span>

	<form id="{"form"|elementId}" style="display: none" action="{g->url}" method="post" enctype="{$EditItemBlock.enctype|default:"application/x-www-form-urlencoded"}">
	  {g->hiddenFormVars}
	  <input name="{"controller"|formVar}" type="hidden" value="core.ItemEdit"/>
	  <input name="{"itemId"|formVar}" type="hidden" value="{$EditItemBlock.item.id}"/>
	  <input name="{"editPlugin"|formVar}" type="hidden" value="ItemEditItem"/>
	  <input class="serialNumberInput-{$EditItemBlock.item.id}" name="{"form[serialNumber]"|formVar}" type="hidden" value="{$EditItemBlock.item.serialNumber}"/>
	  {include file="gallery:modules/core/templates/MarkupBar.tpl" viewL10domain="modules_core" element="textInput"|elementId}
	  <input id="{"textInput"|elementId}" name="{"form[`$EditItemBlock.property`]"|formVar}" type="text" value="{$EditItemBlock.item[$EditItemBlock.property]}"/>

	  <div class="gbBlock gcBackground1">
	    <input class="inputTypeSubmit" id="{"saveInput"|elementId}" name="{"form[action][save]"|formVar}" type="submit" value="{g->text text="Save"}"/>
	    <input class="inputTypeSubmit" id="{"undoInput"|elementId}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Cancel"}"/>
	  </div>
	</form>

	{if !empty($head.javascript['lib/javascript/EditItemBlock.js'])}
	  <script type="text/javascript">
	    // <![CDATA[

	    var EditItemBlock_{$templateId|replace:"-":"_"} = new EditItemBlock();
	    {if !empty($templateId)}
	      EditItemBlock_{$templateId|replace:"-":"_"}.templateId = "{$templateId}";
	    {/if}

	    YAHOO.util.Event.addListener("{"link"|elementId}", "click", function(event, self) {ldelim}
		GalleryUtilities.hide("{"link"|elementId}");
		GalleryUtilities.hide("{"status"|elementId}");
		GalleryUtilities.show("{"form"|elementId}");
		YAHOO.util.Dom.get("{"textInput"|elementId}").focus();
		YAHOO.util.Dom.get("{"textInput"|elementId}").select();
	      {rdelim}, EditItemBlock_{$templateId|replace:"-":"_"});

	    {* Register template's submit function with submit buttons *}
	    YAHOO.util.Event.addListener("{"saveInput"|elementId}",
	      "click", function(event, self) {ldelim}
		  EditItemBlock_{$templateId|replace:"-":"_"}.submit(
		    {ldelim}EditItemBlock: {ldelim}item: {ldelim}id: {$EditItemBlock.item.id}{rdelim},
		      property: "{$EditItemBlock.property}"{rdelim}{rdelim},
		    YAHOO.util.Event.getTarget(event), self);

		  YAHOO.util.Event.preventDefault(event);
		{rdelim}, EditItemBlock_{$templateId|replace:"-":"_"});

	    YAHOO.util.Event.addListener("{"undoInput"|elementId}",
	      "click", function(event, self) {ldelim}
		  YAHOO.util.Dom.get("{"link"|elementId}").title = "{g->text text="Click to edit"}";
		  GalleryUtilities.hide("{"status"|elementId}");
		  GalleryUtilities.hide("{"form"|elementId}");
		  GalleryUtilities.show("{"link"|elementId}");
		  YAHOO.util.Event.preventDefault(event);
		{rdelim}, EditItemBlock_{$templateId|replace:"-":"_"});

	    {* Register template's request handler with custom request event *}
	    GalleryUtilities.requestEvent.subscribe(
	      EditItemBlock_{$templateId|replace:"-":"_"}.handleRequest,
	      EditItemBlock_{$templateId|replace:"-":"_"});

	    {* Register template's response handler with custom response event *}
	    GalleryUtilities.responseEvent.subscribe(
	      EditItemBlock_{$templateId|replace:"-":"_"}.handleResponse,
	      EditItemBlock_{$templateId|replace:"-":"_"});

	    {* TODO Move to init function *}
	    new YAHOO.widget.Tooltip("{"linkTooltip"|elementId}", {ldelim}context: "{"link"|elementId}"{rdelim});

	    new YAHOO.widget.Tooltip("{"workingTooltip"|elementId}", {ldelim}context: "{"working"|elementId}"{rdelim});
	    new YAHOO.widget.Tooltip("{"successTooltip"|elementId}", {ldelim}context: "{"success"|elementId}"{rdelim});
	    new YAHOO.widget.Tooltip("{"warningTooltip"|elementId}", {ldelim}context: "{"warning"|elementId}"{rdelim});
	    new YAHOO.widget.Tooltip("{"errorTooltip"|elementId}", {ldelim}context: "{"error"|elementId}"{rdelim});

	    // ]]>
	  </script>
	{/if}
      {/if}
    {/if}
  </div>
{/if}

{* Ajax callback output *}
{if GalleryUtilities::isCallback()}
  {capture append="smarty.output"}
    YAHOO.util.Dom.get("{"value"|elementId}").innerHTML =
      "{$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256}";

    {if empty($status.editMessage) && empty($status.warning) && empty($form.error)}
      YAHOO.util.Dom.get("{"link"|elementId}").title = "{g->text text="Click to edit"}";
      GalleryUtilities.hide("{"status"|elementId}");
    {else}
      GalleryUtilities.show("{"status"|elementId}");
    {/if}

    GalleryUtilities.hide("{"working"|elementId}");

    {if empty($status.editMessage)}
      GalleryUtilities.hide("{"success"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"link"|elementId}").title = "{$status.editMessage}";
      {*YAHOO.util.Dom.get("{"success"|elementId}").title = "{$status.editMessage}";*}
      GalleryUtilities.show("{"success"|elementId}");
    {/if}

    {if empty($status.warning)}
      GalleryUtilities.hide("{"warning"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"link"|elementId}").title = "{$status.warning|@implode:""}";
      {*YAHOO.util.Dom.get("{"warning"|elementId}").title = "{$status.warning|@implode:""}";*}
      GalleryUtilities.show("{"warning"|elementId}");
    {/if}

    {if empty($form.error)}
      GalleryUtilities.hide("{"error"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"link"|elementId}").title = "{g->text text="There was a problem processing your request"}";
      GalleryUtilities.show("{"error"|elementId}");
    {/if}

    YAHOO.util.Dom.batch(
      YAHOO.util.Dom.getElementsByClassName("serialNumberInput-{$EditItemBlock.item.id}"),
      function(element) {ldelim}
	  element.value = {$EditItemBlock.item.serialNumber};
	{rdelim});
  {/capture}
{/if}
