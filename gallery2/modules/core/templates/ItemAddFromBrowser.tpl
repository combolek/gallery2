{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to ItemAddFromBrowser.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
{if $ItemAddFromBrowser.uploadsPermitted}
<div class="gbAdmin">
  <div class="giDescription">
    {g->text one="Upload a file directly from your computer."
             many="Upload up to %d files directly from your computer."
             count=$form.uploadBoxCount
             arg1=$form.uploadBoxCount}
    {g->text text="Enter the full path to the file and an optional caption in the boxes below."}
    <input type="hidden" name="{g->formVar var="form[uploadBoxCount]"}" value="{$form.uploadBoxCount}" />
  </div>

  <div class="gbAdmin">
    <div class="giDescription">
      {g->text text="<b>Note:</b> you can upload up to %s at one time.  If you want to upload more than that, you must upload the files separately, or use an upload format" arg1=$ItemAddFromBrowser.uploadMaxSize}
    </div>
    {section name="uploadBoxes" loop=$form.uploadBoxCount}
    {assign var=iteration value=$smarty.section.uploadBoxes.iteration}
    <div class="gbDataEntry">
      <div class="giTitle">
	<div class="giTitle">
	  {g->text text="File"}
	</div>

	<input name="{g->formVar var="form[$iteration]"}" type="file" size="60"/>
      </div>
    </div>

    <div class="gbDataEntry">
      <div class="giTitle">
	{g->text text="Caption"}
      </div>

      <textarea rows="2" cols="60" name="{g->formVar var="form[caption][$iteration]"}"></textarea>
    </div>
    {/section}
  </div>

  <div class="gbButtons">
    <input type="submit" name="{g->formVar var="form[action][addFromBrowser]"}" 
           value="{g->text text="Add Items"}"/>
  </div>
</div>
{else}
<div class="gbAdmin">
  <div class="giError">
    {g->text text="Your webserver is configured to disallow file uploads from your web browser at this time.  Please contact your system administrator for assistance."}  
  </div>
</div>
{/if}
