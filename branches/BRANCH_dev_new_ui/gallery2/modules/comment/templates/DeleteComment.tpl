{gallery->bannerbox}
  {gallery->title}
    {gallery->text text="Delete this comment?"}
  {/gallery->title}
{/gallery->bannerbox}


{gallery->detailedbox}
  {gallery->title}
    {gallery->text text="Are you sure?"}
  {/gallery->title}

  {gallery->description}
    {gallery->text text="Delete this comment?  There is no undo!"}
  {/gallery->description}

  {gallery->body}
    {gallery->input type="hidden" name="commentId"}{$DeleteComment.comment.id}{/gallery->input}
    {gallery->input type="submit" name="form.action.delete"}
      {gallery->text text="Delete"}
    {/gallery->input}
    {gallery->input type="submit" name="form.action.cancel"}
      {gallery->text text="Cancel"}
    {/gallery->input}
  {/gallery->body}
{/gallery->detailedbox}

{gallery->detailedbox}
  {gallery->body}
    {gallery->table}
      {gallery->row}
	{gallery->column}
	  {gallery->text text="Commenter: "}
	{/gallery->column}
	{gallery->column}
	  {$DeleteComment.commenter.userName}
	{/gallery->column}
      {/gallery->row}
      {gallery->row}
	{gallery->column}
	  {gallery->text text="Date: "}
	{/gallery->column}
	{gallery->column}
	  {gallery->date timestamp=$DeleteComment.comment.date format="%e-%b-%Y %H:%M"}
	{/gallery->column}
      {/gallery->row}
      {gallery->row}
	{gallery->column}
	  {gallery->text text="Comment: "}
	{/gallery->column}
	{gallery->column}
	  {$DeleteComment.comment.comment}
	{/gallery->column}
      {/gallery->row}
    {/gallery->table}
  {/gallery->body}
{/gallery->detailedbox}
