<?php
// $Id$
// Hack prevention.
if (!empty($HTTP_GET_VARS["GALLERY_BASEDIR"]) ||
                    !empty($HTTP_POST_VARS["GALLERY_BASEDIR"]) ||
                    !empty($HTTP_COOKIE_VARS["GALLERY_BASEDIR"])) {
            print "Security violation\n";
	            exit;
		    }
?>
<?php 
	require($GALLERY_BASEDIR . "errors/configure_instructions.php") ;
?>
<html>
<head>
  <title><?php echo _("Gallery Configuration Error") ?></title>
  <?php echo getStyleSheetLink() ?>
</head>
<body dir=<?php echo $gallery->direction ?>>
<center>
<span class="title">
<?php echo _("Gallery has not been configured!") ?>
</span>
<p>
<center>
<table width=80%>
<tr><td>
<?php echo _("Gallery must be configured before you can use it.  First, you must put it into configuration mode.  Here's how.");
echo configure("configure"); ?>
<p>
<?php echo sprintf(_("And then start the %sConfiguration Wizard%s."), 
		'<a href="<?php echo $GALLERY_BASEDIR ?>setup/index.php">',
		'</a>');
print "  ";
include($GALLERY_BASEDIR . "errors/configure_help.php"); ?>
</table>
</body>
</html>
