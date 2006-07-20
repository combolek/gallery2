{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}

{* Ajax callback output *}
{if GalleryUtilities::isCallback()}
  {capture append="smarty.output"}
    YAHOO.util.Dom.get("{"serialNumberInput"|elementId}").value = {$form.serialNumber};
    {if empty($status.editMessage) && empty($status.warning) && empty($form.error)}
      YAHOO.util.Dom.get("{"status"|elementId}").style.display = "none";
    {else}
      YAHOO.util.Dom.get("{"status"|elementId}").style.display = "";
    {/if}

    {if empty($status.editMessage)}
      YAHOO.util.Dom.get("{"success"|elementId}").style.display = "none";
    {else}
      YAHOO.util.Dom.get("{"success"|elementId}").innerHTML = "{$status.editMessage}";
      YAHOO.util.Dom.get("{"success"|elementId}").style.display = "";
    {/if}

    {if empty($status.warning)}
      YAHOO.util.Dom.get("{"warning"|elementId}").style.display = "none";
    {else}
      YAHOO.util.Dom.get("{"warning"|elementId}").innerHTML = "{$status.warning|@implode:""}";
      YAHOO.util.Dom.get("{"warning"|elementId}").style.display = "";
    {/if}

    {if empty($form.error)}
      YAHOO.util.Dom.get("{"error"|elementId}").style.display = "none";
    {else}
      YAHOO.util.Dom.get("{"error"|elementId}").style.display = "";
    {/if}
  {/capture}
{/if}

<div class="gbBlock gcBackground1">
  <h2> {g->text text="Edit %s" arg1=$ItemEdit.itemTypeNames.0} </h2>
</div>

<input name="{"editPlugin"|formVar}" type="hidden" value="{$ItemEdit.editPlugin}"/>
<input id="{"serialNumberInput"|elementId}" name="{"form[serialNumber]"|formVar}" type="hidden" value="{$form.serialNumber}"/>

<div class="gbBlock" id="{"status"|elementId}"{if empty($status.editMessage) && empty($status.warning) && empty($form.error)} style="display: none"{/if}>
  <h2 class="giSuccess" id="{"success"|elementId}"{if empty($status.editMessage)} style="display: none"{/if}> {$status.editMessage} </h2>

  <div class="giWarning" id="{"warning"|elementId}"{if empty($status.warning)} style="display: none"{/if}>
    {foreach from=$status.warning item=warning}
      {$warning}
    {/foreach}
  </div>

  <h2 class="giError" id="{"error"|elementId}"{if empty($form.error)} style="display: none"{/if}> {g->text text="There was a problem processing your request"} </h2>
</div>

<div class="gbTabBar">
  {foreach from=$ItemEdit.plugins item=plugin}
    {if $plugin.isSelected}
      <span class="giSelected o"><span>
	{$plugin.title}
      </span></span>
    {else}
      <span class="o"><span>
	<a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemEdit"
	 arg3="itemId=`$ItemAdmin.item.id`" arg4="editPlugin=`$plugin.id`"}">
	  {$plugin.title}
	</a>
      </span></span>
    {/if}
  {/foreach}
</div>

{include file="gallery:`$ItemEdit.pluginFile`" l10Domain=$ItemEdit.pluginL10Domain}
