{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminModules{/gallery->input}

    {gallery->maintitle1}
      Gallery Modules
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxdescription}
	{gallery->text text="Gallery features come as separate modules.  You can download and install modules to add more features to your Gallery, or you can disable features if you don't want to use them.  In order to use a feature, you must install, configure (if necessary) and activate it.  If you don't wish to use a feature, you can deactivate it."}
      {/gallery->detailedboxdescription}

      {gallery->detailedboxbody}
	{gallery->table width="100%"}
	  {gallery->row}
	    {gallery->columnheader} {gallery->text text="Module Name"} {/gallery->columnheader}
	    {gallery->columnheader} {gallery->text text="Version"} {/gallery->columnheader}
	    {gallery->columnheader} {gallery->text text="Description"} {/gallery->columnheader}
	    {gallery->columnheader} {gallery->text text="Actions"} {/gallery->columnheader}
	  {/gallery->row}

	  {foreach from=$modules item=module}
	    {gallery->row}
	      {gallery->column}
		{$module.name}
	      {/gallery->column}
	      {gallery->column}
		{$module.version}
	      {/gallery->column}
	      {gallery->column}
		{$module.description}
	      {/gallery->column}	
	      {gallery->column}
		{if (!empty($module.action))}
		  {if (empty($module.action.controller)) }
		    {gallery->link url_view='core:SiteAdmin' url_subView=$module.action.view url_return_view='core:SiteAdmin' url_return_subView='core:AdminModules'}
		      {$module.action.text}
		    {/gallery->link}
		  {else}
		    {gallery->link url_controller=$module.action.controller url_moduleName=$module.action.moduleName url_action=$module.action.action}
		      {$module.action.text}
		    {/gallery->link}
		  {/if}
		{else}
		  &nbsp;
		{/if}
	      {/gallery->column}	
	    {/gallery->row}
	  {/foreach}
	{/gallery->table}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}
