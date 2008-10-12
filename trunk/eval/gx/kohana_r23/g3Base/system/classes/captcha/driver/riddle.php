<?php
/**
 * Captcha driver for "riddle" style.
 *
 * $Id: riddle.php 3366 2008-08-27 22:15:39Z Shadowhand $
 *
 * @package    Captcha
 * @author     Kohana Team
 * @copyright  (c) 2007-2008 Kohana Team
 * @license    http://kohanaphp.com/license.html
 */
class Captcha_Driver_Riddle_Core extends Captcha_Driver {

	private $riddle;

	/**
	 * Generates a new Captcha challenge.
	 *
	 * @return  string  the challenge answer
	 */
	public function generate_challenge()
	{
		// Load riddles from the current language
		$riddles = Kohana::lang('captcha.riddles');

		// Pick a random riddle
		$riddle = $riddles[array_rand($riddles)];

		// Store the question for output
		$this->riddle = $riddle[0];

		// Return the answer
		return $riddle[1];
	}

	/**
	 * Outputs the Captcha riddle.
	 *
	 * @param   boolean  html output
	 * @return  mixed
	 */
	public function render($html)
	{
		return $this->riddle;
	}

} // End Captcha Riddle Driver Class