<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * Smarty {assign} compiler function plugin
 *
 * Type:     compiler function<br>
 * Name:     assign<br>
 * Purpose:  assign a value to a template variable
 * @link http://smarty.php.net/manual/en/language.custom.functions.php#LANGUAGE.FUNCTION.ASSIGN {assign}
 *       (Smarty online manual)
 * @author Monte Ohrt <monte at ohrt dot com> (initial author)
 * @auther messju mohr <messju at lammfellpuschen dot de> (conversion to compiler function)
 * @param string containing var-attribute and value-attribute
 * @param Smarty_Compiler
 */
function smarty_compiler_assign($tag_attrs, &$compiler)
{
    $params = $compiler->_parse_attrs($tag_attrs);
    if (empty($params)) {
        $compiler->_syntax_error("assign: empty parameters", E_USER_WARNING);
        return;
    }

    if (!isset($params['var'])) {
        foreach ($params as $key => $value) {
            $output[] = '$this->assign("' . str_replace('"', '\"', $key) . '", ' . $value . ');';
        }
        return implode(' ', $output);
    }

    if (!isset($params['value'])) {
        $compiler->_syntax_error("assign: missing 'value' parameter", E_USER_WARNING);
        return;
    }

    return "\$this->assign($params[var], $params[value]);";
}

/* vim: set expandtab: */

?>
