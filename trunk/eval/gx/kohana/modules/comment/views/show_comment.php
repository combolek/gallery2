<?php if ($comments): ?>
<script type="text/javascript">
	//var oElement = document.getElementById("gCommentAdd");
	function addComment(e) {
		var author, email, text, comment, li;

		e.preventDefault(); // Prevent form submission

		// Write comment to the database...

		// Show the block
		YAHOO.util.Dom.setStyle("gComment-3", 'display', 'block');

		// Get form input
		//oCommentForm = document.getElementById('gCommentAdd');
		author = document.getElementById('gCommentAuthor').value;
		email = document.getElementById('gCommentEmail').value;
		text = document.getElementById('gCommentText').value;
		//alert(author + email + text);

		// Create a new list element
		var li = document.createElement('li');
		li.id = 'gComment-3';
		li.innerHTML = '<p><a href="' + email + '" class="gAuthor">' + author + '</a> ' +
			' said 30 minutes ago <span class="gDate understate">(October 23, 2008 4:00pm)</span></p>' +
			'<div class="gText">' + text + '</div>';

		// Append new list item with comment form input
		var elCommentThread = new YAHOO.util.Element('gCommentThread');

 			// Append a list item to contain the new comment
 			elCommentThread.appendChild(li);

		// Highlight the new comment
		var alertColor = {
     			backgroundColor: { to: '#FCF1D2' }
		};
		var anim = new YAHOO.util.ColorAnim('gComment-3', alertColor)
		anim.animate();
	}
	YAHOO.util.Event.addListener("gCommentAdd", "submit", addComment);
</script>

<div id="gComments">
  <h2>Comments</h2>
  <ul id="gCommentThread">
    <?php foreach ($comments as $comment): ?>
    <li id="gComment-<?php print $comment->id ?>">
      <p>
	<a href="#" class="gAuthor"> <?php print $comment->author ?></a>
	said 2 hours ago <span class="gDate understate">(October 23, 2008 11:30am)</span>
      </p>
      <div>
	<?php print $comment->text ?>
      </div>
    </li>
    <?php endforeach; ?>
  </ul>

  <form id="gCommentAdd">
    <fieldset>
      <legend>Add comment</legend>
      <div>
	<label for="gCommentAuthor">Your Name</label>
	<input type="text" id="gCommentAuthor" class="text" />
      </div>
      <div>
	<label for="gCommentEmail">Your Email (not displayed)</label>
	<input type="text" id="gCommentEmail" class="text" />
      </div>
      <div>
	<label for="gCommentText">Comment</label>
	<textarea id="gCommentText"></textarea>
      </div>

      <input type="submit" id="gCommentSubmit" value="Add" />

    </fieldset>
  </form>

</div>
<?php endif; ?>
