{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminNetPbm{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="NetPBM Settings"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxdescription}
	{gallery->text text="NetPBM is a graphics toolkit that can be used to process images that you upload to Gallery.  You must install the NetPBM binaries on your machine, then enter the path to them in the text box below.  If you're on a Unix machine, don't forget to make the binaries executable (<i>chmod 755 *</i> in the NetPBM directory should do it)"}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="Path to NetPBM:"}
	    {/gallery->widget1title}
	    
	    {gallery->widget1body}
	      {gallery->input type="text" name="form.path"}{$form.path}{/gallery->input}
	      
	      {if isset($form.error.path.missing)}
		{gallery->error}
		  {gallery->text text="You must enter a path to your NetPBM binaries"}
		{/gallery->error}
	      {/if}

	      {if isset($form.error.path.testError)}
		{gallery->error}
		  {gallery->text text="The path you entered doesn't contain valid NetPBM binaries. Use the 'test' button to check where the error is."}
		{/gallery->error}
	      {/if}

	      {if isset($form.error.path.badPath)}
		{gallery->error}
		  {gallery->text text="The path you entered isn't a valid path."}
		{/gallery->error}
	      {/if}
	    {/gallery->widget1body}
	  {/gallery->widget1}

	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="PNM to JPEG converter"}
	    {/gallery->widget1title}

	    {gallery->widget1body}
	      {gallery->select name="form.pnmtojpeg"}
		{html_options values=$pnmToJpegList selected=$form.pnmtojpeg output=$pnmToJpegList}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}

	  {gallery->widget1}
	    {gallery->widget1title}
	      {gallery->text text="JPEG Quality"}
	    {/gallery->widget1title}

	    {gallery->widget1body}
	      {gallery->select name="form.jpegQuality"}
		{html_options values=$jpegQualityList selected=$form.jpegQuality output=$jpegQualityList}
	      {/gallery->select}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.save"}{gallery->text text="Save Settings"}{/gallery->input}
	{gallery->input type="submit" name="form.action.test"}{gallery->text text="Test Settings"}{/gallery->input}
	{gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {if !empty($tests)}
      {gallery->detailedbox}
	{gallery->detailedboxtitle}
	  {gallery->text text="NetPBM binary test results"}
	{/gallery->detailedboxtitle}
	
	{gallery->detailedboxbody}
	  {gallery->table}
	    {gallery->row}
	      {gallery->columnheader}
		{gallery->text text="Binary Name"}
	      {/gallery->columnheader}
	      {gallery->columnheader}
		{gallery->text text="Pass/Fail"}
	      {/gallery->columnheader}
	    {/gallery->row}

	    {foreach from=$tests item=test}
	      {gallery->row}
		{gallery->column}
		  {$test.name}
		{/gallery->column}
		{gallery->column}
		  {if ($test.success)}
		    {gallery->text text="Passed"}
		  {else}
		    {gallery->text text="Failed"}
		  {/if}
		{/gallery->column}
	      {/gallery->row}

	      {if ! $test.success && ! empty($test.message)}
		{gallery->row}
		  {gallery->column}
		    {gallery->text text="Error messages:"}
		    <br />
		    {foreach from=$test.message item=line}
		      <pre>{$line}</pre>
		    {/foreach}
		  {/gallery->column}
		{/gallery->row}
	      {/if}
	    {/foreach}
	  {/gallery->table}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}

      {if $mimeTypes}
	{gallery->detailedbox}
	  {gallery->detailedboxtitle}
	    {gallery->text text="Supported MIME Types"}
	  {/gallery->detailedboxtitle}

	  {gallery->detailedboxdescription}
	    {gallery->text text="The ImageMagick module can support files with the following MIME types"}
	  {/gallery->detailedboxdescription}
	  
	  {gallery->detailedboxbody}
	    {foreach from=$mimeTypes item=mimeType}
	      {$mimeType} 
	    {/foreach}
	  {/gallery->detailedboxbody}
	{/gallery->detailedbox}
      {/if}
    {/if}
  {/gallery->form}
{/gallery->mainbody1}    
