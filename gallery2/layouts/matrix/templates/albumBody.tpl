      {gallery->lightFrame width="100%"}
    <table border="0" width="100%" cellspacing="0%" cellpadding="0%">
	<tr>
	  <td>
	    <table border="0" width="100%" cellspacing="0%" cellpadding="0%">
		<tr>
		  <td>
		    {gallery->text one="%d item in this album" 
	                         many="%d items in this album"
	                         count=$layout.totalChildCount
	                         arg1=$layout.totalChildCount}
		    {if $layout.totalPageCount > 1}
		    {gallery->text text="on %d pages" arg1=$layout.totalPageCount}
		    {/if}
		  </td>
		  <td align="right">
		    {foreach from=$layout.moduleSystemContent item=module}
		    {foreach from=$layout.module item=content}
		    {$content}
		    {/foreach}
		    {/foreach}
		  </td>
		</tr>
		<tr>	
		  <td>
		    {foreach from=$layout.moduleItemLinks item=itemLinks key=loopId}
		    {if ($loopId == $layout.item.id)}
		    <br>
		    {gallery->text text="Action: "}
		    {gallery->select onChange="if (this.value) javascript:location.href=this.value"}
		    <option value=""> {gallery->text text="<< Action >>"}
		    {foreach from=$layout.itemLinks item=module}
		    {foreach from=$layout.module item=link}
		    <option value="{$link.url}"> {$link.text}
		    {/foreach}
		    {/foreach}
		    {/gallery->select}
		    {/if}
		    {/foreach}
		  </td>
		  <td align="right">
		    {foreach from=$layout.moduleSystemLinks item=module}
		    {foreach from=$layout.module item=link}
		    <a href="{$link.url}">[{$link.text}]</a>
		    {/foreach}
		    {/foreach}
		  </td>
		</tr>
	    </table>
	  </td>
	</tr>

    {if !empty($layout.item.description)}
    <tr>
      <td>
	{$layout.item.description}
      </td>
    </tr>
    {/if}

    <tr>
      <td>
	{include file="parents.tpl"}
      </td>
    </tr>

    {if !empty($layout.navigator.jumprange)}
    <tr>
      <td width="100%">
	{include file="pageNavigator.tpl"}
      </td>
    </tr>
    {/if}

    <tr>
      <td>
	<table border="0" width="100%">
	  <!-- {counter assign=childIndex start=0 print=false} -->
	  <!-- {section name=outer loop=$layout.children step=$layout.properties.columns} -->
	    <tr>
	      <!-- {section name=inner loop=$layout.children start=$childIndex max=$properties.columns} -->
	      <!-- {assign var=child value=$layout.children[$childIndex]} -->
	      <td valign="baseline" align="center">
		{if $child.entityType == 'galleryalbumitem'}
		{include file="albumThumbnail.tpl"}
		{else}
		{include file="singleThumbnail.tpl"}
		{/if}

		{if !empty($child.title)}
		<br>
		<b>{$child.title}</b>
		{else}
		&nbsp;
		{/if}
		
		{if !empty($child.summary)}
		<br>
		<i>{$child.summary}</i>
		{else}
		&nbsp;
		{/if}

		{if !empty($child.childCount)}
		<br>
		{gallery->smallerFontSize}
		{gallery->text one="This album contains %d item"
                             many="This album contains %d items"
                             count=$child.childCount
                             arg1=$child.childCount}
		{/gallery->smallerFontSize}
		{else}
		&nbsp
		{/if}
		
		{if (!empty($child.moduleSummaries)) }
		{foreach from=$child.moduleSummaries item=summary}
		<br>
		{$summary}
		{/foreach}
		{/if}
	      </td>
	      <!-- {counter} -->
	      <!-- {/section} -->
	    </tr>
	    <!-- {/section} -->
	</table>
      </td>
    </tr>
    
    {if !empty($layout.navigator.jumprange)}
    <tr>
      <td width="100%">
	{include file="pageNavigator.tpl"}
      </td>
    </tr>
    {/if}
    
    <tr>
      <td>
	{include file="parents.tpl"}
      </td>
    </tr>
    
    <!-- Module Item Details for the active item -->
	{* change this over to including template files *}
    {if !empty($layout.moduleItemDetails)}
    {foreach from=$layout.moduleItemDetails key=moduleName item=detail}
    <tr>
      <td width="100%">
	{$detail}
      </td>
    </tr>
    {/foreach}
    {/if}

  </table>
    {/gallery->lightFrame}
