<?php
class PhotoController extends Zend_Controller_Action {
    public function viewAction() {
	$this->_helper->layout->setLayout('base_layout');

	$photo = new Photo();
	$this->view->photo = $photo->find($this->_getParam('id'))->current()->toArray();

	$layout = Zend_Layout::getMvcInstance();
	$layout->title = $this->view->photo['title'];
    }

    public function deleteAction() {
	$this->_helper->layout->setLayout('base_layout');

	$photo = new Photo();
	$id = $this->_getParam('id');
	$p = $photo->find($id)->current()->toArray();
	unlink(DATA_DIR . "/{$p['path']}");

	$where = $photo->getAdapter()->quoteInto('id = ?', $id);
	$photo->delete($where);

	$this->_redirector = $this->_helper->getHelper('Redirector');
	$this->_redirector->gotoSimple('index', 'album');
    }
}