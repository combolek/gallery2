<?php

/*
 *  $Id: PHP5BasicObjectBuilder.php 566 2007-02-02 16:27:12Z hans $
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * This software consists of voluntary contributions made by many individuals
 * and is licensed under the LGPL. For more information please see
 * <http://propel.phpdb.org>.
 */

require_once 'propel/engine/builder/om/ObjectBuilder.php';

/**
 * Generates a PHP5 base Object class for user object model (OM).
 *
 * This class produces the base object class (e.g. BaseMyTable) which contains all
 * the custom-built accessor and setter methods.
 *
 * This class replaces the Object.tpl, with the intent of being easier for users
 * to customize (through extending & overriding).
 *
 * @author     Hans Lellelid <hans@xmpl.org>
 * @package    propel.engine.builder.om.php5
 */
class PHP5BasicObjectBuilder extends ObjectBuilder {

	/**
	 * Gets the package for the [base] object classes.
	 * @return     string
	 */
	public function getPackage()
	{
		return parent::getPackage() . ".om";
	}

	/**
	 * Returns the name of the current class being built.
	 * @return     string
	 */
	public function getClassname()
	{
		return $this->getBuildProperty('basePrefix') . $this->getStubObjectBuilder()->getClassname();
	}

	/**
	 * Adds the include() statements for files that this class depends on or utilizes.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addIncludes(&$script)
	{

		$table = $this->getTable();
		$package = $this->getPackage();
		$parentClass = $this->getBaseClass();
		$interface = $this->getInterface();

		$script .= "
require_once '".$this->getFilePath($parentClass)."';
";



		if (!empty($interface)) {
			$script .= "
require_once '".$this->getFilePath($interface)."';
";
		}


		if (!$table->isAlias()) {

			// If any columns in table are BLOB or CLOB then we need to make
			// sure those classes are included so we can do things like
			// if ($v instanceof Lob) etc.

			$includes_lobs = false;
			foreach ($table->getColumns() as $col) {
				if ($col->isLob()) {
					$includes_lobs = true;
					break;
				}
			}

			if($includes_lobs) {
				$script .= "
include_once 'creole/util/Clob.php';
include_once 'creole/util/Blob.php';
";
			}
		} // if table is not alias

		$script .= "

include_once 'propel/util/Criteria.php';
";

		$script .= "
include_once '".$this->getStubPeerBuilder()->getClassFilePath()."';
";
	} // addIncludes()

	/**
	 * Adds class phpdoc comment and openning of class.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addClassOpen(&$script)
	{

		$table = $this->getTable();
		$tableName = $table->getName();
		$tableDesc = $table->getDescription();
		$interface = $this->getInterface();

		$script .= "
/**
 * Base class that represents a row from the '$tableName' table.
 *
 * $tableDesc
 *";
		if ($this->getBuildProperty('addTimeStamp')) {
			$now = strftime('%c');
			$script .= "
 * This class was autogenerated by Propel on:
 *
 * $now
 *";
		}
		$script .= "
 * @package    ".$this->getPackage()."
 */
abstract class ".$this->getClassname()." extends ".ClassTools::classname($this->getBaseClass())." ";

		$interface = ClassTools::getInterface($table);
		if ($interface) {
			$script .= " implements " . ClassTools::classname($interface);
		}

		$script .= " {

";
	}

	/**
	 * Specifies the methods that are added as part of the basic OM class.
	 * This can be overridden by subclasses that wish to add more methods.
	 * @see        ObjectBuilder::addClassBody()
	 */
	protected function addClassBody(&$script)
	{
		$table = $this->getTable();
		if (!$table->isAlias()) {
			$this->addConstants($script);
			$this->addAttributes($script);
		}

		$this->addColumnAccessorMethods($script);
		$this->addColumnMutatorMethods($script);

		$this->addHydrate($script);

		$this->addManipulationMethods($script);
		$this->addValidationMethods($script);

		if ($this->isAddGenericAccessors()) {
			$this->addGetByName($script);
			$this->addGetByPosition($script);
			$this->addToArray($script);
		}

		if ($this->isAddGenericMutators()) {
			$this->addSetByName($script);
			$this->addSetByPosition($script);
			$this->addFromArray($script);
		}

		$this->addBuildCriteria($script);
		$this->addBuildPkeyCriteria($script);
		$this->addGetPrimaryKey($script);
		$this->addSetPrimaryKey($script);

		$this->addCopy($script);

		if (!$table->isAlias()) {
			$this->addGetPeer($script);
		}
	}

	/**
	 * Closes class.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addClassClose(&$script)
	{
		$script .= "
} // " . $this->getClassname() . "
";
	}

	/**
	 * Adds any constants to the class.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addConstants(&$script)
	{
		// nothing to do here any more
		// fieldnameTypeConstants have been moved to class BasePeer [sv]
	}

	/**
	 * Adds class attributes.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addAttributes(&$script)
	{
		$script .= "
	/**
	 * The Peer class.
	 * Instance provides a convenient way of calling static methods on a class
	 * that calling code may not be able to identify.
	 * @var        ".$this->getPeerClassname()."
	 */
	protected static \$peer;
