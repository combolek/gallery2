{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}UserLogin{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Log in to your account"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->widget2set}
	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="User name"}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->input type="text" name="form.username"}{$form.username}{/gallery->input}

	      {if isset($form.error.username.missing)}
		{gallery->error}
		  {gallery->text text="You must enter a username"}
		{/gallery->error}
	      {/if}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Password"}
	    {/gallery->widget2title}
	    {gallery->widget2body}
	      {gallery->input type="password" name="form.password"}{/gallery->input}
	      {if isset($form.error.password.missing)}
		{gallery->error}
		  {gallery->text text="You must enter a password"}
		{/gallery->error}
	      {/if}

	      {if isset($form.error.invalidPassword)}
		{gallery->error}
		  {gallery->text text="Your login information is incorrect.  Please try again."}
		{/gallery->error}
	      {/if}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2body}
	      {gallery->input type="submit" name="form.action.login"}{gallery->text text="Login"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
	    {/gallery->widget2body}
	  {/gallery->widget2}
	{/gallery->widget2set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
