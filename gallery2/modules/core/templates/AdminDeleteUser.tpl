{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminDeleteUser{/gallery->input}
    {gallery->input type="hidden" name="userId"}{$user.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Delete User"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Are you sure?"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="This will completely remove <b>%s</b> from Gallery.  There is no undo!" arg1=$user.userName}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.delete"}{gallery->text text="Delete"}{/gallery->input}
	{gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
