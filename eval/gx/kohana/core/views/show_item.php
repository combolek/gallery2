<div class="gPhotoView">
  <?php echo html::image(array('src' => 'var/images/' . $path, 'class' => 'photo', 'alt' => $item->title)); ?>
  <?php Comment::ShowComments($item->id); ?>
</div>
