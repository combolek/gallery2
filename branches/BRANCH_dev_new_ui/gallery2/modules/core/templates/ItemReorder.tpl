{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}ItemReorder{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Reorder Album"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->body}
	{gallery->text text="You can change the order of the items in this album."}
      {/gallery->body}

      {gallery->description}
	{gallery->text text="Change the order of the items in this album."}
      {/gallery->description}

      {gallery->body}
	{gallery->widget2set}
	  {gallery->widget2}
	    {gallery->title}
	      {gallery->text text="Move this item"}
	    {/gallery->title}
	    {gallery->body}
	      {gallery->select name="form.selectedId"}
		{foreach from=$peers item=item}
		  <option value="{$item.id}"> {$item.title|default:$item.pathComponent}
		{/foreach}
	      {/gallery->select}
	      {gallery->select name="form.placement"}
		<option value="before"> {gallery->text text="before"}
		<option value="after"> {gallery->text text="after"}
	      {/gallery->select}
	      {gallery->select name="form.targetId"}
		{foreach from=$peers item=item}
		  <option value="{$item.id}"> {$item.title|default:$item.pathComponent}
		{/foreach}
	      {/gallery->select}
	    {/gallery->body}
	  {/gallery->widget2}
	{/gallery->widget2set}
      {/gallery->body}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->body}
	{gallery->input type="submit" name="form.action.reorder"}{gallery->text text="Reorder"}{/gallery->input}
	{gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
      {/gallery->body}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
