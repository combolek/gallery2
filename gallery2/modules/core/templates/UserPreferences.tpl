{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}UserPreferences{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Account Settings"}
    {/gallery->maintitle1}

    {if isset($status)}
      {gallery->detailedbox}
	{gallery->detailedboxbody}
	  {gallery->status}
	    {if isset($status.saved)}
	      {gallery->text text="Account settings saved successfully"}
	    {/if}
	  {/gallery->status}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {/if}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->widget2set}
	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Username"}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {$user.userName}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Full name"}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->input type="text" name="form.fullName"}{$form.fullName}{/gallery->input}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Email address"}
	      {gallery->textmodifier1}
		{gallery->text text="required"}
	      {/gallery->textmodifier1}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->input type="text" name="form.email"}{$form.email}{/gallery->input}
	      {if isset($form.error.email.missing)}
		{gallery->error}
		  {gallery->text text="You must enter an email address"}
		{/gallery->error}
	      {/if}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Language"}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->select name="form.language"}
		{html_options options=$languageList selected=$form.language}
	      {/gallery->select}
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
