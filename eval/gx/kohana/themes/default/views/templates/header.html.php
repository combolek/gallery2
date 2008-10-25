      <img id="gLogo" alt=" Gallery Logo" src="themes/default/images/logo.png" />

      <h1><?= $title ?></h1>

      <div id="gLoginMenu">
        <?= html::anchor('register', 'Register'); ?>
        <?= html::anchor('auth/login', 'Login') ?>
      </div>

      <ul id="gSiteMenu">
        <? foreach (
             array(
              'Home/Dashboard' => '#',
              'Browse Photos' => 'show/1',
              'Upload New Photos' => 'upload',
              'Admin' =>  '#',
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
        <li class="root"><a href="#">Home</a></li>
        <li><a href="#">Friends &amp; Family</a></li>
        <li><a href="#">Christmas 2007</a></li>
        <!-- later on the ">>" should be a background image -->
      </ul>
            