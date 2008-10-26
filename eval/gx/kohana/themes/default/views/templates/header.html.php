<img id="gLogo" alt=" Gallery Logo" src="themes/default/images/logo.png" />

<h1><?php echo $title ?></h1>

<div id="gLoginMenu">
  <?= html::anchor('user/register', 'Register'); ?>
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
   <?php foreach ($path as $i => $p): ?>
   <li <?php if ($i == 0): ?>class="root"<?php endif ?>>
     <?php print html::anchor("album/$p->id", $p->title); ?>
   </li>
   <?php endforeach; ?>
</ul>
