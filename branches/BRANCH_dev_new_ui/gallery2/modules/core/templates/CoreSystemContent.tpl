{gallery->simplebox}
  {gallery->title}
    {gallery->text text="Greetings, %s!" arg1=$CoreSystemContent.user.fullName|default:$user.userName}
  {/gallery->title}
  {gallery->body}
    {gallery->listingbox}
      {if isset($CoreSystemContent.show.siteAdmin)}
	{gallery->item}
	  {gallery->link url_view="core:SiteAdmin"}
	    {gallery->text text="Site admin"}
	  {/gallery->link}
	{/gallery->item}
      {/if}
      {if isset($CoreSystemContent.show.login)}
	{gallery->item}
	  {gallery->link url_return="true" url_view="core:UserAdmin" url_subView="core:UserLogin"}
	    {gallery->text text="Login"}
	  {/gallery->link}
	{/gallery->item}
      {/if}
      {if isset($CoreSystemContent.show.yourAccount)}
	{gallery->item}
	  {gallery->link url_view="core:UserAdmin" url_subView="core:UserPreferences"}
	    {gallery->text text="Your account"}
	  {/gallery->link}
	{/gallery->item}
      {/if}
      {if isset($CoreSystemContent.show.logout)}
	{gallery->item}
	  {gallery->link url_return="true" url_controller="core:Logout"}
	    {gallery->text text="Logout"}
	  {/gallery->link}
	{/gallery->item}
      {/if}
    {/gallery->listingbox}
  {/gallery->body}
{/gallery->simplebox}
