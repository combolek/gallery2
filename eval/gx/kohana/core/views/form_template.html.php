<?php
print($open);
if ($class) {
  print "<!-- unused class in form_template.html.php: $class -->";
}

if ($title) {
  print "<h1>$title</h1>";
}

function DrawForm($inputs) {
  foreach ($inputs as $input) {
    if ($input->type == 'group') {
      print "<fieldset>\n";
      print "<legend>$input->name</legend>\n";
      DrawForm($input->inputs);
      print "</fieldset>\n";
    }
    try {
      $error_messages = $input->error_messages();
    } catch (Exception $e) {
      // Form_Group doesn't have error_messages in Kohana 2.2
      $error_messages = array();
    }
    $error_class = $error_messages ? "error" : "";
    print "<div class=\"row $error_class\">\n";
    print $input->label() . "\n";
    print $input->render() . "\n";
    print $input->message();
    foreach ($error_messages as $error_message) {
      print "<br/>$error_message";
    }
    print "</div>\n";
  }
}
DrawForm($inputs);

print($close);
?>
