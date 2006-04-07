{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<script type="text/javascript" src="{g->url href="lib/prototype/prototype.js"}"></script>
<script type="text/javascript">
  //<![CDATA[
  contexts = new Array();

  var stateData = {ldelim}
    "inactive" : {ldelim}
      "img.src" : "{g->url href="modules/core/data/module-inactive.gif"}",
      "img.alt" : "{g->text text="Status: Inactive"}",
      "actions" : {ldelim} "activate": 1, "uninstall" : 1 {rdelim}
    {rdelim},
    "active" : {ldelim}
      "img.src" : "{g->url href="modules/core/data/module-active.gif"}",
      "img.alt" : "{g->text text="Status: Active"}",
      "actions" : {ldelim} "deactivate": 1 {rdelim}
    {rdelim},
    "uninstalled" : {ldelim}
      "img.src" : "{g->url href="modules/core/data/module-install.gif"}",
      "img.alt" : "{g->text text="Status: Not Installed"}",
      "actions" : {ldelim} "install": 1 {rdelim}
    {rdelim},
    "unupgraded" : {ldelim}
      "img.src" : "{g->url href="modules/core/data/module-upgrade.gif"}",
      "img.alt" : "{g->text text="Status: Upgrade Required (Inactive)"}",
      "actions" : {ldelim} "upgrade": 1 {rdelim}
    {rdelim},
    "incompatible" : {ldelim}
      "img.src" : "{g->url href="modules/core/data/module-incompatible.gif"}",
      "img.alt" : "{g->text text="Status: Incompatible Module (Inactive)"}",
      "actions" : {ldelim} {rdelim}
    {rdelim},
    "unconfigured" : {ldelim}
      "img.src" : "{g->url href="modules/core/data/module-inactive.gif"}",
      "img.alt" : "{g->text text="Status: Inactive (Configuration Required)"}",
      "actions" : {ldelim} "configure" : 1, "uninstall" : 1 {rdelim}
    {rdelim}
  {rdelim};
  var errorPageUrl = '{g->url arg1="view=core.ErrorPage" htmlEntities=0}';

{literal}
  var allActions = [ "install", "configure", "upgrade", "activate", "deactivate", "uninstall" ];
  function updateModuleState(moduleId, state, isSeedingRun) {
    icon = $("module-icon-" + moduleId);
    icon.src = stateData[state]['img.src'];
    icon.alt = stateData[state]['img.alt'];
    for (var i in allActions) {
      var node = $("action-" + allActions[i] + "-" + moduleId);
      if (node) {
	node.style.display = stateData[state]['actions'][allActions[i]] ? 'inline' : 'none';
      }
    }

    var re = new RegExp().compile('gbLink-' + moduleId + '_');
    var links = document.getElementsByTagName("li");
    for (i in links) {
      if (re.test(links[i].className)) {
        links[i].style.display = (state == 'active') ? 'block' : 'none';
      }
    }

    if (!isSeedingRun) {
      addMessage(moduleId, "Module [" + moduleId + "] state set to " + state);
    }
  }

  function setModuleBusyStatus(moduleId, makeBusy) {
    var row = $("module-row-" + moduleId);
    if (makeBusy) {
      row.className = row.className + " gbBusy";
    } else {
      row.className = row.className.replace(" gbBusy", "");
    }
  }

  function performModuleAction(moduleId, url) {
    if (contexts[moduleId]) {
      return;
    }

    contexts[moduleId] = Array();

    var callback = function(response) {
      if (response.readyState != 4) {
	return;
      }

      eval("var result = " + response.responseText)
      if (result['status'] == 'success') {
        for (var stateChangeModuleId in result['states']) {
          updateModuleState(stateChangeModuleId, result['states'][stateChangeModuleId], false);
        }
      } else if (result['status'] == 'redirect') {
	document.location.href = result['redirect'];
      } else if (result['status'] == 'error') {
	document.location.href = errorPageUrl;
      }

      setModuleBusyStatus(moduleId, false);
      delete(contexts[moduleId]);
    }

    new Ajax.Request(url, {method: 'get', parameters: '', onComplete: callback});
    setModuleBusyStatus(moduleId, true);

    return false;
  }

  var STATUS_COUNTER = 0;
  var STATUS_BOX_ID = "gbModuleStatusUpdates";
  addMessage = function(moduleId, message) {
    var moduleStatus = document.createElement("div");
    moduleStatus.id = "module-status-details-" + moduleId + "-" + (STATUS_COUNTER++);
    moduleStatus.style.whiteSpace = "nowrap";
    moduleStatus.appendChild(document.createTextNode(message));

    var containerEl = $(STATUS_BOX_ID);
    containerEl.appendChild(moduleStatus);
    containerEl.style.display = "block";

    var dimensions = Element.getDimensions(containerEl);
    containerEl.style.left = ((document.width - dimensions.width) / 2) + "px";

    updateStatusPosition();
    setTimeout("removeMessage('" + moduleStatus.id + "')", 3000);
  }

  removeMessage = function(moduleStatusId) {
    var containerEl = $(STATUS_BOX_ID);
    var statusMessage = $(moduleStatusId);
    if (statusMessage != null) {
      containerEl.removeChild(statusMessage);
    }

    if (containerEl.childNodes.length == 0) {
      containerEl.style.display = "none";
    }
  }

  updateStatusPosition = function() {
    var containerEl = $(STATUS_BOX_ID);
    containerEl.style.top = document.getElementsByTagName("html")[0].scrollTop + "px";
  }

  Event.observe(window, "scroll", updateStatusPosition, false);
  //]]>
</script>
{/literal}

<div id="gbModuleStatusUpdates"></div>

<div class="gbBlock gcBackground1">
  <h2> {g->text text="Gallery Modules"} </h2>
</div>

<div class="gbBlock">
  <p class="giDescription">
    {g->text text="Gallery features come as separate modules.  You can download and install modules to add more features to your Gallery, or you can disable features if you don't want to use them.  In order to use a feature, you must install, configure (if necessary) and activate it.  If you don't wish to use a feature, you can deactivate it."}
  </p>

  <table class="gbDataTable">
    {assign var="group" value=""}
    {foreach from=$AdminModules.modules item=module}
      {if $group != $module.group}
	{if !empty($group)}
	  <tr><td> &nbsp; </td></tr>
	{/if}
	<tr>
	  <th colspan="6"><h2>{$module.groupLabel}</h2></th>
	</tr><tr>
	  <th> &nbsp; </th>
	  <th> {g->text text="Module Name"} </th>
	  <th> {g->text text="Version"} </th>
	  <th> {g->text text="Installed"} </th>
	  <th> {g->text text="Description"} </th>
	  <th> {g->text text="Actions"} </th>
	</tr>
      {/if}
      {assign var="group" value=$module.group}

      <tr id="module-row-{$module.id}" class="{cycle values="gbEven,gbOdd"}">
	<td style="display: relative;">
	  <img id="module-icon-{$module.id}" src="" width="13" height="13" alt="" />
	</td>

	<td>
	  {$module.name}
	</td>

	<td align="center">
	  {$module.version}
	</td>

	<td align="center">
	  {$module.installedVersion}
	</td>

	<td>
	  {$module.description}
	  {if $module.state == 'incompatible'}
	    <br/>
	    <span class="giError">
	      {g->text text="Incompatible module!"}
	      {if $module.api.required.core != $module.api.provided.core}
		<br/>
		{g->text text="Core API Required: %s (available: %s)"
			 arg1=$module.api.required.core arg2=$module.api.provided.core}
	      {/if}
	      {if $module.api.required.module != $module.api.provided.module}
		<br/>
		{g->text text="Module API Required: %s (available: %s)"
			 arg1=$module.api.required.module arg2=$module.api.provided.module}
	      {/if}
	    </span>
	  {/if}
	</td>

	<td>
          {if $module.id == 'core' || $module.state == 'incompatible'}
	    &nbsp;
	  {else}
            <a style="cursor: pointer" id="action-install-{$module.id}" onclick="performModuleAction('{$module.id}', '{g->url arg1="view=core.ModuleCallback" arg2="moduleId=`$module.id`" arg3="command=installModule"}')">
              {g->text text="install"}
            </a>
            <a style="cursor: pointer" id="action-upgrade-{$module.id}" onclick="performModuleAction('{$module.id}', '{g->url arg1="view=core.ModuleCallback" arg2="moduleId=`$module.id`" arg3="command=upgradeModule"}')">
              {g->text text="upgrade"}
            </a>
            <a style="cursor: pointer" id="action-configure-{$module.id}" onclick="performModuleAction('{$module.id}', '{g->url arg1="view=core.ModuleCallback" arg2="moduleId=`$module.id`" arg3="command=configureModule"}')">
              {g->text text="configure"}
            </a>
            <a style="cursor: pointer" id="action-activate-{$module.id}" onclick="performModuleAction('{$module.id}', '{g->url arg1="view=core.ModuleCallback" arg2="moduleId=`$module.id`" arg3="command=activateModule"}')">
              {g->text text="activate"}
            </a>
            <a style="cursor: pointer" id="action-deactivate-{$module.id}" onclick="performModuleAction('{$module.id}', '{g->url arg1="view=core.ModuleCallback" arg2="moduleId=`$module.id`" arg3="command=deactivateModule"}')">
              {g->text text="deactivate"}
            </a>
            <a style="cursor: pointer" id="action-uninstall-{$module.id}" onclick="performModuleAction('{$module.id}', '{g->url arg1="view=core.ModuleCallback" arg2="moduleId=`$module.id`" arg3="command=uninstallModule"}')">
              {g->text text="uninstall"}
            </a>
	  {/if}
          <script type="text/javascript"> updateModuleState('{$module.id}', '{$module.state}', true); </script>
	</td>
      </tr>
    {/foreach}
  </table>
</div>
