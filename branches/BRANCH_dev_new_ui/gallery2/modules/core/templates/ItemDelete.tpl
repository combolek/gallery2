{gallery->mainbody1}
  {gallery->form action_controller=$controller}
    {gallery->input type="hidden" name="form.formName"}ItemDelete{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Delete Item"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Are you sure?"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{if ($itemType == 'album')}
	  {if ($childCount > 0)}
	    {gallery->text one="This album has %d child." many="This album has %d children." count=$childCount arg1=$childCount}
	    {gallery->text text="Removing this album will remove all of its children also.  There is no undo!"}
	  {else}
	    {gallery->text text="This album is empty.  This will completely remove this album from Gallery.  There is no undo!"}
	  {/if}
	{else}
	  {gallery->text text="This will completely remove this item from Gallery. There is no undo!"}
	{/if}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.delete"}{gallery->text text="Delete"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
