<? if ($comments): ?>
<script type="text/javascript">
// <![CDATA[
  
  // http://docs.jquery.com
  // https://www.ibm.com/developerworks/web/library/wa-jquery1/
  // http://plugins.jquery.com
  
  // Avoid conflicts w/ other JS frameworks that use $, like prototype
  // This allows the use of other JS frameworks
  j$ = jQuery.noConflict();
  
  // Wait for the DOM to load
  j$(document).ready(function(){
    // Get comment form values
    var commentAuthor = j$('#gCommentAuthor').val();
    var commentEmail = j$('#gCommentEmail').val();
    var commentText = j$('#gCommentText').val();
    var itemId = j$('#gItemId').val();
      
    alert(commentAuthor + commentEmail);
    
    // Run client-side validation
    
    // Send add comment request SHOULD BE SET UP WITH CALLBACKS FOR SUCCESS/ERROR
    // Display "processing" modal display
    j$("#gCommentAdd").ajaxForm(function() {
      // Show comment addition confirmation message
      alert("Your comment has been added");
      
      // Success callback - Add the comment
        // Get ready to add the new comment to the thread
        var newCommentID = 'gComment-' + j$("#gCommentThread").children("li").length + 1;
        
        // Markup the new comment
        var li = '<li id="' + newCommentID + '" class="gComment"></li>';
        
        // Add the comment 
        j$("#gCommentThread").append(li);
        j$("#" + newCommentID).html('<p><a href="mailto:' + commentEmail + 
          '" class="gAuthor">' + commentAuthor + '</a>  just said at ' + 
          '<span class="gDate understate">HH:MM DD-MM-YY</span></p>' +
          '<div class="gText">' + commentText + '</div>');
        
        // Hide the new comment and then fadeIn() or slideDown()
        j$("#" + newCommentID)
         .hide()
         .slideDown("slow")
		  .animate({ backgroundColor: "#ff9" }, 1000)
		  .animate({ backgroundColor: "#fff" }, 1000);
        
        // Clear form values on success
      });
      
      // Failure callback - display error status message
   });
  
// ]]>
</script>

<div id="gComments">
  <h2>Comments</h2>
  <ul id="gCommentThread">
    <? foreach ($comments as $index=>$comment): ?>
    <li class="gComment" id="gComment-<?= $index; ?>">
      <p>
        <a href="#" class="gAuthor"> <?= $comment->author ?></a>
        said <?= round((time() - $comment->datetime)/60) ?> minutes ago
        <span class="gDate understate"><?= strftime('%c', $comment->datetime) ?></span>
      </p>
      <div>
        <?= $comment->text ?>
      </div>
    </li>
    <? endforeach; ?>
  </ul>

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
      <input type="hidden" id="gItemId" value="<?=($item_id); ?>" />
      <input type="submit" id="gCommentSubmit" value="Add" />
    </fieldset>
  </form>

</div>
<? endif; ?>
