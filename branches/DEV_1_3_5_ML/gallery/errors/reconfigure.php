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
	if (! (@include($GALLERY_BASEDIR . "ML_files/ML_config.php")) || ! $gallery->ML) {
                include ($GALLERY_BASEDIR ."setup/ML_wizard.php");
                exit;
        }

	require($GALLERY_BASEDIR . "errors/configure_instructions.php") ;
?>
<html>
<head>
  <title><?php echo _("Gallery needs Reconfiguration") ?></title>
  <?php echo getStyleSheetLink() ?>
</head>
<body dir=<?php echo $gallery->direction ?>>
<?php include ($gallery->path ."ML_files/ML_info_addon.inc"); ?>
<center>
<span class="title"> <?php echo _("Gallery needs Reconfiguration") ?> </span>
<p>
<center>
<table width=80%><tr><td>
<?php echo _("Your Gallery configuration was created using the config wizard from an older version of Gallery.") ?>
<?php echo _("It is out of date.  Please re-run the configuration wizard!") ?>
<?php echo _("In a shell do this") ?>:
<p><center>
<?php configure("configure"); ?>
<p>
<?php echo _("Then launch the") ?> <a href="<?php echo $GALLERY_BASEDIR ?>setup/index.php"><?php echo _("configuration wizard") ?></a>.

<?php include($GALLERY_BASEDIR . "errors/configure_help.php"); ?>

</table>
</body>
</html>