";
		if (!$this->getTable()->isAlias()) {
			$this->addColumnAttributes($script);
		}
	}

	/**
	 * Adds variables that store column values.
	 * @param      string &$script The script will be modified in this method.
	 * @see        addColumnNameConstants()
	 */
	protected function addColumnAttributes(&$script) {

		$table = $this->getTable();

		foreach ($table->getColumns() as $col) {

			$cptype = $col->getPhpNative();
			$clo=strtolower($col->getName());
			$defVal = "";
			if (($val = $col->getPhpDefaultValue()) !== null) {
				settype($val, $cptype);
				$defaultValue = var_export($val, true);
				$defVal = " = " . $defaultValue;
			}

			$script .= "

	/**
	 * The value for the $clo field.
	 * @var        $cptype
	 */
	protected \$" . $clo . $defVal . ";
";

			if ($col->isLazyLoad()) {
				$script .= "
	/**
	 * Whether the lazy-loaded $clo value has been loaded from database.
	 * This is necessary to avoid repeated lookups if $clo column is NULL in the db.
	 * @var        boolean
	 */
	protected \$".$clo."_isLoaded = false;
";
			}

		}  // foreach col

	} // addColumnAttributes()

	/**
	 * Adds the getPeer() method.
	 * This is a convenient, non introspective way of getting the Peer class for a particular object.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addGetPeer(&$script)
	{
		$script .= "
	/**
	 * Returns a peer instance associated with this om.
	 *
	 * Since Peer classes are not to have any instance attributes, this method returns the
	 * same instance for all member of this class. The method could therefore
	 * be static, but this would prevent one from overriding the behavior.
	 *
	 * @return     ".$this->getPeerClassname()."
	 */
	public function getPeer()
	{
		if (self::\$peer === null) {
			self::\$peer = new ".$this->getPeerClassname()."();
		}
		return self::\$peer;
	}
