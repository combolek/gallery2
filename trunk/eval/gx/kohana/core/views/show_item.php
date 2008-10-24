<div class="yui-b gPhotoView">
  <?php echo html::image(array('src' => 'var/images/' . $path, 'class' => 'photo', 'alt' => $item->title)); ?>

  <div id="gComments">
    <h2>Comments</h2>

    <ul id="gCommentThread">
      <li id="gComment-1">
	<p><a href="#" class="gAuthor">Andy</a> said 2 hours ago <span class="gDate understate">(October 23, 2008 11:30am)</span></p>
	<div>
	  Lorem ipsum dolor sit amet.
	</div>
      </li>
      <li id="gComment-2">
	<p><a href="#" class="gAuthor">Other user</a> said 30 minutes ago <span class="gDate understate">(October 23, 2008 1:00pm)</span></p>
	<div>
	  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
	</div>
      </li>
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

  </div><!-- END gComments -->
</div>
