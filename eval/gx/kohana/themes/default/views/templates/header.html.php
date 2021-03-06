<img id="gLogo" alt=" Gallery Logo" src="themes/default/images/logo.png" />

<h1><?= $title ?></h1>

<div id="gLoginMenu">
  <?= (!empty($is_admin)) ? html::anchor('admin/core', 'Administration') : "" ?>
  <?= (empty($authenticated)) ? html::anchor('user/register', 'Register') : "" ?>
  <?= html::anchor('auth/login', (empty($authenticated)) ? 'Login' : 'Logout') ?>
</div>

<ul id="gSiteMenu">
  <? if (isset($item)): ?>
  <? foreach (
     array('Home/Dashboard' => '#',
	   'Browse Photos' => "album/{$item->id}",
       'Upload New Photos' => "album/{$item->id}/addphoto",
       'Create Album' =>  "album/{$item->id}/addalbum",
	   'Help?' => '#'
    ) as $text => $view): ?>
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

<ul class="gBreadcrumbs">
   <? foreach ($path as $i => $p): ?>
   <li <? if ($i == 0): ?>class="root"<? endif ?>>
     <?= html::anchor("album/$p->id", "{$p->title} ({$p->count_children()})"); ?>
   </li>
   <? endforeach; ?>
</ul>
