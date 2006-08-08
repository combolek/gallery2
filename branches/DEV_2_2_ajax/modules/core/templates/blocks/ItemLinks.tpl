{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}

{* If more than one link & $useDropdown is set use a dropdown.  Otherwise render as links. *}
{if (isset($links) || isset($theme.itemLinks))}
  {if empty($item)}
    {assign item=$theme.item}
  {/if}
  {if empty($links)}
    {assign links=$theme.itemLinks}
  {/if}
  {if !isset($useDropdown)}
    {assign useDropdown=true}
  {/if}
  {if !isset($lowercase)}
    {assign lowercase=false}
  {/if}

  {if count($links) > 1 && $useDropdown}
    <div class="{$class}">
      <select onchange="var value = this.value; this.options[0].selected = true; eval(value)">
	<option label="{if $item.canContainChildren}{g->text text="&laquo; album actions &raquo;"}{else}{g->text text="&laquo; item actions &raquo;"}{/if}" value="">{if $item.canContainChildren}{g->text text="&laquo; album actions &raquo;"}{else}{g->text text="&laquo; item actions &raquo;"}{/if}</option>
	{foreach from=$links item=link}
	  {if $lowercase}
	    {assign linkText=$link.text|lower}
	  {else}
	    {assign linkText=$link.text}
	  {/if}
	  <option label="{$linkText}" value="{if isset($link.script)}{$link.script}{else}window.location = '{g->url params=$link.params}'{/if}"> {$linkText} </option>
	{/foreach}
      </select>
    </div>
  {elseif count($links) > 0}
    <div class="{$class}">
      {foreach from=$links item=link}
	{if $lowercase}
	  {assign linkText=$link.text|lower}
	{else}
	  {assign linkText=$link.text}
	{/if}
	<a class="gbAdminLink {g->linkid urlParams=$link.params}" href="{if isset($link.script)}javascript:{$link.script}{else}{g->url params=$link.params}{/if}"> {$linkText} </a>
      {/foreach}
    </div>
  {/if}
{/if}
