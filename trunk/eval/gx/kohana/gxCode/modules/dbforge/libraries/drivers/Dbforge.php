<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Dbforge Driver Interface
 *
 * @package    Dbforge
 * @author     Michael Lavers
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
abstract class Dbforge_Driver {

	/**
	 * Create database
	 *
	 * @param	string	the database name
	 * @return	bool
	 */
	abstract public function create_database($name);

	/**
	 * Drop database
	 *
	 * @param	string	the database name
	 * @return	bool
	 */
	abstract public function drop_database($name);
	
	/**
	 * Drop Table
	 *
	 * @return	bool
	 */
	abstract public function drop_table($table);

	/**
	 * Create Table
	 *
	 * @param	string	the table name
	 * @param	array	the fields
	 * @param	mixed	primary key(s)
	 * @param	mixed	key(s)
	 * @param	boolean	should 'IF NOT EXISTS' be added to the SQL
	 * @return	bool
	 */
	abstract public function create_table($table, $fields, $primary_keys, $keys, $if_not_exists);

	/**
	 * Alter table query
	 *
	 * Generates a platform-specific query so that a table can be altered
	 * Called by add_column(), drop_column(), and column_alter(),
	 *
	 * @param	string	the ALTER type (ADD, DROP, CHANGE)
	 * @param	string	the column name
	 * @param	string	the table name
	 * @param	string	the column definition
	 * @param	string	the default value
	 * @param	boolean	should 'NOT NULL' be added
	 * @param	string	the field after which we should add the new field
	 * @return	object
	 */
	abstract public function alter_table($alter_type, $table, $fields, $after_field = '');

	/**
	 * Wrap the tablename in backticks, has support for: table.field syntax.
	 *
	 * @param   string  table name
	 * @return  string
	 */
	abstract public function escape_table($table);

	/**
	 * Escape a column/field name, has support for special commands.
	 *
	 * @param   string  column name
	 * @return  string
	 */
	abstract public function escape_column($column);

} // End Dbforge Driver Interface
