<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title><?= $header->title; ?></title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.6.0/build/reset-fonts-grids/reset-fonts-grids.css" />
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.6.0/build/base/base-min.css" />

    <!-- Dependencies -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
    <!-- OPTIONAL: Animation (only required if using ContainerEffect) -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/animation/animation-min.js"></script>
    <!-- OPTIONAL: Connection (only required if using Dialog/SimpleDialog) -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/connection/connection-min.js"></script>
    <!-- Source file -->
    <script type="text/javascript" src="http://yui.yahooapis.com/2.6.0/build/container/container-min.js"></script>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.6.0/build/container/assets/container.css" />
    <!-- Element -->
    <script src="http://yui.yahooapis.com/2.6.0/build/element/element-beta-min.js"></script>

    <?= html::stylesheet('themes/jakob/css/styles.css', 'screen'); ?>
  </head>
  <body>
    <div id="doc2" class="yui-t5">
      <div id="hd">
	<?= $header; ?>
      </div>

      <div id="bd">
	<div id="yui-main">
	  <div id="content" class="yui-b">
	    <?= $content; ?>
	  </div>
	</div>

	<div id="sidebar" class="yui-b">
	  <h2>Sidebar</h2>
	  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
	</div>

      </div><!-- end bd -->

      <div id="ft">
	<?= $footer; ?>
      </div>
    </div>
  </body>
</html>
