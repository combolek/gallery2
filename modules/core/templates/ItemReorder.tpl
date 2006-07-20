{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock gcBackground1">
  <h2> {g->text text="Reorder Album"} </h2>
</div>

<div class="gbBlock" id="{"status"|elementId}"{if empty($status.saved)} style="display: none"{/if}><h2 class="giSuccess"> {g->text text="Order saved successfully"} </h2></div>

{if isset($ItemReorder.show.automaticOrderMessage)}
<div class="gbBlock">
  <p class="giDescription">
    {g->text text="This album has an automatic sort order specified, so you cannot change the order of items manually.  You must remove the automatic sort order to continue."}
    <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemEdit" arg3="itemEditPlugin=core.ItemEditAlbum" arg4="itemId=`$ItemAdmin.item.id`"}"> {g->text text="change"} </a>
  </p>
</div>
{else}
<div class="gbBlock">
  <p class="giDescription">
    {g->text text="Change the order of the items in this album."}
  </p>

  <h4> {g->text text="Move this item"} </h4>

  <select id="{"selectedSelect"|elementId}" name="{"form[selectedId]"|formVar}">
    {foreach from=$ItemReorder.peers item=peer}
    <option value="{$peer.id}"> {$peer.title|default:$peer.pathComponent} </option>
    {/foreach}
  </select>

  <select name="{"form[placement]"|formVar}">
    <option value="before"> {g->text text="before"} </option>
    <option value="after"> {g->text text="after"} </option>
  </select>

  <select id="{"targetSelect"|elementId}" name="{"form[targetId]"|formVar}">
    {foreach from=$ItemReorder.peers item=peer}
    <option value="{$peer.id}"> {$peer.title|default:$peer.pathComponent} </option>
    {/foreach}
  </select>

  {capture append="ItemReorder.update"}
    if (ItemReorder != null && ItemReorder.peers != null) {ldelim}
      var html = "";
      for (var i = 0; i < ItemReorder.peers.length; i++) {ldelim}
	html += "<option value=\"" + ItemReorder.peers[i].id + "\"> " + ItemReorder.peers[i].title || ItemReorder.peers[i].pathComponent + " </option>";
      {rdelim}

      YAHOO.util.Dom.get("{"selectedSelect"|elementId}").innerHTML = html;
      YAHOO.util.Dom.get("{"targetSelect"|elementId}").innerHTML = html;
    {rdelim}
  {/capture}
</div>

<div class="gbBlock gcBackground1">
  <input class="inputTypeSubmit" id="{"reorderInput"|elementId}" name="{"form[action][reorder]"|formVar}" type="submit" value="{g->text text="Reorder"}"/>
  <input class="inputTypeSubmit" id="{"cancelInput"|elementId}" name="{"form[action][cancel]"|formVar}" type="submit" value="{g->text text="Cancel"}"/>
</div>
{/if}

<script>
  // <![CDATA[

  {* Template's client-side variables & functions *}
  var ItemReorder = {ldelim}

    {* Update template's dynamic elements *}
    update: function(ItemReorder) {ldelim}
      {$ItemReorder.update}
    {rdelim}
  {rdelim};

  {* Register template's submit function with submit buttons *}
  YAHOO.util.Event.addListener(["{"reorderInput"|elementId}", "{"cancelInput"|elementId}"], "click", ItemAdmin.submit, ItemAdmin);

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($status.saved)}
	YAHOO.util.Dom.get("{"status"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"status"|elementId}").style.display = "";
      {/if}

      ItemReorder.update({ldelim}peers: [
	  {foreach from=$ItemReorder.peers item="peer"}
	  {ldelim}id: {$peer.id},
	    title: "{$peer.title}",
	    pathComponent: "{$peer.pathComponent}"{rdelim},
	  {/foreach}
	]{rdelim});
    {/capture}
  {/if}

  // ]]>
</script>
