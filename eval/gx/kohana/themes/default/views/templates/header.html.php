<img id="gLogo" alt=" Gallery Logo" src="themes/default/images/logo.png" />

<h1><?php echo $title ?></h1>

<div id="gLoginMenu">
  <?= html::anchor('user/register', 'Register'); ?>
  <?= html::anchor('auth/login', (empty($authenticated)) ? 'Login' : 'Logout') ?>
</div>

<ul id="gSiteMenu">
  <? $itemId = empty($item) ? 1 : $item->id;
   foreach (
     array('Home/Dashboard' => '#',
	   'Browse Photos' => "album/{$itemId}",
	   'Upload New Photos' => "album/{$itemId}/addphoto",
	   'Create Album' =>  "album/{$itemId}/addalbum",
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
</ul>

<ul class="gBreadcrumbs">
   <?php foreach ($path as $i => $p): ?>
   <li <?php if ($i == 0): ?>class="root"<?php endif ?>>
     <?php print html::anchor("album/$p->id", $p->title); ?>
   </li>
   <?php endforeach; ?>
</ul>
