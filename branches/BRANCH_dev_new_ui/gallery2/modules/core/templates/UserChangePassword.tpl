{gallery->mainbody1}
  {gallery->form action_controller=$controller}
    {gallery->maintitle1}
      {gallery->text text="Change Password"}
    {/gallery->maintitle1}

    {if isset($status)}
      {gallery->detailedbox}
	{gallery->detailedboxbody}
	  {gallery->status}
	    {if isset($status.changedPassword)}
	      {gallery->text text="Password changed successfully"}
	    {/if}
	  {/gallery->status}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {/if}

    {gallery->detailedbox}
      {gallery->detailedboxdescription}
	{gallery->text text="You must enter a new password twice to change passwords."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->widget2set}
	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Password"}
	      {gallery->textmodifier1}
		{gallery->text text="required"}
	      {/gallery->textmodifier1}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->input type="password" name="form.password1"}{/gallery->input}
	      {if isset($form.error.password1.missing)}
		{gallery->error}
		  {gallery->text text="You must enter a password"}
		{/gallery->error}
	      {/if}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Verify Password"}
	      {gallery->textmodifier1}
		{gallery->text text="required"}
	      {/gallery->textmodifier1}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->input type="password" name="form.password2"}{/gallery->input}

	      {if isset($form.error.password2.missing)}
		{gallery->error}
		  {gallery->text text="You must enter your password again!"}
		{/gallery->error}
	      {/if}

	      {if isset($form.error.password2.mismatch)}
		{gallery->error}
		  {gallery->text text="The passwords you entered did not match"}
		{/gallery->error}
	      {/if}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2body}
	      {gallery->input type="submit" name="form.action.save"}{gallery->text text="Change"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	{/gallery->widget2set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}