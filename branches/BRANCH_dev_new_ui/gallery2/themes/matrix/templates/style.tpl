{* 
 * style.tpl - this gets included in the <HEAD> block and is an opportunity
 *             for the theme to insert its own styles.
 * 
 * Input variables:
 *
 *  $theme.url
 *     The URL to the main directory of this theme 
 *}
<style type="text/css" media="all">@import url({$theme.url}styles/theme.css);</style>
