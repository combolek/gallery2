{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminEditGroup{/gallery->input}
    {gallery->input type="hidden" name="groupId"}{$group.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Edit a group"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->widget2set}
	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Group Name"}
	      {gallery->textmodifier1}
		{gallery->text text="required"}
	      {/gallery->textmodifier1}
	    {/gallery->widget2title}

	    {gallery->widget2body}
	      {gallery->input type="text" name="form.groupName"}{$form.groupName}{/gallery->input}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2body}
	      {gallery->input type="submit" name="form.action.save"}{gallery->text text="Save"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.undo"}{gallery->text text="Undo"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
	    {/gallery->widget2body}
	  {/gallery->widget2}
	{/gallery->widget2set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
