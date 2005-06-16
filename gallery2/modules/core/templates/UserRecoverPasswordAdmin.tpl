{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{capture name="loginDescriptionDownload"}
    <div class="giDescription">
      {g->text text="In order to proceed with the password reset, we have to verify that you are who you claim.  The best way to be sure is to ask you to make a tiny change in the Gallery directory which will prove that you have the right permissions.  So, we're going to ask that you create a new text file called %s in your gallery2 directory. It must contain the following randomly generated characters:" arg1="<strong>login.txt</strong>"}
    </div>
    <h2>
      {g->text text="%s" arg1=$UserRecoverPasswordAdmin.authString}
    </h2>
    <div class="giDescription">
      {capture name="downloadUrl"}
      <a href="{g->url arg1="view=core.UserAdmin" arg2="subView=core.UserRecoverPasswordDownload"}">
      {/capture}
      {g->text text="As a convenience to you, we've prepared a %scorrect version of login.txt%s for you.  Download that and copy it into your install directory and you're all set." arg1=$smarty.capture.downloadUrl arg2="</a>"}
     </div>
     <div class="giDescription">
       {g->text text="Once you've uploaded the file, click refresh to continue."}
     </div>
{/capture}
<div class="gbBlock gcBackground1">
  <h2> {g->text text="Emergency Administrator Password Reset"} </h2>
</div>

<div class="gbBlock">
  {g->text text="This page can be used to securely reset the password on your 'admin' account."}
</div>

  {if isset($UserRecoverPasswordAdmin.status.authString.correct)}
  <div class="gbBlock">
    <h2 class="giSuccess">
      {g->text text="Authorization Confirmed"}
    </h2>
    {g->text text="Your authorization has been confirmed.  Please enter your new password below.  After setting your new password you will be taken to the login page."}
  </div>

  <div class="gbBlock">
    <h4>{g->text text="New Password"}</h4>

    <input type="password" name="{g->formVar var="form[password1]"}"/>
    {if isset($form.error.password.missing)}
    <div class="giError">
      {g->text text="You must enter a new password"}
    </div>
    {/if}
  </div>

  <div class="gbBlock">
    <h4>{g->text text="Verify New Password"}</h4>

    <input type="password" name="{g->formVar var="form[password2]"}"/>
  </div>

  {if isset($form.error.password.mismatch)}
  <div class="giError">
    {g->text text="The passwords you entered did not match"}
  </div>
  {/if}

  <script type="text/javascript">
    document.forms[0]['{g->formVar var="form[password1]"}'].focus();
  </script>
  {elseif isset($UserRecoverPasswordAdmin.error.authString.incorrect) || isset($error.authString.incorrect)}
  <div class="gbBlock">
    {if !isset($UserRecoverPasswordAdmin.status.firstLoad)}
    <h2 class="giError">
      {g->text text="Authorization Incorrect"}
    </h2>
    {else}
    <h2 class="giSuccess">
      {g->text text="Recovery Instructions"}
    </h2>
    {/if}
    {$smarty.capture.loginDescriptionDownload}
  </div>
  {elseif isset($UserRecoverPasswordAdmin.error.authFile.missing)}
  <div class="gbBlock">
    <h2 class="giError">
      {g->text text="AuthFile Missing"}
    </h2>
    {$smarty.capture.loginDescriptionDownload}
  </div>
  {elseif isset($UserRecoverPasswordAdmin.error.authFile.unreadable)}
  <div class="gbBlock">
    <h2 class="giError">
      {g->text text="AuthFile Unreadable"}
    </h2>
    <h2>
      {g->text text="Your %s file is not readable. Please give Gallery read permissions on the file." arg1="<strong>login.txt</strong>"}
    </h2>
  </div>
  {/if}

<div class="gbBlock gcBackground1">
  {if isset($UserRecoverPasswordAdmin.status.authString.correct)}
  <input type="submit" class="inputTypeSubmit"
   name="{g->formVar var="form[action][recover]"}" value="{g->text text="Recover"}"/>
  {else}
  <input type="submit" class="inputTypeSubmit"
   name="{g->formVar var="form[action][refresh]"}" value="{g->text text="Refresh"}"/>
  {/if}
  <input type="submit" class="inputTypeSubmit"
   name="{g->formVar var="form[action][cancel]"}" value="{g->text text="Cancel"}"/>
</div>
