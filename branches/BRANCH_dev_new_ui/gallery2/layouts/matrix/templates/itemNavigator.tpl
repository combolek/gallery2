{gallery->linksbox}
  {if isset($layout.navigator.first)}
    {gallery->item}
      {strip}
	{gallery->link url_view="core:ShowItem" url_itemId=$layout.navigator.first}
	  {gallery->text text="first"}
	{/gallery->link}
      {/strip}
    {/gallery->item}
  {/if}
  {if isset($layout.navigator.back)}
    {gallery->item}
      {strip}
	{gallery->link url_view="core:ShowItem" url_itemId=$layout.navigator.back}
	  {gallery->text text="back"}
	{/gallery->link}
      {/strip}
    {/gallery->item}
  {/if}
  {if isset($layout.navigator.next)}
    {gallery->item}
      {strip}
	{gallery->link url_view="core:ShowItem" url_itemId=$layout.navigator.next}
	  {gallery->text text="next"}
	{/gallery->link}
      {/strip}
    {/gallery->item}
  {/if}
  {if isset($layout.navigator.last)}
    {gallery->item}
      {strip}
	{gallery->link url_view="core:ShowItem" url_itemId=$layout.navigator.last}
	  {gallery->text text="last"}
	{/gallery->link}
      {/strip}
    {/gallery->item}
  {/if}
{/gallery->linksbox}
