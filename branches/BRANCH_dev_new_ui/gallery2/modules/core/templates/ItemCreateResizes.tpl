{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}ItemCreateResizes{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Item Thumbnail Size and Resizes"}
    {/gallery->maintitle1}

    {if isset($status)}
      {gallery->detailedbox}
	{gallery->detailedboxbody}
	  {gallery->status}
	    {if isset($status.settingsSaved)}
	      {gallery->text text="Changes saved successfully."}
	    {/if}
	  {/gallery->status}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {/if}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Thumbnails"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="Specify the thumbnail size of this item here:"}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->input type=text size=6 name="form.thumbnail.size"}{$form.thumbnail.size}{/gallery->input}

	{if !empty($form.error.thumbnail.size.missing)}
	  {gallery->error}
	    {gallery->text text="You must enter a thumbnail size"}
	  {/gallery->error}
        {/if}

	{if !empty($form.error.thumbnail.size.invalid)}
	  {gallery->error}
	    {gallery->text text="You must enter a number (greater than zero)"}
	  {/gallery->error}
        {/if}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Resized Images"}
      {/gallery->detailedboxtitle}

      {gallery->detailedboxdescription}
	{gallery->text text="These sizes are alternate resized versions of the original you would like to have available for viewing."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {counter start=0 assign=index}
	  {foreach from=$form.resizes item=resize}
	    {gallery->widget1}
	      {gallery->widget1body}
		{gallery->input type="checkbox" name="form.resizes.$index.active"}{$form.resizes.$index.active}{/gallery->input}
		{gallery->input type="text" size="6" name="form.resizes.$index.size"}{$form.resizes.$index.size}{/gallery->input}

	        {if !empty($form.error.resizes.$index.size.missing)}
	          {gallery->error}
	            {gallery->text text="You must enter a valid size"}
	          {/gallery->error}
                {/if}
	        
	        {if !empty($form.error.resizes.$index.size.invalid)}
	          {gallery->error}
	            {gallery->text text="You must enter a number (greater than zero)"}
	          {/gallery->error}
                {/if}
                {counter}
	      {/gallery->widget1body}
	    {/gallery->widget1}
	  {/foreach}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.save"}{gallery->text text="Save"}{/gallery->input}
	{gallery->input type="submit" name="form.action.undo"}{gallery->text text="Undo"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
