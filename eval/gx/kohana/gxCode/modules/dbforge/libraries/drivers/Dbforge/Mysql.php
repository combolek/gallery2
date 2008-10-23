<?php defined('SYSPATH') or die('No direct script access.');
/**
 * MySQL Dbforge Driver
 *
 * @package    Dbforge
 * @author     Michael Lavers
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Dbforge_Mysql_Driver extends Dbforge_Driver {

	/**
	 * Database configuration
	 */
	protected $db_config;

	/**
	 * Sets the config for the class.
	 *
	 * @param  array  database configuration
	 */
	public function __construct($config)
	{
		$this->db_config = $config;

		Log::add('debug', 'MySQL Dbforge Driver Initialized');
	}

	/**
	 * Create database
	 *
	 * @param	string	the database name
	 * @return	bool
	 */
	public function create_database($name)
	{
		return "CREATE DATABASE ".$name;
	}

	/**
	 * Drop database
	 *
	 * @param	string	the database name
	 * @return	bool
	 */
	public function drop_database($name)
	{
		return "DROP DATABASE ".$name;
	}

	/**
	 * Create Table
	 *
	 * @param	string	the table name
	 * @param	mixed	the fields
	 * @param	mixed	primary key(s)
	 * @param	mixed	key(s)
	 * @param	boolean	should 'IF NOT EXISTS' be added to the SQL
	 * @return	bool
	 */
	public function create_table($table, $fields, $primary_keys, $keys, $if_not_exists)
	{
		$sql = 'CREATE TABLE ';
			
		if ($if_not_exists === TRUE)
		{
			$sql .= 'IF NOT EXISTS ';
		}
		
		$sql .= $this->escape_table($table)." (";

		$sql .= $this->process_fields($fields);

		if (count($primary_keys) > 0)
		{
			// The function protect_identifiers() is removed from this line
			// because Kohana doesn't handle aliases the same way CI does.
			//$primary_keys = $this->escape_column($primary_keys);
			$sql .= ",\n\tPRIMARY KEY (" . implode(', ', $primary_keys) . ")";
		}

		if (is_array($keys) && count($keys) > 0)
		{
			// The function protect_identifiers() is removed from this line
			// because Kohana doesn't handle aliases the same way CI does.
			//$keys = $this->escape_column($keys);
			foreach ($keys as $key)
			{
				$sql .= ",\n\tKEY ($key)";
			}
		}

		$sql .= "\n) DEFAULT CHARACTER SET {$this->db_config['character_set']} COLLATE {$this->db_config['collate']};";

		return $sql;
	}

	/**
	 * Drop Table
	 *
	 * @return	bool
	 */
	public function drop_table($table)
	{
		return "DROP TABLE IF EXISTS ".$this->escape_table($table);
	}

	/**
	 * Alter table query
	 *
	 * Generates a platform-specific query so that a table can be altered
	 * Called by add_column(), drop_column(), and column_alter(),
	 *
	 * @param	string	the ALTER type (ADD, DROP, CHANGE)
	 * @param	string	the column name
	 * @param	array	fields
	 * @param	string	the field after which we should add the new field
	 * @return	object
	 */
	public function alter_table($alter_type, $table, $fields, $after_field = '')
	{
		// The function protected_identifiers() was removed from this line as
		// Kohana doesn't appear to handle aliases the same way CI does.
		$sql = 'ALTER TABLE '.$this->escape_table($table)." $alter_type ";

		// DROP has everything it needs now.
		if ($alter_type == 'DROP')
		{
			// The function protected_identifiers() was removed from this line as
			// Kohana doesn't appear to handle aliases the same way CI does.
			return $sql.$this->escape_column($fields);
		}

		$sql .= $this->process_fields($fields);

		if ($after_field != '')
		{
			// The function protected_identifiers() was removed from this line as
			// Kohana doesn't appear to handle aliases the same way CI does.
			$sql .= ' AFTER ' . $this->escape_column($after_field);
		}
		
		return $sql;
	}

	/**
	 * Process Fields
	 *
	 * @param	mixed	the fields
	 * @return	string
	 */
	private function process_fields($fields)
	{
		$current_field_count = 0;
		$sql = '';

		foreach ($fields as $field=>$attributes)
		{
			// Numeric field names aren't allowed in databases, so if the key is
			// numeric, we know it was assigned by PHP and the developer manually
			// entered the field information, so we'll simply add it to the list
			if (is_numeric($field))
			{
				$sql .= "\n\t$attributes";
			}
			else
			{
				$attributes = array_change_key_case($attributes, CASE_UPPER);
				
				// The function protect_identifiers() is removed from this line
				// because Kohana doesn't handle aliases the same way CI does.
				$sql .= "\n\t".$this->escape_column($field);

				if (array_key_exists('NAME', $attributes))
				{
					// The function protect_identifiers() is removed from this line
					// because Kohana doesn't handle aliases the same way CI does.
					$sql .= ' '.$this->escape_column($attributes['NAME']).' ';
				}
				
				if (array_key_exists('TYPE', $attributes))
				{
					$sql .=  ' '.$attributes['TYPE'];
				}
	
				if (array_key_exists('CONSTRAINT', $attributes))
				{
					$sql .= '('.$attributes['CONSTRAINT'].')';
				}
	
				if (array_key_exists('UNSIGNED', $attributes) && $attributes['UNSIGNED'] === TRUE)
				{
					$sql .= ' UNSIGNED';
				}
	
				if (array_key_exists('DEFAULT', $attributes))
				{
					$sql .= ' DEFAULT \''.$attributes['DEFAULT'].'\'';
				}
	
				if (array_key_exists('NULL', $attributes))
				{
					$sql .= ($attributes['NULL'] === TRUE) ? ' NULL' : ' NOT NULL';
				}
	
				if (array_key_exists('AUTO_INCREMENT', $attributes) && $attributes['AUTO_INCREMENT'] === TRUE)
				{
					$sql .= ' AUTO_INCREMENT';
				}
			}
			
			// don't add a comma on the end of the last field
			if (++$current_field_count < count($fields))
			{
				$sql .= ',';
			}
		}
		
		return $sql;
	}

	/**
	 * Protect Identifiers
	 *
	 * This function adds backticks if appropriate based on db type
	 * This function is not currently in use, but has been added here in case Kohana
	 * starts to handle aliases in a similiar way CI does.
	 *
	 * @param	mixed	the item to escape
	 * @param	boolean	only affect the first word
	 * @return	mixed	the item with backticks
	 */
	private function _protect_identifiers($item, $first_word_only = FALSE)
	{
		if (is_array($item))
		{
			$escaped_array = array();

			foreach($item as $k=>$v)
			{
				$escaped_array[$this->_protect_identifiers($k)] = $this->_protect_identifiers($v, $first_word_only);
			}

			return $escaped_array;
		}	

		// This function may get "item1 item2" as a string, and so
		// we may need "`item1` `item2`" and not "`item1 item2`"
		// ar_aliased_tables is in reference to CI's Active Record
		if (ctype_alnum($item) === FALSE)
		{
			if (strpos($item, '.') !== FALSE)
			{
				$aliased_tables = implode(".",$this->ar_aliased_tables).'.';
				$table_name =  substr($item, 0, strpos($item, '.')+1);
				$item = (strpos($aliased_tables, $table_name) !== FALSE) ? $item = $item : $this->dbprefix.$item;
			}

			// This function may get "field >= 1", and need it to return "`field` >= 1"
			$lbound = ($first_word_only === TRUE) ? '' : '|\s|\(';

			$item = preg_replace('/(^'.$lbound.')([\w\d\-\_]+?)(\s|\)|$)/iS', '$1`$2`$3', $item);
		}
		else
		{
			return "`{$item}`";
		}

		$exceptions = array('AS', '/', '-', '%', '+', '*');
		
		foreach ($exceptions as $exception)
		{
		
			if (stristr($item, " `{$exception}` ") !== FALSE)
			{
				$item = preg_replace('/ `('.preg_quote($exception).')` /i', ' $1 ', $item);
			}
		}
		return $item;
	}
	
	public function escape_table($table)
	{
		if (!$this->db_config['escape'])
			return $table;

		if (stripos($table, ' AS ') !== FALSE)
		{
			// Force 'AS' to uppercase
			$table = str_ireplace(' AS ', ' AS ', $table);

			// Runs escape_table on both sides of an AS statement
			$table = array_map(array($this, __FUNCTION__), explode(' AS ', $table));

			// Re-create the AS statement
			return implode(' AS ', $table);
		}
		return '`'.str_replace('.', '`.`', $table).'`';
	}

	public function escape_column($column)
	{
		if (!$this->db_config['escape'])
			return $column;

		if (strtolower($column) == 'count(*)' OR $column == '*')
			return $column;

		// This matches any modifiers we support to SELECT.
		if ( ! preg_match('/\b(?:rand|all|distinct(?:row)?|high_priority|sql_(?:small_result|b(?:ig_result|uffer_result)|no_cache|ca(?:che|lc_found_rows)))\s/i', $column))
		{
			if (stripos($column, ' AS ') !== FALSE)
			{
				// Force 'AS' to uppercase
				$column = str_ireplace(' AS ', ' AS ', $column);

				// Runs escape_column on both sides of an AS statement
				$column = array_map(array($this, __FUNCTION__), explode(' AS ', $column));

				// Re-create the AS statement
				return implode(' AS ', $column);
			}

			return preg_replace('/[^.*]+/', '`$0`', $column);
		}

		$parts = explode(' ', $column);
		$column = '';

		for ($i = 0, $c = count($parts); $i < $c; $i++)
		{
			// The column is always last
			if ($i == ($c - 1))
			{
				$column .= preg_replace('/[^.*]+/', '`$0`', $parts[$i]);
			}
			else // otherwise, it's a modifier
			{
				$column .= $parts[$i].' ';
			}
		}
		return $column;
	}

} // End Dbforge_Mysql_Driver Clas
