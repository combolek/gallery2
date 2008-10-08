<?php


abstract class BaseItem extends BaseObject  implements Persistent {


	
	protected static $peer;


	
	protected $id;


	
	protected $name;


	
	protected $path;


	
	protected $haschildren = false;


	
	protected $parent_id;


	
	protected $isalbum = false;

	
	protected $aItemRelatedByParentId;

	
	protected $collItemsRelatedByParentId;

	
	protected $lastItemRelatedByParentIdCriteria = null;

	
	protected $alreadyInSave = false;

	
	protected $alreadyInValidation = false;

	
	public function getId()
	{

		return $this->id;
	}

	
	public function getName()
	{

		return $this->name;
	}

	
	public function getPath()
	{

		return $this->path;
	}

	
	public function getHaschildren()
	{

		return $this->haschildren;
	}

	
	public function getParentId()
	{

		return $this->parent_id;
	}

	
	public function getIsalbum()
	{

		return $this->isalbum;
	}

	
	public function setId($v)
	{

		
		
		if ($v !== null && !is_int($v) && is_numeric($v)) {
			$v = (int) $v;
		}

		if ($this->id !== $v) {
			$this->id = $v;
			$this->modifiedColumns[] = ItemPeer::ID;
		}

	} 
	
	public function setName($v)
	{

		
		
		if ($v !== null && !is_string($v)) {
			$v = (string) $v; 
		}

		if ($this->name !== $v) {
			$this->name = $v;
			$this->modifiedColumns[] = ItemPeer::NAME;
		}

	} 
	
	public function setPath($v)
	{

		
		
		if ($v !== null && !is_string($v)) {
			$v = (string) $v; 
		}

		if ($this->path !== $v) {
			$this->path = $v;
			$this->modifiedColumns[] = ItemPeer::PATH;
		}

	} 
	
	public function setHaschildren($v)
	{

		if ($this->haschildren !== $v || $v === false) {
			$this->haschildren = $v;
			$this->modifiedColumns[] = ItemPeer::HASCHILDREN;
		}

	} 
	
	public function setParentId($v)
	{

		
		
		if ($v !== null && !is_int($v) && is_numeric($v)) {
			$v = (int) $v;
		}

		if ($this->parent_id !== $v) {
			$this->parent_id = $v;
			$this->modifiedColumns[] = ItemPeer::PARENT_ID;
		}

		if ($this->aItemRelatedByParentId !== null && $this->aItemRelatedByParentId->getId() !== $v) {
			$this->aItemRelatedByParentId = null;
		}

	} 
	
	public function setIsalbum($v)
	{

		if ($this->isalbum !== $v || $v === false) {
			$this->isalbum = $v;
			$this->modifiedColumns[] = ItemPeer::ISALBUM;
		}

	} 
	
	public function hydrate(ResultSet $rs, $startcol = 1)
	{
		try {

			$this->id = $rs->getInt($startcol + 0);

			$this->name = $rs->getString($startcol + 1);

			$this->path = $rs->getString($startcol + 2);

			$this->haschildren = $rs->getBoolean($startcol + 3);

			$this->parent_id = $rs->getInt($startcol + 4);

			$this->isalbum = $rs->getBoolean($startcol + 5);

			$this->resetModified();

			$this->setNew(false);

						return $startcol + 6; 
		} catch (Exception $e) {
			throw new PropelException("Error populating Item object", $e);
		}
	}

	
	public function delete($con = null)
	{
		if ($this->isDeleted()) {
			throw new PropelException("This object has already been deleted.");
		}

		if ($con === null) {
			$con = Propel::getConnection(ItemPeer::DATABASE_NAME);
		}

		try {
			$con->begin();
			ItemPeer::doDelete($this, $con);
			$this->setDeleted(true);
			$con->commit();
		} catch (PropelException $e) {
			$con->rollback();
			throw $e;
		}
	}

	
	public function save($con = null)
	{
		if ($this->isDeleted()) {
			throw new PropelException("You cannot save an object that has been deleted.");
		}

		if ($con === null) {
			$con = Propel::getConnection(ItemPeer::DATABASE_NAME);
		}

		try {
			$con->begin();
			$affectedRows = $this->doSave($con);
			$con->commit();
			return $affectedRows;
		} catch (PropelException $e) {
			$con->rollback();
			throw $e;
		}
	}

	
	protected function doSave($con)
	{
		$affectedRows = 0; 		if (!$this->alreadyInSave) {
			$this->alreadyInSave = true;


												
			if ($this->aItemRelatedByParentId !== null) {
				if ($this->aItemRelatedByParentId->isModified()) {
					$affectedRows += $this->aItemRelatedByParentId->save($con);
				}
				$this->setItemRelatedByParentId($this->aItemRelatedByParentId);
			}


						if ($this->isModified()) {
				if ($this->isNew()) {
					$pk = ItemPeer::doInsert($this, $con);
					$affectedRows += 1; 										 										 
					$this->setId($pk);  
					$this->setNew(false);
				} else {
					$affectedRows += ItemPeer::doUpdate($this, $con);
				}
				$this->resetModified(); 			}

			if ($this->collItemsRelatedByParentId !== null) {
				foreach($this->collItemsRelatedByParentId as $referrerFK) {
					if (!$referrerFK->isDeleted()) {
						$affectedRows += $referrerFK->save($con);
					}
				}
			}

			$this->alreadyInSave = false;
		}
		return $affectedRows;
	} 
	
