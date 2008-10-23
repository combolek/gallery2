<?php defined('SYSPATH') or die('No direct script access.');

class Dbforge_Controller extends Controller {

	// Do not allow to run in production
	const ALLOW_PRODUCTION = FALSE;

	public function __construct()
	{
		parent::__construct();

		// Load some libraries
		foreach(array('dbforge') as $lib)
		{
			$class = ucfirst($lib);
			$this->$lib = new $class();
		}
	}

	public function index()
	{
		echo 'DBForge feature examples:<ul>';
		echo '<li>'.html::anchor('dbforge/create_database', 'Create Database').'</li>';
		echo '<li>'.html::anchor('dbforge/drop_database', 'Drop Database').'</li>';
		echo '<li>'.html::anchor('dbforge/create_table', 'Create Table').'</li>';
		echo '<li>'.html::anchor('dbforge/drop_table', 'Drop Table').'</li>';
		echo '<li>'.html::anchor('dbforge/add_column', 'Add Column').'</li>';
		echo '<li>'.html::anchor('dbforge/modify_column', 'Modify Column').'</li>';
		echo '</ul>';
	}

	public function create_database()
	{
		if ($this->dbforge->create_database('dbforge_test'))
		{
			echo "Database 'dbforge_test' created.";
		}
	}

	public function drop_database()
	{
		if ($this->dbforge->drop_database('dbforge_test'))
		{
			echo "Database 'dbforge_test' dropped.";
		}
	}
	
	public function create_table()
	{
		$fields = array
		(
			'blog_id' => array
			(
				'type' => 'INT',
				'constraint' => 5,
				'unsigned' => TRUE,
				'auto_increment' => TRUE
			),
			'blog_title' => array
			(
				'type' => 'VARCHAR',
				'constraint' => '100',
			),
			'blog_author' => array
			(
				'type' =>'VARCHAR',
				'constraint' => '100',
				'default' => 'King of Town',
			),
			'blog_description' => array
			(
				'type' => 'TEXT',
				'null' => TRUE,
			),
		);
		$this->dbforge->add_field($fields);
		$this->dbforge->add_key('blog_id', TRUE);
		if ($this->dbforge->create_table('dbforge_test'))
		{
			echo "Table 'dbforge_test' created with the following schema and 'blog_id' as the primary key:";
			echo "<pre>";
			print_r($fields);
			echo "</pre>";
		}
	}
	
	public function drop_table()
	{
		if ($this->dbforge->drop_table('dbforge_test'))
		{
			echo "Table 'dbforge_test' dropped.";
		}
	}
	
	public function add_column()
	{
		$fields = array
		(
			'preferences' => array
			(
				'type' => 'TEXT'
			)
		);
		
		if ($this->dbforge->add_column('dbforge_test', $fields))
		{
			echo "Column 'preferences' added to 'dbforge_test' table.";
		}
	}

	public function modify_column()
	{
		$fields = array
		(
			'preferences' => array
			(
				'name' => 'settings',
				'type' => 'BLOB',
			),
		);
		
		if ($this->dbforge->modify_column('dbforge_test', $fields))
		{
			echo "The column 'preferences' was changed to 'settings' and turned from a TEXT to a BLOB.";
		}
	}

} // End Auth Controller
