<?php
class AlbumController extends Zend_Controller_Action {
    public function indexAction() {
	$this->_helper->layout->setLayout('base_layout');
	$layout = Zend_Layout::getMvcInstance();
	$layout->title = "John Doe's Gallery";
	$layout->active = 'index';

	$db = Zend_Db_Table_Abstract::getDefaultAdapter();
	$this->view->photos = $db->select()->from('Photo')->limit(9)->query()->fetchAll();
    }

    public function uploadAction() {
	$this->_helper->layout->setLayout('base_layout');
	$layout = Zend_Layout::getMvcInstance();
	$layout->title = "John Doe's Gallery";
	$layout->active = 'upload';

	$form = new Zend_Form();
	$form->setMethod('post')
	    ->setEncType(Zend_Form::ENCTYPE_MULTIPART);
	$image = new Zend_Form_Element_File('image');
	$form->addElement($image->setLabel('File to upload')
			  ->setRequired(true));

	$title = new Zend_Form_Element_Text('title');
	$form->addElement($title->setLabel('Image Name')
			  ->addValidator('NotEmpty'));

	$submit = new Zend_Form_Element_Submit('submit');
	$form->addElement($submit->setLabel('Upload'));

	if ($this->_request->isPost()) {
	    if (is_uploaded_file($_FILES['image']['tmp_name']) && $form->isValid($_POST)) {
		move_uploaded_file($_FILES['image']['tmp_name'], DATA_DIR . '/' . $_FILES['image']['name']);
		$photo = new Photo();
		$photo->insert(array('path' => $_FILES['image']['name'],
				     'title' => $form->getValue('title')));
		$this->_redirector = $this->_helper->getHelper('Redirector');
		$this->_redirector->gotoSimple('index');
	    } else {
		$form->populate($this->_request->getPost());
	    }
	}
	$this->view->form = $form;
    }
}