	protected $validationFailures = array();

	
	public function getValidationFailures()
	{
		return $this->validationFailures;
	}

	
	public function validate($columns = null)
	{
		$res = $this->doValidate($columns);
		if ($res === true) {
			$this->validationFailures = array();
			return true;
		} else {
			$this->validationFailures = $res;
			return false;
		}
	}

	
	protected function doValidate($columns = null)
	{
		if (!$this->alreadyInValidation) {
			$this->alreadyInValidation = true;
			$retval = null;

			$failureMap = array();


												
			if ($this->aItemRelatedByParentId !== null) {
				if (!$this->aItemRelatedByParentId->validate($columns)) {
					$failureMap = array_merge($failureMap, $this->aItemRelatedByParentId->getValidationFailures());
				}
			}


			if (($retval = ItemPeer::doValidate($this, $columns)) !== true) {
				$failureMap = array_merge($failureMap, $retval);
			}



			$this->alreadyInValidation = false;
		}

		return (!empty($failureMap) ? $failureMap : true);
	}

	
	public function getByName($name, $type = BasePeer::TYPE_PHPNAME)
	{
		$pos = ItemPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
		return $this->getByPosition($pos);
	}

	
	public function getByPosition($pos)
	{
		switch($pos) {
			case 0:
				return $this->getId();
				break;
			case 1:
				return $this->getName();
				break;
			case 2:
				return $this->getPath();
				break;
			case 3:
				return $this->getHaschildren();
				break;
			case 4:
				return $this->getParentId();
				break;
			case 5:
				return $this->getIsalbum();
				break;
			default:
				return null;
				break;
		} 	}

	
	public function toArray($keyType = BasePeer::TYPE_PHPNAME)
	{
		$keys = ItemPeer::getFieldNames($keyType);
		$result = array(
			$keys[0] => $this->getId(),
			$keys[1] => $this->getName(),
			$keys[2] => $this->getPath(),
			$keys[3] => $this->getHaschildren(),
			$keys[4] => $this->getParentId(),
			$keys[5] => $this->getIsalbum(),
		);
		return $result;
	}

	
	public function setByName($name, $value, $type = BasePeer::TYPE_PHPNAME)
	{
		$pos = ItemPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
		return $this->setByPosition($pos, $value);
	}

	
	public function setByPosition($pos, $value)
	{
		switch($pos) {
			case 0:
				$this->setId($value);
				break;
			case 1:
				$this->setName($value);
				break;
			case 2:
				$this->setPath($value);
				break;
			case 3:
				$this->setHaschildren($value);
				break;
			case 4:
				$this->setParentId($value);
				break;
			case 5:
				$this->setIsalbum($value);
				break;
		} 	}

	
	public function fromArray($arr, $keyType = BasePeer::TYPE_PHPNAME)
	{
		$keys = ItemPeer::getFieldNames($keyType);

		if (array_key_exists($keys[0], $arr)) $this->setId($arr[$keys[0]]);
		if (array_key_exists($keys[1], $arr)) $this->setName($arr[$keys[1]]);
		if (array_key_exists($keys[2], $arr)) $this->setPath($arr[$keys[2]]);
		if (array_key_exists($keys[3], $arr)) $this->setHaschildren($arr[$keys[3]]);
		if (array_key_exists($keys[4], $arr)) $this->setParentId($arr[$keys[4]]);
		if (array_key_exists($keys[5], $arr)) $this->setIsalbum($arr[$keys[5]]);
	}

	
	public function buildCriteria()
	{
		$criteria = new Criteria(ItemPeer::DATABASE_NAME);

		if ($this->isColumnModified(ItemPeer::ID)) $criteria->add(ItemPeer::ID, $this->id);
		if ($this->isColumnModified(ItemPeer::NAME)) $criteria->add(ItemPeer::NAME, $this->name);
		if ($this->isColumnModified(ItemPeer::PATH)) $criteria->add(ItemPeer::PATH, $this->path);
		if ($this->isColumnModified(ItemPeer::HASCHILDREN)) $criteria->add(ItemPeer::HASCHILDREN, $this->haschildren);
		if ($this->isColumnModified(ItemPeer::PARENT_ID)) $criteria->add(ItemPeer::PARENT_ID, $this->parent_id);
		if ($this->isColumnModified(ItemPeer::ISALBUM)) $criteria->add(ItemPeer::ISALBUM, $this->isalbum);

		return $criteria;
	}

	
	public function buildPkeyCriteria()
	{
		$criteria = new Criteria(ItemPeer::DATABASE_NAME);

		$criteria->add(ItemPeer::ID, $this->id);

		return $criteria;
	}

	
	public function getPrimaryKey()
	{
		return $this->getId();
	}

	
	public function setPrimaryKey($key)
	{
		$this->setId($key);
	}

	
	public function copyInto($copyObj, $deepCopy = false)
	{

		$copyObj->setName($this->name);

		$copyObj->setPath($this->path);

		$copyObj->setHaschildren($this->haschildren);

		$copyObj->setParentId($this->parent_id);

		$copyObj->setIsalbum($this->isalbum);


		if ($deepCopy) {
									$copyObj->setNew(false);

			foreach($this->getItemsRelatedByParentId() as $relObj) {
				if($this->getPrimaryKey() === $relObj->getPrimaryKey()) {
						continue;
				}

				$copyObj->addItemRelatedByParentId($relObj->copy($deepCopy));
			}

		} 

		$copyObj->setNew(true);

		$copyObj->setId(NULL); 
	}

	
	public function copy($deepCopy = false)
	{
				$clazz = get_class($this);
		$copyObj = new $clazz();
		$this->copyInto($copyObj, $deepCopy);
		return $copyObj;
	}

	
	public function getPeer()
	{
		if (self::$peer === null) {
			self::$peer = new ItemPeer();
		}
		return self::$peer;
	}

	
	public function setItemRelatedByParentId($v)
	{


		if ($v === null) {
			$this->setParentId(NULL);
		} else {
			$this->setParentId($v->getId());
		}


		$this->aItemRelatedByParentId = $v;
	}


	
	public function getItemRelatedByParentId($con = null)
	{
		if ($this->aItemRelatedByParentId === null && ($this->parent_id !== null)) {
						include_once 'lib/model/om/BaseItemPeer.php';

			$this->aItemRelatedByParentId = ItemPeer::retrieveByPK($this->parent_id, $con);

			
		}
		return $this->aItemRelatedByParentId;
	}

	
	public function initItemsRelatedByParentId()
	{
		if ($this->collItemsRelatedByParentId === null) {
			$this->collItemsRelatedByParentId = array();
		}
	}

	
	public function getItemsRelatedByParentId($criteria = null, $con = null)
	{
				include_once 'lib/model/om/BaseItemPeer.php';
		if ($criteria === null) {
			$criteria = new Criteria();
		}
		elseif ($criteria instanceof Criteria)
		{
			$criteria = clone $criteria;
		}

		if ($this->collItemsRelatedByParentId === null) {
			if ($this->isNew()) {
			   $this->collItemsRelatedByParentId = array();
			} else {

				$criteria->add(ItemPeer::PARENT_ID, $this->getId());

				ItemPeer::addSelectColumns($criteria);
				$this->collItemsRelatedByParentId = ItemPeer::doSelect($criteria, $con);
			}
		} else {
						if (!$this->isNew()) {
												

				$criteria->add(ItemPeer::PARENT_ID, $this->getId());

				ItemPeer::addSelectColumns($criteria);
				if (!isset($this->lastItemRelatedByParentIdCriteria) || !$this->lastItemRelatedByParentIdCriteria->equals($criteria)) {
					$this->collItemsRelatedByParentId = ItemPeer::doSelect($criteria, $con);
				}
			}
		}
		$this->lastItemRelatedByParentIdCriteria = $criteria;
		return $this->collItemsRelatedByParentId;
	}

	
	public function countItemsRelatedByParentId($criteria = null, $distinct = false, $con = null)
	{
				include_once 'lib/model/om/BaseItemPeer.php';
		if ($criteria === null) {
			$criteria = new Criteria();
		}
		elseif ($criteria instanceof Criteria)
		{
			$criteria = clone $criteria;
		}

		$criteria->add(ItemPeer::PARENT_ID, $this->getId());

		return ItemPeer::doCount($criteria, $distinct, $con);
	}

	
	public function addItemRelatedByParentId(Item $l)
	{
		$this->collItemsRelatedByParentId[] = $l;
		$l->setItemRelatedByParentId($this);
	}

} 