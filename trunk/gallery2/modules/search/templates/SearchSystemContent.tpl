{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to SearchSystemContent.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div class="gbMenu">
  <div class="giTitle">
    <a href="javascript:document.getElementById('SearchSystemContent').submit()">
      {g->text text="Search"}
    </a>
  </div>

  <form id="SearchSystemContent" action="{g->url}" method="post">
    <p>
      <input type="hidden" name="{g->formVar var="view"}" value="{$SearchSystemContent.view}"/>
      <input type="hidden" name="{g->formVar var="form[formName]"}" value="SearchSystemContent"/>
      <input type="text" name="{g->formVar var="form[searchCriteria]"}" size="15"/>
      <input type="hidden" name="{g->formVar var="form[useDefaultSettings]"}" value="1"/>
    </p>
  </form>
</div>
