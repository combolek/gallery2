<div class="gPhotoView">
  <h2><?= $item->title ?></h2>
  <?= html::image(array('src' => item::url($item), 'class' => 'photo', 'alt' => $item->title)); ?>
  <? Comment::ShowComments($item->id); ?>
</div>
