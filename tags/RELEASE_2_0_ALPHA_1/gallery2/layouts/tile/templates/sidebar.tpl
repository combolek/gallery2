{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to sidebar.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div id="gsSidebar">
  {* Module links *}
  <div class="gbMenu">
    <h3 class="giTitle">
      {g->text text="Greetings, %s!" arg1=$layout.user.fullName|default:$layout.user.userName}
    </h3>
    <ul>
      {foreach from=$layout.moduleSystemLinks item=module}
      {foreach from=$module item=link}
      <li>
        <a href="{g->url params=$link.params}">{$link.text}</a>
      </li>
      {/foreach}
      {/foreach}
    </ul>
  </div>

  {* Extra modules system content *}
  {foreach from=$layout.moduleSystemContentFiles key=moduleId item=moduleFile}
  {if ($moduleId != 'core')}
    {include file="gallery:$moduleFile" l10Domain="modules_$moduleId"}
  {/if}
  {/foreach}

  {* Breadcrumb *}
  {if (count($layout.parents)>0)}
    <div class="gbMenu">
      <div class="giTitle"> {g->text text="Navigation"} </div>
      <ul>
        {foreach from=$layout.parents item=parent}
          <li>
            &raquo;
            <a href="{g->url arg1="view=core:ShowItem" arg2="itemId=`$parent.id`"}">
              {$parent.title|default:$parent.pathComponent|markup}
            </a>
          </li>
        {/foreach}
      </ul>
    </div>
  {/if}

  {* Album actions, if there are any *}
  {if !empty($layout.moduleItemLinks)}
  <div class="gbMenu">
    <h3 class="giTitle">
      {g->text text="Actions"}
    </h3>
    <ul>
      {foreach from=$layout.moduleItemLinks item=link}
      <li>
        <a href="{$link.url}">{$link.text}</a>
      </li>
      {/foreach}
    </ul>
  </div>
  {/if}
</div>
