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
	{g->text text="Square Thumbnail Module"}
      </h2>
    </div>

  </div>

  <div id="gsStatus">
    <div class="giError">
      {capture name="url"}
      {g->url arg1="view=core:SiteAdmin" arg2="subView=core:AdminModules"}
      {/capture}
      {g->text text="This module requires you to have at least one graphics toolkit active in order for it to operate properly.  Please return to the <a href=\"%s\">Modules</a> page and activate a graphics toolkit." arg1=$smarty.capture.url}
    </div>
  </div>
</div>
