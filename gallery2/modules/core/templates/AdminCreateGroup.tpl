{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminCreateGroup{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Create A New Group"}
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
	      {if isset($form.error.groupName.missing)}
		{gallery->error}
		  {gallery->text text="You must enter a group name"}
		{/gallery->error}
	      {/if}
	      
	      {if isset($form.error.groupName.exists)}
		{gallery->error}
		  {gallery->text text="Group '%s' already exists" arg1=$form.groupName}
		{/gallery->error}
	      {/if}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2body}
	      {gallery->input type="submit" name="form.action.create"}{gallery->text text="Create Group"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
	    {/gallery->widget2body}
	  {/gallery->widget2}
	{/gallery->widget2set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
