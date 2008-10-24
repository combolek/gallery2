<h1>Photo: <?php echo $item->title; ?></h1>

<table id="photo-grid">
  <tbody>
    <tr>
      <td>
	<?php echo html::image(array('src' => 'var/images/' . $path, 'class' => 'photo', 'alt' => $item->title)); ?>
      </td>
    </tr>
    <tr>
      <td>
	<?php echo html::anchor('show/' . $item->parent_id, 'Return to Album'); ?>
      </td>
    </tr>
  </tbody>
</table>
