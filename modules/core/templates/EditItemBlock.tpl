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
      <img class="giWorking" id="{"working"|elementId}" style="display: none" alt="{g->text text="Saving changes..."}" src="{g->url href="themes/ajaxian/images/working-hard.gif"}"/>

      <img class="giSuccess" id="{"success"|elementId}"{if empty($status.editMessage)} style="display: none"{/if} alt="{$status.editMessage}" src="{g->url href="install/images/ico_success.gif"}"/>

      <img class="giWarning" id="{"warning"|elementId}"{if empty($status.warning)} style="display: none"{/if} alt="{$status.warning|@implode:""}" src="{g->url href="install/images/ico_warning.gif"}"/>

      <img class="giError" id="{"error"|elementId}"{if empty($form.error)} style="display: none"{/if} alt="{g->text text="There was a problem processing your request"}" src="{g->url href="install/images/ico_error.gif"}"/>
    </span>
  {/capture}
{else}
  <div class="{$class}">
    {if !empty($EditItemBlock.item[$EditItemBlock.property])}
      {if !$EditItemBlock.item.permissions.core_edit}
	{$content}
      {else}

	{* TODO Fix CSS *}
	<a id="{"link"|elementId}" style="color: black{if $EditItemBlock.property != 'title'}; font-weight: normal{/if}" href="javascript:GalleryUtilities.hide('{"status"|elementId}'); GalleryUtilities.hide('{"link"|elementId}'); GalleryUtilities.show('{"form"|elementId}')" title="Click to edit">
	  {$content}
	</a>

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
	    <input class="inputTypeSubmit" id="{"undoInput"|elementId}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Reset"}"/>
	  </div>
	</form>

	<script type="text/javascript">
	  // <![CDATA[

	  var EditItemBlock_{$templateId|replace:"-":"_"} = new EditItemBlock();
	  EditItemBlock_{$templateId|replace:"-":"_"}.templateId = "{$templateId}";

	  {* Register template's submit function with submit buttons *}
	  YAHOO.util.Event.addListener(["{"saveInput"|elementId}", "{"undoInput"|elementId}"],
	    "click", function(event, self) {ldelim}
	      EditItemBlock_{$templateId|replace:"-":"_"}.submit(
	        {ldelim}item: {ldelim}id: {$EditItemBlock.item.id}{rdelim},
		  property: "{$EditItemBlock.property}"{rdelim}, YAHOO.util.Event.getTarget(event),
		self);
	      YAHOO.util.Event.preventDefault(event);
	    {rdelim}, EditItemBlock_{$templateId|replace:"-":"_"});

	  new YAHOO.widget.Tooltip("{"tooltip"|elementId}", {ldelim}context: "{"link"|elementId}"{rdelim});

	  // ]]>
	</script>
      {/if}
    {/if}
  </div>
{/if}

{* Ajax callback output *}
{if GalleryUtilities::isCallback()}
  {capture append="smarty.output"}
    YAHOO.util.Dom.get("{"value"|elementId}").innerHTML =
      "{$EditItemBlock.item[$EditItemBlock.property]|markup|entitytruncate:256}";

    YAHOO.util.Dom.batch(
      YAHOO.util.Dom.getElementsByClassName("serialNumberInput-{$EditItemBlock.item.id}"),
      function(element) {ldelim}
	element.value = {$EditItemBlock.item.serialNumber};
      {rdelim});

    GalleryUtilities.hide("{"working"|elementId}");

    {if empty($status.editMessage) && empty($status.warning) && empty($form.error)}
      GalleryUtilities.hide("{"status"|elementId}");
    {else}
      GalleryUtilities.show("{"status"|elementId}");
    {/if}

    {if empty($status.editMessage)}
      GalleryUtilities.hide("{"success"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"success"|elementId}").alt = "{$status.editMessage}";
      GalleryUtilities.show("{"success"|elementId}");
    {/if}

    {if empty($status.warning)}
      GalleryUtilities.hide("{"warning"|elementId}");
    {else}
      YAHOO.util.Dom.get("{"warning"|elementId}").alt = "{$status.warning|@implode:""}";
      GalleryUtilities.show("{"warning"|elementId}");
    {/if}

    {if empty($form.error)}
      GalleryUtilities.hide("{"error"|elementId}");
    {else}
      GalleryUtilities.show("{"error"|elementId}");
    {/if}
  {/capture}
{/if}
