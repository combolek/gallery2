{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}ItemReorder{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Reorder Album"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->text text="You can change the order of the items in this album."}
      {/gallery->detailedboxbody}

      {gallery->detailedboxdescription}
	{gallery->text text="Change the order of the items in this album."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->widget2set}
	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Move this item"}
	    {/gallery->widget2title}
	    {gallery->widget2body}
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
	    {/gallery->widget2body}
	  {/gallery->widget2}
	{/gallery->widget2set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.reorder"}{gallery->text text="Reorder"}{/gallery->input}
	{gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
