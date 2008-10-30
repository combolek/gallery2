<?=html::anchor('album/1', 'John Doe\'s Gallery')?>

<h1>Admin: Users</h1>

<table>
  <thead>
    <tr>
      <td>&nbsp;</td>
      <td>User Name</td>
      <td>Email</td>
      <td>Login Count</td>
      <td>Last Login</td>
      <td>Roles</td>
    </tr>
  </thead>
  <tbody>
    <? foreach ($users as $user): ?>
      <tr>
        <td>
          <? if ($user->id != 1): ?>
            <input type="checkbox" value="<?=$user->id; ?>">
          <? else: ?>
            &nbsp;
          <? endif;?>
        </td>
        <td><?=$user->username; ?></td>
        <td><?=$user->email ?></td>
        <td><?=$user->logins ?></td>
        <td><?=date("D M j Y g:i:s", $user->last_login) ?></td>
        <td>
          <ul>
            <? foreach ($user->roles as $role):?>
              <li><?=$role->name; ?></li>
            <? endforeach;?>
          </ul>
        </td>
      </tr>
    <? endforeach;?>
  </tbody>
  
</table>

