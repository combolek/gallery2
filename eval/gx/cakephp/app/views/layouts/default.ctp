<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title><?php echo $title_for_layout ?></title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <?php echo $html->css('http://yui.yahooapis.com/2.5.2/build/reset-fonts-grids/reset-fonts-grids.css') ?>
    <?php echo $html->css('http://yui.yahooapis.com/2.5.2/build/base/base-min.css') ?>
    <?php echo $html->css('styles.css', null, array('media' => 'screen,projection')) ?>
    <?php echo $scripts_for_layout ?>
  </head>
  <body>
    <div id="doc2" class="yui-t5">
      <div id="hd">
	<img id="Logo" alt="Logo" />

	<h1><?php echo $title_for_layout ?></h1>

	<a id="register-link" href="#">Register</a>

	<a id="login-link" href="#">Login</a>

	<ul id="global-navigation">
	  <li><a href="#">Home/Dashboard</a></li>
	  <li><?php echo $html->link('Browse Photos', 'view', $this->action == 'index' ? array('class' => 'active') : null) ?></li>
	  <li><?php echo $html->link('Upload New Photos', 'add', $this->action == 'add' ? array('class' => 'active') : null) ?></li>
	  <li><a href="#">Admin</a></li>
	  <li><a href="#">Help?</a></li>
	</ul>

	<ul id="breadcrumbs">
	  <li class="root"><a href="#">Home</a></li>
	  <li><a href="#">Friends &amp; Family</a></li>
	  <li><a href="#">Christmas 2007</a></li>
	  <!-- later on the ">>" should be a background image -->
	</ul>

      </div><!-- end hd -->

      <div id="bd">
	<div id="yui-main">
	  <div class="yui-b">
	    <?php echo $content_for_layout ?>
	  </div>
	</div><!-- end yui-main -->

	<div id="sidebar" class="yui-b">
	  <h2>Sidebar</h2>
	  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
	</div>

      </div><!-- end bd -->

      <div id="ft">
	Powered by <a href="#">GalleryX</a> | <a href="#">About this Gallery</a> | ...
      </div>
    </div>
  </body>
</html>
