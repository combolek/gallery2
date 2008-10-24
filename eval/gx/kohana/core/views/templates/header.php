<img id="Logo" alt="Logo" />

<h1><?php echo $title; ?></h1>

<a id="register-link" href="#">Register</a>

<a id="login-link" href="#">Login</a>

<ul id="global-navigation">
  <?php foreach (array('Home/Dashboard' => '#',
  'Browse Photos' => 'show/1',
  'Upload New Photos' => 'upload',
  'Admin' =>  '#',
  'Help?' => '#') as $text => $view):?>
  <li>
    <?php if ($active == $text): ?>
    <?php echo html::anchor($view, $text, array('class' => 'active')1); ?>
    <?php else: ?>
    <?php echo html::anchor($view, $text, $active); ?>
    <?php endif; ?>
  </li>
  <?php endforeach; ?>
</ul>

<ul id="breadcrumbs">
  <li class="root"><a href="#">Home</a></li>
  <li><a href="#">Friends &amp; Family</a></li>

  <li><a href="#">Christmas 2007</a></li>
  <!-- later on the ">>" should be a background image -->
</ul>

