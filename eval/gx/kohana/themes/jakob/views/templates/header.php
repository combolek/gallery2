<img id="Logo" alt="Logo" />

<h1><?php echo $title; ?></h1>

<?php echo html::anchor('register', 'Register'); ?>

<?php echo html::anchor('auth/login', 'Login'); ?>

<ul id="global-navigation">
  <?php foreach (array('Home/Dashboard' => '#',
  'Browse Photos' => 'show/1',
  'Upload New Photos' => 'upload',
  'Admin' =>  '#',
  'Help?' => '#') as $text => $view):?>
  <li>
    <?php if ($active == $text): ?>
    <?php echo html::anchor($view, $text, array('class' => 'active')); ?>
    <?php else: ?>
    <?php echo html::anchor($view, $text, $active); ?>
    <?php endif; ?>
  </li>
  <?php endforeach; ?>
</ul>

<ul class="breadcrumbs">
  <li class="root"><a href="#">Home</a></li>
  <li><a href="#">Friends &amp; Family</a></li>

  <li><a href="#">Christmas 2007</a></li>
  <!-- later on the ">>" should be a background image -->
</ul>

