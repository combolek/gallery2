<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <div class="giTitle">
	{g->text text="FFMPEG Settings"}
      </div>
    </div>

    <div class="spacer">
      &nbsp;
    </div>
  </div>

  {if isset($status)}
  <div id="gsStatus">
    {if isset($status.saved)}
    <div class="giStatus">
      {g->text text="Settings saved successfully"}
    </div>
    {/if}
  </div>
  {/if}

  <div class="gbAdmin">
    <div class="giDescription">
      {g->text text="FFMPEG is a graphics toolkit that can be used to process video files that you upload to Gallery.  You must install the FFMPEG binary on your machine, then enter the path to it in the text box below.  If you're on a Unix machine, don't forget to make the binary executable (<i>chmod 755 ffmpeg</i> in the right directory should do it)"}
    </div>

    <div class="gbDataEntry">
      <div class="giTitle">
	{g->text text="Path to FFMPEG:"}
      </div>
	
      <input type="text" size="40" name="{g->formVar var="form[path]"}" value="{$form.path}"/>
      
      {if isset($form.error.path.missing)}
      <div class="giError">
	{g->text text="You must enter a path to your FFMPEG binary"}
      </div>
      {/if}
      
      {if isset($form.error.path.testError)}
      <div class="giError">
	{g->text text="The path you entered doesn't contain a valid FFMPEG binary. Use the 'test' button to check where the error is."}
      </div>
      {/if}
      
      {if isset($form.error.path.badPath)}
      <div class="giError">
	{g->text text="The path you entered isn't a valid path to a <b>ffmpeg</b> binary."}
      </div>
      {/if}

      {if isset($form.error.path.notExecutable)}
      <div class="giError">
	{g->text text="The <b>ffmpeg</b> binary is not executable.  To fix it, run <b>chmod 755 %s</b> in a shell." arg1=$form.path}
      </div>
      {/if}
    </div>
  </div>

  <div class="gbAdmin">
    <input type="submit" name="{g->formVar var="form[action][save]"}" value="{g->text text="Save Settings"}"/>
    <input type="submit" name="{g->formVar var="form[action][test]"}" value="{g->text text="Test Settings"}"/>
    <input type="submit" name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}"/>
  </div>

  {if !empty($AdminFfmpeg.tests)}
  <div class="gbAdmin">
    <div class="giTitle">
      {g->text text="FFMPEG binary test results"}
    </div>

    <table class="gbDataTable">
      <tr>
	<th>
	  {g->text text="Binary Name"}
	</th>
	<th>
	  {g->text text="Pass/Fail"}
	</th>
      </tr>

      {foreach from=$AdminFfmpeg.tests item=test}
      <tr class="{cycle values="gbEven,gbOdd"}">
	<td>
	  {$test.name}
	</td>
	  
	<td>
	  {if ($test.success)}
	  <div class="giSuccess">
	    {g->text text="Passed"}
	  </div>
	  {else}
	  <div class="giError">
	    {g->text text="Failed"}
	  </div>

	  {if ! empty($test.message)}
	  {g->text text="Error messages:"}
	  <br />
	  {foreach from=$test.message item=line}
	  <pre>{$line}</pre>
	  {/foreach}
	  {/if}
	  {/if}
	</td>
      </tr>
      {/foreach}
    </table>
  </div>

  {if $AdminFfmpeg.mimeTypes}
  <div class="gbAdmin">
    <div class="giTitle">
      {g->text text="Supported MIME Types"}
    </div>

    <div class="giDescription">
      {g->text text="The FFMPEG module can support files with the following MIME types"}
    </div>
	
    {foreach from=$AdminFfmpeg.mimeTypes item=mimeType}
    {$mimeType} 
    {/foreach}
  </div>
  {/if}
  {/if}
</div>
