<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <div class="giTitle">
	{g->text text="Confirm Migration"}
      </div>
    </div>

    <div class="spacer">
      &nbsp;
    </div>
  </div>

  <div class="gbAdmin">
    <div class="giTitle">
      {g->text text="Users to import:"}
    </div>

    {if isset($form.migrateUser)}
      {foreach from=$form.migrateUser key=uid item=junk}
      <input type="hidden" name="{g->formVar var="form[migrateUser][$uid]"}" value="1"/>
      {$ConfirmImport.uids.$uid} &nbsp;
      {/foreach}
    </table>
    {/if}
  </div>

  <div class="gbAdmin">
    <div class="giTitle">
      {g->text text="Albums to import"}
    </div>

    <table class="gbDataTable">
      <tr>
	<th>
	  {g->text text="Album Name"}
	</th>
	<th>
	  {g->text text="Album Title"}
	</th>
	<th>
	  {g->text text="Album Notes"}
	</th>
      </tr>

      {foreach from=$form.sourceAlbums item=albumName}
      <tr class="{cycle values="gbEven,gbOdd"}">
	<td>
	  {$ConfirmImport.urlDecoded.$albumName}
	  <input type="hidden" name="{g->formVar var="form[sourceAlbums][$albumName]"}" value="1"/>
	</td>

	<td>
	  {$ConfirmImport.titles.$albumName}
	</td>

	<td>
	  {if ($ConfirmImport.existingAlbums.$albumName)> 0}
	  {g->text text="An album already exists with this name.  This album will be renamed."}
	  <br />
	  {/if}

	  {if ($ConfirmImport.illegalAlbumNames.$albumName) != ''}
	  {g->text text="This album has an illegal name and will be renamed to <i>%s</i>" 
	           arg1=$ConfirmImport.illegalAlbumNames.$albumName}
	  <br />
	  {/if}

	  {if (!$ConfirmImport.albumValidOwner.$albumName)}
	  {g->text text="This album's owner hasn't been imported"}
	  {/if}
	</td>
      </tr>
      {/foreach}
    </table>
  </div>

  <div class="gbAdmin">
    <div class="giDescription">
      {g->text text="Top level albums and albums whose parents are not selected will be imported into this album:"}
    </div>

    <div class="giInfo">
      <span>
	{g->text text="Title: %s" arg1=$ConfirmImport.targetAlbum.title}
      </span>
      <span>
	{g->text text="Description: %s" arg1=$ConfirmImport.targetAlbum.description}
      </span>
    </div>
    <input type="hidden" name="{g->formVar var="form[destinationAlbumID]"}" value="{$ConfirmImport.destinationAlbumID}"/>
  </div>

  <div class="gbAdmin">
    <input type="hidden" name="{g->formVar var="albumsPath"}" value="{$ConfirmImport.albumsPath}"/>
    <input type="submit" name="{g->formVar var="form[action][import]"}" value="{g->text text="Import"}"/>
    <input type="submit" name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}"/>
  </div>
</div>