";
	}

	// --------------------------------------------------------------
	//
	// A C C E S S O R    M E T H O D S
	//
	// --------------------------------------------------------------

	/**
	 * Adds a date/time/timestamp getter method.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 * @see        parent::addColumnAccessors()
	 */
	protected function addTemporalAccessor(&$script, $col)
	{
		$cfc=$col->getPhpName();
		$clo=strtolower($col->getName());

		// these default values are based on the Creole defaults
		// the date and time default formats are locale-sensitive
		if ($col->getType() === PropelTypes::DATE) {
			$defaultfmt = $this->getBuildProperty('defaultDateFormat');
		} elseif ($col->getType() === PropelTypes::TIME) {
			$defaultfmt = $this->getBuildProperty('defaultTimeFormat');
		} elseif ($col->getType() === PropelTypes::TIMESTAMP) {
			$defaultfmt = $this->getBuildProperty('defaultTimeStampFormat');
		}

		// if the default format property was an empty string, then we'll set it
		// to NULL, which will return the "native" integer timestamp
		if (empty($defaultfmt)) { $defaultfmt = null; }

		$script .= "
	/**
	 * Get the [optionally formatted] [$clo] column value.
	 * ".$col->getDescription()."
	 * @param      string \$format The date/time format string (either date()-style or strftime()-style).
	 *							If format is NULL, then the integer unix timestamp will be returned.
	 * @return     mixed Formatted date/time value as string or integer unix timestamp (if format is NULL).
	 * @throws     PropelException - if unable to convert the date/time to timestamp.
	 */
	public function get$cfc(\$format = ".var_export($defaultfmt, true)."";
		if ($col->isLazyLoad()) $script .= ", \$con = null";
		$script .= ")
	{
";
		if ($col->isLazyLoad()) {
			$script .= "
		if (!\$this->".$clo."_isLoaded && \$this->$clo === null && !\$this->isNew()) {
			\$this->load$cfc(\$con);
		}
";
		}
		$script .= "
		if (\$this->$clo === null || \$this->$clo === '') {
			return null;
		} elseif (!is_int(\$this->$clo)) {
			// a non-timestamp value was set externally, so we convert it
			\$ts = strtotime(\$this->$clo);
			if (\$ts === -1 || \$ts === false) { // in PHP 5.1 return value changes to FALSE
				throw new PropelException(\"Unable to parse value of [$clo] as date/time value: \" . var_export(\$this->$clo, true));
			}
		} else {
			\$ts = \$this->$clo;
		}
		if (\$format === null) {
			return \$ts;
		} elseif (strpos(\$format, '%') !== false) {
			return strftime(\$format, \$ts);
		} else {
			return date(\$format, \$ts);
		}
	}
";
	} // addTemporalAccessor

	/**
	 * Adds a normal (non-temporal) getter method.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 * @see        parent::addColumnAccessors()
	 */
	protected function addGenericAccessor(&$script, $col)
	{
		$cfc=$col->getPhpName();
		$clo=strtolower($col->getName());

		$script .= "
	/**
	 * Get the [$clo] column value.
	 * ".$col->getDescription()."
	 * @return     ".$col->getPhpNative()."
	 */
	public function get$cfc(";
		if ($col->isLazyLoad()) $script .= "\$con = null";
		$script .= ")
	{
";
		if ($col->isLazyLoad()) {
			$script .= "
		if (!\$this->".$clo."_isLoaded && \$this->$clo === null && !\$this->isNew()) {
			\$this->load$cfc(\$con);
		}
";
		}
		$script .= "
		return \$this->$clo;
	}
";
	}

	/**
	 * Adds the lazy loader method.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 * @see        parent::addColumnAccessors()
	 */
	protected function addLazyLoader(&$script, $col)
	{
		$cfc=$col->getPhpName();
		$clo=strtolower($col->getName());

		$script .= "
	/**
	 * Load the value for the lazy-loaded [$clo] column.
	 *
	 * This method performs an additional query to return the value for
	 * the [$clo] column, since it is not populated by
	 * the hydrate() method.
	 *
	 * @param      \$con Connection
	 * @return     void
	 * @throws     PropelException - any underlying error will be wrapped and re-thrown.
	 */
	protected function load$cfc(\$con = null)
	{
		\$c = \$this->buildPkeyCriteria();
		\$c->addSelectColumn(".$this->getColumnConstant($col).");
		try {
			\$rs = ".$this->getPeerClassname()."::doSelectRS(\$c, \$con);
			\$rs->next();
";
		$affix = CreoleTypes::getAffix(CreoleTypes::getCreoleCode($col->getType()));
		$clo = strtolower($col->getName());
		switch($col->getType()) {
			 case PropelTypes::DATE:
			 case PropelTypes::TIME:
			 case PropelTypes::TIMESTAMP:
			 	$script .= "
			\$this->$clo = \$rs->get$affix(1, null);
";
				break;
			default:
				$script .= "
			\$this->$clo = \$rs->get$affix(1);
";
		} // switch
		$script .= "
			\$this->".$clo."_isLoaded = true;
		} catch (Exception \$e) {
			throw new PropelException(\"Error loading value for [$clo] column on demand.\", \$e);
		}
	}
";

	} // addLazyLoader()



	// --------------------------------------------------------------
	//
	// M U T A T O R    M E T H O D S
	//
	// --------------------------------------------------------------

	/**
	 * Adds the open of the mutator (setter) method for a column.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 */
	protected function addMutatorOpen(&$script, Column $col)
	{
		$cfc=$col->getPhpName();
		$clo=strtolower($col->getName());

		$script .= "
	/**
	 * Set the value of [$clo] column.
	 * ".$col->getDescription()."
	 * @param      ".$col->getPhpNative()." \$v new value
	 * @return     void
	 */
	public function set$cfc(\$v)
	{
";
		if ($col->isLazyLoad()) {
			$script .= "
		// explicitly set the is-loaded flag to true for this lazy load col;
		// it doesn't matter if the value is actually set or not (logic below) as
		// any attempt to set the value means that no db lookup should be performed
		// when the get$cfc() method is called.
		\$this->".$clo."_isLoaded = true;
";
		}

	}

	/**
	 * Adds the close of the mutator (setter) method for a column.
	 * This can be overridden (e.g. by PHP5ComplexObjectBuilder) if additional functionality is needed.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 */
	protected function addMutatorClose(&$script, Column $col)
	{
				$script .= "
	} // set".$col->getPhpName()."()
";
	}

	/**
	 * Adds a setter for date/time/timestamp columns.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 * @see        parent::addColumnMutators()
	 */
	protected function addLobMutator(&$script, Column $col)
	{
		$this->addMutatorOpen($script, $col);
		$clo = strtolower($col->getName());
		// Setting of LOB columns gets some special handling

		if ($col->getPropelType() === PropelTypes::BLOB || $col->getPropelType() === PropelTypes::LONGVARBINARY ) {
			$lobClass = 'Blob';
		} else {
			$lobClass = 'Clob';
		}
		$script .= "
		// if the passed in parameter is the *same* object that
		// is stored internally then we use the Lob->isModified()
		// method to know whether contents changed.
		if (\$v instanceof Lob && \$v === \$this->$clo) {
			\$changed = \$v->isModified();
		} else {
			\$changed = (\$this->$clo !== \$v);
		}
		if (\$changed) {
			if ( !(\$v instanceof Lob) ) {
				\$obj = new $lobClass();
				\$obj->setContents(\$v);
			} else {
				\$obj = \$v;
			}
			\$this->$clo = \$obj;
			\$this->modifiedColumns[] = ".$this->getColumnConstant($col).";
		}
";
		$this->addMutatorClose($script, $col);

	} // addLobMutatorSnippet


	/**
	 * Adds a setter method for date/time/timestamp columns.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 * @see        parent::addColumnMutators()
	 */
	protected function addTemporalMutator(&$script, Column $col)
	{
		$clo = strtolower($col->getName());

		$defaultValue = null;
		if (($val = $col->getPhpDefaultValue()) !== null) {
			settype($val, $col->getPhpNative());
			$defaultValue = var_export($val, true);
		}

		$this->addMutatorOpen($script, $col);

		$script .= "
		if (\$v !== null && !is_int(\$v)) {
			\$ts = strtotime(\$v);
			if (\$ts === -1 || \$ts === false) { // in PHP 5.1 return value changes to FALSE
				throw new PropelException(\"Unable to parse date/time value for [$clo] from input: \" . var_export(\$v, true));
			}
		} else {
			\$ts = \$v;
		}
		if (\$this->$clo !== \$ts";
		if ($defaultValue !== null) {
			$script .= " || \$ts === $defaultValue";
		}
		$script .= ") {
			\$this->$clo = \$ts;
			\$this->modifiedColumns[] = ".$this->getColumnConstant($col).";
		}
";
		$this->addMutatorClose($script, $col);
	}

	/**
	 * Adds setter method for "normal" columns.
	 * @param      string &$script The script will be modified in this method.
	 * @param      Column $col The current column.
	 * @see        parent::addColumnMutators()
	 */
	protected function addDefaultMutator(&$script, Column $col)
	{
		$clo = strtolower($col->getName());

		// FIXME: refactor this
		$defaultValue = null;
		if (($val = $col->getPhpDefaultValue()) !== null) {
			settype($val, $col->getPhpNative());
			$defaultValue = var_export($val, true);
		}

		$this->addMutatorOpen($script, $col);
		
		// Perform some smart checking here to handle possible type discrepancies
		// between the passed-in value and the value from the DB 
		
		if ($col->getPhpNative() === "int") {
			$script .= "
		// Since the native PHP type for this column is integer,
		// we will cast the input value to an int (if it is not).
		if (\$v !== null && !is_int(\$v) && is_numeric(\$v)) {
			\$v = (int) \$v;
		}
";
		} elseif ($col->getPhpNative() === "string") {
			$script .= "
		// Since the native PHP type for this column is string,
		// we will cast the input to a string (if it is not).
		if (\$v !== null && !is_string(\$v)) {
			\$v = (string) \$v; 
		}
";
		}
		
		$script .= "
		if (\$this->$clo !== \$v";
		if ($defaultValue !== null) {
			$script .= " || \$v === $defaultValue";
		}
		$script .= ") {
			\$this->$clo = \$v;
			\$this->modifiedColumns[] = ".$this->getColumnConstant($col).";
		}
";
		$this->addMutatorClose($script, $col);
	}

	/**
	 * Adds the hydrate() method, which sets attributes of the object based on a ResultSet.
	 */
	protected function addHydrate(&$script)
	{
		$table = $this->getTable();

		$script .= "
	/**
	 * Hydrates (populates) the object variables with values from the database resultset.
	 *
	 * An offset (1-based \"start column\") is specified so that objects can be hydrated
	 * with a subset of the columns in the resultset rows.  This is needed, for example,
	 * for results of JOIN queries where the resultset row includes columns from two or
	 * more tables.
	 *
	 * @param      ResultSet \$rs The ResultSet class with cursor advanced to desired record pos.
	 * @param      int \$startcol 1-based offset column which indicates which restultset column to start with.
	 * @return     int next starting column
	 * @throws     PropelException  - Any caught Exception will be rewrapped as a PropelException.
	 */
	public function hydrate(ResultSet \$rs, \$startcol = 1)
	{
		try {
";
			$n = 0;
			foreach($table->getColumns() as $col) {
				if(!$col->isLazyLoad()) {
					$affix = CreoleTypes::getAffix(CreoleTypes::getCreoleCode($col->getType()));
					$clo = strtolower($col->getName());
					switch($col->getType()) {

						case PropelTypes::DATE:
						case PropelTypes::TIME:
						case PropelTypes::TIMESTAMP:
							$script .= "
			\$this->$clo = \$rs->get$affix(\$startcol + $n, null);
";
							break;
						default:
							$script .= "
			\$this->$clo = \$rs->get$affix(\$startcol + $n);
";
					}
					$n++;
				} // if col->isLazyLoad()
			} /* foreach */

			if ($this->getBuildProperty("addSaveMethod")) {
				$script .= "
			\$this->resetModified();
";
			}

			$script .= "
			\$this->setNew(false);

			// FIXME - using NUM_COLUMNS may be clearer.
			return \$startcol + $n; // $n = ".$this->getPeerClassname()."::NUM_COLUMNS - ".$this->getPeerClassname()."::NUM_LAZY_LOAD_COLUMNS).

		} catch (Exception \$e) {
			throw new PropelException(\"Error populating ".$table->getPhpName()." object\", \$e);
		}
	}
";

	} // addHydrate()


	/**
	 *
	 */
	protected function addBuildPkeyCriteria(&$script) {


		$script .= "
	/**
	 * Builds a Criteria object containing the primary key for this object.
	 *
	 * Unlike buildCriteria() this method includes the primary key values regardless
	 * of whether or not they have been modified.
	 *
	 * @return     Criteria The Criteria object containing value(s) for primary key(s).
	 */
	public function buildPkeyCriteria()
	{
		\$criteria = new Criteria(".$this->getPeerClassname()."::DATABASE_NAME);
";
		foreach ($this->getTable()->getColumns() as $col) {
			$clo = strtolower($col->getName());
			if ($col->isPrimaryKey()) {
				$script .= "
		\$criteria->add(".$this->getColumnConstant($col).", \$this->$clo);";
			}
		}

		$script .= "

		return \$criteria;
	}
";

	}

	/**
	 *
	 */
	protected function addBuildCriteria(&$script)
	{
		$script .= "
	/**
	 * Build a Criteria object containing the values of all modified columns in this object.
	 *
	 * @return     Criteria The Criteria object containing all modified values.
	 */
	public function buildCriteria()
	{
		\$criteria = new Criteria(".$this->getPeerClassname()."::DATABASE_NAME);
";
		foreach ($this->getTable()->getColumns() as $col) {
			$clo = strtolower($col->getName());
			$script .= "
		if (\$this->isColumnModified(".$this->getColumnConstant($col).")) \$criteria->add(".$this->getColumnConstant($col).", \$this->$clo);";
		}
		$script .= "

		return \$criteria;
	}
";
	} // addBuildCriteria()

	protected function addToArray(&$script)
	{
		$script .= "
	/**
	 * Exports the object as an array.
	 *
	 * You can specify the key type of the array by passing one of the class
	 * type constants.
	 *
	 * @param      string \$keyType One of the class type constants TYPE_PHPNAME,
	 *                        TYPE_COLNAME, TYPE_FIELDNAME, TYPE_NUM
	 * @return     an associative array containing the field names (as keys) and field values
	 */
	public function toArray(\$keyType = BasePeer::TYPE_PHPNAME)
	{
		\$keys = ".$this->getPeerClassname()."::getFieldNames(\$keyType);
		\$result = array(";
		foreach ($this->getTable()->getColumns() as $num => $col) {
			$script .= "
			\$keys[$num] => \$this->get".$col->getPhpName()."(),";
		}
		$script .= "
		);
		return \$result;
	}
";
	} // addToArray()

	protected function addGetByName(&$script)
	{
		$script .= "
	/**
	 * Retrieves a field from the object by name passed in as a string.
	 *
	 * @param      string \$name name
	 * @param      string \$type The type of fieldname the \$name is of:
	 *                     one of the class type constants TYPE_PHPNAME,
	 *                     TYPE_COLNAME, TYPE_FIELDNAME, TYPE_NUM
	 * @return     mixed Value of field.
	 */
	public function getByName(\$name, \$type = BasePeer::TYPE_PHPNAME)
	{
		\$pos = ".$this->getPeerClassname()."::translateFieldName(\$name, \$type, BasePeer::TYPE_NUM);
		return \$this->getByPosition(\$pos);
	}
";
	}

	protected function addGetByPosition(&$script)
	{
		$table = $this->getTable();
		$script .= "
	/**
	 * Retrieves a field from the object by Position as specified in the xml schema.
	 * Zero-based.
	 *
	 * @param      int \$pos position in xml schema
	 * @return     mixed Value of field at \$pos
	 */
	public function getByPosition(\$pos)
	{
		switch(\$pos) {";
	$i = 0;
	foreach ($table->getColumns() as $col) {
		$cfc = $col->getPhpName();
		$cptype = $col->getPhpNative();// not safe to use it because some methods may return objects (Blob)
$script .= "
			case $i:
				return \$this->get$cfc();
				break;";
		$i++;
	} /* foreach */
$script .= "
			default:
				return null;
				break;
		} // switch()
	}
";
	}

	protected function addSetByName(&$script)
	{
		$table = $this->getTable();
		$script .= "
	/**
	 * Sets a field from the object by name passed in as a string.
	 *
	 * @param      string \$name peer name
	 * @param      mixed \$value field value
	 * @param      string \$type The type of fieldname the \$name is of:
	 *                     one of the class type constants TYPE_PHPNAME,
	 *                     TYPE_COLNAME, TYPE_FIELDNAME, TYPE_NUM
	 * @return     void
	 */
	public function setByName(\$name, \$value, \$type = BasePeer::TYPE_PHPNAME)
	{
		\$pos = ".$this->getPeerClassname()."::translateFieldName(\$name, \$type, BasePeer::TYPE_NUM);
		return \$this->setByPosition(\$pos, \$value);
	}
";
	}

	protected function addSetByPosition(&$script)
	{
		$table = $this->getTable();
		$script .= "
	/**
	 * Sets a field from the object by Position as specified in the xml schema.
	 * Zero-based.
	 *
	 * @param      int \$pos position in xml schema
	 * @param      mixed \$value field value
	 * @return     void
	 */
	public function setByPosition(\$pos, \$value)
	{
		switch(\$pos) {";
		$i = 0;
		foreach ($table->getColumns() as $col) {
			$cfc = $col->getPhpName();
			$cptype = $col->getPhpNative();
			$script .= "
			case $i:
				\$this->set$cfc(\$value);
				break;";
			$i++;
		} /* foreach */
		$script .= "
		} // switch()
	}
";
	} // addSetByPosition()

	protected function addFromArray(&$script)
	{
		$table = $this->getTable();
		$script .= "
	/**
	 * Populates the object using an array.
	 *
	 * This is particularly useful when populating an object from one of the
	 * request arrays (e.g. \$_POST).  This method goes through the column
	 * names, checking to see whether a matching key exists in populated
	 * array. If so the setByName() method is called for that column.
	 *
	 * You can specify the key type of the array by additionally passing one
	 * of the class type constants TYPE_PHPNAME, TYPE_COLNAME, TYPE_FIELDNAME,
	 * TYPE_NUM. The default key type is the column's phpname (e.g. 'authorId')
	 *
	 * @param      array  \$arr     An array to populate the object from.
	 * @param      string \$keyType The type of keys the array uses.
	 * @return     void
	 */
	public function fromArray(\$arr, \$keyType = BasePeer::TYPE_PHPNAME)
	{
		\$keys = ".$this->getPeerClassname()."::getFieldNames(\$keyType);
";
		foreach ($table->getColumns() as $num => $col) {
			$cfc = $col->getPhpName();
			$cptype = $col->getPhpNative();
			$script .= "
		if (array_key_exists(\$keys[$num], \$arr)) \$this->set$cfc(\$arr[\$keys[$num]]);";
		} /* foreach */
		$script .= "
	}
";
	} // addFromArray



	protected function addDelete(&$script)
	{
		$script .= "
	/**
	 * Removes this object from datastore and sets delete attribute.
	 *
	 * @param      Connection \$con
	 * @return     void
	 * @throws     PropelException
	 * @see        BaseObject::setDeleted()
	 * @see        BaseObject::isDeleted()
	 */
	public function delete(\$con = null)
	{
		if (\$this->isDeleted()) {
			throw new PropelException(\"This object has already been deleted.\");
		}

		if (\$con === null) {
			\$con = Propel::getConnection(".$this->getPeerClassname()."::DATABASE_NAME);
		}

		try {
			\$con->begin();
			".$this->getPeerClassname()."::doDelete(\$this, \$con);
			\$this->setDeleted(true);
			\$con->commit();
		} catch (PropelException \$e) {
			\$con->rollback();
			throw \$e;
		}
	}
";
	} // addDelete()

	/**
	 * Adds the methods related to saving and deleting the object.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addManipulationMethods(&$script)
	{
		$this->addDelete($script);
		$this->addSave($script);
	}

	/**
	 * Adds the methods related to validationg the object.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addValidationMethods(&$script)
	{
		$this->addValidationFailuresAttribute($script);
		$this->addGetValidationFailures($script);
		$this->addValidate($script);
	}

	/**
	 * Adds the save() method.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addSave(&$script)
	{
		$table = $this->getTable();
		$script .= "
	/**
	 * Stores the object in the database.
	 *
	 * If the object is new, it inserts it; otherwise an update is performed.
	 *
	 * @param      Connection \$con
	 * @return     int The number of rows affected by this insert/update operation (for non-complex OM this will be at most 1).
	 * @throws     PropelException
	 */
	public function save(\$con = null)
	{
		\$affectedRows = 0; // initialize var to track total num of affected rows

		// If this object has been modified, then save it to the database.
		if (\$this->isModified()) {
			if (\$this->isNew()) {
				\$pk = ".$this->getPeerClassname()."::doInsert(\$this, \$con);
				\$affectedRows += 1; // we are assuming that there is only 1 row per doInsert() which
									 // should always be true here (even though technically
									 // BasePeer::doInsert() can insert multiple rows).
";
		if ($table->getIdMethod() != "none") {
			if (count($pks = $table->getPrimaryKey())) {
				foreach ($pks as $pk) {
					if ($pk->isAutoIncrement()) {
						$script .= "
					\$this->set".$pk->getPhpName()."(\$pk);  //[IMV] update autoincrement primary key
";
					}
				}
			}
		}
		$script .= "
					\$this->setNew(false);
			} else {
					\$affectedRows += ".$this->getPeerClassname()."::doUpdate(\$this, \$con);
			}
				\$this->resetModified(); // [HL] After being saved an object is no longer 'modified'
		} // if \$this->isModified()

		return \$affectedRows;
	} // save()
";

	} // addSave()

	/**
	 * Adds the $validationFailures attribute to store ValidationFailed objects.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addValidationFailuresAttribute(&$script)
	{
		$script .= "
	/**
	 * Array of ValidationFailed objects.
	 * @var        array ValidationFailed[]
	 */
	protected \$validationFailures = array();
";
	}

	/**
	 * Adds the validate() method.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addValidate(&$script)
	{
		$script .= "
	/**
	 * Validates the objects modified field values.
	 *
	 * If \$columns is either a column name or an array of column names
	 * only those columns are validated.
	 *
	 * @param      mixed \$columns Column name or an array of column names.
	 *
	 * @return     mixed <code>true</code> if all columns pass validation
	 *			  or an array of <code>ValidationFailed</code> objects for columns that fail.
	 */
	public function validate(\$columns = null)
	{
		if (\$columns) {
			return ".$this->getPeerClassname()."::doValidate(\$this, \$columns);
		}
		return ".$this->getPeerClassname()."::doValidate(\$this);
	}
";

	} // addValidate()

	/**
	 * Adds the getValidationFailures() method.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addGetValidationFailures(&$script)
	{
		$script .= "
	/**
	 * Gets any ValidationFailed objects that resulted from last call to validate().
	 *
	 *
	 * @return     array ValidationFailed[]
	 * @see        validate()
	 */
	public function getValidationFailures()
	{
		return \$this->validationFailures;
	}
";
	} // addGetValidationFailures()

	/**
	 * Adds the correct getPrimaryKey() method for this object.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addGetPrimaryKey(&$script)
	{
		$pkeys = $this->getTable()->getPrimaryKey();
		if (count($pkeys) == 1) {
			$this->addGetPrimaryKey_SinglePK($script);
		} elseif (count($pkeys) > 1) {
			$this->addGetPrimaryKey_MultiPK($script);
		} else {
			// no primary key -- this is deprecated, since we don't *need* this method anymore
			$this->addGetPrimaryKey_NoPK($script);
		}
	}

	/**
	 * Adds the getPrimaryKey() method for tables that contain a single-column primary key.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addGetPrimaryKey_SinglePK(&$script)
	{
		$table = $this->getTable();
		$pkeys = $table->getPrimaryKey();
		$cptype = $pkeys[0]->getPhpType();

		$script .= "
	/**
	 * Returns the primary key for this object (row).
	 * @return     $cptype
	 */
	public function getPrimaryKey()
	{
		return \$this->get".$pkeys[0]->getPhpName()."();
	}
";
	} // addetPrimaryKey_SingleFK

	/**
	 * Adds the setPrimaryKey() method for tables that contain a multi-column primary key.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addGetPrimaryKey_MultiPK(&$script)
	{

		$script .= "
	/**
	 * Returns the composite primary key for this object.
	 * The array elements will be in same order as specified in XML.
	 * @return     array
	 */
	public function getPrimaryKey()
	{
		\$pks = array();
";
		$i = 0;
		foreach ($this->getTable()->getPrimaryKey() as $pk) {
			$script .= "
		\$pks[$i] = \$this->get".$pk->getPhpName()."();
";
			$i++;
		} /* foreach */
		$script .= "
		return \$pks;
	}
";
	} // addGetPrimaryKey_MultiFK()

	/**
	 * Adds the getPrimaryKey() method for objects that have no primary key.
	 * This "feature" is dreprecated, since the getPrimaryKey() method is not required
	 * by the Persistent interface (or used by the templates).  Hence, this method is also
	 * deprecated.
	 * @param      string &$script The script will be modified in this method.
	 * @deprecated
	 */
	protected function addGetPrimaryKey_NoPK(&$script)
	{
		$script .= "
	/**
	 * Returns NULL since this table doesn't have a primary key.
	 * This method exists only for BC and is deprecated!
	 * @return     null
	 */
	public function getPrimaryKey()
	{
		return null;
	}
";
	}
	/**
	 * Adds the correct setPrimaryKey() method for this object.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addSetPrimaryKey(&$script)
	{
		$pkeys = $this->getTable()->getPrimaryKey();
		if (count($pkeys) == 1) {
			$this->addSetPrimaryKey_SinglePK($script);
		} elseif (count($pkeys) > 1) {
			$this->addSetPrimaryKey_MultiPK($script);
		} else {
			// no primary key -- this is deprecated, since we don't *need* this method anymore
			$this->addSetPrimaryKey_NoPK($script);
		}
	}

	/**
	 * Adds the setPrimaryKey() method for tables that contain a single-column primary key.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addSetPrimaryKey_SinglePK(&$script)
	{

		$pkeys = $this->getTable()->getPrimaryKey();
		$col = $pkeys[0];
		$clo=strtolower($col->getName());
		$ctype = $col->getPhpNative();

		$script .= "
	/**
	 * Generic method to set the primary key ($clo column).
	 *
	 * @param      $ctype \$key Primary key.
	 * @return     void
	 */
	public function setPrimaryKey(\$key)
	{
		\$this->set".$col->getPhpName()."(\$key);
	}
";
	} // addSetPrimaryKey_SinglePK

	/**
	 * Adds the setPrimaryKey() method for tables that contain a multi-columnprimary key.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addSetPrimaryKey_MultiPK(&$script)
	{

		$script .="
	/**
	 * Set the [composite] primary key.
	 *
	 * @param      array \$keys The elements of the composite key (order must match the order in XML file).
	 * @return     void
	 */
	public function setPrimaryKey(\$keys)
	{
";
			$i = 0;
			foreach ($this->getTable()->getPrimaryKey() as $pk) {
				$pktype = $pk->getPhpNative();
				$script .= "
		\$this->set".$pk->getPhpName()."(\$keys[$i]);
";
				$i++;
			} /* foreach ($table->getPrimaryKey() */
			$script .= "
	}
