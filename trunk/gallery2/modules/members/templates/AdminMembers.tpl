{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock gcBackground1">
  <h2> {g->text text="Members Settings"} </h2>
</div>

{if isset($status.saved)}
<div class="gbBlock"><h2 class="giSuccess">
  {g->text text="Settings saved successfully"}
</h2></div>
{/if}

<div class="gbBlock">
  <p class="giDescription">
   {g->text text="This will select who can see the members list and member profiles."}
  </p>
    
  <select name="{g->formVar var="form[canViewMembersModule]"}">
    {html_options options=$Members.memberViews selected=$form.canViewMembersModule}
  </select>
</div>
  
<div class="gbBlock">
  <p class="giDescription">
    {g->text text="This will select if email addresses are displayed in the member profiles.  Administrators will always be able to see email addresses."}
  </p>
    
  <select name="{g->formVar var="form[canViewEmailAddress]"}">
    {html_options options=$Members.emailViews selected=$form.canViewEmailAddress}
  </select>
</div>

<div class="gbBlock gcBackground1">
  <input type="submit" class="inputTypeSubmit"
   name="{g->formVar var="form[action][save]"}" value="{g->text text="Save"}"/>
  <input type="submit" class="inputTypeSubmit"
   name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Reset"}"/>
</div>
