{gallery->mainbody1}
  {gallery->form action_controller="$controller"}
    {gallery->input type="hidden" name="form.formName"}AdminGroups{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Group Management"}
    {/gallery->maintitle1}

    {if isset($status)}
      {gallery->detailedbox}
	{gallery->detailedboxbody}
	  {gallery->status}
	    {if isset($status.deletedGroup)}
	      {gallery->text text="Removed group '%s'" arg1=$status.deletedGroup}
	    {/if}
	    {if isset($status.createdGroup)}
	      {gallery->text text="Created group '%s'" arg1=$status.createdGroup}
	    {/if}
	    {if isset($status.modifiedGroup)}
	      {gallery->text text="Modified group '%s'" arg1=$status.modifiedGroup}
	    {/if}
	  {/gallery->status}
	{/gallery->detailedboxbody}
      {/gallery->detailedbox}
    {/if}

    {gallery->detailedbox}
      {gallery->detailedboxdescription}
	{gallery->text one="There is %d group in the system." 
	             many="There are %d total groups in the system." 
	             count=$totalGroupCount
	             arg1=$totalGroupCount}
      {/gallery->detailedboxdescription}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Group Edit"}
      {/gallery->detailedboxtitle}
      
      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1body}
	      {gallery->input type="text" name="form.text.groupName" size="20"}{$form.text.groupName}{/gallery->input}
	      {if isset($form.error.text.noSuchGroupr)}
		{gallery->error}
		  {gallery->text text="Group '%s' does not exist." arg1=$form.text.groupName}
		{/gallery->error}
	      {/if}
	      {if isset($form.error.text.noGroupSpecified)}
		{gallery->error}
		  {gallery->text text="You must enter a group name"}
		{/gallery->error}
	      {/if}
	      <br />
	      {gallery->input type="submit" name="form.action.editFromText"}{gallery->text text="Edit"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.deleteFromText"}{gallery->text text="Delete"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.addRemoveUsersFromText"}{gallery->text text="Add/Remove Users"}{/gallery->input}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Group Edit (by list)"}
      {/gallery->detailedboxtitle}
      {gallery->detailedboxbody}
	{gallery->widget1set}
	  {gallery->widget1}
	    {gallery->widget1body}
	      {gallery->select name="form.list.groupId" size=$form.list.pageSize}
		{html_options options=$form.list.groupNames}
	      {/gallery->select}
	      <br/>
	      {gallery->input type="submit" name="form.action.editFromList"}{gallery->text text="Edit"}{/gallery->input}
	      {gallery->input type="submit" name="form.action.deleteFromList"}{gallery->text text="Delete"}{/gallery->input}	      {gallery->input type="submit" name="form.action.addRemoveUsersFromList"}{gallery->text text="Add/Remove Users"}{/gallery->input}

	      {if ($form.list.maxPages > 1)}
		{gallery->text text="Viewing page %d of %d"
		  arg1=$form.list.page
		  arg2=$form.list.maxPages}
		
		{if ($form.list.page > 1)}
		  {gallery->input type="submit" name="form.action.firstPage"}{gallery->text text="First Page"}{/gallery->input}
		  {gallery->input type="submit" name="form.action.backPage"}{gallery->text text="<< Back"}{/gallery->input}
		{/if}
		{if ($form.list.page < $form.list.maxPages)}
		  {gallery->input type="submit" name="form.action.nextPage"}{gallery->text text="Next >>"}{/gallery->input}
		  {gallery->input type="submit" name="form.action.lastPage"}{gallery->text text="Last Page"}{/gallery->input}
		{/if}
		
		{gallery->input type="text" name="form.list.filter"}{$form.list.filter}{/gallery->input}
		{gallery->input type="submit" name="form.action.filterBySubstring"}{gallery->text text="Filter:"}{/gallery->input}
		{gallery->input type="submit" name="form.action.filterClear"}{gallery->text text="Clear"}{/gallery->input}
		
		{gallery->input type="hidden" name="form.list.page"}{$form.list.page}{/gallery->input}
		{gallery->input type="hidden" name="form.list.maxPages"}{$form.list.maxPages}{/gallery->input}
	      {/if}
	      
	      {if (!empty($form.list.filter))}
		{gallery->text one="%d group matches your filter"
		  many="%d groups match your filter"
		  count=$form.list.count
		  arg1=$form.list.count}
	      {/if}
	      
	      {if isset($form.error.list.noGroupSelected)}
		{gallery->error}
		  {gallery->text text="You must select a group"}
		{/gallery->error}
	      {/if}
	    
	      {if isset($form.error.list.cantDeleteAllUsersGroup)}
		{gallery->error}
		  {gallery->text text="You cannot delete the All Users group!"}
		{/gallery->error}
	      {/if}
	      
	      {if isset($form.error.list.cantDeleteAdminGroup)}
		{gallery->error}
		  {gallery->text text="You cannot delete the Site Admins group!"}
		{/gallery->error}
	      {/if}

	      {if isset($form.error.list.cantEditUsers)}
		{gallery->error}
		  {gallery->text text="You cannot add or delete users from this group"}
		{/gallery->error}
	      {/if}
	    {/gallery->widget1body}
	  {/gallery->widget1}
	{/gallery->widget1set}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="Create Group"}
      {/gallery->detailedboxtitle}
      {gallery->detailedboxbody}
	{gallery->input type="submit" name="form.action.create"}{gallery->text text="Create"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}
  {/gallery->form}
{/gallery->mainbody1}

  