<div class="gPhotoView">
  <h2><?php echo $item->title ?></h2>
  <?php echo html::image(array('src' => 'var/images/' . $item->path, 'class' => 'photo', 'alt' => $item->title)); ?>
  <?php Comment::ShowComments($item->id); ?>
</div>
