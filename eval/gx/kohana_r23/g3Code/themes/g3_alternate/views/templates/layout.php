<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="{g->language}" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title><?php echo $header->title; ?></title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.5.2/build/reset-fonts-grids/reset-fonts-grids.css" />
    <link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/2.5.2/build/base/base-min.css" />
    <link rel="stylesheet" type="text/css" href="/g3/css/styles.css "media="screen" />
  </head>
  <body>
  <div id="doc2" class="yui-t2">
    <div id="hd">
      <?php echo $header; ?>
    </div><!-- end hd -->

    <div id="bd">
      <div id="yui-main">
	<div class="yui-b">
	  <?php echo $content; ?>
	</div>
      </div><!-- end yui-main -->
      <div id="sidebar" class="yui-b">
	<?php echo $sidebar; ?>
      </div>

    </div><!-- end bd -->

    <div id="ft">
      <?php echo $footer; ?>
    </div>
  </div>
  </body>
</html>