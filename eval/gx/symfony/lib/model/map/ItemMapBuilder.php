<?php



class ItemMapBuilder {

	
	const CLASS_NAME = 'lib.model.map.ItemMapBuilder';

	
	private $dbMap;

	
	public function isBuilt()
	{
		return ($this->dbMap !== null);
	}

	
	public function getDatabaseMap()
	{
		return $this->dbMap;
	}

	
	public function doBuild()
	{
		$this->dbMap = Propel::getDatabaseMap('propel');

		$tMap = $this->dbMap->addTable('item');
		$tMap->setPhpName('Item');

		$tMap->setUseIdGenerator(true);

		$tMap->addPrimaryKey('ID', 'Id', 'int', CreoleTypes::INTEGER, true, null);

		$tMap->addColumn('NAME', 'Name', 'string', CreoleTypes::VARCHAR, true, 45);

		$tMap->addColumn('PATH', 'Path', 'string', CreoleTypes::VARCHAR, true, 45);

		$tMap->addColumn('HASCHILDREN', 'Haschildren', 'boolean', CreoleTypes::BOOLEAN, true, null);

		$tMap->addForeignKey('PARENT_ID', 'ParentId', 'int', CreoleTypes::INTEGER, 'item', 'ID', false, null);

		$tMap->addColumn('ISALBUM', 'Isalbum', 'boolean', CreoleTypes::BOOLEAN, true, null);

	} 
} 