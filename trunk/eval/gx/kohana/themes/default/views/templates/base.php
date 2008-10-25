<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title><?php echo $header->title; ?></title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <?php echo html::stylesheet('themes/default/css/styles.css', 'screen'); ?>
  </head>
  <body class="yui-skin-sam">
    <div id="doc2" class="gItemView yui-t5">
    
      <div id="hd">
        <div id="gHeader">
	      <?php echo $header; ?>
        </div>
      </div>

      <div id="bd">
      
	    <div id="yui-main">
	      <div id="gContent" class="yui-b">
	        <?php echo $content; ?>
          </div>
        </div>

        <div id="gSidebar" class="yui-b">
        
          <div id="gCarousel">
            <h2>Carousel</h2>
            <img src="images/carousel.png" />
            <!-- for reference see http://developer.yahoo.com/yui/examples/carousel/csl_dynload2.html and 
            	http://developer.yahoo.com/ypatterns/pattern.php?pattern=carousel -->
          </div>
          
          <div id="gTagCloud">
            <h2>Tag cloud</h2>
            <p>tag1, tag2, tag3, ...</p>
            <form id="gCompactForm">
              <fieldset>
                <input type="text" name="gTags" id="gTags" class="text" value="add new tags ..." />
                <input type="submit" name="" value="add" />
              </fieldset>
            </form>
          </div>
          
          <table class="gMetadata">
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
          
        </div>
        
      </div><!-- end bd -->

      <div id="ft">
        <div id="gFooter">
          <?php echo $footer; ?>
        </div>
      </div>
      
    </div>
  </body>
</html>