{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<table width="100%" cellspacing="0" cellpadding="0">
  <tr valign="top">
    {if !empty($theme.params.sidebarBlocks)}
    <td id="gsSidebarCol">
      {g->theme include="sidebar.tpl"}
    </td>
    {/if}
    <td>
      <div id="gsContent" class="gcBorder1">
        <div class="gbBlock gcBackground1">
          <table style="width: 100%">
            <tr>
              <td>
                {if !empty($theme.item.title)}
                <h2> {$theme.item.title|markup} </h2>
                {/if}
                {if !empty($theme.item.description)}
                <p class="giDescription">
                  {$theme.item.description|markup}
                </p>
                {/if}
              </td>
              <td style="width: 30%">
                {g->block type="core.ItemInfo"
                          item=$theme.item
                          showDate=true
                          showSize=true
                          showOwner=true
                          class="giInfo"}
              </td>
            </tr>
          </table>
        </div>

        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbNavigator">
          {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
        </div>
        {/if}

        {if !count($theme.children)}
        <div class="gbBlock giDescription gbEmptyAlbum">
          <h3 class="emptyAlbum">
	    {g->text text="This album is empty."}
	    {if isset($theme.permissions.core_addDataItem)}
	    <br/>
              <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
	    {/if}
          </h3>
        </div>
        {else}

        {assign var="childrenInColumnCount" value=0}
        <div class="gbBlock">
          <table id="gsThumbMatrix">
            <tr valign="top">
              {foreach from=$theme.children item=child}

              {* Move to a new row *}
              {if ($childrenInColumnCount == $theme.params.columns)}
            </tr>
            <tr valign="top">
              {assign var="childrenInColumnCount" value=0}
              {/if}

	      {assign var=childrenInColumnCount value="`$childrenInColumnCount+1`"}
	      <td class="{if $child.canContainChildren}giAlbumCell gcBackground1{else}giItemCell{/if}"
		  style="width: {$theme.columnWidthPct}%">
		{if ($child.canContainChildren || $child.entityType == 'GalleryLinkItem')}
		{assign var=frameType value="albumFrame"}
		{else}
		{assign var=frameType value="itemFrame"}
		{/if}
		<div>
		  {if isset($theme.params.$frameType) && isset($child.thumbnail)}
		    {g->container type="imageframe.ImageFrame" frame=$theme.params.$frameType
				  width=$child.thumbnail.width height=$child.thumbnail.height}
		      <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">
			{g->image id="%ID%" item=$child image=$child.thumbnail
			 class="%CLASS% giThumbnail"}
		      </a>
		    {/g->container}
		  {elseif isset($child.thumbnail)}
		    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">
		      {g->image item=$child image=$child.thumbnail class="giThumbnail"}
		    </a>
		  {else}
		    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}"
		       class="giMissingThumbnail">
		      {g->text text="no thumbnail"}
		    </a>
		  {/if}
		</div>

		{g->block type="core.ItemLinks" item=$child links=$child.itemLinks}

		{if !empty($child.title)}
		<p class="giTitle">
		  {if $child.canContainChildren}
		  {g->text text="Album: %s" arg1=$child.title|markup}
		  {else}
		  {$child.title|markup}
		  {/if}
		</p>
		{/if}

                {if !empty($child.summary)}
<div class="gbBlock" id="{"status"|elementId::$child.id}"{if empty($status.editMessage) && empty($status.warning) && empty($form.error)} style="display: none"{/if}>
  <h2 class="giSuccess" id="{"success"|elementId::$child.id}"{if empty($status.editMessage)} style="display: none"{/if}> {$status.editMessage} </h2>

  <div class="giWarning" id="{"warning"|elementId::$child.id}"{if empty($status.warning)} style="display: none"{/if}>
    {foreach from=$status.warning item=warning}
      {$warning}
    {/foreach}
  </div>

  <h2 class="giError" id="{"error"|elementId::$child.id}"{if empty($form.error)} style="display: none"{/if}> {g->text text="There was a problem processing your request"} </h2>
</div>

                <p class="giDescription">
		  <a id="{"summary"|elementId::$child.id}" style="color: black; font-weight: normal; text-decoration: none" href="javascript:GalleryUtilities.hide('{"summary"|elementId::$child.id}'); GalleryUtilities.show('{"summaryForm"|elementId::$child.id}')"> {$child.summary|markup|entitytruncate:256} </a>
		</p>

		<form id="{"summaryForm"|elementId::$child.id}" style="display: none" action="{g->url}" method="post" enctype="{$ItemAdmin.enctype}">{* TODO Fix enctype *}
		  {g->hiddenFormVars}
		  <input name="{"controller"|formVar}" type="hidden" value="core.ItemEdit"/>
		  <input name="{"itemId"|formVar}" type="hidden" value="{$child.id}"/>
		  <input name="{"editPlugin"|formVar}" type="hidden" value="ItemEditItem"/>
		  <input id="{"serialNumberInput"|elementId::$child.id}" name="{"form[serialNumber]"|formVar}" type="hidden" value="{$child.serialNumber}"/>
		  {include file="gallery:modules/core/templates/MarkupBar.tpl" viewL10domain="modules_core" element="summary"|elementId::$child.id}
		  <input id="{"summary"|elementId::$child.id}" name="{"form[summary]"|formVar}" type="text" value="{$child.summary}"/>
		  <div class="gbBlock gcBackground1">
		    <input class="inputTypeSubmit" id="{"saveInput"|elementId::$child.id}" name="{"form[action][save]"|formVar}" type="submit" value="{g->text text="Save"}"/>
		    <input class="inputTypeSubmit" id="{"undoInput"|elementId::$child.id}" name="{"form[action][undo]"|formVar}" type="submit" value="{g->text text="Reset"}"/>
		  </div>
		</form>

<script type="text/javascript">
  // <![CDATA[

  {* Template's client-side variables & functions *}
  var EditSummary_{$child.id} = {ldelim}

    {* Submit template's form using Ajax *}
    submit: function(event, self) {ldelim}
      if (!GalleryUtilities.isCallbackSupported()) {ldelim}
	return;
      {rdelim}

      var form = YAHOO.util.Dom.get("{"summaryForm"|elementId::$child.id}");

      {* Disable template's form *}
      YAHOO.util.Dom.batch(form.elements, function(element) {ldelim}
	element.blur();
	element.disabled = "disabled";
      {rdelim});

      {* Give immediate feedback if possible *}
      YAHOO.util.Dom.get("{"summary"|elementId::$child.id}").innerHTML = "{g->text text="Saving..."}";
      GalleryUtilities.hide("{"summaryForm"|elementId::$child.id}");
      GalleryUtilities.show("{"summary"|elementId::$child.id}");

      {* Serialize form elements *}
      var args = GalleryUtilities.serializeForm(form, YAHOO.util.Event.getTarget(event));
      args.push("{"callback"|formVar}=callback");

      {g->formVars name="delegate" value=$delegate}
      args.push("{$name}={$value}");
      {/g->formVars}

      {* Make Ajax callback request *}
      GalleryUtilities.callbackRequest("{g->url}", args);

      YAHOO.util.Event.preventDefault(event);
    {rdelim}
  {rdelim};

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"saveInput"|elementId::$child.id}", "{"undoInput"|elementId::$child.id}"], "click", EditSummary_{$child.id}.submit, EditSummary_{$child.id});

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      YAHOO.util.Dom.get("{"summary"|elementId::$child.id}").innerHTML = "{$child.summary|markup|entitytruncate:256}";

      {* TODO Move to Ajax event listener so form is also enabled on failure *}
      {* Enable template's form *}
      YAHOO.util.Dom.batch(YAHOO.util.Dom.get("{"summaryForm"|elementId::$child.id}").elements,
          function(element) {ldelim}
	element.disabled = "";
      {rdelim});

      YAHOO.util.Dom.get("{"serialNumberInput"|elementId::$child.id}").value = {$form.serialNumber};

      {if empty($status.editMessage) && empty($status.warning) && empty($form.error)}
	YAHOO.util.Dom.get("{"status"|elementId::$child.id}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"status"|elementId::$child.id}").style.display = "";
      {/if}

      {if empty($status.editMessage)}
	YAHOO.util.Dom.get("{"success"|elementId::$child.id}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"success"|elementId::$child.id}").innerHTML = "{$status.editMessage}";
	YAHOO.util.Dom.get("{"success"|elementId::$child.id}").style.display = "";
      {/if}

      {if empty($status.warning)}
	YAHOO.util.Dom.get("{"warning"|elementId::$child.id}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"warning"|elementId::$child.id}").innerHTML = "{$status.warning|@implode:""}";
	YAHOO.util.Dom.get("{"warning"|elementId::$child.id}").style.display = "";
      {/if}

      {if empty($form.error)}
	YAHOO.util.Dom.get("{"error"|elementId::$child.id}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"error"|elementId::$child.id}").style.display = "";
      {/if}
    {/capture}
  {/if}

  // ]]>
</script>
                {/if}

                {if ($child.canContainChildren && $theme.params.showAlbumOwner) ||
                    (!$child.canContainChildren && $theme.params.showImageOwner)}
                {assign var="showOwner" value=true}
                {else}
                {assign var="showOwner" value=false}
                {/if}
                {g->block type="core.ItemInfo"
                          item=$child
                          showDate=true
			  showOwner=$showOwner
                          showSize=true
       		          showViewCount=true
                          showSummaries=true
                          class="giInfo"}
              </td>
              {/foreach}

              {* flush the rest of the row with empty cells *}
              {section name="flush" start=$childrenInColumnCount loop=$theme.params.columns}
              <td>&nbsp;</td>
              {/section}
            </tr>
          </table>
        </div>
        {/if}

        {if !empty($theme.navigator)}
        <div class="gbBlock gcBackground2 gbNavigator">
          {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
        </div>
        {/if}

        {if !empty($theme.jumpRange)}
        <div id="gsPages" class="gbBlock gcBackground1">
          {g->block type="core.Pager"}
        </div>
        {/if}

        {g->block type="core.GuestPreview" class="gbBlock"}

        {* Our emergency edit link, if the user removes all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkAlbumBlocks=true}

        {* Show any other album blocks (comments, etc) *}
        {foreach from=$theme.params.albumBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}
      </div>
    </td>
  </tr>
</table>
