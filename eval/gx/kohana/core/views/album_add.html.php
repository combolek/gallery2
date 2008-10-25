<form method="post" enctype="multipart/form-data"
   action="<?php echo url::site("album/{$item->id}/add"); ?>">
  <?php if (!empty($success)): ?>
  <p class="success"><?php echo $success; ?></p>
  <?php endif; ?>
  <?php if (!empty($error)): ?>
  <p class="error"><?php echo $error; ?></p>
  <?php endif; ?>
  <table border="0px">
    <tr>
      <td>File to upload:</td><td><input type="file" name="image"/></td>
    </tr>
    <tr>
      <td>Image Name:</td><td><input type="text" name="name" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="Submit" value="Upload" /></td>
    </tr>
  </table>
</form>

