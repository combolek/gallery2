{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminCore{/gallery->input}
    
    {gallery->maintitle1}
      {gallery->text text="General Settings"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Defaults"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="These are default values.  They can be overridden in each album."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Default sort order"}
	    {/gallery->widget1title}

	    {gallery->widget1body}
	      {gallery->select name="form.default.orderBy"}
		{html_options options=$orderByList selected=$form.default.orderBy}
	      {/gallery->select}

	      {gallery->select name="form.default.orderDirection"}
		{html_options options=$orderDirectionList selected=$form.default.orderDirection}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}

	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Default layout"}
	    {/gallery->widget1title}

	    {gallery->widget1body}
	      {gallery->select name="form.default.layout"}
		{html_options values=$layoutList selected=$form.default.layout output=$layoutList}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}

	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Default theme"}
	    {/gallery->widget1title}

	    {gallery->widget1body}
	      {gallery->select name="form.default.theme"}
		{html_options values=$themeList selected=$form.default.theme output=$themeList}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Language settings"}
      {/gallery->detailedboxtitle}
      {gallery->detailedboxdescription}
	{gallery->text text="Select language defaults for Gallery. Individual users can override this setting in their personal preferences."}
      {/gallery->detailedboxdescription}
      
      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Default language"}
	    {/gallery->widget1title}
	    
	    {gallery->widget1body}
	      {gallery->select name="form.default.language"}
		{html_options options=$languageList selected=$form.default.language}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Filesystem Permissions"}
      {/gallery->detailedboxtitle}
      {gallery->detailedboxdescription}
	{gallery->text text="Specify the default permissions for files and directories that Gallery creates. This doesn't apply to files/directories that Gallery has already created."}
      {/gallery->detailedboxdescription}
      
      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="New directories"}
	    {/gallery->widget1title}
	    
	    {gallery->widget1body}
	      {gallery->select name="form.permissions.directory"}
		{html_options values=$permissionsDirectoryList selected=$form.permissions.directory output=$permissionsDirectoryList}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	  
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="New files"}
	    {/gallery->widget1title}
	    
	    {gallery->widget1body}
	      {gallery->select name="form.permissions.file"}
		{html_options values=$permissionsFileList selected=$form.permissions.file output=$permissionsFileList}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Local Server Upload Paths"}
      {/gallery->detailedboxtitle}
      
      {gallery->detailedboxdescription}
	{gallery->text text="Specify the legal directories on the local server where a user can store files and then upload them into Gallery using the <i>Upload from Local Server</i> feature.  The paths you enter here and all the files and directories under those paths will be available to any Gallery user who has upload privileges, so you should limit this to directories that won't contain sensitive data (eg. /tmp or /usr/ftp/incoming)"}
      {/gallery->detailedboxdescription}
      
      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Legal Paths"}
	    {/gallery->widget1title}
	    {gallery->widget1body}
	      {gallery->select name="form.uploadLocalServer.selectedDir" size="5"}
		{html_options values=$localServerDirList selected=$form.uploadFromLocalServer.selectedDir output=$localServerDirList}
	      {/gallery->select}

	      <br/>

	      {gallery->input type="submit" name="form.action.removeUploadLocalServerDir"}
		{gallery->text text="remove"}
	      {/gallery->input}

	      <br/>

	      {gallery->input type="submit" name="form.action.addUploadLocalServerDir"}
		{gallery->text text="add"}
	      {/gallery->input}
	      {gallery->input type="text" name="form.uploadLocalServer.newDir"}{/gallery->input}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Session Settings"}
      {/gallery->detailedboxtitle}
      
      {gallery->detailedboxdescription}
	{gallery->text text="Specify the lifetime of the session here."}
      {/gallery->detailedboxdescription}
      
      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Lifetime"}
	    {/gallery->widget1title}
	    
	    {gallery->widget1body}
	      {gallery->select name="session.lifetime"}
		{html_options options=$sessionTimeList selected=$form.session.lifetime}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	  
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Inactivity Timeout"}
	    {/gallery->widget1title}
	    
	    {gallery->widget1body}
	      {gallery->select name="session.inactivityTimeout"}
		{html_options options=$sessionTimeList selected=$form.session.inactivityTimeout}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.save"}
	  {gallery->text text="save"}
	{/gallery->input}
	{gallery->input type="submit" name="form.action.reset"}
	  {gallery->text text="reset"}
	{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
