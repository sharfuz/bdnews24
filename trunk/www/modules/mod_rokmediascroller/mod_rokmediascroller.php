<?php
/**
* @package RokLatestNews
* @copyright Copyright (C) 2007 RocketWerx. All rights reserved.
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
*/


// no direct access
defined('_JEXEC') or die('Restricted access');

// Include the syndicate functions only once
require_once (dirname(__FILE__).DS.'helper.php');

$feed = modRokMediaScrollerHelper::getFeed($params);

require(JModuleHelper::getLayoutPath('mod_rokmediascroller'));