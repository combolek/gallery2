{gallery->pathbar}
  {foreach from=$parents item=parent}
    {gallery->pathbaritem}
      {gallery->link url_view='core:ShowItem' url_itemId=$parent.id}
	{$parent.title|default:$parent.pathComponent}
      {/gallery->link}
    {/gallery->pathbaritem}
    {gallery->pathbarseparator}
  {/foreach}
  {gallery->pathbaritem}
    {gallery->link url_view='core:ShowItem' url_itemId=$item.id}
      {$item.title|default:$item.pathComponent}
    {/gallery->link}
  {/gallery->pathbaritem}
{/gallery->pathbar}

{gallery->main}
  {gallery->sidebar1}
    {gallery->sidebarbox}
      {gallery->body}
	{if empty($thumbnail)}
	  {gallery->text text="No Thumbnail"}
	{else}
	  {gallery->thumbnail item=$item thumbnail=$thumbnail}
	{/if}
      {/gallery->body}
    {/gallery->sidebarbox}

    {gallery->sidebarbox}
      {gallery->title}
	{gallery->text text="Options"}
      {/gallery->title}
      {gallery->body}
	{gallery->listing}
	  {foreach from=$subViewChoices item=choice}
	    {gallery->listingitem}
	      {gallery->link url_view='core:ItemAdmin' url_subView=$choice.view url_itemId=$item.id}
		{$choice.name}
	      {/gallery->link}
	    {/gallery->listingitem}
	  {/foreach}
	{/gallery->listing}
      {/gallery->body}
    {/gallery->sidebarbox}

    {gallery->sidebarbox}
      {gallery->body}
	{gallery->title}
	  {gallery->text text="Navigation"}
	  {gallery->listing}
	    {if ($itemType == 'item')}
	      {gallery->listingitem}
		{gallery->link url_view='core:ShowItem' url_itemId=$item.id}
		  {gallery->text text="Back to Item View"}
		{/gallery->link}
	      {/gallery->listingitem}
	      {gallery->listingitem}
		{gallery->link url_view='core:ShowItem' url_itemId=$parents[0].id}
		  {gallery->text text="Back to Album View"}
		{/gallery->link}
	      {/gallery->listingitem}
	    {else}
	      {gallery->listingitem}
		{gallery->link url_view='core:ShowItem' url_itemId=$item.id}
		  {gallery->text text="Back to Album View"}
		{/gallery->link}
	      {/gallery->listingitem}
	    {/if}
	  {/gallery->listing}
	{/gallery->title}
      {/gallery->body}
    {/gallery->sidebarbox}
  {/gallery->sidebar1}

  {$subViewHtml}

{/gallery->main}
