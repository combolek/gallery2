<h1>Album: Christmas 2007</h1>

<table id="photo-grid">
  <tbody>
    <?php for ($row = 0, $i = 0; $row < 3; $row++): ?>
    <tr>
      <?php for ($col = 0; $col < 3; $col++): ?>
      <td>
	<?php if ($i < count($photos)): ?>
	<?php echo $html->link(
              $html->image("../files/{$photos[$i]['Photo']['path']}", array('class' => 'photo', 'alt' => 'photo')),
	      "view/{$photos[$i++]['Photo']['id']}",
	      array('escape' => false))
	?>
	<?php else: ?>
	<img class="photo" alt="photo"/>
	<?php endif; ?>
      </td>
      <?php endfor; ?>
    </tr>
    <?php endfor; ?>
  </tbody>
</table>
