<?=html::anchor('album/1', 'John Doe\'s Gallery')?>

<h1>Admin: Roles</h1>

<table>
  <thead>
    <tr>
      <td>&nbsp;</td>
      <td>Role</td>
      <td>Description</td>
    </tr>
  </thead>
  <tbody>
    <? foreach ($roles as $role): ?>
      <tr>
        <td>
          <? if ($role->id > 2): ?>
            <input type="checkbox" value="<?=$role->id; ?>">
          <? else: ?>
            &nbsp;
          <? endif;?>
        </td>
        <td><?=$role->name; ?></td>
        <td><?=$role->description ?></td>
      </tr>
    <? endforeach;?>
  </tbody>
  
</table>

