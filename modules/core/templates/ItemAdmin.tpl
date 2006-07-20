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
      if (!YAHOO.util.Connect.getConnectionObject()) {ldelim}
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

      var args = [];
      YAHOO.util.Dom.batch(form.elements, function(element) {ldelim}

	{* Don't serialize form elements without name attributes *}
	if (element.name == "") {ldelim}
	  return;
	{rdelim}

	{* Don't serialize submit elements which weren't clicked *}
	if (element.type.toLowerCase() == "submit" &&
	    element != YAHOO.util.Event.getTarget(event)) {ldelim}
	  return;
	{rdelim}

	{* Serialize form elements *}
	switch (element.type) {ldelim}
	case 'select-one':
	  var option = element.options[element.selectedIndex];
	  var arg = [element.name, option.value];
	  break;
	case 'select-multiple':
	  var value = [];
	  YAHOO.util.Dom.batch(element.options, function(option) {ldelim}
	    if (option.selected) {ldelim}
	      value.push(option.value);
	    {rdelim}
	  {rdelim});
	  var arg = [element.name, value];
	  break;
	case 'checkbox':
	case 'radio':
	  if (element.checked) {ldelim}
	    var arg = [element.name, element.value];
	  {rdelim}
	  break;
	case 'submit':
	case 'hidden':
	case 'password':
	case 'text':
	  var arg = [element.name, element.value];
	  break;
	{rdelim}

	{* Ignore empty arguments *}
	if (arg) {ldelim}
	  args.push(encodeURIComponent(arg[0]) + '=' + encodeURIComponent(arg[1]));
	{rdelim}
      {rdelim});

      args.push("{"callback"|formVar}=callback");

      YAHOO.util.Connect.asyncRequest("POST", "{g->url}", {ldelim}
	success: function(response) {ldelim}

	  {* Enable template's form *}
	  YAHOO.util.Dom.batch(form.elements, function(element) {ldelim}
	    element.disabled = "";
	  {rdelim});

	  if (response.getResponseHeader["Content-Type"] &&
	      response.getResponseHeader["Content-Type"].ltrim().substr(0, 15) ==
	        "text/javascript") {ldelim}
	    eval(response.responseText);
	  {rdelim} else {ldelim}
	    document.open();
	    document.write(response.responseText);
	    document.close();
	  {rdelim}
	{rdelim},

	failure: function(response) {ldelim}

	  {* Enable template's form *}
	  YAHOO.util.Dom.batch(form.elements, function(element) {ldelim}
	    element.disabled = "";
	  {rdelim});

	  if (response.getResponseHeader["Content-Type"] &&
	      response.getResponseHeader["Content-Type"].ltrim().substr(0, 15) ==
	        "text/javascript") {ldelim}
	    eval(response.responseText);
	  {rdelim} else {ldelim}
	    document.open();
	    document.write(response.responseText);
	    document.close();
	  {rdelim}
	{rdelim}{rdelim}, args.join("&"));

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

	  {* FIXME Why doesn't this work?
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
      ItemAdmin.update({ldelim}item: {ldelim}parentId: {$ItemAdmin.item.parentId}{rdelim},
	thumbnail: {ldelim}src: "{$ItemAdmin.thumbnail.src|replace:"&amp;":"&"}",
	  width: {$ItemAdmin.thumbnail.width},
	  height: {$ItemAdmin.thumbnail.height}{rdelim}{rdelim});
    {/capture}
  {/if}

  {* Trim leading spaces *}
  String.prototype.ltrim = function() {ldelim}
    var index = 0;
    while (this.substr(index, 1) == " ") {ldelim}
      index++;
    {rdelim}

    return this.substr(index);
  {rdelim}

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
