{gallery->pathbar}
  {gallery->pathbaritem}
    {gallery->text text="Your Account"}
  {/gallery->pathbaritem}
  {if ($show.userInPathbar)}
    {gallery->pathbarseparator}
    {gallery->pathbaritem}
      {gallery->text text=$user.fullName|default:$user.userName}
    {/gallery->pathbaritem}
  {/if}
{/gallery->pathbar}

{gallery->main}
  {gallery->sidebar1}
    {gallery->sidebarbox}
      {gallery->sidebarboxtitle}
	{gallery->text text="User Options"}
      {/gallery->sidebarboxtitle}
      
      {gallery->sidebarboxbody}
	{gallery->listing}
	  {foreach from=$subViewChoices item=choice}
	    {if ($subViewName == $choice.view)}
	      {gallery->listingselecteditem}
		{$choice.name}
	      {/gallery->listingselecteditem}
	    {else}
	      {gallery->listingitem}
		{gallery->link url_view='core:UserAdmin' url_subView=$choice.view}
		  {$choice.name}
		{/gallery->link}
	      {/gallery->listingitem}
	    {/if}
	  {/foreach}
	{/gallery->listing}
      {/gallery->sidebarboxbody}
    {/gallery->sidebarbox}
    
    {gallery->sidebarbox}
      {gallery->sidebarboxtitle}
	{gallery->text text="Navigation"}
      {/gallery->sidebarboxtitle}
      
      {gallery->sidebarboxbody}
	{gallery->listing}
	  {gallery->listingitem}
	    {gallery->link}
	      {gallery->text text="Browse Gallery"}
	    {/gallery->link}
	  {/gallery->listingitem}
	{/gallery->listing}
      {/gallery->sidebarboxbody}
    {/gallery->sidebarbox}
  {/gallery->sidebar1}

  {$subViewHtml}

{/gallery->main}