{gallery->bannerbox}
  {gallery->title}
    {gallery->text text="Reorder Album"}
  {/gallery->title}
{/gallery->bannerbox}

{gallery->detailedbox}
  {gallery->description}
    {gallery->text text="Change the order of the items in this album."}
  {/gallery->description}

  {gallery->body}
    {gallery->widget2box}
      {gallery->widget2}
	{gallery->title}
	  {gallery->text text="Move this item"}
	{/gallery->title}
	{gallery->body}
	  {gallery->select name="form.selectedId"}
	    {foreach from=$ItemReorder.peers item=peer}
	      <option value="{$peer.id}"> {$peer.title|default:$peer.pathComponent}
	    {/foreach}
	  {/gallery->select}
	  {gallery->select name="form.placement"}
	    <option value="before"> {gallery->text text="before"}
	    <option value="after"> {gallery->text text="after"}
	  {/gallery->select}
	  {gallery->select name="form.targetId"}
	    {foreach from=$ItemReorder.peers item=peer}
	      <option value="{$peer.id}"> {$peer.title|default:$peer.pathComponent}
	    {/foreach}
	  {/gallery->select}
	{/gallery->body}
      {/gallery->widget2}
    {/gallery->widget2box}
  {/gallery->body}
{/gallery->detailedbox}

{gallery->detailedbox}
  {gallery->body}
    {gallery->input type="submit" name="form.action.reorder"}{gallery->text text="Reorder"}{/gallery->input}
    {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
  {/gallery->body}
{/gallery->detailedbox}
