<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title><?php echo $header->title; ?></title>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <?php echo html::stylesheet('themes/default/css/styles.css', 'screen'); ?>
  </head>
  <body>
    <div id="doc2" class="yui-t5">
      <div id="hd">
	<?php echo $header; ?>
      </div>

      <div id="bd">
	<div id="yui-main">
	  <div id="content" class="yui-b">
	    <?php echo $content; ?>
	  </div>
	</div>

	<div id="sidebar" class="yui-b">
	  <h2>Sidebar</h2>
	  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. </p>
	</div>

      </div><!-- end bd -->


      <div id="ft">
	<?php echo $footer; ?>
      </div>
    </div>
  </body>
</html>
