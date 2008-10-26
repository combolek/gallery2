<? $currentRow = 0; ?>
<? $currentColumn = 0; ?>

<h1>Album: <?= $item->title; ?></h1>

<table id="photo-grid">
  <tbody>
    <tr>
      <? foreach ($children as $child): ?>
      <? if ($currentColumn >= $maxColumns): ?>
      <? $currentRow++; $currentColumn =  0;?>
    </tr>
    <tr>
      <? endif; ?>
      <td>
	<? $path = 'var/thumbnails/' . $child->id . '.jpg'; ?>
	<?= html::anchor(
	      "$child->type/$child->id",
              html::image(array('src' => $path, 'class' => 'photo', 'alt' => $child->title)));
        ?>
      </td>
      <? $currentColumn++; ?>
      <? endforeach; ?>

      <!-- Fill the rest of the page with empty image holders -->
      <? for (; $currentRow < $maxRows; $currentRow++ ): ?>
        <? for (; $currentColumn < $maxColumns; $currentColumn++ ): ?>
	   <td>
	     <img class="photo" alt="photo" />
	   </td>
	<? endfor; ?>
        <? $currentColumn =  0 ?>
        </tr>
      <? endfor; ?>
  </tbody>
</table>
