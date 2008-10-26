<? if ($comments): ?>
<script type="text/javascript">
  function addComment(e) {
    var author, email, text, comment, li;

    e.preventDefault(); // Prevent form submission

    // Get form input
    //oCommentForm = document.getElementById('gCommentAdd');
    author = document.getElementById('gCommentAuthor').value;
    email = document.getElementById('gCommentEmail').value;
    text = document.getElementById('gCommentText').value;

    // Create a new list element
    var commentId = YAHOO.util.Dom.getElementsByClassName('gComment').length;
    var li = document.createElement('li');
    li.id = 'gComment-' + commentId;
    li.className = 'gComment';
    li.innerHTML = '<p><a href="' + email + '" class="gAuthor">' + author + '</a> ' +
      ' has just said <span class="gDate understate"></span></p>' +
      '<div class="gText">' + text + '</div>';

    // Append new list item with comment form input
    var elCommentThread = new YAHOO.util.Element('gCommentThread');

    // Append a list item to contain the new comment
    elCommentThread.appendChild(li);

    // Highlight the new comment
    var alertColor = new YAHOO.util.ColorAnim('gComment-' + commentId, {
      backgroundColor: { to: '#FCF1D2' }
    }, 1);

    var origColor = new YAHOO.util.ColorAnim('gComment-' + commentId, {
      backgroundColor: { to: '#fff' }
    }, 1);

    // Chain the alert animation to reset to the original bg color
    alertColor.onComplete.subscribe(function() {
      origColor.animate();
    });

    alertColor.animate();

    // Send comment data to server
    //var formObject = document.getElementById('gCommentAdd');
    //YAHOO.util.Connect.setForm(formObject);

    // setForm is supposed to do this work for us, but.
    var commentAuthor = document.getElementById('gCommentAuthor').value;
    var commentEmail= document.getElementById('gCommentEmail').value;
    var commentText = document.getElementById('gCommentText').value;
    var itemId = document.getElementById('gItemId').value;

    var postData = 'author=' + commentAuthor;
    postData += '&email=' + commentEmail;
    postData += '&text=' + commentText;
    postData += '&item_id=' + itemId;

    var cObj = YAHOO.util.Connect.asyncRequest(
      'POST', 'index.php?/comment/Add', callback, postData);
    }

    YAHOO.util.Event.addListener("gCommentAdd", "submit", addComment);

    var responseSuccess = function(o){

    // we can show some nice message here
  };

  var responseFailure = function(o){
    // handle error
  }

  var callback = {
    success:responseSuccess,
    failure:responseFailure,
  };
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

  <form id="gCommentAdd" class="gCompactForm">
    <fieldset>
      <legend>Add comment</legend>
      <div class="row">
        <label for="gCommentAuthor">Your Name</label>
        <input type="text" id="gCommentAuthor" class="text" />
      </div>
      <div class="row">
        <label for="gCommentEmail">Your Email (not displayed)</label>
        <input type="text" id="gCommentEmail" class="text" />
      </div>
      <div class="row">
        <label for="gCommentText">Comment</label>
        <textarea id="gCommentText"></textarea>
      </div>
      <input type="hidden" id="gItemId" value="<?=($item_id); ?>" />
      <input type="submit" id="gCommentSubmit" value="Add" />
    </fieldset>
  </form>

</div>
<? endif; ?>
