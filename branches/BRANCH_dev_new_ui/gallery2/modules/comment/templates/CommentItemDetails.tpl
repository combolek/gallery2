{if !empty($CommentItemDetails.comments)}
  {gallery->simplebox}
    {gallery->title}
      {gallery->text text="Recent comments"}

      {if sizeof($CommentItemDetails.comments) < $CommentItemDetails.totalComments }
	{gallery->link url_view="comment:ShowComments" url_itemId=$CommentItemDetails.item.id}
	  {gallery->text text="(view all %d comments)" arg1=$CommentItemDetails.totalComments}
	{/gallery->link}
      {/if}
    {/gallery->title}

    {gallery->body}
      {foreach from=$CommentItemDetails.comments item=comment}
	{gallery->detailedbox}
	  {gallery->title}
	    {$comment.commenter.fullName|default:$comment.commenter.userName}
	    {if $CommentItemDetails.can.edit || $CommentItemDetails.can.delete}
	      {gallery->linksbox}
		{if $CommentItemDetails.can.edit}
		  {gallery->item}
		    {gallery->link url_return="true" url_view="core:ItemAdmin" url_subView="comment:EditComment" url_itemId=$CommentItemDetails.item.id url_commentId=$comment.id}
		      {gallery->text text="edit"}
		    {/gallery->link}
		  {/gallery->item}
		{/if}
		{if $CommentItemDetails.can.delete}
		  {gallery->item}
		    {gallery->link url_return="true" url_view="core:ItemAdmin" url_subView="comment:DeleteComment" url_itemId=$CommentItemDetails.item.id url_commentId=$comment.id}
		      {gallery->text text="delete"}
		    {/gallery->link}
		  {/gallery->item}
		{/if}
	      {/gallery->linksbox}
	    {/if}

	  {/gallery->title}

	  {gallery->description}
	    {gallery->date timestamp=$comment.date format="%e-%b-%Y %H:%M"}
	    {if !empty($comment.host) && $CommentItemDetails.can.viewIp}
	      {gallery->textmodifier}
		{$comment.host}
	      {/gallery->textmodifier}
	    {/if}
	  {/gallery->description}

	  {gallery->body}
	    {$comment.comment|truncate:256}
	  {/gallery->body}
	{/gallery->detailedbox}
      {/foreach}
    {/gallery->body}
  {/gallery->simplebox}
{/if}
