{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div id="popup_details" class="gcBorder2"><iframe frameborder="0"></iframe></div>

<div id="popup_titlebar" class="gcBackground1 giDescription">
  <div style="float: right; margin-left: 2px">
    <img src="{$layout.layoutUrl}/images/down.png" width="18" height="18"
     onclick="popup_vis(0)" alt=""/>
  </div>
  <strong> {g->text text="Item Details"} </strong>
</div>

<div id="imageview" class="gcBackground2">
  <div id="imagearea"><div id="imagediv" onclick="image_vis(0)"></div></div>
  <div id="textdiv" class="gcBackground1 gcBorder2">
    <div id="tools_left">
      <img id="text_on" src="{$layout.layoutUrl}/images/up.png"
       width="18" height="18" onclick="text_onoff()"
       alt="{g->text text="Show text"}" title="{g->text text="Show text"}"
     /><img id="text_off" src="{$layout.layoutUrl}/images/down.png"
       width="18" height="18" onclick="text_onoff()" style="display: none"
       alt="{g->text text="Hide text"}" title="{g->text text="Hide text"}"
     /><img src="{$layout.layoutUrl}/images/alb.png"
       width="18" height="18" onclick="image_vis(0)"
       alt="{g->text text="Back to Album View"}" title="{g->text text="Back to Album View"}"
     /><img id="slide_poz" src="{$layout.layoutUrl}/images/poz.png"
       width="18" height="18" onclick="slide_onoff()" style="display: none"
       alt="{g->text text="Pause Slideshow"}" title="{g->text text="Pause Slideshow"}"
     /><img id="slide_fwd" src="{$layout.layoutUrl}/images/fwd.png"
       width="18" height="18" onclick="slide_onoff()"
       alt="{g->text text="Start Slideshow"}" title="{g->text text="Start Slideshow"}"
     /><img id="slide_rev" src="{$layout.layoutUrl}/images/rev.png"
       width="18" height="18" onclick="slide_onoff()" style="display: none"
       alt="{g->text text="Start Slideshow"}" title="{g->text text="Start Slideshow"}"
     /><img id="slide_rand" src="{$layout.layoutUrl}/images/rand.png"
       width="18" height="18" onclick="slide_onoff()" style="display: none"
       alt="{g->text text="Start Slideshow"}" title="{g->text text="Start Slideshow"}"/>
    </div>
    <div id="tools_right">
      <img id="full_size" src="{$layout.layoutUrl}/images/full.png"
       width="18" height="18" onclick="image_zoom(1)" style="display: none"
       alt="{g->text text="Full Size"}" title="{g->text text="Full Size"}"
     /><img id="fit_size" src="{$layout.layoutUrl}/images/fit.png"
       width="18" height="18" onclick="image_zoom(0)" style="display: none"
       alt="{g->text text="Fit Size"}" title="{g->text text="Fit Size"}"
     /><img src="{$layout.layoutUrl}/images/info.png"
       width="18" height="18" onclick="popup_info(-1)"
       alt="{g->text text="Item Details"}" title="{g->text text="Item Details"}"
     /><img id="prev_off" src="{$layout.layoutUrl}/images/prev-off.png"
       width="18" height="18" style="display: none"
       alt="{g->text text="No Previous Image"}" title="{g->text text="No Previous Image"}"
     /><img id="prev_img" src="{$layout.layoutUrl}/images/prev.png"
       width="18" height="18" onclick="image_prev()"
       alt="{g->text text="Previous Image"}" title="{g->text text="Previous Image"}"
     /><img id="next_off" src="{$layout.layoutUrl}/images/next-off.png"
       width="18" height="18" style="display: none"
       alt="{g->text text="No Next Image"}" title="{g->text text="No Next Image"}"
     /><img id="next_img" src="{$layout.layoutUrl}/images/next.png"
       width="18" height="18" onclick="image_next()"
       alt="{g->text text="Next Image"}" title="{g->text text="Next Image"}"/>
    </div>
    <div id="title" class="giTitle"></div>
    <div id="text" class="gcBackground2 gcBorder2"></div>
  </div>
</div>

<table id="hybridMain" border="0" cellspacing="0" cellpadding="0"><tr valign="top">
<td>
{capture name="sidebarInsert_2"}
  <div class="gbBlock">
    <h3> {g->text text="Display Options"} </h3>
    <ul>
      <li>
	<a id="dtl_link" href="" onclick="album_detailsonoff();this.blur();return false">
	  {g->text text="hide details"}
	</a>
      </li>
      <li>
	<a id="lnk_link" href="" onclick="album_itemlinksonoff();this.blur();return false">
	  {g->text text="hide item links"}
	</a>
      </li>
    </ul>
    <ul style="margin-top: 4px">
      <li>
        <strong>{g->text text="Slideshow Options"}:</strong>
      </li>
      <li>
	{g->text text="delay"}:
	<select id="slide_delay" onchange="slide_setdelay(this.value)">
	 <option value="3">{g->text text="3 seconds"}</option>
	 <option selected="selected" value="5">{g->text text="5 seconds"}</option>
	 <option value="7">{g->text text="7 seconds"}</option>
	 <option value="10">{g->text text="10 seconds"}</option>
	 <option value="15">{g->text text="15 seconds"}</option>
	 <option value="20">{g->text text="20 seconds"}</option>
	</select>
	<br/>
	{g->text text="direction"}:
	<select id="slide_order" onchange="slide_setorder(this.value)">
	 <option selected="selected" value="1">{g->text text="forward"}</option>
	 <option value="-1">{g->text text="reverse"}</option>
	 <option value="0">{g->text text="random"}</option>
	</select>
      </li>
    </ul>
  </div>
{/capture}
<div id="sidebar" class="gcBorder2">
  {include file="gallery:templates/sidebar.tpl" l10Domain="modules_core"}
</div>
</td><td id="gsContent">
  <div id="album_titlebar" class="gcBackground2 gcBorder2">
   <div id="album_tools">
      <img id="sidebar_min" src="{$layout.layoutUrl}/images/left.png"
       width="18" height="18" onclick="sidebar_onoff()"
       alt="{g->text text="Hide sidebar"}" title="{g->text text="Hide sidebar"}"
     /><img id="sidebar_max" src="{$layout.layoutUrl}/images/right.png"
       width="18" height="18" onclick="sidebar_onoff()" style="display: none"
       alt="{g->text text="Show sidebar"}" title="{g->text text="Show sidebar"}"
     /><img id="slide__fwd" src="{$layout.layoutUrl}/images/fwd.png"
       width="18" height="18" onclick="slide_onoff()"
       alt="{g->text text="Start Slideshow"}" title="{g->text text="Start Slideshow"}"
     /><img id="slide__rev" src="{$layout.layoutUrl}/images/rev.png"
       width="18" height="18" onclick="slide_onoff()" style="display: none"
       alt="{g->text text="Start Slideshow"}" title="{g->text text="Start Slideshow"}"
     /><img id="slide__rand" src="{$layout.layoutUrl}/images/rand.png"
       width="18" height="18" onclick="slide_onoff()" style="display: none"
       alt="{g->text text="Start Slideshow"}" title="{g->text text="Start Slideshow"}"/>
    </div>

    <table width="90%"><tr><td style="width: 40%">
      <div class="giTitle"> {$layout.item.title|markup} </div>
      <div id="album_desc" class="giDescription"> {$layout.item.description|markup} </div>
    </td><td>
      <div id="album_info" class="giInfo">
	{g->text text="Owner: %s" arg1=$layout.owner.fullName|default:$layout.owner.userName}
	<br/>
	{g->text one="Viewed: %d time" many="Viewed: %d times"
		 count=$layout.viewCount arg1=$layout.viewCount}
      </div>
    </td></tr></table>
  </div>
  <div id="gsAlbumContent" class="gcBackground1">
    <table class="content">
    {foreach name="hybrid" from=$layout.children key=i item=it}
      {if ($i is even)}<tr>{/if}
      <td class="i">
	{if isset($it.image)}
	  {if isset($it.renderItem)}
	    <a id="img_{$it.imageIndex}" href="{g->url arg1="view=core.ShowItem"
	     arg2="itemId=`$it.id`" arg3="renderId=`$it.image.id`"}"></a>
	  {else}
	    <a id="img_{$it.imageIndex}" href="{g->url arg1="view=core.DownloadItem"
	     arg2="itemId=`$it.image.id`" arg3="serialNumber=`$it.image.serialNumber`"}"></a>
	  {/if}
	  <a id="info_{$it.imageIndex}" href="{g->url arg1="view=core.ShowItem"
	   arg2="itemId=`$it.id`" arg3="detail=1"}"></a>
	  {capture name="link"}
	    <a href="" onclick="image_show({$it.imageIndex});return false">
	  {/capture}
	  {if isset($it.thumbnail) && isset($layout.itemFrame)}
	    {g->block type="imageframe" frame=$layout.itemFrame}
	      {$smarty.capture.link}
	      {g->image item=$it image=$it.thumbnail id="%ID%" class="%CLASS% giThumbnail"}
	      </a>
	    {/g->block}
	  {else}
	    {$smarty.capture.link}
	    {if isset($it.thumbnail)}
	      {g->image item=$it image=$it.thumbnail class="giThumbnail"}
	    {else}
	      {g->text text="no thumbnail"}
	    {/if}
	    </a>
	  {/if}
	{elseif ($it.canContainChildren)}
	  {capture name="link"}
	    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$it.id`"}">
	  {/capture}
	  {if isset($it.thumbnail) && isset($layout.albumFrame)}
	    {g->block type="imageframe" frame=$layout.albumFrame}
	      {$smarty.capture.link}
	      {g->image item=$it image=$it.thumbnail id="%ID%" class="%CLASS% giThumbnail"}
	      </a>
	    {/g->block}
	  {else}
	    {$smarty.capture.link}
	    {if isset($it.thumbnail)}
	      {g->image item=$it image=$it.thumbnail class="giThumbnail"}
	    {else}
	      {g->text text="no thumbnail"}
	    {/if}
	    </a>
	  {/if}
	{else}
	  <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$it.id`"}">
	    {if isset($it.thumbnail)}
	      {g->image item=$it image=$it.thumbnail class="giThumbnail"}
	    {else}
	      {g->text text="no thumbnail"}
	    {/if}
	  </a>
	{/if}
      </td>
      <td class="t">
	<table class="itemtext"><tr><td>
	  <div class="title gcBackground2">
	    {if isset($it.image) || isset($it.itemLinks)}
	      <span style="float: right; margin-left: 2px"><img
	       src="{$layout.layoutUrl}/images/menu.png" class="popup_button" width="18" height="18"
	       alt="{g->text text="Item Actions"}" title="{g->text text="Item Actions"}"
	       onclick="popup_menu(event,{$i}
		{if isset($it.image)},{$it.imageIndex})"/></span>
	      <span id="title_{$it.imageIndex}" class="giTitle">
	        {else},-1)"/></span>
	      <span class="giTitle">{/if}
	    {else}
	      <span class="giTitle">
	    {/if}
	    {$it.title|markup}</span>
	  </div>
	</td></tr><tr><td class="giDescription">
	  {if isset($it.summary)}{$it.summary|markup}{/if}
	  {if isset($it.image)}
	    <span id="text_{$it.imageIndex}" style="display: none">{$it.description|markup}</span>
	  {/if}
	</td></tr></table>
	{if isset($it.itemLinks)}
	  <span id="links_{$i}" style="display: none">
	  {foreach from=$it.itemLinks item=link}
	    <a href="{$link.url}">{$link.text}</a><br/>
	  {/foreach}
	  </span>
	{/if}
      </td>
      {if ($i is odd)}</tr>{elseif $smarty.foreach.hybrid.last}<td></td><td></td></tr>{/if}
    {/foreach}
    </table>
  </div>
</td>
</tr></table>

<div id="popup_menu" class="gcBackground1 gcBorder2" onmouseover="clearTimeout(popup_timer)"
 onmouseout="popup_timer=setTimeout('ui_vis(\'popup_menu\',0)',1000)">
  <div id="popup_links" onclick="ui_vis('popup_menu',0)"></div>
</div>

<script type="text/javascript">app_init();</script>
