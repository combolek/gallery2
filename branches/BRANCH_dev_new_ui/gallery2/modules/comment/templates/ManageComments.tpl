{gallery->bannerbox}
  {gallery->title}
    {gallery->text text="Manage Comments"}
  {/gallery->title}
{/gallery->bannerbox}

{gallery->simplebox}
  {gallery->body}
    {gallery->table}
      {gallery->row}
	{gallery->column header="true"}
	  {gallery->text text="Commenter"}
	{/gallery->column}
	{gallery->column header="true"}
	  {gallery->text text="Date"}
	{/gallery->column}
	{gallery->column header="true" width="45%"}
	  {gallery->text text="Comment"}
	{/gallery->column}
	{gallery->column header="true"}
	  {gallery->text text="Action"}
	{/gallery->column}
      {/gallery->row}
      {foreach from=$ManageComments.comments item=comment}
	{assign var=commenterId value=$comment.commenterId}
	{assign var=commenter value=$ManageComments.commenters.$commenterId}
	{gallery->row}
	  {gallery->column valign="top"}
	    {$commenter.fullName|default:$commenter.userName}
	  {/gallery->column}
	  {gallery->column valign="top"}
	    {gallery->date timestamp=$comment.date format="%e-%b-%Y %H:%M"}
	  {/gallery->column}
	  {gallery->column valign="top"}
	    {$comment.comment|truncate:100}
	  {/gallery->column}
	  {gallery->column valign="top"}
	    {gallery->linksbox}
	      {if ($ManageComments.show.edit)}
		{gallery->item}
		  {gallery->link url_view="core:ItemAdmin" url_subView="comment:EditComment" 
		    url_itemId=$ItemAdmin.item.id url_commentId=$comment.id}
		    {gallery->text text="edit"}
		  {/gallery->link}
		{/gallery->item}
	      {/if}
	      {if ($ManageComments.show.edit)}
		{gallery->item}
		  {gallery->link url_view="core:ItemAdmin" url_subView="comment:DeleteComment" 
		    url_itemId=$ItemAdmin.item.id url_commentId=$comment.id}
		    {gallery->text text="delete"}
		  {/gallery->link}
		{/gallery->item}
	      {/if}
	    {/gallery->linksbox}
	  {/gallery->column}
	{/gallery->row}
      {/foreach}
    {/gallery->table}
  {/gallery->body}
{/gallery->simplebox}
      