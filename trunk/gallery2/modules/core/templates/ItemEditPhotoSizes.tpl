<div class="gbAdmin">
  <div class="giTitle">
    {g->text text="Thumbnail"}
  </div>
  
  <div class="giDescription">
    {g->text text="Set the size of the thumbnail.  The largest side of the thumbnail will be no larger than this value."}
  </div>
  
  {if $ItemEditPhotoSizes.editSizes.can.createThumbnail}
  <input type="text" size="6" name="{g->formVar var="form[thumbnail][size]"}" value="{$form.thumbnail.size}"/>
  {else}
  <b>
    {g->text text="There are no graphics toolkits enabled that support this type of photo, so we cannot create or modify a thumbnail."}
    {if $ItemEditPhotoSizes.isAdmin} 
    <a href="{g->url arg1="view=core:SiteAdmin" arg2="subView=core:AdminModules"}">
      {g->text text="site admin"}
    </a>
    {/if}
  </b>
  {/if}

  {if !empty($form.error.thumbnail.size.missing)}
  <div class="giError">
    {g->text text="You must enter a thumbnail size"}
  </div>
  {/if}
  
  {if !empty($form.error.thumbnail.size.invalid)}
  <div class="giError">
    {g->text text="You must enter a number (greater than zero)"}
  </div>
  {/if}
</div>

<div class="gbAdmin">
  <div class="giTitle">
    {g->text text="Resized Photos"}
  </div>

  <div class="giDescription">
    {g->text text="These sizes are alternate resized versions of the original you would like to have available for viewing."}
  </div>

  {if $ItemEditPhotoSizes.editSizes.can.createThumbnail}
  {counter start=0 assign=index}
  {foreach from=$form.resizes item=resize}
  <input type="checkbox" name="{g->formVar var="form[resizes][$index][active]"}" {if $form.resizes.$index.active}checked="checked"{/if}/>
  <input type="text" size="6" name="{g->formVar var="form[resizes][$index][size]"}" value="{$form.resizes.$index.size}"/>

  <br/>

  {if !empty($form.error.resizes.$index.size.missing)}
  <div class="giError">
    {g->text text="You must enter a valid size"}
  </div>
  {/if}
      
  {if !empty($form.error.resizes.$index.size.invalid)}
  <div class="giError">
    {g->text text="You must enter a number (greater than zero)"}
  </div>
  {/if}
  {counter}
  {/foreach}
  {else}
  <b>
    {g->text text="There are no graphics toolkits enabled that support this type of photo, so we cannot create or modify resized versions."}
    {if $ItemEditPhotoSizes.isAdmin} 
    <a href="{g->url arg1="view=core:SiteAdmin" arg2="subView=core:AdminModules"}">
      {g->text text="site admin"}
    </a>
    {/if}
  </b>
  {/if}
</div>

<div class="gbAdmin">
  <input type="hidden" name="{g->formVar var="mode"}" value="editSizes"/>
  <input type="submit" name="{g->formVar var="form[action][save]"}" value="{g->text text="Save"}"/>
  <input type="submit" name="{g->formVar var="form[action][undo]"}" value="{g->text text="Undo"}"/>
</div>

