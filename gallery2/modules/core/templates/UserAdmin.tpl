{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to UserAdmin.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<form action="{g->url}" method="post">
  <p>
    {g->hiddenFormVars}
    <input type="hidden" name="{g->formVar var="controller"}" value="{$controller}"/>
    <input type="hidden" name="{g->formVar var="form[formName]"}" value="{$form.formName}"/>
  </p>

  <div id="gsHeader">
    <!-- header -->
  </div>

  <ul class="gbBreadCrumb">
    <li class="giBreadCrumbFirst">
      {g->text text="Your Account"}
    </li>

    {if ($UserAdmin.show.userInPathbar)}
    <li>
      {$UserAdmin.user.fullName|default:$UserAdmin.user.userName}
    </li>
    {/if}
  </ul>

  <div id="gsAdminSidebar">
    <div class="gbMenu">
      <div class="giTitle">
        {g->text text="User Options"}
      </div>

      <ul>
        {foreach from=$UserAdmin.subViewChoices item=choice}
        {if ($UserAdmin.subViewName == $choice.view)}
        <li class="giSelected">
          {$choice.name}
        </li>
        {else}
        <li>
          <a href="{g->url arg1="view=core:UserAdmin" arg2="subView=`$choice.view`"}">
            {$choice.name}
          </a>
        </li> 
        {/if}
        {/foreach}
      </ul>
    </div>
    
    <div class="gbMenu">
      <div class="giTitle">
        {g->text text="Navigation"}
      </div>

      <ul>
        <li>
          <a href="{g->url}">
            {g->text text="Browse Gallery"}
          </a>
        </li>
      </ul>
    </div>
  </div>

  {include file="gallery:`$UserAdmin.viewBodyFile`" l10Domain=$UserAdmin.viewL10Domain}
</form>
