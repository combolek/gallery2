{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<div class="gbBlock">
<form id="LoginSystemContent" action="{g->url}" method="post"><div>
  {g->hiddenFormVars}
  <input type="hidden" name="{g->formVar var="controller"}" value="core:UserLogin" />
  <input type="hidden" name="{g->formVar var="form[formName]"}" value="UserLogin" />

  <input type="text" id="giFormUsername" size="10"
   name="{g->formVar var="form[username]"}" value="{g->text text="Username"}"
   onfocus="var f=document.getElementById('giFormUsername'); if (f.value == '{g->text text="Username" forJavascript=1}') {ldelim} f.value = '' {rdelim}"
   onblur="var f=document.getElementById('giFormUsername'); if (f.value == '') {ldelim} f.value = '{g->text text="Username" forJavascript=1}' {rdelim}"
   />
  <br/>

  <input type="password" id="giFormPassword" size="10" name="{g->formVar var="form[password]"}"/>
  <input type="submit" class="inputTypeSubmit"
   name="{g->formVar var="form[action][login]"}" value="{g->text text="Login"}"/>
</div></form>
</div>
