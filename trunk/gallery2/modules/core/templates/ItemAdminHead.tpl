{*
 * $Revision$ $Date$
 * If you want to customize this file, do not edit it directly.
 * Instead, copy it to ItemAdminHead.tpl.local and edit that version instead.
 * Gallery will look for that file first and use it if it exists
 * and when you upgrade, your changes will not get overwritten.
 *}
<title>
  {g->text text="Gallery Item Administration"}
</title>
{if !empty($ItemAdmin.viewHeadFile)}
{include file="gallery:`$ItemAdmin.viewHeadFile`" l10Domain=$ItemAdmin.viewL10Domain}
{/if}
{g->style}
