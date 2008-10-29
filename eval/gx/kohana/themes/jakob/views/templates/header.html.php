<img id="Logo" alt="Logo" />

<h1><?= $title ?></h1>

<?= (!empty($is_admin)) ? html::anchor('admin/core', 'Administration') : "" ?>
<?= (empty($authenticated)) ? html::anchor('user/register', 'Register') : "" ?>
<?= html::anchor('auth/login', (empty($authenticated)) ? 'Login' : 'Logout') ?>

<ul id="global-navigation">
  <? if (isset($item)): ?>
  <? foreach (array('Home/Dashboard' => '#',
  'Browse Photos' => "album/{$item->id}",
  'Upload New Photos' => "album/{$item->id}/add",
  'Create Album' =>  "album/{$item->id}/add",
  'Help?' => '#') as $text => $view):?>
  <li>
    <? if ($active == $text): ?>
    <?= html::anchor($view, $text, array('class' => 'active')); ?>
    <? else: ?>
    <?= html::anchor($view, $text, $active); ?>
    <? endif; ?>
  </li>
  <? endforeach; ?>
  <? endif; ?>
</ul>

<ul class="breadcrumbs">
  <li class="root"><a href="#">Home</a></li>
  <li><a href="#">Friends &amp; Family</a></li>

  <li><a href="#">Christmas 2007</a></li>
  <!-- later on the ">>" should be a background image -->
</ul>

