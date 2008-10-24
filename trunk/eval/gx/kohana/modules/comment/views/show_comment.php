<?php if ($comments): ?>
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
