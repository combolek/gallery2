{gallery->mainbody1}
  {gallery->maintitle1}
    {gallery->text text="Upload Complete"}
  {/gallery->maintitle1}

  {gallery->detailedbox}
    {gallery->title}
      {if ($count)}
	{gallery->text one="Successfully added %d file." many="Successfully added %d files." count=$count arg1=$count}
      {else}
	{gallery->text text="No files added."}
      {/if}
    {/gallery->title}

    {if ($count)}
      {gallery->body}
	{gallery->table}
	  {foreach from=$status item=entry}
	    {gallery->row}
	      {gallery->column}
		{gallery->text text="Added %s" arg1=$entry.fileName}
	      {/gallery->column}
	    {/gallery->row}
	  {/foreach}
	{/gallery->table}
      {/gallery->body}
    {/if}
  {/gallery->detailedbox}

  {gallery->detailedbox}
    {gallery->body}
      {gallery->form action_view="core:ItemAdmin" action_subView="core:ItemAddChildren" action_itemId=$item.id}
	{gallery->input type="submit"}
	  {gallery->text text="Add more files"}
	{/gallery->input}
      {/gallery->form}
    {/gallery->body}
  {/gallery->detailedbox}
{/gallery->mainbody1}

