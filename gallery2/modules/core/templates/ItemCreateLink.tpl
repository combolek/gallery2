{g->pagebox}
  {g->banner}
    {g->title}
      {g->text text="Link an Item"}
    {/g->title}
  {/g->banner}

  {if (isset($status))}
    {g->success}
      {g->text one="Successfully linked %d item"
               many="Successfully linked %d items" 
               count=$status.linked.count
               arg1=$status.linked.count}
    {/g->success}
  {/if}

  {if !empty($ItemCreateLink.peers)}
    {g->box style="admin"}
      {g->title}
	{g->text text="Source"}
      {/g->title}
      
      {g->description}
	{g->text text="Choose the items you want to link"}
      {/g->description}

      {foreach from=$ItemCreateLink.peers item=peer}
	{assign var="peerItemId" value=$peer.id}
	{g->element}
  	  {g->input type="checkbox" name="form[selectedIds][$peerItemId]"}{$peer.selected}{/g->input}
  	  {$peer.title|default:$peer.pathComponent}
	{/g->element}
      {/foreach}
    {/g->box}

    {g->box style="admin"}
      {g->title}
	{g->text text="Destination"}
      {/g->title}
      
      {g->description}
	{g->text text="Choose a new album for the link"}
      {/g->description}
      
      {g->element}
	{g->select name="form[destination]"}
          {foreach from=$ItemCreateLink.albumTree item=album}
  	    <option value="{$album.data.id}">
  	    {"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"|repeat:$album.depth}`--
  	    {$album.data.title|default:$album.data.pathComponent}
  	    </option>
          {/foreach}
	{/g->select}
      {/g->element}

      {if !empty($form.error.destination.empty)}
	{g->error}
  	  {g->text text="No destination chosen"}
	{/g->error}
      {/if}
    {/g->box}
    
    {g->box style="admin"}
      {g->element}
	{g->input type="submit" name="form[action][link]"}{g->text text="Link"}{/g->input}
	{g->input type="submit" name="form[action][cancel]"}{g->text text="Cancel"}{/g->input}
      {/g->element}
    {/g->box}
  {else}
    {g->box style="admin"}
      {g->description}
	{g->text text="This album contains no items to link."}
      {/g->description}
    {/g->box}
  {/if}

{/g->pagebox}
