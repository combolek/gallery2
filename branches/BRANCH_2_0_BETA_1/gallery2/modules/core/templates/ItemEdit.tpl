{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <h2 class="giTitle">
	{g->text text="Edit %s" arg1=$ItemEdit.itemTypeNames.0}
      </h2>
    </div>
    
  </div>
  <input type="hidden" name="{g->formVar var="editPlugin"}" value="{$ItemEdit.editPlugin}"/>
  <input type="hidden" name="{g->formVar var="form[serialNumber]"}" value="{$form.serialNumber}"/>

  {if !empty($status) || !empty($form.error)}
  <div id="gsStatus">
    {if !empty($status)}
    {if !empty($status.editMessage)}
    <div class="giStatus">
      {if isset($status.editMessage)}
      {$status.editMessage}
      {/if}
    </div>
    {/if}
    {if !empty($status.warning)}
    <div class="giWarning">
      {foreach from=$status.warning item=warning}
      {$warning}
      {/foreach}
    </div>
    {/if}
    {/if}
    {if !empty($form.error)}
    <div class="giError">
      {g->text text="There was a problem processing your request."}
    </div>
    {/if}
  </div>
  {/if}

  <div class="gbAdmin">
    <div class="gbTabBar">
      <ul>
	{foreach from=$ItemEdit.plugins item=plugin} 
	{if $plugin.isSelected}
	<li class="giSelectedTab">
	  <span>
	  {$plugin.title}
	  </span>
	</li>
        {else}
        <li>
          <span>
	  <a href="{g->url arg1="view=core:ItemAdmin" arg2="subView=core:ItemEdit" arg3="itemId=`$ItemAdmin.item.id`" arg4="editPlugin=`$plugin.id`"}">
	    {$plugin.title}
	  </a>
          </span>
        </li>
        {/if}
        {/foreach}
      </ul>
    </div>

    {include file="gallery:`$ItemEdit.pluginFile`" l10Domain=$ItemAdmin.viewL10Domain}

  </div>
</div>
