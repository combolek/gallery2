{gallery->mainbody1}
  {gallery->form action_controller=$controller}
    {gallery->input type="hidden" name="form.formName"}ItemMakeHighlight{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}
    
    {gallery->maintitle1}
      {gallery->text text="Use as parent's thumbnail?"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxdescription}
	{gallery->text text="You can make use this item as the thumbnail for its parent album."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.makeHighlight"}{gallery->text text="Yes, highlight this item!"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
