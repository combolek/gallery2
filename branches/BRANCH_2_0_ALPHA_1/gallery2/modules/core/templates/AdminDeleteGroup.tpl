{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to AdminDeleteGroup.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <div class="giTitle">
	{g->text text="Delete a group"}
      </div>
    </div>
    
  </div>

  <div class="gbAdmin">
    <div class="giTitle">
      {g->text text="Are you sure?"}
    </div>

    <div class="giDescription">
      {g->text text="This will completely remove <b>%s</b> from Gallery.  There is no undo!"
      arg1=$AdminDeleteGroup.group.groupName}
    </div>

    <div class="gbBottomFlag">
      <div class="giActionSelect">
	<input type="hidden" name="{g->formVar var="groupId"}" value="{$AdminDeleteGroup.group.id}"/>
	<input type="submit" name="{g->formVar var="form[action][delete]"}" value="{g->text text="Delete"}" class="button"/>
	<input type="submit" name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}" class="button"/>
      </div>
    </div>
  </div>
</div>
