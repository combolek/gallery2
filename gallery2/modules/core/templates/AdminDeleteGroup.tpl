{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminDeleteGroup{/gallery->input}
    {gallery->input type="hidden" name="groupId"}{$group.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Delete a group"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Are you sure?"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="This will completely remove <b>%s</b> from Gallery.  There is no undo!"
	             arg1=$group.groupName}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.delete"}{gallery->text text="Delete"}{/gallery->input}
	{gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
