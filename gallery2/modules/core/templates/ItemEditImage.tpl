{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}ItemEditImage{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Edit Image"}
    {/gallery->maintitle1}

    {if isset($status)}
      {gallery->detailedbox}
	{gallery->detailedboxbody}
	  {gallery->status}
	    {if isset($status.rotatedImage)}
	      {gallery->text text="Rotated image successfully"}
	    {/if}
	    {if isset($status.scaledImage)}
	      {gallery->text text="Scaled image successfully"}
	    {/if}
	    {if isset($status.revertedImage)}
	      {gallery->text text="Restored original image successfully"}
	    {/if}
	  {/gallery->status}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {/if}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Rotate"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="You can only rotate the image in 90 degree increments."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.rotate.counterClockwise"}
	  {gallery->text text="CC 90&deg;"}
	{/gallery->input}
	&nbsp;
	{gallery->input type="submit" name="form.action.rotate.flip"}
	  {gallery->text text="180&deg;"}
	{/gallery->input}
	&nbsp;
	{gallery->input type="submit" name="form.action.rotate.clockwise"}
	  {gallery->text text="C 90&deg;"}
	{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Scale"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="Shrink or enlarge the original image.  When Gallery scales an image, it maintains the same aspect ratio (height to width) of the original image to avoid distortion.  The value you enter below (in pixels) forms a bounding box.  Gallery will scale the image until it is as large as possible while still fitting inside the box."}
      {/gallery->detailedboxdescription}
      
      {gallery->detailedboxbody}
	{gallery->input type="text" size="6" name="form.scale.size"}{$form.scale.size}{/gallery->input}
	{gallery->input type="submit" name="form.action.scale"}
	  {gallery->text text="Scale"}
	{/gallery->input}

	{if !empty($form.error.scale.size.missing)}
	  {gallery->error}
	    {gallery->text text="You must enter a size"}
	  {/gallery->error}
        {/if}

	{if !empty($form.error.scale.size.invalid)}
	  {gallery->error}
	    {gallery->text text="You must enter a number (greater than zero)"}
	  {/gallery->error}
        {/if}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {if empty($hasPreferredSource)}
      {gallery->detailedbox}
	{gallery->detailedboxtitle}
	  {gallery->text text="Preserve Original"}
	{/gallery->detailedboxtitle}

	{gallery->detailedboxdescription}
	  {gallery->text text="Gallery does not modify your original image when rotating and scaling. Instead, it duplicates your image and works with copies.  This requires a little extra disk space.  Disabling this option will cause any actions to happen to the original image.  This will permanently change your original image!"}
	{/gallery->detailedboxdescription}

	{gallery->detailedboxbody}
	  {gallery->input type="checkbox" name="form.preserveOriginal"}{$form.preserveOriginal}{/gallery->input} {gallery->text text="Preserve Original Image"}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {else}
      {gallery->detailedbox}
	{gallery->detailedboxtitle}
	  {gallery->text text="Modified Image"}
	{/gallery->detailedboxtitle}

	{gallery->detailedboxdescription}
	  {gallery->text text="You are using a copy of the original image that has been scaled or rotated.  The original image is still available, but is no longer being used.  Any changes you make will be applied to the copy instead."}
	{/gallery->detailedboxdescription}

	{gallery->detailedboxbody}
	  {gallery->input type="submit" name="form.action.revertToOriginal"}
	    {gallery->text text="Restore original"}
	  {/gallery->input}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {/if}
  {/gallery->form}
{/gallery->mainbody1}
