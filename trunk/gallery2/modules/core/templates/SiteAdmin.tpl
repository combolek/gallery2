<form action="{g->url}" enctype="{$SiteAdmin.enctype|default:"application/x-www-form-urlencoded"}" method="post">
  <p>
    {g->hiddenFormVars}
    <input type="hidden" name="{g->formVar var="controller"}" value="{$controller}"/>
    <input type="hidden" name="{g->formVar var="form[formName]"}" value="{$form.formName}" />
  </p>
    
  <div id="gsHeader">
    <div class="gbTitleBanner">
      <div class="giTitle">
	{g->text text="Site Administration"}
      </div>
    </div>
  </div>

  <div id="gsAdminSidebar">
    <div class="gbMenu">
      <div class="giTitle"> {g->text text="Admin Options"} </div>

      <!-- TODO: Figure out how to get icons in here in a modular way -->
      <ul>
	{foreach from=$SiteAdmin.subViewChoices item=choice}
	{if ($SiteAdmin.subViewName == $choice.view)}
        <li class="giSelected"> {$choice.name} </li>
	{else}
	<li>
	  <a href="{g->url arg1="view=core:SiteAdmin" arg2="subView=`$choice.view`"}">
	    {$choice.name}
	  </a>
	</li>
	{/if}
	{/foreach}
      </ul>
    </div>

    <div class="gbMenu">
	<div class="giTitle"> {g->text text="Navigation"} </div>
	
        <ul>
	  <li> 
	    <a href="{g->url}">
	      {g->text text="Browse Gallery"}
	    </a>
	  </li>
	</ul>
    </div>
  </div>

  {include file=$SiteAdmin.viewBodyFile l10Domain=$SiteAdmin.viewL10Domain}
</form>
