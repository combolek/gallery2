{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}

{if !empty($head.javascript['lib/javascript/ItemAdmin.js'])}
  <script>
    // <![CDATA[

    var ItemAdmin_{$templateId|replace:"-":"_"} = new ItemAdmin();
    {if !empty($templateId)}
      ItemAdmin_{$templateId|replace:"-":"_"}.templateId = "{$templateId}";
    {/if}

    {* Register template's request handler with custom request event *}
    GalleryUtilities.requestEvent.subscribe(
      ItemAdmin_{$templateId|replace:"-":"_"}.handleRequest,
      ItemAdmin_{$templateId|replace:"-":"_"});

    {* Register template's response handler with custom response event *}
    GalleryUtilities.responseEvent.subscribe(
      ItemAdmin_{$templateId|replace:"-":"_"}.handleResponse,
      ItemAdmin_{$templateId|replace:"-":"_"});

    // ]]>
  </script>
{/if}

<table width="100%" cellspacing="0" cellpadding="0"><tr valign="top">
  <td id="gsSidebarCol">
    <div id="gsSidebar" class="gcBorder1">
      {if !empty($theme.item.parendId) || !empty($ItemAdmin.thumbnail)}
	<div class="gbBlock">
	  {if empty($ItemAdmin.thumbnail)}
	    {g->text text="No Thumbnail"}
	  {else}
	    {g->block type="core.RotatePhotoBlock"
	      RotatePhotoBlock.item=$theme.item
	      RotatePhotoBlock.image=$ItemAdmin.thumbnail
	      RotatePhotoBlock.maxSize=130} {$smarty.RotatePhotoBlock.status}

	    <span style="display: none"> {$smarty.RotatePhotoBlock.form} </span>
	  {/if}

	  {g->container type="core.EditItemBlock"
	      EditItemBlock.item=$theme.item
	      EditItemBlock.property="title}
	    <h3> {$EditItemBlock.value} </h3>
	  {/g->container}
	</div>
      {/if}

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

      {g->block type="core.NavigationLinks" class="gbBlock" navigationLinks=$ItemAdmin.navigationLinks}
    </div>
  </td><td>
    <div id="gsContent" class="gcBorder1">
      <form id="{"form"|elementId}" action="{g->url}" method="post" enctype="{$ItemAdmin.enctype|default:"application/x-www-form-urlencoded"}">
	<div>
	  {g->hiddenFormVars}
	  <input name="{"controller"|formVar}" type="hidden" value="{$controller}"/>
	  <input name="{"form[formName]"|formVar}" type="hidden" value="{$form.formName}"/>
	  <input name="{"itemId"|formVar}" type="hidden" value="{$theme.item.id}"/>
	</div>

	{include file="gallery:`$ItemAdmin.viewBodyFile`" l10Domain=$ItemAdmin.viewL10Domain}
      </form>
    </div>
  </td>
</tr></table>
