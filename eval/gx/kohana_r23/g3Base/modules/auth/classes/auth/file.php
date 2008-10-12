<?php
/**
 * File Auth driver.
 * Note: this Auth driver does not support roles nor auto-login.
 *
 * $Id: file.php 3503 2008-09-26 13:57:40Z Shadowhand $
 *
 * @package    Auth
 * @author     Kohana Team
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Auth_File_Core extends Auth_Driver {

	// User list
	protected $users;

	/**
	 * Constructor loads the user list into the class.
	 */
	public function __construct(array $config)
	{
		parent::__construct($config);

		// Load user list
		$this->users = empty($config['users']) ? array() : $config['users'];
	}

	/**
	 * Logs a user in.
	 *
	 * @param   string   username
	 * @param   string   password
	 * @param   boolean  enable auto-login (not supported)
	 * @return  boolean
	 */
	public function login($username, $password, $remember)
	{
		// Validate username/password combination
		if ($this->password($username) === $password)
		{
			// Complete the login
			return $this->complete_login($username);
		}

		// Login failed
		return FALSE;
	}

	/**
	 * Forces a user to be logged in, without specifying a password.
	 *
	 * @param   mixed    username
	 * @return  boolean
	 */
	public function force_login($username)
	{
		// Complete the login
		return $this->complete_login($username);
	}

	/**
	 * Get the stored password for a username.
	 *
	 * @param   mixed   username
	 * @return  string
	 */
	public function password($username)
	{
		return isset($this->users[$username]) ? $this->users[$username] : FALSE;
	}

} // End Auth_File