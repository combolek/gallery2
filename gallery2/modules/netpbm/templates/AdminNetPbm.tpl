{gallery->form action_controller="$controller"}
  {gallery->input type="hidden" name="form.formName"}AdminNetPbm{/gallery->input}

  {gallery->mainheader}
    {gallery->mainheadertitle}
      {gallery->text text="NetPBM Settings"}
    {/gallery->mainheadertitle}
  {/gallery->mainheader}

  {gallery->mainbody}
    {gallery->setting}
      {gallery->settingdescription}
	{gallery->text text="NetPBM is a graphics toolkit that can be used to process images that you upload to Gallery.  You must install the NetPBM binaries on your machine, then enter the path to them in the text box below.  If you're on a Unix machine, don't forget to make the binaries executable (<i>chmod 755 *</i> in the NetPBM directory should do it)"}
      {/gallery->settingdescription}

      {gallery->settingbody}
	{gallery->widgetset}
	  {gallery->widget}
	    {gallery->widgettitle}
	      {gallery->text text="Path to NetPBM:"}
	    {/gallery->widgettitle}

	    {gallery->widgetbody}
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
	    {/gallery->widgetbody}
	  {/gallery->widget}

	  {gallery->widget}
	    {gallery->widgettitle}
	      {gallery->text text="PNM to JPEG converter"}
	    {/gallery->widgettitle}

	    {gallery->widgetbody}
	      {gallery->select name="form.pnmtojpeg"}
		{html_options values=$pnmToJpegList selected=$form.pnmtojpeg output=$pnmToJpegList}
	      {/gallery->select}
	    {/gallery->widgetbody}
	  {/gallery->widget}

	  {gallery->widget}
	    {gallery->widgettitle}
	      {gallery->text text="JPEG Quality"}
	    {/gallery->widgettitle}

	    {gallery->widgetbody}
	      {gallery->select name="form.jpegQuality"}
		{html_options values=$jpegQualityList selected=$form.jpegQuality output=$jpegQualityList}
	      {/gallery->select}
	    {/gallery->widgetbody}
	  {/gallery->widget}
	{/gallery->widgetset}
      {/gallery->settingbody}
    {/gallery->setting}

    {gallery->buttonbar}
      {gallery->buttonbaritem}
	{gallery->input type="submit" name="form.action.save"}{gallery->text text="Save Settings"}{/gallery->input}
      {/gallery->buttonbaritem}
      {gallery->buttonbaritem}
	{gallery->input type="submit" name="form.action.test"}{gallery->text text="Test Settings"}{/gallery->input}
      {/gallery->buttonbaritem}
      {gallery->buttonbaritem}
	{gallery->input type="submit" name="form.action.cancel"}{gallery->text text="Cancel"}{/gallery->input}
      {/gallery->buttonbaritem}
    {/gallery->buttonbar}

    <!-- BEGIN UNCONVERTED BLOCK -->
    {if !empty($tests)}
      <table>
      <tr>
      <td align="center" colspan="2">
      <table width="50%" cellpadding="0" cellspacing="0" border="1">
      <tr>
      <td colspan="2" align="center">
      {gallery->bigFontSize}
        {gallery->text text="NetPBM binary test results"}
      {/gallery->bigFontSize}
      </td>
      </tr>
      <tr>
      <th> {gallery->text text="Binary Name"} </th>
      <th> {gallery->text text="Pass/Fail"} </th>
      </tr>
      {foreach from=$tests item=test}
        <tr>
        <td align="center" valign="top">
        {$test.name}
        </td>
        <td align="center">
        {if ($test.success)}
          {gallery->successFontColor}{gallery->text text="Passed"}{/gallery->successFontColor}
        {else}
          {gallery->errorFontColor}{gallery->text text="Failed"}{/gallery->errorFontColor}
        {/if}
        </td>
        </tr>
        {if empty($test.success) && !empty($test.results)}
          <tr>
          <td colspan="2">
          {gallery->text text="Error messages:"}
          <br>
          {foreach from=$test.results item=line}
          <pre>{$line}</pre>
          {/foreach}
          </td>
          </tr>
        {/if}
      {/foreach}
      {if $mimeTypes}
        <tr>
        <td colspan="2">
        &nbsp;
        </td>
        </tr>
        <tr>
        <th> {gallery->text text="Supported MIME Types"} </th>
        <td align="center">
        {foreach from=$mimeTypes item=mimeType}
          {$mimeType}<br>
        {/foreach}
        </td>
        </tr>
      {/if}
      </table>
      </td>
      </tr>
      </table>
    {/if}
    <!-- END UNCONVERTED BLOCK -->
  {/gallery->mainbody}
{/gallery->form}
    
