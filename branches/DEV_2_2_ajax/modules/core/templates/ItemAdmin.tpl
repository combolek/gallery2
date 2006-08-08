{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<form id="{"form"|elementId}" action="{g->url}" method="post" enctype="{$ItemAdmin.enctype|default:"application/x-www-form-urlencoded"}">
  <div>
    {g->hiddenFormVars}
    <input name="{"controller"|formVar}" type="hidden" value="{$controller}"/>
    <input name="{"form[formName]"|formVar}" type="hidden" value="{$form.formName}"/>
    <input name="{"itemId"|formVar}" type="hidden" value="{$ItemAdmin.item.id}"/>
  </div>

  <table width="100%" cellspacing="0" cellpadding="0"><tr valign="top">
    <td id="gsSidebarCol"><div id="gsSidebar" class="gcBorder1">
      <div class="gbBlock" id="{"thumbnailDiv"|elementId}"{if empty($ItemAdmin.item.parendId) && empty($ItemAdmin.thumbnail)} style="display: none"{/if}>
	<span id="{"noThumbnail"|elementId}"{if !empty($ItemAdmin.thumbnail)} style="display: none"{/if}> {g->text text="No Thumbnail"} </span>
	<img id="{"thumbnailImage"|elementId}"{if empty($ItemAdmin.thumbnail)} style="display: none"{/if} src="{$ItemAdmin.thumbnail.src}" width="{$ItemAdmin.thumbnail.width}" height="{$ItemAdmin.thumbnail.height}"/>
	<h3> {$ItemAdmin.item.title|markup} </h3>
      </div>

      <div class="gbBlock">
	<h2> {g->text text="Options"} </h2>
	<ul>
	  {foreach from=$ItemAdmin.subViewChoices key=choiceName item=choiceParams}
	    <li class="gbAdminLink {g->linkId urlParams=$choiceParams}">
	      {if isset($choiceParams.active)}
		{$choiceName}
	      {else}
		<a href="{g->url params=$choiceParams}"> {$choiceName} </a>
	      {/if}
	    </li>
	  {/foreach}
	</ul>
      </div>

      {g->block type="core.NavigationLinks"
        class="gbBlock"
	navigationLinks=$ItemAdmin.navigationLinks}
    </div></td>

    <td>
      <div id="gsContent" class="gcBorder1">
	{include file="gallery:`$ItemAdmin.viewBodyFile`" l10Domain=$ItemAdmin.viewL10Domain}
      </div>
    </td>
  </tr></table>
</form>

{* Ajax callback output *}
{if GalleryUtilities::isCallback()}
  {capture append="smarty.output"}
    ItemAdmin.update({ldelim}item: {ldelim}parentId: {$ItemAdmin.item.parentId}{rdelim},
      thumbnail: {ldelim}src: "{$ItemAdmin.thumbnail.src|replace:"&amp;":"&"}",
	width: {$ItemAdmin.thumbnail.width},
	height: {$ItemAdmin.thumbnail.height}{rdelim}{rdelim});
  {/capture}
{/if}
