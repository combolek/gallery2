<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title><?= $header->title; ?></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <?= html::stylesheet('themes/default/css/styles.css', 'screen'); ?>
    <?= html::script('themes/default/js/jquery.min.js'); ?>
    <?= html::script('themes/default/js/jquery.form.js'); ?>
    <?= html::script('themes/default/js/jquery.color.js'); ?>
  </head>
  <body>
    <div id="doc2" class="gItemView yui-t5">

      <div id="hd">
        <div id="gHeader">
        <?= $header; ?>
        </div>
      </div>

      <div id="bd">

        <div id="yui-main">
          <div id="gContent" class="yui-b">
            <?= $content; ?>
          </div>
        </div>

        <div id="gSidebar" class="yui-b">

          <form id="gSearch gBlock">
            <fieldset>
              <input type="text" class="text" value="Search Gallery ..." />
              <input type="submit" class="submit" value="go" />
            </fieldset>
          </form>

          <div class="gTagCloud gBlock">
            <h2>Tag cloud</h2>
            <ul>
              <li><a href="#" class="m size0">animation</a></li>
              <li><a href="#" class="m size0">art</a></li>
              <li><a href="#" class="m size1">blind</a></li>
              <li><a href="#" class="m size3">blog</a></li>
              <li><a href="#" class="m size1">bug-tracker</a></li>
              <li><a href="#" class="m size2">bugs20</a></li>
              <li><a href="#" class="m size0">canvas</a></li>
              <li><a href="#" class="m size0">classification</a></li>
              <li><a href="#" class="m size4">cocktail</a></li>
              <li><a href="#" class="m size0">exhibtion</a></li>
              <li><a href="#" class="m size0">forum</a></li>
              <li><a href="#" class="m size1">geo-tagging</a></li>
              <li><a href="#" class="m size0">german</a></li>
              <li><a href="#" class="m size0">germany</a></li>
              <li><a href="#" class="m size0">gläser</a></li>
              <li><a href="#" class="m size0">graffiti</a></li>
              <li><a href="#" class="m size0">illustration</a></li>
              <li><a href="#" class="m size0">ITP</a></li>
              <li><a href="#" class="m size0">javascript</a></li>
              <li><a href="#" class="m size0">miami</a></li>
              <li><a href="#" class="m size0">miknow</a></li>
              <li><a href="#" class="m size0">nyc</a></li>
              <li><a href="#" class="m size0">NYU</a></li>
              <li><a href="#" class="m size0">ontology</a></li>
              <li><a href="#" class="m size0">open-source</a></li>
              <li><a href="#" class="m size0">project</a></li>
              <li><a href="#" class="m size0">school-of-information</a></li>
              <li><a href="#" class="m size0">screenshot</a></li>
              <li><a href="#" class="m size0">shiftspace</a></li>
              <li><a href="#" class="m size0">shop</a></li>
              <li><a href="#" class="m size0">tagging</a></li>
              <li><a href="#" class="m size2">talkingpoints</a></li>
              <li><a href="#" class="m size0">university-of-michigan</a></li>
              <li><a href="#" class="m size1">usability</a></li>
              <li><a href="#" class="m size0">writing</a></li>
            </ul>
          </div>

          <table class="gMetadata gBlock">
            <caption>Item Info</caption>
            <tbody>
              <tr>
                <th>Name:</th>
                <td>Christmas 2007</td>
              </tr>
              <tr>
                <th>Created:</th>
                <td>January 21, 2008</td>
              </tr>
              <tr>
                <th>Created by:</th>
                <td><a href="#">username</a></td>
              </tr>
            </tbody>
          </table>

        </div><!-- end gSidebar yui-b -->

      </div><!-- end YUI bd -->

      <div id="ft">
        <div id="gFooter">
          <?= $footer; ?>
        </div>
      </div>

    </div>
  </body>
</html>
