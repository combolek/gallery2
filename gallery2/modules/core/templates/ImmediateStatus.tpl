{*
 * $Revision$
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{literal}
<script type="text/javascript">
  function updateStatus(title, description, percentComplete) {

    document.getElementById('ImmediateStatus_title').innerHTML = title;
    document.getElementById('ImmediateStatus_description').innerHTML = description;
	
    var progressMade = Math.round(percentComplete * 100);
    document.getElementById('ImmediateStatus_progressMade').style.width = progressMade + "%"
    document.getElementById('ImmediateStatus_progressToGo').style.width = (100 - progressMade) + "%";

    if (progressMade == 100) {
      document.getElementById('ImmediateStatus_progressToGo').style.display = 'none';
    } else {
      document.getElementById('ImmediateStatus_progressToGo').style.display = 'inline';
    }
  }
</script>
{/literal}

<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <h2 class="giTitle">
	{$ImmediateStatus.pageTitle}
      </h2>
    </div>
  </div>

  <div class="gbAdmin">
    <h2 class="giTitle">
      <span id="ImmediateStatus_title">{$ImmediateStatus.sectionTitle}</span>
    </h2>
  
    <p class="giDescription">
      <span id="ImmediateStatus_description">{$ImmediateStatus.sectionDescription}</span>
    </p>
  </div>

  <div class="gbAdmin">
    <table class="gbStatusTable" cellspacing="0">
      <tr>
        <td id="ImmediateStatus_progressMade" class="giStatusProgressMade" style="width:0%">&nbsp;</td>
        <td id="ImmediateStatus_progressToGo" class="giStatusProgressToGo" style="width:100%; border-left: none')">&nbsp;</td>
      </tr>
    </table>
  </div>

{* do not modify the following line *}
SPLIT ON THIS LINE

</div>
