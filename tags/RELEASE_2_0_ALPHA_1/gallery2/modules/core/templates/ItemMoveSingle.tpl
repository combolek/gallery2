{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to ItemMoveSingle.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <div class="giTitle">
	{g->text text="Move %s" arg1=$ItemMoveSingle.itemTypeNames.0}
      </div>
    </div>

  </div>

  {if (isset($status))}
  <div id="gsStatus">
    <div class="giStatus">
      {g->text text="Successfully moved"}
    </div>
  </div>
  {/if}

  <div class="gbAdmin">
    <div class="giTitle">
      {g->text text="Destination"}
    </div>
      
    <div class="giDescription">
      {g->text text="Choose a destination album"}
    </div>
      
    <select name="{g->formVar var="form[destination]"}" onchange="javascript:checkPermissions(this.form)">
      {foreach from=$ItemMoveSingle.albumTree item=album}
      <option value="{$album.data.id}" {if ($album.data.id == $form.destination)}selected="selected"{/if}>
	{"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"|repeat:$album.depth}`--
	{$album.data.title|default:$album.data.pathComponent}
      </option>
      {/foreach}
    </select>
      
    {if isset($form.error.destination.empty)}
    <div class="giError">
      {g->text text="No destination chosen"}
    </div>
    {/if}

    {if isset($form.error.destination.selfMove)}
    <div class="giError">
      {g->text text="You cannot move an album into its own subtree."}
    </div>
    {/if}
  </div>
    
  <div class="gbButtons">
    <input type="submit" name="{g->formVar var="form[action][move]"}" value="{g->text text="Move"}" class="button"/>
    <input type="submit" name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}" class="button"/>
  </div>
</div>
