<?php defined('SYSPATH') or die('No direct script access.');
Event::add('item.pre_save', array('Sizelimit', 'presave'));
