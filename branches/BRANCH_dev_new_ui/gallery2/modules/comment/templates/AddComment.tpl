{gallery->mainbody1}
  {gallery->form action_controller=$controller}

    {* Embed the hidden return fields *}
    {foreach from=$return key=key item=value}
      {gallery->input type="hidden" name=return.$key}{$value}{/gallery->input}
    {/foreach}

    {gallery->input type="hidden" name="itemId"}{$item.id}{/gallery->input}

    {gallery->maintitle1}
      {gallery->text text="Add Comment"}
    {/gallery->maintitle1}

    {gallery->detailedbox}
      {gallery->detailedboxtitle}
	{gallery->text text="%s (%s)" arg1=$user.fullName arg2=$host}
      {/gallery->detailedboxtitle}
      {gallery->detailedboxbody}
	{gallery->textarea rows="15" cols="60" name="form.comment"}{/gallery->textarea}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

    {gallery->detailedbox}
      {gallery->detailedboxbody}
        {gallery->input type="submit" name="form.action.add"}{gallery->text text="save"}{/gallery->input}
        {gallery->input type="submit" name="form.action.cancel"}{gallery->text text="cancel"}{/gallery->input}
      {/gallery->detailedboxbody}
    {/gallery->detailedbox}

  {/gallery->form}
{/gallery->mainbody1}
