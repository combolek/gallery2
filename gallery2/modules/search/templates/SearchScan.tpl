{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to SearchScan.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div id="gsHeader">
  <!-- add a header here -->
</div>

<ul class="gbBreadCrumb">
  <li>
    <a href="{g->url}">
      {g->text text="Gallery"}
    </a>
  </li>

  <li>
    {g->text text="Search"}
  </li>
</ul>

<div id="gsContents">
  {include file="gallery:`$Navigation.sidebar`" l10Domain=$Navigation.l10Domain}	    

  <div id="gsAlbumContents">
    <form action="{g->url}" method="post">
      {g->hiddenFormVars}
      <input type="hidden" name="{g->formVar var="controller"}" value="{$SearchScan.controller}"/>
      <input type="hidden" name="{g->formVar var="form[formName]"}" value="SearchScan"/>
      <script type="text/javascript">
      // <![CDATA[
      function setCheck(val) {ldelim}
	var frm = document.forms[0];
	{foreach from=$SearchScan.modules key=moduleId item=moduleInfo}
	{foreach from=$moduleInfo.options key=optionId item=optionInfo}
	  frm.elements['g2_form[options][{$moduleId}][{$optionId}]'].checked=val;
	{/foreach}
	{/foreach}
      {rdelim}
    
      function invertCheck() {ldelim}
	var frm = document.forms[0];
	{foreach from=$SearchScan.modules key=moduleId item=moduleInfo}
	{foreach from=$moduleInfo.options key=optionId item=optionInfo}
	  frm.elements['g2_form[options][{$moduleId}][{$optionId}]'].checked=!(frm.elements['g2_form[options][{$moduleId}][{$optionId}]'].checked)
	{/foreach}
	{/foreach}
      {rdelim}
      // ]]>
      </script>
    
      <div id="gsSearchContents">
	<div class="gbTopFlag">
	  <h1 class="giTitle">
	  {g->text text="Search the Gallery"}
	  </h1>
	</div>

	<div class="gbAdmin">
	  <div class="gbDataEntry">
	  <input type="text" size="50" name="{g->formVar var="form[searchCriteria]"}" value="{$form.searchCriteria}" onFocus="this.style.background='#fff';" onblur="this.style.background='#eee';"/>
	  <input type="submit" name="{g->formVar var="form[action][search]"}" value="{g->text text="Search"}" class="button"/>

	  {if isset($form.error.searchCriteria.missing)}
	  <p class="giError">
	    {g->text text="You must enter some text to search for!"}
	  </p>
	  {/if}
	  </div>
	</div>

	<div class="gbAdmin">
	{foreach from=$SearchScan.modules key=moduleId item=moduleInfo}
	  {foreach from=$moduleInfo.options key=optionId item=optionInfo}
	  {capture name=checkboxName}{g->formVar var="form[options][$moduleId][$optionId]"}{/capture}
	  <input id="{$moduleId}.{$optionId}" type="checkbox" name="{$smarty.capture.checkboxName}" {if isset($form.options.$moduleId.$optionId)}checked="checked"{/if} />
	  <label for="{$moduleId}.{$optionId}">
	  {$optionInfo.description}
	  </label>
	  {/foreach}
	{/foreach}
	</div>

	<div class="gbAdmin">
	  <a href="javascript:setCheck(1)">{g->text text="Check All"}</a> &nbsp; 
	  <a href="javascript:setCheck(0)">{g->text text="Uncheck All"}</a> &nbsp; 
	  <a href="javascript:invertCheck(0)">{g->text text="Invert"}</a>
	</div>
	<hr/>

	{assign var="resultCount" value="0"}
	{if !empty($SearchScan.searchResults)}
	<div class="gbAdmin">
	  <h2 class="giTitle">
	  {g->text text="Search Results"}
	  </h2>

	  {foreach from=$SearchScan.searchResults key=moduleId item=results}
	  {assign var="resultCount" value=$resultCount+$results.count}
	  <div class="gbDataEntry">
	    <div class="giTitle">
	      {$SearchScan.modules.$moduleId.name}
	      {if ($results.count > 0)}
	      {g->text text="(Results %d - %d)"
	      arg1=$results.start
	      arg2=$results.end}
	      {/if}
	      {if ($results.count > $results.end)}
	      {assign var="moduleId" value=$moduleId} &nbsp; 
	      <input type="submit" name="{g->formVar var="form[action][showAll][$moduleId]"}" value="{g->text text="Show all %d" arg1=$results.count}" class="button"/>
	      {/if}
	    </div>

	    {assign var="searchCriteria" value=$form.searchCriteria} 
	    {if (sizeof($results.results) > 0)}
	    <table>
	      <tr>

	      {foreach from=$results.results item=result} 
	      {assign var=itemId value=$result.itemId} 
	      <td class="gbItemImage" style="width: 10%">
		<a href="{g->url arg1="view=core:ShowItem" arg2="itemId=$itemId"}">
		{if isset($SearchScan.thumbnails.$itemId)}
		<div class="gbItemImage">
		    {g->image item=$SearchScan.items.$itemId image=$SearchScan.thumbnails.$itemId}
		</div>
		{else}
		{g->text text="No thumbnail"}
		{/if}
		</a>
		  <ul class="giInfo">
		    {foreach from=$result.fields item=field}
		  {if isset($field.value)}
		  <li>
		  {$field.key}:
		  {$field.value|default:"&nbsp;"|replace:$searchCriteria:"<span class=\"searchHighlight\">$searchCriteria</span>"|markup}
		  </li>
		  {/if}
		{/foreach}
		</ul>
	      </td>
	      {/foreach}

	      </tr>
	    </table>
	    {else}
	    {g->text text="No results"}
	    {/if}
	  </div>
	  {/foreach}

	</div>
	{/if}

	{if $resultCount>0 && $SearchScan.slideshowAvailable}
	<div class="gbAdmin">
	  <input type="submit" name="{g->formVar var="form[action][slideshow]"}" value="{g->text text="View these results in a slideshow"}" class="button"/>
	</div>
	{/if}
      </div>
    </form>
  </div>
</div>