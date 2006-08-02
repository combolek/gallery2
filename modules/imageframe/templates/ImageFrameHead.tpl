{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !empty($ImageFrame.idList)}
  <link rel="stylesheet" type="text/css" href="{g->url arg1="view=imageframe.CSS" arg2="frames=`$ImageFrame.idList`" forceDirect=true}"/>
{/if}
