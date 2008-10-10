<?php
/* SVN FILE: $Id$ */
/**
 * Short description for file.
 *
 * Long description for file
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) Tests <https://trac.cakephp.org/wiki/Developement/TestSuite>
 * Copyright 2005-2008, Cake Software Foundation, Inc.
 *								1785 E. Sahara Avenue, Suite 490-204
 *								Las Vegas, Nevada 89104
 *
 *  Licensed under The Open Group Test Suite License
 *  Redistributions of files must retain the above copyright notice.
 *
 * @filesource
 * @copyright		Copyright 2005-2008, Cake Software Foundation, Inc.
 * @link				https://trac.cakephp.org/wiki/Developement/TestSuite CakePHP(tm) Tests
 * @package			cake.tests
 * @subpackage		cake.tests.cases.libs.view.helpers
 * @since			CakePHP(tm) v 1.2.0.4206
 * @version			$Revision$
 * @modifiedby		$LastChangedBy$
 * @lastmodified	$Date$
 * @license			http://www.opensource.org/licenses/opengroup.php The Open Group Test Suite License
 */
if (!defined('CAKEPHP_UNIT_TEST_EXECUTION')) {
	define('CAKEPHP_UNIT_TEST_EXECUTION', 1);
}
App::import('Core', array('Controller', 'Model', 'View'));
App::import('Helper', 'Cache');

/**
 * Test Cache Helper
 *
 * @package		cake.tests
 * @subpackage	cake.tests.cases.libs.view.helpers
 */
class TestCacheHelper extends CacheHelper {

}

/**
 * Test Cache Helper
 *
 * @package		cake.tests
 * @subpackage	cake.tests.cases.libs.view.helpers
 */
class CacheTestController extends Controller {
	var $helpers = array('Html', 'Cache');

	function cache_parsing() {
		$this->viewPath = 'posts';
		$this->layout = 'cache_layout';
		$this->set('variable', 'variableValue');
		$this->set('superman', 'clark kent');
	}
}

/**
 * Cache Helper Test Case
 *
 * @package		cake.tests
 * @subpackage	cake.tests.cases.libs.view.helpers
 */
