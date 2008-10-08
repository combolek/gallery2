<?php

/*
 *  $Id: PHP5MultiExtendObjectBuilder.php 536 2007-01-10 14:30:38Z heltem $
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
 * Generates the empty PHP5 stub object class for use with inheritance in the user object model (OM).
 *
 * This class produces the empty stub class that can be customized with application
 * business logic, custom behavior, etc.
 *
 * This class replaces the MultiExtendObject.tpl, with the intent of being easier for users
 * to customize (through extending & overriding).
 *
 * @author     Hans Lellelid <hans@xmpl.org>
 * @package    propel.engine.builder.om.php5
 */
class PHP5MultiExtendObjectBuilder extends ObjectBuilder {

	/**
	 * The current child "object" we are operating on.
	 */
	private $child;

	/**
	 * Returns the name of the current class being built.
	 * @return     string
	 */
	public function getClassname()
	{
		return $this->getChild()->getClassName();
	}

	/**
	 * Override method to return child package, if specified.
	 * @return     string
	 */
	public function getPackage()
	{
		return ($this->child->getPackage() ? $this->child->getPackage() : parent::getPackage());
	}

	/**
	 * Set the child object that we're operating on currrently.
	 * @param      $child Inheritance
	 */
	public function setChild(Inheritance $child)
	{
		$this->child = $child;
	}

	/**
	 * Returns the child object we're operating on currently.
	 * @return     Inheritance
	 * @throws     BuildException - if child was not set.
	 */
	public function getChild()
	{
		if (!$this->child) {
			throw new BuildException("The PHP5MultiExtendObjectBuilder needs to be told which child class to build (via setChild() method) before it can build the stub class.");
		}
		return $this->child;
	}

	/**
	 * Returns classpath to parent class.
	 * @return     string
	 */
	protected function getParentClasspath()
	{
		if ($this->getChild()->getAncestor()) {
			return $this->getChild()->getAncestor();
		} else {
			return $this->getObjectBuilder()->getClasspath();
		}
	}

	/**
	 * Returns classname of parent class.
	 * @return     string
	 */
	protected function getParentClassname()
	{
		return ClassTools::classname($this->getParentClasspath());
	}

	/**
	 * Gets the file path to the parent class.
	 * @return     string
	 */
	protected function getParentClassFilePath()
	{
		return $this->getFilePath($this->getParentClasspath());
	}

	/**
	 * Adds the include() statements for files that this class depends on or utilizes.
	 * @param      string &$script The script will be modified in this method.
	 */
	protected function addIncludes(&$script)
	{
		$script .= "
require_once '".$this->getParentClassFilePath()."';
";
		$script .= "
require_once '".$this->getObjectBuilder()->getClassFilePath()."';
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

		$baseClassname = $this->getObjectBuilder()->getClassname();

		$script .= "

/**
 * Skeleton subclass for representing a row from one of the subclasses of the '$tableName' table.
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
 * You should add additional methods to this class to meet the
 * application requirements.  This class will only be generated as
 * long as it does not already exist in the output directory.
 *
 * @package    ".$this->getPackage()."
 */
class ".$this->getClassname()." extends ".$this->getParentClassname()." {
";
	}

	/**
	 * Specifies the methods that are added as part of the stub object class.
	 *
	 * By default there are no methods for the empty stub classes; override this method
	 * if you want to change that behavior.
	 *
	 * @see        ObjectBuilder::addClassBody()
	 */
	protected function addClassBody(&$script)
	{
		$child = $this->getChild();
		$col = $child->getColumn();
		$cfc = $col->getPhpName();

		$const = "CLASSKEY_".strtoupper($child->getKey());

		$script .= "
	/**
	 * Constructs a new ".$this->getChild()->getClassName()." class, setting the ".$col->getName()." column to ".$this->getPeerClassname()."::$const.
	 */
	public function __construct()
	{
";

		$script .= "
		\$this->set$cfc(".$this->getPeerClassname()."::CLASSKEY_".strtoupper($child->getKey()).");
	}
";
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

} // PHP5ExtensionObjectBuilder
