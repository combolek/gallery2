<img id="Logo" alt="Logo" />

<h1><? echo $title; ?></h1>

<a id="register-link" href="#">Register</a>

<? print html::anchor("auth/login", "Login"); ?>

<ul id="global-navigation">
  <? foreach (array('Home/Dashboard' => '#',
  'Browse Photos' => 'show/1',
  'Upload New Photos' => 'upload',
  'Admin' =>  '#',
  'Help?' => '#') as $text => $view):?>
  <li>
    <? if ($active == $text): ?>
    <? echo html::anchor($view, $text, array('class' => 'active')); ?>
    <? else: ?>
    <? echo html::anchor($view, $text, $active); ?>
    <? endif; ?>
  </li>
  <? endforeach; ?>
</ul>

<ul class="breadcrumbs">
  <li class="root"><a href="#">Home</a></li>
  <li><a href="#">Friends &amp; Family</a></li>

  <li><a href="#">Christmas 2007</a></li>
  <!-- later on the ">>" should be a background image -->
</ul>