";
	} // addSetPrimaryKey_MultiPK

	/**
	 * Adds the setPrimaryKey() method for objects that have no primary key.
	 * This "feature" is dreprecated, since the setPrimaryKey() method is not required
	 * by the Persistent interface (or used by the templates).  Hence, this method is also
	 * deprecated.
	 * @param      string &$script The script will be modified in this method.
	 * @deprecated
	 */
	protected function addSetPrimaryKey_NoPK(&$script)
	{
		$script .="
	/**
	 * Dummy primary key setter.
	 *
	 * This function only exists to preserve backwards compatibility.  It is no longer
	 * needed or required by the Persistent interface.  It will be removed in next BC-breaking
	 * release of Propel.
	 *
	 * @deprecated
	 */
	 public function setPrimaryKey(\$pk)
	 {
		 // do nothing, because this object doesn't have any primary keys
	 }
";
	}

	/**
	 * Adds the copy() method, which (in complex OM) includes the $deepCopy param for making copies of related objects.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addCopy(&$script)
	{
		$this->addCopyInto($script);

		$table = $this->getTable();

		$script .= "
	/**
	 * Makes a copy of this object that will be inserted as a new row in table when saved.
	 * It creates a new object filling in the simple attributes, but skipping any primary
	 * keys that are defined for the table.
	 *
	 * @return     ".$table->getPhpName()." Clone of current object.
	 * @throws     PropelException
	 */
	public function copy()
	{
		// we use get_class(), because this might be a subclass
		\$clazz = get_class(\$this);
		\$copyObj = new \$clazz();
		\$this->copyInto(\$copyObj);
		return \$copyObj;
	}
