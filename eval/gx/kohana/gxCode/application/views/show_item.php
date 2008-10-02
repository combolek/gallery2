<?php
  $currentRow = 0;
  $currentColumn =  0;
?>
<h1>Album: <?php echo $item->Name; ?></h1>

<table id="photo-grid">
  <tbody>
    <tr>
	<?php foreach ($children as $child): ?>
	  <?php if ($currentColumn >= $maxColumns): ?>
	    <?php $currentRow++; $currentColumn =  0;?>
	    </tr><tr>
	  <?php endif; ?>
	  <td>
	    <?php $path = $item->Path . '/' . $child->Path; ?>
	    <img class="photo" alt="<?php echo $child->Name; ?>" src="<?php echo $path; ?>"/>
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
