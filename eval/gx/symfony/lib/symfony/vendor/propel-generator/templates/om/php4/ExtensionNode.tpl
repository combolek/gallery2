<?php

// Create empty stub node class which extends the BaseNode class created in Node.tpl.
//
// $Id: ExtensionNode.tpl,v 1.2 2004/12/12 10:40:23 micha Exp $

echo '<' . '?' . 'php';

$db = $table->getDatabase();
if($table->getPackage()) {
    $package = $table->getPackage();
} else {
    $package = $targetPackage;
}

?>


require_once '<?php echo ClassTools::getFilePath($pkbase, $basePrefix . $table->getPhpName() . 'Node') ?>';

/** 
 * The skeleton for this class was autogenerated by Propel <?php if ($addTimeStamp) { ?> on:
 *
 * [<?php echo $now ?>]
 *
<?php } ?>
 * You should add additional methods to this class to meet the
 * application requirements.  This class will only be generated as
 * long as it does not already exist in the output directory.
 *
 * @package <?php echo $package ?> 
 */
class <?php echo $table->getPhpName() ?>Node extends <?php echo $basePrefix . $table->getPhpName() . 'Node' ?> {

}