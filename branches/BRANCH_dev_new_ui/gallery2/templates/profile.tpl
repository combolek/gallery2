    <!-- Profiling output -->
    {if !empty($main.profile)}
    <br>
    <center>
      <table border="1">
	  <tr>
	    <td colspan="8">
	      {gallery->text text="Profiling"}
	    </td>
	  </tr>

	  <tr>
	    <th rowspan=2> {gallery->text text="Function"}
	    <th colspan=2> {gallery->text text="Combined"}
	    <th colspan=3> {gallery->text text="Internal"}
	    <th colspan=3> {gallery->text text="External"}
	  </tr>
	  <tr>
	    <th> {gallery->text text="Calls"}
	    <th> {gallery->text text="Total"}
	    <th> &lt;{gallery->text text="Total"}&gt;
	    <th> {gallery->text text="Max"}
	    <th> {gallery->text text="Average"}
	    <th> {gallery->text text="Total"}
	    <th> {gallery->text text="Max"}
	    <th> {gallery->text text="Average"}
	  </tr>

      {foreach from=$main.profile item=profileEntry}
      <tr>
	<td>
	  {$profileEntry.name}
	</td>
      {if (isset($profileEntry.error))} 
      <td colspan="7">
	{gallery->text text="Error:"} {$profileEntry.error}
      </td>
      {else}
      <td>
	{$profileEntry.count}
      </td>
      <td>
	{$profileEntry.total}
      </td>
      <td>
	{$profileEntry.internal.total}
      </td>
      <td>
	{$profileEntry.internal.max}
      </td>
      <td>
	{$profileEntry.internal.average}
      </td>
      <td>
	{$profileEntry.external.total}
	<!-- External call report for {$profileEntry.name} -->
	{foreach from=$profileEntry.external.calls item=call}
	<!-- Call: {$call.elapsed} {$call.marker} -->
	{/foreach}
      </td>
      <td>
	{$profileEntry.external.max}
      </td>
      <td>
	{$profileEntry.external.average}
      </td>
      {/if}
    </tr>
      {/foreach}
    </table>
    </center>
    {/if}
