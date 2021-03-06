<?php

// Load the xarGallery2Helper class
include_once(dirname(__FILE__) .'/../xargallery2helper.php');

/**
 * The standard gallery2 page
 * 
 * @param  there are no params, POST/GET/FILE variables are handled by G2
 * @return array of template variables
 */
function gallery2_user_main()
{     
    // Security Check
    if (!xarSecurityCheck('ReadGallery2', 0)) return;
    $data = array();

    // first check if the module has been configured
    if(!xarGallery2Helper::isConfigured()) {
	$data['g2modhtml'] = xarML('The module has not yet been configured.');
	$data['configured'] = 0;
	return $data;
    } else {
	$data['configured'] = 1;
    }
  
    // init G2
    if (!xarGallery2Helper::init(false, true, false)) {   
	$data['g2modhtml'] = 'G2 returned an error on the init call.';
	return $data;
    }

    // user interface: disable sidebar in G2 and get it as separate HTML to put it into a xaraya block
    if (xarModGetVar('gallery2', 'g2.sidebarInside') == 0) {
	GalleryCapabilities::set('showSidebarBlocks', false);
    }

    // Deactivate xaraya's output buffers to get the embedded progress bars and immediate views to work 
    $outputBuffers = array();
    while (($ob = ob_get_contents()) !== false) {
	@ob_end_clean();
	$outputBuffers[] = $ob;
    }
    
    // handle the G2 request
    $g2moddata = GalleryEmbed::handleRequest();
  
    // show error message if isDone is not defined
    if (!isset($g2moddata['isDone'])) {
      $data['g2modhtml'] = 'isDone is not defined, something very bad must have happened.';
      return $data;
    }
    // die if it was a binary data (image) request
    if ($g2moddata['isDone']) {
      exit; /* uploads module does this too */
    }

    /* Get xaraya's output buffers back in place (no immediate output) */
    foreach ($outputBuffers as $ob) {
	ob_start();
	echo $ob;
    }
    
    // put the body html from G2 into the xaraya template 
    $data['g2modhtml'] = isset($g2moddata['bodyHtml']) ? $g2moddata['bodyHtml'] : '';

    // get the page title, javascript and css links from the <head> html from G2
    $title = ''; $javascript = array();	$css = array();
 
    if (isset($g2moddata['headHtml'])) {
      list($title, $css, $javascript) = GalleryEmbed::parseHead($g2moddata['headHtml']);
    }
    
    /* set title */
    if(!empty($title)) {
      xarTplSetPageTitle(xarVarPrepForDisplay($title));
    } 
    
    /* Add G2 javascript to template */
    if (!empty($javascript)) {
      foreach ($javascript as $script) {
	  if(preg_match("|<script(?:\s[^>]*)?\ssrc=[\"\'](.+)[\"\'](?:\s[^>]*)?>.*</script>|Usi",
			 $script , $regs)) {
	      xarTplAddJavaScript('head', 'src', $regs[1]);
	  } else {
	      preg_match("|<script(?:\s[^>]*)?>(.+)</script>|Usi",
			 $script, $regs);
	      xarTplAddJavaScript('head', 'code', $regs[1]);
	  }
      }
    }

    /*
     * TODO: find xarAPI function to include HTML <head> data
     *       perhaps  xartpl_modifyheadercontent()
     */

    /*
     * TODO replace this injection hack with a real css function as soon as xaraya allows for css
     * links for files outside the xaraya directory structure
     *
     * Try a hack: use the xarTplAddJavascript() function to inject css into the xaraya <head>
     * section!! (it works)
     */
    $scriptInjectionCss = "</script>\n" . implode("\n", $css) . "\n<script type=\"text/javascript\">";
    xarTplAddJavaScript('head', 'code', $scriptInjectionCss);

    
    // set the g2 sideBar (menu) html global, so that we can retrieve it,
    // when xaraya calls all the blocks for their html
    if (isset($g2moddata['sidebarBlocksHtml']) && !empty($g2moddata['sidebarBlocksHtml'])) {
      global $g2sidebarHtml;
      $g2sidebarHtml = $g2moddata['sidebarBlocksHtml'];
    }
    
    return $data;
} 


?>
