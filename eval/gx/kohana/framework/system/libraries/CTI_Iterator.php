<?php defined('SYSPATH') or die('No direct script access.');
/**
 * ORM result iterator, supporting Class Table Inheritance
 *
 * Based on:
 *
 * Wouter's Class Table Inhertenace rewrite
 * @commnets   http://forum.kohanaphp.com/comments.php?DiscussionID=1074
 *  *
 * Extended by:
 *
 * @author     talmdal
 * @commnets   Change the name and extend ORM_Iterator_Core
 *
 */
class CTI_Iterator_Core extends ORM_Iterator_Core {
	/* <ADD> Replaced new $class with ORM::factory
	 * When instantiating new classes using constructor, possible
	 * extension aren't checked. When instantiating using ORM::factory
	 * they are (and the extended model is returned).
	 */


	// Class attributes
	protected $object_name; //<ADD> (needed to use ORM::factory method)

	public function __construct(ORM $model, $result) {
		parent::__construct($model, $result);

		$this->object_name = strtolower(substr($this->class_name, 0, -6));
	}

	/**
	 * Returns an array of the results as ORM objects.
	 *
	 * @return  array
	 */
	public function as_array() {
		$array = array();

		if ($results = $this->result->result_array()) {
			//Import object name
			$object = $this->object_name;

			foreach ($results as $obj) 			{
				$array[] = CTI::factory($object,$obj);
			}
		}

		return $array;
	}

	/**
	 * Return a range of offsets.
	 *
	 * @param   integer  start
	 * @param   integer  end
	 * @return  array
	 */
	public function range($start, $end) {
		// Array of objects
		$array = array();

		if ($this->result->offsetExists($start)) {
			//Import object name
			$object = $this->object_name;

			// Set the end offset
			$end = $this->result->offsetExists($end) ? $end : $this->count();

			for ($i = $start; $i < $end; $i++) {
				// Insert each object in the range
				$array[] = CTI::factory($object,$this->result->offsetGet($i)); //<ADD> TEST
			}
		}

		return $array;
	}

	/**
	 * Iterator: current
	 */
	public function current() {
		if ($row = $this->result->current()) {
			//Import object name
			$object = $this->object_name;

			//$row = new $class($row);
			$row = ORM::factory($object,$row); //<ADD> TEST
		}

		return $row;
	}

	/**
	 * ArrayAccess: offsetGet
	 */
	public function offsetGet($offset) {
		if ($this->result->offsetExists($offset)) {
			//Import object name
			$object = $this->object_name;

			return CTI::factory($object,$this->result->offsetGet($offset)); //<ADD> TEST
		}
	}

} // End CTI Iterator
?>