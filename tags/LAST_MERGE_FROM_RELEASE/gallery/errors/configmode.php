<? require("errors/configure_instructions.php") ?>
<html>
<head>
  <title>Gallery in Configuration Mode</title>
  <link rel="stylesheet" type="text/css" href="<?= getGalleryStyleSheetName() ?>">
</head>
<body>	
<center>
<span class="title"> Gallery: Configuration Mode </span>
<p>
<table width=80%><tr><td>
<br>
<center>
To configure gallery, 
<font size=+1>
<a href=setup/index.php>Start the configuration wizard</a>
</font>
</center>
<br>

If you've finished your configuration but you're still seeing this
page, that's because for safety's sake we don't let you run Gallery in
an insecure mode.  You need to switch to secure mode before you can
use it.  In a shell do this:

<p><center>
<?= configure("secure.sh"); ?>
<p>
Then just reload this page and all should be well.
</table>
