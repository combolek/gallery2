<script type="text/javascript">
  // <![CDATA[
  $(document).ready(function(){
    $("#gCommentAdd").ajaxForm(
      { target: "#gCommentThread",
	url: "index.php?/comment/add",
	success: function() {
	  $("#gCommentThread li:last")
	  .hide()
	  .slideDown("slow")
	  .animate({ backgroundColor: "#ff9" }, 1000)
	  .animate({ backgroundColor: "#fff" }, 1000)
	}
      })
    .clearForm();
    });
  // ]]>
</script>
<form method="post" action="index.php?/comment/Add" id="gCommentAdd" class="gCompactForm">
  <fieldset>
    <legend>Add comment</legend>
    <div class="row">
      <label for="gCommentAuthor">Your Name</label>
      <input type="text" name="author" id="gCommentAuthor" class="text" />
    </div>
    <div class="row">
      <label for="gCommentEmail">Your Email (not displayed)</label>
      <input type="text" name="email" id="gCommentEmail" class="text" />
    </div>
    <div class="row">
      <label for="gCommentText">Comment</label>
      <textarea name="text" id="gCommentText"></textarea>
    </div>
    <input type="hidden" id="gItemId" name="item_id" value="<?= $item_id ?>" />
    <input type="submit" id="gCommentSubmit" value="Add" />
  </fieldset>
</form>

