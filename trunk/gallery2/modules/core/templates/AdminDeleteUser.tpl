{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to AdminDeleteUser.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <h2 class="giTitle">
	{g->text text="Delete a User"}
      </h2>
    </div>
    
  </div>

  <div class="gbAdmin">
    <h2 class="giTitle">
      {g->text text="Are you sure?"}
    </h2>

    <p class="giDescription">
      {g->text text="This will completely remove <strong>%s</strong> from Gallery.  There is no undo!"
      arg1=$AdminDeleteUser.user.userName}
    </p>

    <div class="gbBottomFlag">
      <div class="giActionSelect">
	<input type="hidden" name="{g->formVar var="userId"}" value="{$AdminDeleteUser.user.id}"/>
	<input type="submit" name="{g->formVar var="form[action][delete]"}" value="{g->text text="Delete"}" class="button"/>
	<input type="submit" name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}" class="button"/>
      </div>
    </div>
  </div>
</div>
