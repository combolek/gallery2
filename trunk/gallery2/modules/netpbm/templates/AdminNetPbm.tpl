      {galleryForm controller="$controller"}
      {galleryInput type="hidden" name="formName"}AdminNetPbm{/galleryInput}

      <!-- Embed the hidden return fields -->
      {foreach from=$return key=key item=value}
      {galleryInput type="hidden" name=$key|string_format:"return.%s"}{$value}{/galleryInput}
      {/foreach}
      
    <table>

	<tr>
	  <td colspan="2" align="center">
	    {galleryBiggerFont} {galleryText text="NetPBM Settings"} {/galleryBiggerFont}
	  </td>
	</tr>

	<tr>
	  <td colspan="2">
	    {galleryText text="NetPBM is a graphics toolkit that can be used to process images that you upload to Gallery.  You must install the NetPBM binaries on your machine, then enter the path to them in the text box below.  If you're on a Unix machine, don't forget to make the binaries executable (<i>chmod 755 *</i> in the NetPBM directory should do it)"}
	  </td>
	</tr>

	<tr>
	  <td colspan="2">
	    {galleryBigFont} {galleryText text="Defaults"} {/galleryBigFont}
	  </td>
	</tr>

	<tr>
	  <td align="right">
	    {galleryText text="Path to NetPBM:"}
	  </td>
	  <td>
	    {galleryInput type="text" name="form.path"}{$form.path}{/galleryInput}
	  </td>
	</tr>

	<!-- {if isset($form.error.path.missing)} -->
	<tr>
	  <td colspan="2" align="center">
	    {galleryErrorFontColor}
	    {galleryText text="You must enter a path to your NetPBM binaries"}
	    {/galleryErrorFontColor}
	  </td>
	</tr>
	<!-- {/if} -->

	<tr>	
	  <td align="right">
	    {galleryText text="PNM to JPEG converter"}
	  </td>
	  <td>
	    {gallerySelect name="form.pnmtojpeg"}
	    {html_options values=$pnmToJpegList selected=$form.pnmtojpeg output=$pnmToJpegList}
	    {/gallerySelect}
	  </td>
	</tr>

	<tr>	
	  <td align="right">
	    {galleryText text="JPEG Quality"}
	  </td>
	  <td>
	    {gallerySelect name="form.jpegQuality"}
	    {html_options values=$jpegQualityList selected=$form.jpegQuality output=$jpegQualityList}
	    {/gallerySelect}
	  </td>
	</tr>

	<tr>
	  <td>
	    &nbsp;
	  </td>
	</tr>

	<tr>
	  <td colspan="2" align="center">
	    {galleryInput type="submit" name="form.action.save"}{galleryText text="Save Settings"}{/galleryInput}
	    {galleryInput type="submit" name="form.action.test"}{galleryText text="Test Settings"}{/galleryInput}
	    {galleryInput type="submit" name="form.action.cancel"}{galleryText text="Cancel"}{/galleryInput}
	  </td>
	</tr>

	<tr>
	  <td>
	    &nbsp;
	  </td>
	</tr>

    {if !empty($tests)}
    <tr>
      <td align="center" colspan="2">
	<table width="50%" cellpadding="0" cellspacing="0" border="1">
	    <tr>
	      <td colspan="2" align="center">
		{galleryBigFont} {galleryText text="NetPBM binary test results"} {/galleryBigFont}
	      </td>
	    </tr>
	    <tr>
	      <th> {galleryText text="Binary Name"} </th>
	      <th> {galleryText text="Pass/Fail"} </th>
	    </tr>
	{foreach from=$tests item=test}
	<tr>
	  <td align="center" valign="top">
	    {$test.name}
	  </td>
	  <td align="center">
	    {if ($test.success)}
	    {gallerySuccessFontColor}{galleryText text="Passed"}{/gallerySuccessFontColor}
	    {else}
	    {galleryErrorFontColor}{galleryText text="Failed"}{/galleryErrorFontColor}
	    {/if}
	  </td>
	</tr>

	{if empty($test.success) && !empty($test.results)}
	<tr>
	  <td colspan="2">
	    {galleryText text="Error messages:"}
	    <br>
	    {foreach from=$test.results item=line}
	    <pre>{$line}</pre>
	    {/foreach}
	  </td>
	</tr>
	{/if}

	{/foreach}
      </table>
      </td>
    </tr>
    {/if}

  </table>
    {/galleryForm}
    
