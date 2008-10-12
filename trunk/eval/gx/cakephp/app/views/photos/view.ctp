<table id="photo-grid">
  <tbody>
    <tr>
      <td>
	<?php echo $html->image("../files/{$photo['Photo']['path']}",
                                array('class' => 'photo', 'alt' => $photo['Photo']['title'])) ?>
      </td>
    </tr>
	<tr>
	  <td>
	<?php echo $photo['Photo']['title'] ?>
	  </td>
	</tr>
    <tr>
      <td>
	<?php echo $html->link('Return to Album', '/photos'); ?>
      </td>
    </tr>
  </tbody>
</table>
