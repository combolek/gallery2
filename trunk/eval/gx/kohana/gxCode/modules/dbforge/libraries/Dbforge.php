<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Dbforge database manipulation (ported from CI !.6)
 *
 * @package    Dbforge
 * @author     Michael Lavers
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Dbforge_Core extends Database_Core {

	// Dataparent::__construct();base instance
	protected $database;
	
	// Configuration
	protected $collate = array('collate' => 'utf8_general_ci');
	protected $dbforge_driver;
	
	protected $fields       = array();
	protected $keys         = array();
	protected $primary_keys = array();
	protected $db_char_set  = '';

	/**
	 * Loads Database and configuration options.
	 */
	public function __construct()
	{
		parent::__construct();
		
		$this->config = array_merge($this->config, $this->collate);
			
		// Set driver name
		$dbforge_driver = 'Dbforge_'.ucfirst($this->config['connection']['type']).'_Driver';

		// Load the driver
		if ( ! Kohana::auto_load($dbforge_driver))
			throw new Kohana_Database_Exception('database.driver_not_supported', $this->config['connection']['type']);

		// Initialize the driver
		$this->dbforge_driver = new $dbforge_driver($this->config);

		// Validate the driver
		if ( ! ($this->dbforge_driver instanceof Dbforge_Driver))
			throw new Kohana_Database_Exception('database.driver_not_supported', 'Dbforge drivers must use the Dbforge_Driver interface.');

		Log::add('debug', 'Dbforge Library initialized');
	}

	/**
	 * Create database
	 *
	 * @param	string	the database name
	 * @return	bool
	 */
	public function create_database($db_name = '')
	{
		if ($db_name == '')
		{
			throw new Kohana_Database_Exception('dbforge.database_required');
		}
		
		$sql = $this->dbforge_driver->create_database($db_name);
		
		if (is_bool($sql))
		{
			return $sql;
		}
	
		return $this->query($sql);
	}

	/**
	 * Drop database
	 *
	 * @param	string	the database name	'database_required'		=> 'Database information is required for that operation.',
	 * @return	bool
	 */
	public function drop_database($db_name = '')
	{
		if ($db_name == '')
		{
			throw new Kohana_Database_Exception('dbforge.database_required');
		}
	
		$sql = $this->dbforge_driver->drop_database($db_name);
		
		if (is_bool($sql))
		{
			return $sql;
		}
	
		return $this->query($sql);
	}

	/**
	 * Add Key
	 *
	 * @param	string	key
	 * @param	string	type
	 * @return	void
	 */
	public function add_key($key = '', $primary = FALSE)
	{
		if ($key == '')
		{
			throw new Kohana_Database_Exception('dbforge.key_required');
		}
		
		if ($primary === TRUE)
		{
			$this->primary_keys[] = $key;
		}
		else
		{
			$this->keys[] = $key;
		}
	}

	/**
	 * Add Field
	 *
	 * @param	string	collation
	 * @return	void
	 */
	public function add_field($field = '')
	{
		if ($field == '')
		{
			throw new Kohana_Database_Exception('dbforge.field_required');
		}
		
		if (is_string($field))
		{
			if ($field == 'id')
			{
				$this->fields[] = array('id' => array(
										'type' => 'INT',
										'constraint' => 9,
										'auto_increment' => TRUE
										)
									);									
				$this->add_key('id', TRUE);
			}
			else
			{
				if (strpos($field, ' ') === FALSE)
				{
					throw new Kohana_Database_Exception('dbforge.field_required');
				}
				
				$this->fields[] = $field;
			}
		}
		
		if (is_array($field))
		{
			$this->fields = array_merge($this->fields, $field);
		}
		
	}

	/**
	 * Create Table
	 *
	 * @param	string	the table name
	 * @return	bool
	 */
	public function create_table($table = '', $if_not_exists = FALSE)
	{	
		if ($table == '')
		{
			throw new Kohana_Database_Exception('dbforge.table_required');
		}
			
		//if (count($this->fields) == 0)
		//{	
		//	throw new Kohana_Database_Exception('database.field_required');
		//}

		$sql = $this->dbforge_driver->create_table($this->config['table_prefix'].$table, $this->fields, $this->primary_keys, $this->keys, $if_not_exists);

		$this->reset();
		return $this->query($sql);
	}

	/**
	 * Drop Table
	 *
	 * @param	string	the table name
	 * @return	bool
	 */
	public function drop_table($table_name)
	{
		$sql = $this->dbforge_driver->drop_table($this->config['table_prefix'].$table_name);
		
		if (is_bool($sql))
		{
			return $sql;
		}
	
		return $this->query($sql);
	}

	/**
	 * Column Add
	 *
	 * @param	string	the table name
	 * @param	string	the column name
	 * @param	string	the column definition
	 * @return	bool
	 */
	public function add_column($table = '', $field = array(), $after_field = '')
	{
		if ($table == '')
		{
			throw new Kohana_Database_Exception('dbforge.table_required');
		}

		// add field info into field array, but we can only do one at a time
		// so only grab the first field in the event there are more then one
		$this->add_field(array_slice($field, 0, 1));

		if (count($this->fields) == 0)
		{
			throw new Kohana_Database_Exception('dbforge.field_required');
		}

		$sql = $this->dbforge_driver->alter_table('ADD', $this->config['table_prefix'].$table, $this->fields, $after_field);

		$this->reset();
		return $this->query($sql);
	}

	/**
	 * Column Drop
	 *
	 * @param	string	the table name
	 * @param	string	the column name
	 * @return	bool
	 */
	public function drop_column($table = '', $column_name = '')
	{
	
		if ($table == '')
		{
			throw new Kohana_Database_Exception('dbforge.table_required');
		}

		if ($column_name == '')
		{
			throw new Kohana_Database_Exception('dbforge.column_required');
		}

		$sql = $this->dbforge_driver->alter_table('DROP', $this->config['table_prefix'].$table, $column_name);
	
		return $this->query($sql);
	}

	/**
	 * Column Modify
	 *
	 * @param	string	the table name
	 * @param	string	the column name
	 * @param	string	the column definition
	 * @return	bool
	 */
	public function modify_column($table = '', $field = array())
	{
	
		if ($table == '')
		{
			throw new Kohana_Database_Exception('dbforge.table_required');
		}

		// add field info into field array, but we can only do one at a time
		// so only grab the first field in the event there are more then one
		$this->add_field(array_slice($field, 0, 1));

		if (count($this->fields) == 0)
		{
			throw new Kohana_Database_Exception('dbforge.field_required');
		}

		$sql = $this->dbforge_driver->alter_table('CHANGE', $this->config['table_prefix'].$table, $this->fields);

		$this->reset();
		return $this->query($sql);
	}

	/**
	 * Reset
	 *
	 * Resets table creation vars
	 *
	 * @return	void
	 */
	private function reset()
	{
		$this->fields 		= array();
		$this->keys			= array();
		$this->primary_keys 	= array();
	}

} // Dbforge library
