<?php

/**
 * @category  JoomlaGear
 * @package   Template Changer
 * @type      Module
 * @version   1.2.0
 * @copyright Copyright (c) 2008 - 2009 JoomlaGear. All rights reserved
 * @author    JoomlaGear.com
 * @website   http://www.joomlagear.com/
 * @email     enquiry@joomlagear.com
 *
 * LICENSE NOTICE
 *
 * This source file is subject to GNU/GPLv2 license, which is available
 * on the internet at the URL: http://www.gnu.org/licenses/gpl-2.0.html
 * If you are unable get license through the internet send a email note
 * to admin@joomlagear.com so we can email you a copy. Unless agreed to
 * in writing this source file is distributed AS IS, WITHOUT WARRANTIES
 * OR CONDITIONS OF ANY KIND, either express or implied
 */

defined('_JEXEC') or die('Restricted access');

require_once(dirname(__FILE__).DS.'helper.php');

$uri =& JURI::getInstance();
ModTemplateChangerHelper::checkParams($params, $uri);
$templates = ModTemplateChangerHelper::getTemplates($params, $uri);
ModTemplateChangerHelper::checkRequest($params, $uri, $templates);

require_once(JModuleHelper::getLayoutPath('mod_templatechanger'));

?>