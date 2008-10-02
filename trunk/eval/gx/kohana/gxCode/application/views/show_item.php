<?php
  $currentRow = 0;
  $currentColumn =  0;
?>
<h1>Photo: <?php echo $item->Name; ?></h1>


<table id="photo-grid">
  
  <tbody>
    <tr>
      <td>
	<?php echo html::image(array('src' => $path . $item->Path, 'class' => 'photo', 'alt' => $item->Name)); ?>
      </td>
    </tr>
  </tbody>

</table>
