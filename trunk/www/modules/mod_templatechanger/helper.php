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

class ModTemplateChangerHelper
{
	function checkParams($params, $uri)
	{
		global $mainframe;

		if (!$params->get('templateselectionfirstsave', 0)) {
			$db    =& JFactory::getDBO();
			$query = "SELECT id, ordering, position, params".
					" FROM #__modules".
					" WHERE module = 'mod_templatechanger'";
			$db->setQuery($query);
			$db->query();

			$modules1 = $db->loadObjectList();
			$redirect = false;

			if (is_array($modules1)) {
				foreach ($modules1 as $module1) {
					if (strpos($module1->params, 'moduleclass_sfx=') === false) {
						$query = "SELECT id, ordering, params".
								" FROM #__modules".
								" WHERE position = '".$module1->position."'";
						$db->setQuery($query);
						$db->query();

						$modules2 = $db->loadObjectList();
						$redirect = true;

						if (is_array($modules2)) {
							foreach ($modules2 as $module2) {
								if ($module2->id != $module1->id) {
									$query = "UPDATE #__modules".
											" SET ordering = ordering + 1".
											" WHERE id = ".$module2->id;
								} else {
									$query = "UPDATE #__modules".
											" SET params = '".$module2->params."moduleclass_sfx=_menu\n', ordering = 0".
											" WHERE id = ".$module2->id;
								}

								$db->setQuery($query);
								$db->query();
							}
						}
					}
				}
			}

			if ($redirect) {
				$query = $uri->getQuery();

				if (trim((string)$query) != '' && !is_null($query)) {
					$query = '?'.trim((string)$query);
				}

				$redirect_uri = $uri->current().$query;
				?>
				<script type="text/javascript">
				<!--
				location.href="<?php echo $redirect_uri; ?>";
				//-->
				</script>
				<?php
				$mainframe->redirect($redirect_uri);
			}
		}
	}

	function getTemplates($params, $uri)
	{
		global $mainframe;

		JLoader::import('components.com_templates.helpers.template', JPATH_ADMINISTRATOR, null);

		$templates            = TemplatesHelper::parseXMLTemplateFiles(JPATH_THEMES);
		$results              = new stdClass();
		$results->options     = array();
		$max_name_length      = (is_numeric($params->get('maxnamelength', 20)) && $params->get('maxnamelength', 20) >= 1 && $params->get('maxnamelength', 20) <= 100)? (int)$params->get('maxnamelength', 20): 20;
		$results->enableemail = 0;

		if ($params->get('enableemail', 0)) {
			jimport('joomla.mail.helper');

			$email = $params->get('emailaddress', $mainframe->getCfg('mailfrom'));

			if (JMailHelper::isEmailAddress($email)) {
				$results->enableemail        = 1;
				$results->emailbuttonpretext = ($params->get('emailbuttonpretext', 0) && trim($params->get('emailbuttonpretext', '')) != '')? trim($params->get('emailbuttonpretext')): 0;
				$results->emailaddress       = $email;
				$email_subject_pretext       = preg_replace('/[^A-Z0-9\s_\-\.,]/i', '', trim((string)($params->get('emailsubjectpretext', ''))));

				if ($email_subject_pretext == '') {
					$email_subject_pretext = JText::_('Template enquiry');
				}

				$results->emailsubject = '?subject='.substr(preg_replace('/[^A-Z0-9\s_\-\.,]/i', '', $email_subject_pretext), 0, 100).': ';
				$email_button_text     = preg_replace('/[^A-Z\s]/i', '', trim((string)($params->get('emailbuttontext', ''))));

				if ($email_button_text == '') {
					$email_button_text = JText::_('Email Enquiry');
				}

				$results->emailbuttontext = substr(preg_replace('/[^A-Z\s]/i', '', trim((string)($email_button_text))), 0, 15);
			}
		}

		if ($params->get('showpreview', 1)) {
			$results->images     = array();
			$results->imagewidth = (is_numeric($params->get('imagewidth', 140)) && $params->get('imagewidth', 140) >= 1 && $params->get('imagewidth', 140) <= 300)? (int)$params->get('imagewidth', 140): 140;
		}

		foreach ($templates as $template) {
			$template_dir = strtolower($template->directory);
			// Note: dirs containing a period (.) are not retrieved with $params->get('templateselectioncb'.$template_dir)
			if (!$params->get('templateselectionfirstsave', 0) || isset($params->_registry['_default']['data']->{'templateselectioncb'.$template_dir})) {
				$template_name = '';

				// Note: dirs containing a period (.) are not retrieved with $params->get('templateselectionname'.$template_dir)
				if (isset($params->_registry['_default']['data']->{'templateselectionname'.$template_dir})) {
					$template_name = trim((string)($params->_registry['_default']['data']->{'templateselectionname'.$template_dir}));
				}

				$template_name = ($template_name == '')? $template->name: $template_name;

				if (strlen($template_name) > $max_name_length) {
					$results->options[$template_dir] = JHTML::_('select.option', $template_dir, substr($template_name, 0, $max_name_length-3).'...');
				} else {
					$results->options[$template_dir] = JHTML::_('select.option', $template_dir, $template_name);
				}

				if ($results->enableemail) {
					$results->email[$template_dir] = array($template->name, $template_name);
				}

				if ($params->get('showpreview', 1) && false !== (list($width, $height) = @getimagesize(JPATH_THEMES.DS.$template->directory.DS.'template_thumbnail.png'))) {
					$results->images[$template_dir]         = new stdClass();
					$results->images[$template_dir]->name   = $template_name;
					$results->images[$template_dir]->src    = $uri->base().'templates/'.$template->directory.'/template_thumbnail.png';
					$results->images[$template_dir]->width  = $width;
					$results->images[$template_dir]->height = $height;
				}
			}
		}

		ksort($results->options);

		return $results;
	}

	function checkRequest($params, $uri, $templates)
	{
		global $mainframe;

		$redirect_uri = $uri->_uri;
		$cookie       = JRequest::getCmd('template', 0, 'cookie');
		$get          = JRequest::getCmd('template', 0, 'get');
		$redirect     = false;
		$enablecookie = ($params->get('enablecookie', 0) > 0)? true: false;

		if ($enablecookie && $cookie && !array_key_exists($cookie, $templates->options) || !$enablecookie && $cookie) {
			@setcookie('template', '', time()-86400, '/');
			$redirect = true;
		}

		if ($get && !array_key_exists($get, $templates->options)) {
			$query = $uri->getQuery(true);

			foreach ($query as $name => $value) {
				if ($name != 'template') {
					$new_query[$name] = $value;
				}
			}
			$new_query    = (isset($new_query))? '?'.$uri->buildQuery($new_query): null;
			$redirect_uri = $uri->current().$new_query;
			$redirect     = true;
		}

		if ($redirect) {
			?>
			<script type="text/javascript">
			<!--
			location.href="<?php echo $redirect_uri; ?>";
			//-->
			</script>
			<?php
			$mainframe->redirect($redirect_uri);
		}
	}
}

?>