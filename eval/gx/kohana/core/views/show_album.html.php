<?php $currentRow = 0; ?>
<?php $currentColumn = 0; ?>

<h1>Album: <?php echo $item->title; ?></h1>

<table id="photo-grid">
  <tbody>
    <tr>
      <?php foreach ($children as $child): ?>
      <?php if ($currentColumn >= $maxColumns): ?>
      <?php $currentRow++; $currentColumn =  0;?>
    </tr>
    <tr>
      <?php endif; ?>
      <td>
	<?php $path = 'var/thumbnails/' . $child->id . '.jpg'; ?>
	<?php
	   echo html::anchor(
	   "show/$child->id",
           html::image(array('src' => $path, 'class' => 'photo', 'alt' => $child->title)));
        ?>
      </td>
      <?php $currentColumn++; ?>
      <?php endforeach; ?>

      <!-- Fill the rest of the page with empty image holders -->
      <?php for (; $currentRow < $maxRows; $currentRow++ ): ?>
	    <?php for (; $currentColumn < $maxColumns; $currentColumn++ ): ?>
		  <td>
		    <img class="photo" alt="photo" />
		  </td>
		  <?php endfor; ?>
		  <?php $currentColumn =  0 ?>
    </tr>
    <?php endfor; ?>
  </tbody>
</table>
