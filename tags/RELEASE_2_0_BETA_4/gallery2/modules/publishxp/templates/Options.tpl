{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<form action="{g->url}" method="post" id="publishXpForm"
 enctype="{$UserAdmin.enctype|default:"application/x-www-form-urlencoded"}">
  <div>      
    <script type="text/javascript">
      setSubtitle("{g->text text="Set options for the photos to be added."}");
      setOnBackUrl("{g->url arg1="view=publishxp.SelectAlbum" arg2="albumId=`$form.albumId`" forJavascript="true"}");
      setSubmitOnNext(true);
      setButtons(true, true, false);
    </script>
    {g->hiddenFormVars}
    <input type="hidden" name="{g->formVar var="controller"}" value="publishxp.Options"/>
    <input type="hidden" name="{g->formVar var="form[formName]"}" value="{$form.formName}"/>
    <input type="hidden" name="{g->formVar var="form[albumId]"}" value="{$form.albumId}"/>
    <input type="hidden" name="{g->formVar var="form[action][setOptions]"}" value="1"/>
  </div>
 
  <div class="gbBlock gcBackground1">
    <h2>
      {g->text text="Specify extra options for uploaded photos"}
    </h2>
  </div>

  <div class="gbBlock">
    <p class="giDescription">
      {g->text text="Now that you have chosen the destination album, the following options can be used when adding the photos to Gallery."}
    </p>

    <input type="checkbox" name="{g->formVar var="form[stripExtensions]"}" {if !empty($form.stripExtensions)}checked{/if}>
    {g->text text="Strip file extensions?"}
      
    <br/>

    <input type="checkbox" name="{g->formVar var="form[setCaptions]"}" {if !empty($form.setCaptions)}checked{/if}>
    {g->text text="Set captions on the published items?"}
  </div>
</form>
