{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}ItemEditAlbum{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Album Settings"}
    {/gallery->maintitle1}

    {if isset($status)}
      {gallery->detailedbox}
	{gallery->detailedboxbody}
	  {gallery->status}
	    {if isset($status.createdAlbum)}
	      {gallery->text text="Album created successfully"}
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
	      {gallery->text text="Sort order"}
	    {/gallery->widget2title}
	    {gallery->widget2description}
	      {gallery->text text=" This sets the default sort order for the album.  This applies to all new items."}
	    {/gallery->widget2description}
	    {gallery->widget2body}
	      {gallery->select name="form.orderBy"}
		{html_options options=$orderByList selected=$form.orderBy}
	      {/gallery->select}
	      {gallery->select name="form.orderDirection"}
		{html_options options=$orderDirectionList selected=$form.orderDirection}
	      {/gallery->select}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Layout"}
	    {/gallery->widget2title}
	    {gallery->widget2description}
	      {gallery->text text="Choose a layout for this album. (The way the gallery is arranged on the page.)"}
	    {/gallery->widget2description}
	    {gallery->widget2body}
	      {gallery->select name="form.layout"}
		{html_options values=$layoutList selected=$form.layout output=$layoutList}
	      {/gallery->select}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Theme"}
	    {/gallery->widget2title}
	    {gallery->widget2description}
	      {gallery->text text="Choose a theme for this album.  (The look and feel of this album)"}
	    {/gallery->widget2description}
	    {gallery->widget2body}
	      {gallery->select name="form.theme"}
		{html_options values=$themeList selected=$form.theme output=$themeList}
	      {/gallery->select}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Thumbnails"}
	    {/gallery->widget2title}
	    {gallery->widget2description}
	      {gallery->text text=" Every item requires a thumbnail. Set the default value in pixels here."}
	    {/gallery->widget2description}
	    {gallery->widget2body}
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
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Resized Images"}
	    {/gallery->widget2title}
	    {gallery->widget2description}
	      {gallery->text text="Each item in your album can have multiple sizes. Define the default sizes here."}
	    {/gallery->widget2description}
	    {gallery->widget2body}
	      {gallery->table}
		{gallery->row}
		  {gallery->columnheader}
		    {gallery->text text="Active"}
		  {/gallery->columnheader}
		  {gallery->columnheader}
		    {gallery->text text="Target Size (pixels)"}
		  {/gallery->columnheader}
		{/gallery->row}
		{counter start=0 assign=index}
		{foreach from=$form.resizes item=resize}
		  {gallery->row}
		    {gallery->column}
		      {gallery->input type="checkbox" name="form.resizes.$index.active"}{$form.resizes.$index.active}{/gallery->input}
		    {/gallery->column}
		    {gallery->column}
		      {gallery->input type="text" size="6" name="form.resizes.$index.size"}{$form.resizes.$index.size}{/gallery->input}
		    {/gallery->column}
		  {/gallery->row}

	          {if !empty($form.error.resizes.$index.size.missing)}
		    {gallery->row}
		      {gallery->column colspan="2"}
			{gallery->error}
			  {gallery->text text="You must enter a valid size"}
			{/gallery->error}
		      {/gallery->column}
		    {/gallery->row}
                  {/if}
	          
	          {if !empty($form.error.resizes.$index.size.invalid)}
		    {gallery->row}
		      {gallery->column colspan="2"}
			{gallery->error}
			  {gallery->text text="You must enter a number (greater than zero)"}
			{/gallery->error}
		      {/gallery->column}
		    {/gallery->row}
                  {/if}
                  {counter}
	        {/foreach}
	      {/gallery->table}
	    {/gallery->widget2body}
	  {/gallery->widget2}

	  {gallery->widget2}
	    {gallery->widget2title}
	      {gallery->text text="Recreate thumbnails and resizes"}
	    {/gallery->widget2title}
	    {gallery->widget2description}
	      {gallery->text text="The thumbnail and resized image settings are for all new items. To apply these settings to all the items in your album, check the appropriate box."}
	    {/gallery->widget2description}
	    {gallery->widget2body}
	      {gallery->input type="checkbox" name="form.recreateThumbnails"}{$form.recreateThumbnails}{/gallery->input}
	      {gallery->text text="Recreate thumbnails"}
	      <br />
	      {gallery->input type="checkbox" name="form.recreateResizes"}{$form.recreateResizes}{/gallery->input}
	      {gallery->text text="Recreate resized images"}
	    {/gallery->widget2body}
	  {/gallery->widget2}
	{/gallery->widget2set}
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
