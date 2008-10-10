<?php echo $form->create('photos', array('type' => 'file')) ?>
  <table border="0px">
    <tr>
      <td>File to upload:</td>
      <td><?php echo $form->file('image'); ?> </td>
    </tr>
    <tr>
      <td>Image Name:</td>
      <td><?php echo $form->input('title', array('label' => false)); ?></td>
    </tr>
    <tr>
      <td colspan="2" align="center">
	<?php echo $form->submit('Upload') ?>
      </td>
    </tr>
  </table>
<?php echo $form->end(); ?>
