<?php defined('SYSPATH') or die('No direct script access.');
class ORM_MPTT extends ORM_MPTT_Core {
  public function add_child(ORM_MPTT $model) {
    $this->_lock();
    $result = parent::add_child($model);
    $this->_unlock();
    return $result;
  }

  public function delete($id = NULL) {
    $this->_lock();
    $result = parent::delete($id);
    $this->_unlock();
    return $result;
  }

  public function save() {
    if (is_null($this->parent_id)) {
      $this->_lock();
      $result = parent::save();
      $this->_unlock();
    } else {
      $result = parent::save();
    }
    return $result;
  }

  private function _lock() {
    $result = $this->db->query("SELECT GET_LOCK('{$this->table_name}', 1) AS L")->current();
    if (empty($result->L)) {
       throw new Exception("Couldn't get lock");
    }
  }

  private function _unlock() {
    $this->db->query("SELECT RELEASE_LOCK('{$this->table_name}')");
  }
}
