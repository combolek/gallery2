{*
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to debug.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<div id="gpDebug">
  <div class="giTitle">
      {g->text text="Gallery Debug Output"} 
  </div>

  {if isset($main.debug)}
  <span>
      <pre>
      {$main.debug}
      </pre>
  </span>
  {/if}

  {if isset($main.profile)}
  <span>
    {$main.profile}
  </span>
  {/if}

  {if isset($main.debug)}
  {debug output=""}
  {/if}
</div>
