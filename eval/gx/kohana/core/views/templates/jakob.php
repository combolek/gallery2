<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title><?php echo $header->title; ?></title>

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

    <?php echo html::stylesheet('css/styles.css', 'screen'); ?>

	<script type="text/javascript">
		//var oElement = document.getElementById("gCommentAdd");
		function addComment(e) {
			var author, email, text, comment, li;

			e.preventDefault(); // Prevent form submission

			// Write comment to the database...

			// Show the block
			YAHOO.util.Dom.setStyle("gComment-3", 'display', 'block');

			// Get form input
			//oCommentForm = document.getElementById('gCommentAdd');
			author = document.getElementById('gCommentAuthor').value;
			email = document.getElementById('gCommentEmail').value;
			text = document.getElementById('gCommentText').value;
			//alert(author + email + text);

			// Create a new list element
			var li = document.createElement('li');
			li.id = 'gComment-3';
			li.innerHTML = '<p><a href="' + email + '" class="gAuthor">' + author + '</a> ' +
				' said 30 minutes ago <span class="gDate understate">(October 23, 2008 4:00pm)</span></p>' +
				'<div class="gText">' + text + '</div>';

			// Append new list item with comment form input
			var elCommentThread = new YAHOO.util.Element('gCommentThread');

   			// Append a list item to contain the new comment
   			elCommentThread.appendChild(li);

			// Highlight the new comment
			var alertColor = {
       			backgroundColor: { to: '#FCF1D2' }
			};
			var anim = new YAHOO.util.ColorAnim('gComment-3', alertColor)
			anim.animate();
		}
		YAHOO.util.Event.addListener("gCommentAdd", "submit", addComment);
	</script>
  </head>
  <body>
    <div id="doc2" class="yui-t5">
      <div id="hd">
	<?php echo $header; ?>
      </div>

      <div id="bd">
	<div id="yui-main">
	  <div id="content">
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