";
	} // addCopy()

	/**
	 * Adds the copy() method.
	 */
	protected function addCopyInto(&$script)
	{
		$table = $this->getTable();

		$script .= "
	/**
	 * Sets contents of passed object to values from current object.
	 *
	 * @param      object \$copyObj An object of ".$table->getPhpName()." (or compatible) type.
	 * @return     ".$table->getPhpName()." Clone of current object.
	 * @throws     PropelException
	 */
	public function copyInto(\$copyObj)
	{
";

		$pkcols = array();
		foreach ($table->getColumns() as $pkcol) {
			if ($pkcol->isPrimaryKey()) {
				$pkcols[] = $pkcol->getName();
			}
		}

		foreach ($table->getColumns() as $col) {
			if (!in_array($col->getName(), $pkcols)) {
				$script .= "
		\$copyObj->set<?php echo $col->getPhpName()?>(\$this-><?php echo strtolower($col->getName()) ?>);";
			}
		} // foreach

		$script .= "

		\$copyObj->setNew(true);";

		foreach ($table->getColumns() as $col) {
			if ($col->isPrimaryKey()) {
				$coldefval = $col->getPhpDefaultValue();
				$coldefval = var_export($coldefval, true);
				$script .= "
		\$copyObj->set".$col->getPhpName() ."($coldefval); // this is a pkey column, so set to default value";
			} // if col->isPrimaryKey
		} // foreach
		$script .= "
		return \$copyObj;
	}
";
	} // addCopy()

} // PHP5BasicObjectBuilder
