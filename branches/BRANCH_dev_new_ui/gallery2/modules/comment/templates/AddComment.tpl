{gallery->bannerbox}
  {gallery->title}
    {gallery->text text="Add Comment"}
  {/gallery->title}
{/gallery->bannerbox}

{if ($form.action.preview)}
  {gallery->detailedbox}
    {gallery->title}
      {gallery->text text="Comment Preview"}
    {/gallery->title}

    {gallery->body}
      {$form.comment}
    {/gallery->body}
  {/gallery->detailedbox}
{/if}

{gallery->detailedbox}
  {gallery->title}
    {gallery->text text="%s (%s)" arg1=$AddComment.user.fullName arg2=$AddComment.host}
  {/gallery->title}
  {gallery->body}
    {gallery->textarea rows="15" cols="60" name="form.comment"}{$form.comment}{/gallery->textarea}
  {/gallery->body}
{/gallery->detailedbox}

{gallery->detailedbox}
  {gallery->body}
    {gallery->input type="submit" name="form.action.preview"}{gallery->text text="preview"}{/gallery->input}
    {gallery->input type="submit" name="form.action.add"}{gallery->text text="save"}{/gallery->input}
    {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="cancel"}{/gallery->input}
  {/gallery->body}
{/gallery->detailedbox}
