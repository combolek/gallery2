<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * delete an automagically created file by name and id
 *
 * @param string $auto_base
 * @param string $auto_source
 * @param string $auto_id
 * @param integer $exp_time
 * @return boolean
 */ 
 
// $auto_base, $auto_source = null, $auto_id = null, $exp_time = null
    
function smarty_core_rm_auto($params, &$this)
{	
    if (!@is_dir($params['auto_base']))
      return false;

    if(!isset($params['auto_id']) && !isset($params['auto_source'])) {
		$_params = array(
			'dirname' => $params['auto_base'],
			'level' => 0,
			'exp_time' => $params['exp_time']
		);
        $_res = $this->_execute_core_function('rmdir', $_params);            
    } else {        
        $_tname = $this->_get_auto_filename($params['auto_base'], $params['auto_source'], $params['auto_id']);

        if(isset($params['auto_source'])) {
            $_res = $this->_unlink($_tname);
        } elseif ($this->use_sub_dirs) {
			$_params = array(
				'dirname' => $_tname,
				'level' => 1,
				'exp_time' => $params['exp_time']
			);
        	$_res = $this->_execute_core_function('rmdir', $_params);            
        } else {
            // remove matching file names
            $_handle = opendir($params['auto_base']);
			$_res = true;
            while (false !== ($_filename = readdir($_handle))) {
                if($_filename == '.' || $_filename == '..') {
                    continue;    
                } elseif (substr($params['auto_base'] . DIRECTORY_SEPARATOR . $_filename, 0, strlen($_tname)) == $_tname) {
                    $_res &= (bool)$this->_unlink($params['auto_base'] . DIRECTORY_SEPARATOR . $_filename, $params['exp_time']);
                }
            }
        }
    }

    return $_res;
}

/* vim: set expandtab: */

?>
