{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock">
  <h3> {g->text text="Define picture size limit"} </h3>

  <div style="margin: 0.5em 0">
    <div style="font-weight: bold">
      {g->text text="Maximum dimensions of full sized images"}
    </div>
    <input id="{"dimensionsNone"|elementId}" type="radio" name="{"form[SizeLimitOption][dimensionChoice]"|formVar}" value="unlimited"  onclick="SizeLimitOption.toggleDimensions()"{if $SizeLimitOption.dimensionChoice == "unlimited"} checked="checked"{/if}/>
    <label for="{"dimensionsNone"|elementId}"> {g->text text="No Limits"} </label>
    <br/>
    <input type="radio" name="{"form[SizeLimitOption][dimensionChoice]"|formVar}" value="explicit" onclick="SizeLimitOption.toggleDimensions()" {if $SizeLimitOption.dimensionChoice == "explicit"}checked="checked"{/if}/>
    {g->dimensions formVar="form[SizeLimitOption][dimensions]"
		   width=$SizeLimitOption.width height=$SizeLimitOption.height}
    {if $SizeLimitOption.dimensionChoice == "unlimited"}
    <script type="text/javascript">
      // <![CDATA[

      var form = YAHOO.util.Dom.get("{"form"|elementId:"ItemAdmin"}");
      form.elements["{"form[SizeLimitOption][dimensions][width]"|formVar}"].disabled = "disabled";
      form.elements["{"form[SizeLimitOption][dimensions][height]"|formVar}"].disabled = "disabled";

      // ]]>
    </script>
    {/if}

    <div class="giError" id="{"errorDimensionMissing"|elementId}"{if empty($form.error.SizeLimitOption.dimensions.missing)} style="display: none"{/if}> {g->text text="You must specify at least one of the dimensions"} </div>
  </div>

  <div style="margin: 0.5em 0">
    <div style="font-weight: bold">
      {g->text text="Maximum file size of full sized images in kilobytes"}
    </div>
    <input id="{"sizeNone"|elementId}" type="radio" name="{"form[SizeLimitOption][sizeChoice]"|formVar}" value="unlimited" onclick="SizeLimitOption.toggleSize()" {if $SizeLimitOption.sizeChoice == "unlimited"} checked="checked"{/if}/>
    <label for="{"sizeNone"|elementId}"> {g->text text="No Limits"} </label>
    <br/>
    <input type="radio" name="{"form[SizeLimitOption][sizeChoice]"|formVar}" value="explicit" onclick="SizeLimitOption.toggleSize()" {if $SizeLimitOption.sizeChoice == "explicit"} checked="checked"{/if}/>
    <input type="text" name="{"form[SizeLimitOption][filesize]"|formVar}" value="{$SizeLimitOption.filesize}" size="7" maxlength="6"{if $SizeLimitOption.sizeChoice != "explicit"} disabled="disabled"{/if}/>

    <div class="giError" id="{"errorFilesizeInvalid"|elementId}"{if empty($form.error.SizeLimitOption.filesize.invalid)} style="display: none"{/if}> {g->text text="You must enter a number (greater than zero)"} </div>
  </div>

  <input id="{"keepOriginal"|elementId}" type="checkbox" name="{"form[SizeLimitOption][keepOriginal]"|formVar}"{if $SizeLimitOption.keepOriginal} checked="checked"{/if}/>
  <label for="{"keepOriginal"|elementId}"> {g->text text="Keep original image?"} </label>
  <br/>
  <input id="{"applyToDescendents"|elementId}" type="checkbox" name="{"form[SizeLimitOption][applyToDescendents]"|formVar}"/>
  <label for="{"applyToDescendents"|elementId}"> {g->text text="Check here to apply size limits to the pictures in this album and all subalbums"} </label>
  <blockquote><p>
    {g->text text="Checking this option will rebuild pictures according to appropriate limits"}
  </p></blockquote>
  {g->changeInDescendents module="sizelimit" text="Use these size limits in all subalbums"}
  <blockquote><p>
    {g->text text="Checking this option will set same picture size limits in all subalbums"}
  </p></blockquote>
</div>

<script type="text/javascript">
  // <![CDATA[

  {* Template's client-side variables & functions *}
  var SizeLimitOption = {ldelim}
    toggleDimensions: function() {ldelim}
      var form = YAHOO.util.Dom.get("{"form"|elementId:"ItemAdmin"}");
      form.elements["{"form[SizeLimitOption][dimensions][width]"|formVar}"].disabled =
	!form.elements["{"form[SizeLimitOption][dimensionChoice]"|formVar}"][1].checked;
      form.elements["{"form[SizeLimitOption][dimensions][height]"|formVar}"].disabled =
	!form.elements["{"form[SizeLimitOption][dimensionChoice]"|formVar}"][1].checked;
    {rdelim},

    toggleSize: function() {ldelim}
      var form = YAHOO.util.Dom.get("{"form"|elementId:"ItemAdmin"}");
      form.elements["{"form[SizeLimitOption][filesize]"|formVar}"].disabled =
       !form.elements["{"form[SizeLimitOption][sizeChoice]"|formVar}"][1].checked;
    {rdelim}
  {rdelim};

  {* Ajax callback output *}
  {if GalleryUtilities::isCallback()}
    {capture append="smarty.output"}
      {if empty($form.error.SizeLimitOption.dimensions.missing)}
	YAHOO.util.Dom.get("{"errorDimensionMissing"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorDimensionMissing"|elementId}").style.display = "";
      {/if}

      {if empty($form.error.SizeLimitOption.filesize.invalid)}
	YAHOO.util.Dom.get("{"errorFilesizeInvalid"|elementId}").style.display = "none";
      {else}
	YAHOO.util.Dom.get("{"errorFilesizeInvalid"|elementId}").style.display = "";
      {/if}
    {/capture}
  {/if}

  // ]]>
</script>
