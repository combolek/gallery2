<div id="gsAdminContents">
  <div class="gbTopFlag">
    <div class="gbTitle">
      <div class="giTitle">
	{g->text text="Comment change confirmation"}
      </div>
    </div>

    <div class="spacer">
      &nbsp;
    </div>
  </div>

  {if isset($status)}
  <div id="gsStatus">
    <div class="giStatus">
      {if isset($status.added)}
      {g->text text="Comment added successfully"}
      {/if}
      {if isset($status.deleted)}
      {g->text text="Comment deleted successfully"}
      {/if}
      {if isset($status.saved)}
      {g->text text="Comment modified successfully"}
      {/if}
    </div>
  </div>
  {/if}
</div>
