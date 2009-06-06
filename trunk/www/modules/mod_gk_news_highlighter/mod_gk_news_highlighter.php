<?php

/**
* Gavick News Highlighter - main PHP file
* @package Joomla!
* @Copyright (C) 2008 Gavick.com
* @ All rights reserved
* @ Joomla! is Free Software
* @ Released under GNU/GPL License : http://www.gnu.org/copyleft/gpl.html
* @version $Revision: 2.0 $
**/

// no direct access
defined('_JEXEC') or die('Restricted access');

// helper loading
require_once (dirname(__FILE__).DS.'helper.php');

$helper = new NewsHighlighter(); 
// run variables validation
$helper->init($params);
// creating XHTML code	
$helper->render($params);

?>