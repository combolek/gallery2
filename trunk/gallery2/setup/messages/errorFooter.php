
<br>
<br>

When you think you have resolved this problem, you can click this button to try again:
<form method="POST">
<?php foreach ($_POST as $key => $value) { ?>
    <input type="hidden" name="<?php echo $key ?>" value="<?php echo $value ?>">
<?php } ?>
    <input type="submit" name="submit" value="Try again">
</form>

<?php if (!empty($message['output'])) { ?>
  <br>
  <br>
  <br>
  <hr>
       
  The following output was generated by the above operation.
  Under normal circumstances, no output is generated by the
  Gallery setup operations, so this is probably a warning or
  error of some kind that deserves special attention.

  <pre><?php echo $message['output'] ?></pre>
<?php } ?>

<?php if (!empty($message['debug'])) { ?>
  <br>
  <br>
  <br>
  <hr>
       
  The following debug output was generated by the above operation.
  This output can be kind of lengthy, depending on what the specific
  operation is.  Scan through it for anything that looks like an
  error message for clues as to what might have gone wrong.					  

  <pre><?php echo $message['debug'] ?></pre>
<?php } ?>

<?php if (!empty($message['error'])) { ?>
  <br>
  <br>
  <br>
  <hr>
  Here&rsquo;s where we were in the code when things went wrong.  This
  information probably won&rsquo;t be very useful to you, but if your
  problem persists, it&rsquo;ll be very useful to the Gallery team in
  helping you track down your issue.				  

  <pre><?php echo $message['error']->getAsHtml() ?></pre>
<?php } ?>

  </body>
</html>
