{if !empty($form.localServerFiles)}
<script type="text/javascript" language="javascript">
  function toggleSelections() {ldelim}
      form = document.forms[0];
      state = form.elements['{gallery->elementName name="selectionToggle"}'].checked;
      {foreach from=$form.localServerFiles item=file}
      form.elements['{gallery->elementName name="form.localServerFiles.`$file.fileKey`"}'].checked = state;
      {/foreach}
  {rdelim}
</script>
{/if}

{if $mode == 'fromLocalServer'}
<script type="text/javascript" language="javascript">
  function selectPath(path) {ldelim}
      document.forms[0].elements['{gallery->elementName name="form.localServerPath"}'].value = path;
  {rdelim}
</script>
{/if}

{gallery->mainbody1}
  {gallery->form action_controller="$controller" enctype="multipart/form-data" method="post"}
    {gallery->input type="hidden" name="form.formName"}ItemAddChildren{/gallery->input}
    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Add Items to this Album"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->description}
      	{gallery->text text="Gallery can handle files of any format.  However, it can only create automatic resizes and thumbnails for certain types of files."}
      {/gallery->description}
    {/gallery->detailedbox}

    {gallery->tabbedbox}
      {gallery->tabbedboxtabset}
	{if $mode != 'fromBrowser'}
	  {gallery->tabbedboxtab}
	    {gallery->link url_view="core:ItemAdmin" url_subView="core:ItemAddChildren" url_itemId=$item.id url_mode="fromBrowser"}
	      {gallery->text text="From Web Browser"}
	    {/gallery->link}
	  {/gallery->tabbedboxtab}
	{else}
	  {gallery->tabbedboxselectedtab}
	    {gallery->text text="From Web Browser"}
	  {/gallery->tabbedboxselectedtab}
	{/if}

	{if $mode != 'fromLocalServer'}
	  {gallery->tabbedboxtab}
	    {gallery->link url_view="core:ItemAdmin" url_subView="core:ItemAddChildren" url_itemId=$item.id url_mode="fromLocalServer"}
	      {gallery->text text="From Local Server"}
	    {/gallery->link}
	  {/gallery->tabbedboxtab}
	{else}
	  {gallery->tabbedboxselectedtab}
	    {gallery->text text="From Local Server"}
	  {/gallery->tabbedboxselectedtab}
	{/if}

	{if $mode != 'fromWebPage'}
	  {gallery->tabbedboxtab}
	    {gallery->link url_view="core:ItemAdmin" url_subView="core:ItemAddChildren" url_itemId=$item.id url_mode="fromWebPage"}
	      {gallery->text text="From Web Page"}
	    {/gallery->link}
	  {/gallery->tabbedboxtab}
	{else}
	  {gallery->tabbedboxselectedtab}
	    {gallery->text text="From Web Page"}
	  {/gallery->tabbedboxselectedtab}
	{/if}
      {/gallery->tabbedboxtabset}
	
      {gallery->body}
	{if $mode == 'fromBrowser'}
	  {gallery->detailedbox}
	    {gallery->description}
	      {gallery->text one="Upload a file directly from your computer."
	                     many="Upload up to %d files directly from your computer."
	                     count=$form.uploadBoxCount
	                     arg1=$form.uploadBoxCount}
	      {gallery->text text="Enter the full path to the file and an optional caption in the boxes below."}
	      {gallery->input type="hidden" name="form.uploadBoxCount"}{$form.uploadBoxCount}{/gallery->input}
	    {/gallery->description}

	    {gallery->body}
	      {gallery->widget2set}
		{section name="uploadBoxes" loop=$form.uploadBoxCount}
		  {assign var=iteration value=$smarty.section.uploadBoxes.iteration}
		  {gallery->widget2}
		    {gallery->title}
		      {gallery->text text="File"}
		    {/gallery->title}
		    {gallery->body}
		      {gallery->input name=form.fileUpload.$iteration type="file" size="60"}{/gallery->input}
		    {/gallery->body}
		  {/gallery->widget2}

		  {gallery->widget2}
		    {gallery->title}
		      {gallery->text text="Caption"}
		    {/gallery->title}
		    {gallery->body}
		      {gallery->textarea rows="2" cols="60" name=form.fileUpload.$iteration.caption}{/gallery->textarea}
		    {/gallery->body}
		  {/gallery->widget2}
		{/section}
	      {/gallery->widget2set}
	    {/gallery->body}
	  {/gallery->detailedbox}

	  {gallery->detailedbox}
	    {gallery->body}
	      {gallery->input type="submit" name="form.action.addFromBrowser"}{gallery->text text="Add Items"}{/gallery->input}
	    {/gallery->body}
	  {/gallery->detailedbox}
	{/if}

	{if $mode == 'fromLocalServer'}
	  {gallery->detailedbox}
	    {gallery->description}
	      {gallery->text text="Transfer files that are already on your server into your Gallery.  The files must already have been uploaded to your server some other way (like FTP) and must be placed in a directory where they are accessibly by anybody on the server.  If you're on Unix this means that the files and the directory the files are in should have modes of at least 755."}
	    {/gallery->description}

	    {gallery->body}
	      {if empty($localServerDirList)}
		{gallery->text text="For security purposes, you can't use this feature until the Gallery Site Administrator configures a set of legal upload directories."}
		{if $isAdmin} 
		  {gallery->link url_view="core:SiteAdmin" url_subView="core:AdminCore"}
		    {gallery->text text="site admin"}
		  {/gallery->link}
		{/if}
	      {else}
		{if empty($form.localServerFiles)}
		  {gallery->widget2set}
		    {gallery->widget2}
		      {gallery->title}
			{gallery->text text="Server Path"}
		      {/gallery->title}
		      {gallery->body}
			{gallery->input type=text size=80 name="form.localServerPath"}{$form.localServerPath}{/gallery->input}
			{if isset($form.error.localServerPath.missing)}
			  {gallery->error}
			    {gallery->text text="You must enter a directory."}
			  {/gallery->error}
			{/if}

			{if isset($form.error.localServerPath.invalid)}
			  {gallery->error}
			    {gallery->text text="The directory you entered is invalid.  Make sure that the directory is readable by all users."}
			  {/gallery->error}
			{/if}

			{if isset($form.error.localServerPath.illegal)}
			  {gallery->error}
			    {gallery->text text="The directory you entered is illegal.  It must be a sub directory of one of the directories listed below."}
			  {/gallery->error}
			{/if}

			<br />
			{gallery->text text="Legal Directories"}
			{if $isAdmin}
			  {gallery->link url_view="core:SiteAdmin" url_subView="core:AdminCore"}
			    {gallery->text text="modify"}
			  {/gallery->link}
			{/if}
			{gallery->listing}
			  {foreach from=$localServerDirList item=dir}
			    {gallery->listingitem}
			      {gallery->link javascript="selectPath('$dir')"}
				{$dir}
			      {/gallery->link}
			    {/gallery->listingitem}
			  {/foreach}
			{/gallery->listing}
			{gallery->input type="submit" name="form.action.findFilesFromLocalServer"}{gallery->text text="Find Files"}{/gallery->input}
		      {/gallery->body}
		    {/gallery->widget2}
		  {/gallery->widget2set}
		{else} {* {if empty($form.localServerFiles)} *}
		  {gallery->widget2set}
		    {gallery->widget2}
		      {gallery->title}
			{gallery->text text="Directory"} {$form.localServerPath}
			{gallery->link url_view="core:ItemAdmin" url_subView="core:ItemAddChildren" url_itemId=$item.id url_form_localServerPath=$form.localServerPath url_form_formName="ItemAddChildren"}
			  {gallery->text text="change"}
			{/gallery->link}
			{gallery->input type="hidden" name="form.localServerPath"}{$form.localServerPath}{/gallery->input}
		      {/gallery->title}
		      {gallery->body}
			{gallery->table}
			  {gallery->row}
			    {gallery->columnheader}
			      {gallery->input name="selectionToggle" type="checkbox" onChange="javascript:toggleSelections()"}{/gallery->input}
			    {/gallery->columnheader}
			    {gallery->columnheader}
			      {gallery->text text="File name"}
			    {/gallery->columnheader}
			    {gallery->columnheader}
			      {gallery->text text="Type"}
			    {/gallery->columnheader}
			    {gallery->columnheader}
			      {gallery->text text="Size"}
			    {/gallery->columnheader}
			  {/gallery->row}

			  {foreach from=$form.localServerFiles item=file}
			    {gallery->row}
			      {gallery->column}
				{gallery->input type="checkbox" name="form.localServerFiles.`$file.fileKey`"}{/gallery->input}
			      {/gallery->column}
			      {gallery->column}
				{$file.fileName}
			      {/gallery->column}
			      {gallery->column}
				{$file.itemType}
			      {/gallery->column}
			      {gallery->column}
				{gallery->text one="%d byte" many="%d bytes" count=$file.stat.size arg1=$file.stat.size}
			      {/gallery->column}
			    {/gallery->row}
			  {/foreach}
			{/gallery->table}
			{gallery->input type="submit" name="form.action.addFromLocalServer"}{gallery->text text="Add Files"}{/gallery->input}
		      {/gallery->body}
		    {/gallery->widget2}
		  {/gallery->widget2set}
		{/if} {* {if !empty($form.localServerFiles)} *}
	      {/if} {* {if empty($localServerDirList)} *}
	    {/gallery->body}
	  {/gallery->detailedbox}
	{/if}

	{if $mode == 'fromWebPage'}
	  {gallery->detailedbox}
	    {gallery->title}
	      {gallery->text text="Not implemented yet"}
	    {/gallery->title}
	  {/gallery->detailedbox}
	{/if}
      {/gallery->body}
    {/gallery->tabbedbox}
  {/gallery->form}
{/gallery->mainbody1}


