{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !isset($content)}
  {counter name="ImageFrame_counter" assign="ImageFrame.count"}
  {assign ImageFrame.class=$frame|elementId ImageFrame.id=$ImageFrame.count|elementId}
  {if isset($smarty.Gallery.image.classes.0)}
    {assign ImageFrame.class="$smarty.Gallery.image.classes.0 $ImageFrame.class"}
  {/if}
  {assign smarty.Gallery.image.classes.0=$ImageFrame.class smarty.Gallery.image.ids.0=$ImageFrame.id}
{else}
  {if isset($ImageFrame.data[$frame])}
    {assign data=$ImageFrame.data[$frame]}
  {/if}
  {if isset($maxSize) && isset($width) && isset($height)}
    {g->shrinkDimensions widthVar="width" heightVar="height" maxSize=$maxSize}
  {/if}
  {if !isset($data) || $data.type == 'style'}
    {$content}
  {elseif $data.type == 'image'}
    {if isset($data.square) && $data.square && isset($width) && isset($height)}
      {assign isSquare=true}
      {if $width > $height}
	{assign height=$width}
      {else}
	{assign width=$height}
      {/if}
    {/if}
    <table class="{$frame|elementId}" border="0" cellpadding="0" cellspacing="0">
      {if !empty($data.imageTT) || !empty($data.imageTL) || !empty($data.imageTR) || !empty($data.imageTTL) || !empty($data.imageTTR)}
	<tr>
	  <td class="TL"></td>
	  {if $data.wHL}
	    <td class="TTL"></td>
	  {/if}
	  <td class="TT"{if $data.wHL or $data.wHR} style="width: {if isset($width)}{$width - $data.wHL - $data.wHR}px{else}expression((document.getElementById('{$smarty.Gallery.image.ids.1}').width - {$data.wHL + $data.wHR}) + 'px'){/if}"{/if}>
	    <div class="H"></div>
	  </td>
	  {if $data.wHR}
	    <td class="TTR"></td>
	  {/if}
	  <td class="TR"></td>
	</tr>
      {/if}
      <tr>
	{capture name="LL"}
	  <td class="LL"{if $data.hVT or $data.hVB} style="height: {if isset($height)}{$height - $data.hVT - $data.hVB}px{else}expression((document.getElementById('{$smarty.Gallery.image.ids.1}').height - {$data.hVT + $data.hVB}) + 'px'){/if}"{/if}>
	    <div class="V">&nbsp;</div>
	  </td>
	{/capture}
	{capture name="RR"}
	  <td class="RR"{if $data.hVT or $data.hVB} style="height: {if isset($height)}{$height - $data.hVT - $data.hVB}px{else}expression((document.getElementById('{$smarty.Gallery.image.ids.1}').height - {$data.hVT + $data.hVB}) + 'px'){/if}"{/if}>
	    <div class="V">&nbsp;</div>
	  </td>
	{/capture}
	{if $data.hVT}
	  <td class="LLT"></td>
	{else}
	  {$smarty.capture.LL}
	{/if}
	<td rowspan="{$data.rowspan}" colspan="{$data.colspan}" class="{"image"|elementId}"{if isset($isSquare)} align="center" valign="middle" style="width: {$width}px; height: {$height}px"{/if}>
	  {$content}
	</td>
	{if $data.hVT}
	  <td class="RRT"></td>
	{else}
	  {$smarty.capture.RR}
	{/if}
      </tr>
      {if $data.hVT}
	<tr>
	  {$smarty.capture.LL}
	  {$smarty.capture.RR}
	</tr>
      {/if}
      {if $data.hVB}
	<tr>
	  <td class="LLB"></td>
	  <td class="RRB"></td>
	</tr>
      {/if}
      {if !empty($data.imageBB) || !empty($data.imageBL) || !empty($data.imageBR) || !empty($data.imageBBL) || !empty($data.imageBBR)}
	<tr>
	  <td class="BL"></td>
	  {if $data.wHL}
	    <td class="BBL"></td>
	  {/if}
	  <td class="BB"{if $data.wHL or $data.wHR} style="width: {if isset($width)}{$width - $data.wHL - $data.wHR}px{else}expression((document.getElementById('{$smarty.Gallery.image.ids.1}').width - {$data.wHL + $data.wHR}) + 'px'){/if}"{/if}>
	    <div class="H"></div>
	  </td>
	  {if $data.wHR}
	    <td class="BBR"></td>
	  {/if}
	  <td class="BR"></td>
	</tr>
      {/if}
    </table>
  {/if}
{/if}