class CacheHelperTest extends CakeTestCase {
/**
 * setUp method
 *
 * @access public
 * @return void
 */
	function setUp() {
		$this->Controller = new CacheTestController();
		$this->Cache = new TestCacheHelper();
		Configure::write('Cache.check', true);
		Configure::write('Cache.disable', false);
	}

/**
 * Start Case - switch view paths
 *
 * @access public
 * @return void
 */
	function startCase() {
		$this->_viewPaths = Configure::read('viewPaths');
		Configure::write('viewPaths', array(TEST_CAKE_CORE_INCLUDE_PATH . 'tests' . DS . 'test_app' . DS . 'views'. DS));
	}

/**
 * test cache parsing with no cake:nocache tags in view file.
 *
 */
	function testLayoutCacheParsingNoTagsInView() {
		$this->Controller->cache_parsing();
		$this->Controller->cacheAction = 21600;
		$this->Controller->here = '/cacheTest/cache_parsing';
		$this->Controller->action = 'cache_parsing';

		$View = new View($this->Controller);
		$result = $View->render('index');
		$this->assertNoPattern('/cake:nocache/', $result);
		$this->assertNoPattern('/php echo/', $result);

		$filename = CACHE . 'views' . DS . 'cacheTest_cache_parsing.php';
		$this->assertTrue(file_exists($filename));

		$contents = file_get_contents($filename);
		$this->assertPattern('/php echo \$variable/', $contents);
		$this->assertPattern('/php echo microtime()/', $contents);
		$this->assertPattern('/clark kent/', $result);

		@unlink($filename);
	}

/**
 * Test cache parsing with cake:nocache tags in view file.
 *
 */
	function testLayoutCacheParsingWithTagsInView() {
		$this->Controller->cache_parsing();
		$this->Controller->cacheAction = 21600;
		$this->Controller->here = '/cacheTest/cache_parsing';
		$this->Controller->action = 'cache_parsing';

		$View = new View($this->Controller);
		$result = $View->render('test_nocache_tags');
		$this->assertNoPattern('/cake:nocache/', $result);
		$this->assertNoPattern('/php echo/', $result);

		$filename = CACHE . 'views' . DS . 'cacheTest_cache_parsing.php';
		$this->assertTrue(file_exists($filename));

		$contents = file_get_contents($filename);
		$this->assertPattern('/if \(is_writable\(TMP\)\)\:/', $contents);
		$this->assertPattern('/php echo \$variable/', $contents);
		$this->assertPattern('/php echo microtime()/', $contents);

		@unlink($filename);
	}
/**
 * testComplexNoCache method
 *
 * @return void
 * @access public
 */
	function testComplexNoCache () {
		$this->Controller->cache_parsing();
		$this->Controller->cacheAction = array('cacheTest' => 21600);
		$this->Controller->here = '/cacheTest/cache_complex';
		$this->Controller->action = 'cache_complex';
		$this->Controller->layout = 'multi_cache';
		$this->Controller->viewPath = 'posts';

		$View = new View($this->Controller);
		$result = $View->render('sequencial_nocache');

		$this->assertNoPattern('/cake:nocache/', $result);
		$this->assertNoPattern('/php echo/', $result);
		$this->assertPattern('/A\. Layout Before Content/', $result);
		$this->assertPattern('/B\. In Plain Element/', $result);
		$this->assertPattern('/C\. Layout After Test Element/', $result);
		$this->assertPattern('/D\. In View File/', $result);
		$this->assertPattern('/E\. Layout After Content/', $result);
		//$this->assertPattern('/F\. In Element With No Cache Tags/', $result);
		$this->assertPattern('/G\. Layout After Content And After Element With No Cache Tags/', $result);
		$this->assertNoPattern('/1\. layout before content/', $result);
		$this->assertNoPattern('/2\. in plain element/', $result);
		$this->assertNoPattern('/3\. layout after test element/', $result);
		$this->assertNoPattern('/4\. in view file/', $result);
		$this->assertNoPattern('/5\. layout after content/', $result);
		//$this->assertNoPattern('/6\. in element with no cache tags/', $result);
		$this->assertNoPattern('/7\. layout after content and after element with no cache tags/', $result);

		$filename = CACHE . 'views' . DS . 'cacheTest_cache_complex.php';
		$this->assertTrue(file_exists($filename));
		$contents = file_get_contents($filename);
		@unlink($filename);

		$this->assertPattern('/A\. Layout Before Content/', $contents);
		$this->assertNoPattern('/B\. In Plain Element/', $contents);
		$this->assertPattern('/C\. Layout After Test Element/', $contents);
		$this->assertPattern('/D\. In View File/', $contents);
		$this->assertPattern('/E\. Layout After Content/', $contents);
		//$this->assertPattern('/F\. In Element With No Cache Tags/', $contents);
		$this->assertPattern('/G\. Layout After Content And After Element With No Cache Tags/', $contents);
		$this->assertPattern('/1\. layout before content/', $contents);
		$this->assertNoPattern('/2\. in plain element/', $contents);
		$this->assertPattern('/3\. layout after test element/', $contents);
		$this->assertPattern('/4\. in view file/', $contents);
		$this->assertPattern('/5\. layout after content/', $contents);
		//$this->assertPattern('/6\. in element with no cache tags/', $contents);
		$this->assertPattern('/7\. layout after content and after element with no cache tags/', $contents);
	}
/**
 * End Case - restore view Paths
 *
 * @access public
 * @return void
 */
	function endCase() {
		Configure::write('viewPaths', $this->_viewPaths);
	}
/**
 * tearDown method
 *
 * @access public
 * @return void
 */
	function tearDown() {
		unset($this->Cache);
	}
}

?>