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
	{g->text text="Thumbnail Page Module"}
      </h2>
    </div>
  </div>

  <div id="gsStatus">
    <div class="giError">
      {g->text text="This module requires an active graphics toolkit that supports either:"}
      <ol>
      <li> {g->text text="A multi-page file type such as TIFF, PDF or Postscript"}
           <br/> {g->text text="Example: ImageMagick module with gs (GhostScript) support"} <p/>
      <li> {g->text text="A movie type such as Mpeg or AVI"}
           <br/> {g->text text="Example: Ffmpeg module"}
      </ol>
    </div>
  </div>
</div>
