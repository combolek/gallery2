{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
img.{"image"|elementId:"ImageFrame"} {ldelim}
  border: none;
  vertical-align: bottom;
{rdelim}
{foreach from=$ImageFrame.data key=id item=data}
  {if $data.type == 'style'}
    img.{$id|elementId:"ImageFrame"} {ldelim}
      {$data.style}
    {rdelim}
  {elseif $data.type == 'image'}
    table.{$id|elementId:"ImageFrame"} {ldelim}
      direction: ltr;
    {rdelim}
    {if !empty($data.imageTL)}
      table.{$id|elementId:"ImageFrame"} .TL {ldelim}
	background:url({$data.imageTL}) no-repeat;
	height: {$data.heightTL}px;
        width: {$data.widthTL}px;
      {rdelim}
    {/if}
    {if !empty($data.imageTTL)}
      table.{$id|elementId:"ImageFrame"} .TTL {ldelim}
        width: {$data.widthTTL}px;
	background: url({$data.imageTTL}) no-repeat;
      {rdelim}
    {/if}
    {if !empty($data.imageTT)}
      table.{$id|elementId:"ImageFrame"} .TT {ldelim}
	background: url({$data.imageTT}) repeat-x;
        height: {$data.heightTT}px;
      {rdelim}
    {/if}
    {if !empty($data.imageTTR)}
      table.{$id|elementId:"ImageFrame"} .TTR {ldelim}
	background: url({$data.imageTTR}) no-repeat;
        width: {$data.widthTTR}px;
      {rdelim}
    {/if}
    {if !empty($data.imageTR)}
      table.{$id|elementId:"ImageFrame"} .TR {ldelim}
	background: url({$data.imageTR}) no-repeat;
	height: {$data.heightTR}px;
        width: {$data.widthTR}px;
      {rdelim}
    {/if}
    {if !empty($data.imageLLT)}
      table.{$id|elementId:"ImageFrame"} .LLT {ldelim}
	background: url({$data.imageLLT}) no-repeat;
        height: {$data.heightLLT}px;
      {rdelim}
    {/if}
    {if !empty($data.imageLL)}
      table.{$id|elementId:"ImageFrame"} .LL {ldelim}
        width: {$data.widthLL}px;
	background: url({$data.imageLL}) repeat-y;
      {rdelim}
      table.{$id|elementId:"ImageFrame"} .LL div.V {ldelim}
        width: {$data.widthLL}px;
      {rdelim}
    {/if}
    {if !empty($data.imageLLB)}
      table.{$id|elementId:"ImageFrame"} .LLB {ldelim}
	background: url({$data.imageLLB}) no-repeat;
        height: {$data.heightLLB}px;
      {rdelim}
    {/if}
    {if !empty($data.imageRRT)}
      table.{$id|elementId:"ImageFrame"} .RRT {ldelim}
	background: url({$data.imageRRT}) no-repeat;
        height: {$data.heightRRT}px;
      {rdelim}
    {/if}
    {if !empty($data.imageRR)}
      table.{$id|elementId:"ImageFrame"} .RR {ldelim}
	background:url({$data.imageRR}) repeat-y;
        width: {$data.widthRR}px;
      {rdelim}
      table.{$id|elementId:"ImageFrame"} .RR div.V {ldelim}
        width: {$data.widthRR}px;
      {rdelim}
    {/if}
    {if !empty($data.imageRRB)}
      table.{$id|elementId:"ImageFrame"} .RRB {ldelim}
	background: url({$data.imageRRB}) no-repeat;
        height: {$data.heightRRB}px;
      {rdelim}
    {/if}
    {if !empty($data.imageBL)}
      table.{$id|elementId:"ImageFrame"} .BL {ldelim}
	background: url({$data.imageBL}) no-repeat;
	height: {$data.heightBL}px;
        width: {$data.widthBL}px;
      {rdelim}
    {/if}
    {if !empty($data.imageBBL)}
      table.{$id|elementId:"ImageFrame"} .BBL {ldelim}
	background: url({$data.imageBBL}) no-repeat;
        width: {$data.widthBBL}px;
      {rdelim}
    {/if}
    {if !empty($data.imageBB)}
      table.{$id|elementId:"ImageFrame"} .BB {ldelim}
	background: url({$data.imageBB}) repeat-x;
        height: {$data.heightBB}px;
      {rdelim}
    {/if}
    {if !empty($data.imageBBR)}
      table.{$id|elementId:"ImageFrame"} .BBR {ldelim}
	background: url({$data.imageBBR}) no-repeat;
        width: {$data.widthBBR}px;
      {rdelim}
    {/if}
    {if !empty($data.imageBR)}
      table.{$id|elementId:"ImageFrame"} .BR {ldelim}
	background: url({$data.imageBR}) no-repeat;
	height: {$data.heightBR}px;
        width: {$data.widthBR}px;
      {rdelim}
    {/if}
    {if !empty($data.imageCC)}
      table.{$id|elementId:"ImageFrame"} .{"image"|elementId:"ImageFrame"} {ldelim}
        background: url({$data.imageCC}) repeat center center;
      {rdelim}
    {/if}
    table.{$id|elementId:"ImageFrame"} td {ldelim}
      font-size: 1px; {* For IE *}
    {rdelim}
  {/if}
{/foreach}
td div.H {ldelim}
  height: 0;
  width: 1px;
{rdelim}
td div.V {ldelim}
  height: 1px;
  width: 0;
{rdelim}
