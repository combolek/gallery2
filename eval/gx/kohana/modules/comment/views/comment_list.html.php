<ul id="gCommentThread">
   <? foreach (array_reverse($comments) as $index => $comment): ?>
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
