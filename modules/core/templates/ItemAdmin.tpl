{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<script type="text/javascript">
  // <![CDATA[

  {* Template's client-side variables & functions *}
  var ItemAdmin = {ldelim}

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
      if (YAHOO.util.Event.getTarget(event).name ==
	  "{"form[action][rotate][counterClockwise]"|formVar}") {ldelim}
	YAHOO.util.Dom.get("{"thumbnailImage"|elementId}").style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";
      {rdelim} else if (YAHOO.util.Event.getTarget(event).name ==
	  "{"form[action][rotate][flip]"|formVar}") {ldelim}
	YAHOO.util.Dom.get("{"thumbnailImage"|elementId}").style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";
      {rdelim} else if (YAHOO.util.Event.getTarget(event).name ==
	  "{"form[action][rotate][clockwise]"|formVar}") {ldelim}
	YAHOO.util.Dom.get("{"thumbnailImage"|elementId}").style.filter =
	  "progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";
      {rdelim}

      {* Serialize form elements *}
      var args = GalleryUtilities.serializeForm(form, YAHOO.util.Event.getTarget(event));
      args.push("{"callback"|formVar}=callback");

      {* Make Ajax callback request *}
      GalleryUtilities.callbackRequest("{g->url}", args);

      YAHOO.util.Event.preventDefault(event);
    {rdelim},

    {* Update template's dynamic elements *}
    update: function(ItemAdmin) {ldelim}
      if (ItemAdmin != null) {ldelim}
	if (ItemAdmin.item.parentId == null &&
	    ItemAdmin.thumbnail == null) {ldelim}
	  YAHOO.util.Dom.get("{"thumbnailDiv"|elementId}").style.display = "none";
	{rdelim} else {ldelim}
	  YAHOO.util.Dom.get("{"thumbnailDiv"|elementId}").style.display = "";
	{rdelim}

	if (ItemAdmin.thumbnail == null) {ldelim}
	  YAHOO.util.Dom.get("{"thumbnailImage"|elementId}").style.display = "none";
	  YAHOO.util.Dom.get("{"noThumbnail"|elementId}").style.display = "";
	{rdelim} else {ldelim}
	  var img = document.createElement("img");

	  {* TODO Why doesn't this work?
	  YAHOO.util.Event.addListener(img, "onload", function(event, self) {ldelim}
	  *}
	  img.onload = function() {ldelim}
	    img.width = ItemAdmin.thumbnail.width;
	    img.height = ItemAdmin.thumbnail.height;
	    YAHOO.util.Dom.get("{"thumbnailDiv"|elementId}").replaceChild(img,
	      YAHOO.util.Dom.get("{"thumbnailImage"|elementId}"));
	    img.id = "{"thumbnailImage"|elementId}";
	    YAHOO.util.Dom.get("{"noThumbnail"|elementId}").style.display = "none";
	    YAHOO.util.Dom.get("{"thumbnailImage"|elementId}").style.display = "";
	  {rdelim};
	  {*
	  {rdelim}, this);
	  *}
	  img.src = ItemAdmin.thumbnail.src;
	{rdelim}
      {rdelim}
    {rdelim}
  {rdelim};

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}

      {* TODO Move to Ajax event listener so form is also enabled on failure *}
      {* Enable template's form *}
      YAHOO.util.Dom.batch(YAHOO.util.Dom.get("{"form"|elementId}").elements,
          function(element) {ldelim}
	element.disabled = "";
      {rdelim});

      ItemAdmin.update({ldelim}item: {ldelim}parentId: {$ItemAdmin.item.parentId}{rdelim},
	thumbnail: {ldelim}src: "{$ItemAdmin.thumbnail.src|replace:"&amp;":"&"}",
	  width: {$ItemAdmin.thumbnail.width},
	  height: {$ItemAdmin.thumbnail.height}{rdelim}{rdelim});
    {/capture}
  {/if}

  // ]]>
</script>

<form id="{"form"|elementId}" action="{g->url}" method="post" enctype="{$ItemAdmin.enctype}">
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

      {g->block type="core.NavigationLinks" class="gbBlock"
	navigationLinks=$ItemAdmin.navigationLinks}
    </div></td>

    <td>
      <div id="gsContent" class="gcBorder1">
	{include file="gallery:`$ItemAdmin.viewBodyFile`" l10Domain=$ItemAdmin.viewL10Domain}
      </div>
    </td>
  </tr></table>
</form>
