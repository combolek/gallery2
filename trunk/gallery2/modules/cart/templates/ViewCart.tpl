<form action="{g->url}" method="post">
  <p>
    {g->hiddenFormVars}
    <input type="hidden" name="{g->formVar var="controller"}" value="{$ViewCart.controller}"/>
    <input type="hidden" name="{g->formVar var="form[formName]"}" value="{$form.formName}"/>
  </p>

  <div id="gsHeader">
    <div class="gbTitleBanner">
      <div class="giTitle">
        {g->text text="View Your Cart"}
      </div>
    </div>
  </div>

  {if isset($status)}
  <div id="gsStatus">
    {if isset($status.cartModified)}
    <div class="giStatus">
      {g->text text="Cart updated successfully"}
    </div>
    {/if}
  </div>
  {/if}

  <div class="gbAdmin">
    <span>
      <a href="{g->url}">
        {g->text text="Browse Gallery"}
      </a>
    </span>
  </div>
    
  <div class="gbAdmin">
    <table class="gbDataTable">
      <tr>
        <th>
          {g->text text="Quantity"}
        </th>

        <th colspan="2" align="center">
          {g->text text="Item"}
        </th>

        <th>
          {g->text text="Type"}
        </th>

        <th>
          {g->text text="Remove"}
        </th>
      </tr>

      {foreach from=$ViewCart.items item=item}
      <tr class="{cycle values="gbEven,gbOdd"}">
        <td>
          <input type="text" size="3" name="{g->formVar var="form[counts][`$item.id`]"}" value="{$form.counts[$item.id]}"/>
        </td>

        <td>
          <a href="{g->url arg1="view=core:ShowItem" arg2="itemId=`$item.id`"}">
            {if isset($ViewCart.thumbnails[$item.id])}
            {g->image item=$ViewCart.items[$item.id] image=$ViewCart.thumbnails[$item.id]}
            {else}
            {g->text text="No thumbnail"}
            {/if}
          </a>
        </td>

        <td>
          <table>
            <tr>
      	<td valign="top">
      	  <b>
      	    {g->text text="Title"}
      	  </b>
      	</td>

      	<td>
      	  {$item.title}
      	</td>
            </tr>

            <tr>
      	<td valign="top">
      	  <b>
      	    {g->text text="Summary"}
      	  </b>
      	</td>

      	<td>
      	  {$item.summary}
      	</td>
            </tr>
          </table>
        </td>

        <td>
          {$ViewCart.itemTypeNames[$item.id].0}
        </td>

        <td align="center">
          <input type="checkbox" name="{g->formVar var="form[delete][`$item.id`]"}"/>
        </td>
      </tr>
      {/foreach}
    </table>
  </div>

  <div class="gbAdmin">
    <select name="{g->formVar var="form[pluginId]"}">
      <option label="{g->text text="Update Quantities"}" value="updateCart"> {g->text text="Update Quantities"} </option>
      <option label="{g->text text="Empty Cart"}" value="emptyCart"> {g->text text="Empty Cart"} </option>
      {foreach from=$ViewCart.plugins key=pluginId item=pluginData}
      <option label="{$pluginData.actionDisplayName}" value="{$pluginId}"> {$pluginData.actionDisplayName} </option>
      {/foreach}
    </select>

    <input type="submit" name="{g->formVar var="form[action][modify]"}" value="{g->text text="Go"}"/>
  </div>
</form>
