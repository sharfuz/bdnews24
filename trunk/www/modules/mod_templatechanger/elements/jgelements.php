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

class JElementJGElements extends JElement
{
	function fetchElement($name, $value, &$node, $control_name)
	{
		switch ($name) {
			case 'showpreview':
				return JElementJGElements::_showpreview($name, $value, $node, $control_name);
			case 'imagewidth':
				return JElementJGElements::_imagewidth($name, $value, $node, $control_name);
			case 'enablecookie':
				return JElementJGElements::_enablecookie($name, $value, $node, $control_name);
			case 'enableemail':
				return JElementJGElements::_enableemail($name, $value, $node, $control_name);
			case 'emailbuttonpretext':
				return JElementJGElements::_emailbuttonpretext($name, $value, $node, $control_name);
			case 'emailbuttontext':
				return JElementJGElements::_emailbuttontext($name, $value, $node, $control_name);
			case 'emailaddress':
				return JElementJGElements::_emailaddress($name, $value, $node, $control_name);
			case 'emailsubjectpretext':
				return JElementJGElements::_emailsubjectpretext($name, $value, $node, $control_name);
			case 'maxnamelength':
				return JElementJGElements::_maxnamelength($name, $value, $node, $control_name);
			case 'templateselection':
				return JElementJGElements::_templateselection($name, $value, $node, $control_name);
			default:
				return JText::_('Element not found for name').' = '.$name;
		}
	}

	function _showpreview($name, $value, &$node, $control_name)
	{
		$value = (int)$value;

		if ($value != 1 && $value != 0) {
			$this->_parent->set($name, 1);
			$value = 1;
		}

		$html  = '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'1" value="1"'; if ($value == 1) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'1">'.JText::_('Yes').'</label>&nbsp;';
		$html .= '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'0" value="0"'; if ($value == 0) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'0">'.JText::_('No').'</label>';

		return $html;
	}

	function _imagewidth($name, $value, &$node, $control_name)
	{
		if (!is_numeric($value) || $value < 1 || $value > 300) {
			$this->_parent->set($name, 140);
			$value = 140;
		}

		$html  = '<input type="text" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'" value="'.(int)$value.'" size="5" maxlength="3" class="text_area" />';
		$html .= '&nbsp;<label for="'.$control_name.$name.'">'.JText::_('px').'</label>';

		return $html;
	}

	function _enablecookie($name, $value, &$node, $control_name)
	{
		$value = (int)$value;

		if ($value != 2 && $value != 1 && $value != 0) {
			$this->_parent->set($name, 0);
			$value = 0;
		}

		$html  = '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'2" value="2"'; if ($value == 2) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'2">'.JText::_('Yes').'</label>&nbsp;';
		$html .= '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'1" value="1"'; if ($value == 1) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'1">'.JText::_('Session Only').'</label>';
		$html .= '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'0" value="0"'; if ($value == 0) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'0">'.JText::_('No').'</label>';

		return $html;
	}

	function _enableemail($name, $value, &$node, $control_name)
	{
		$value = (int)$value;

		if ($value != 1 && $value != 0) {
			$this->_parent->set($name, 0);
			$value = 0;
		}

		$html  = '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'1" value="1"'; if ($value == 1) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'1">'.JText::_('Yes').'</label>&nbsp;';
		$html .= '<input type="radio" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'0" value="0"'; if ($value == 0) $html .= ' checked="checked"';  $html .= ' />&nbsp;';
		$html .= '<label for="'.$control_name.$name.'0">'.JText::_('No').'</label>';

		return $html;
	}

	function _emailbuttonpretext($name, $value, &$node, $control_name)
	{
		return '<textarea name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'" cols="24" rows="5" class="text_area">'.(string)$value.'</textarea>';
	}

	function _emailbuttontext($name, $value, &$node, $control_name)
	{
		$value = substr(preg_replace('/[^A-Z\s]/i', '', trim((string)$value)), 0, 15);

		if (trim((string)$value) == '') {
			$value = JText::_('Email Enquiry');
		}

		$value = substr(preg_replace('/[^A-Z\s]/i', '', trim((string)$value)), 0, 15);
		$this->_parent->set($name, $value);

		return '<input type="text" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'" value="'.$value.'" size="40" maxlength="100" class="text_area" />';
	}

	function _emailaddress($name, $value, &$node, $control_name)
	{
		global $mainframe;

		jimport('joomla.mail.helper');
		$value = (string)$value;

		if (!strlen(trim($value))) {
			$value = $mainframe->getCfg('mailfrom');

			if (!JMailHelper::isEmailAddress($value)) {
				$value = '';
			}

			$this->_parent->set($name, $value);
		} else {
			if (!JMailHelper::isEmailAddress($value)) {
				$value = $mainframe->getCfg('mailfrom');

				if (!JMailHelper::isEmailAddress($value)) {
					$value = '';
				}

				$this->_parent->set($name, $value);
			}
		}

		return '<input type="text" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'" value="'.(string)$value.'" size="40" maxlength="200" class="text_area" />';
	}

	function _emailsubjectpretext($name, $value, &$node, $control_name)
	{
		$value = substr(preg_replace('/[^A-Z0-9\s_\-\.,]/i', '', trim((string)$value)), 0, 100);

		if (trim($value) == '') {
			$value = JText::_('Template enquiry');
		}

		$value = substr(preg_replace('/[^A-Z0-9\s_\-\.,]/i', '', trim((string)$value)), 0, 100);
		$this->_parent->set($name, $value);

		return '<input type="text" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'" value="'.$value.'" size="40" maxlength="200" class="text_area" />';
	}

	function _maxnamelength($name, $value, &$node, $control_name)
	{
		if (!is_numeric($value) || $value < 1 || $value > 100) {
			$this->_parent->set($name, 20);
			$value = 20;
		}

		$html  = '<input type="text" name="'.$control_name.'['.$name.']" id="'.$control_name.$name.'" value="'.(int)$value.'" size="5" maxlength="3" class="text_area" />';
		$html .= '&nbsp;<label for="'.$control_name.$name.'">'.JText::_('characters').'</label>';

		return $html;
	}

	function _templateselection($name, $value, &$node, $control_name)
	{
		global $mainframe;

		JLoader::import('components.com_templates.helpers.template', JPATH_ADMINISTRATOR, null);
		jimport('joomla.filesystem.file');

		$client	    =& JApplicationHelper::getClientInfo(JRequest::getVar('client', '0', '', 'int'));
		$templates  =  TemplatesHelper::parseXMLTemplateFiles(JPATH_SITE.DS.'templates');
		$first_save =  ($this->_parent->get($name.'firstsave', 0))? true: false;

		$html  = '<table class="adminlist" cellspacing="1" style="background:#CCC">';
		$html .= '<thead>';
		$html .= '<tr>';
			$html .= '<th class="title" align="center" valign="middle">#</th>';
			$html .= '<th class="title" align="center" valign="middle"><input type="checkbox" id="modTemplateChangerCheckboxController" onclick="fnModTemplateChangerCheckboxes(this);" /></th>';
			$html .= '<th class="title" align="center" valign="middle">'.JText::_('Template Name').'</th>';
			$html .= '<th class="title" align="center" valign="middle">'.JText::_('Default').'</th>';
			$html .= '<th class="title" align="center" valign="middle">'.JText::_('Displayed Name').'</th>';
		$html .= '</tr>';
		$html .= '</thead>';
		$html .= '<tfoot>';
		$html .= '</tfoot>';
		$html .= '<tbody>';
		$count = 1;

		foreach ($templates as $template) {
			$template_dir = strtolower($template->directory);
			$html .= '<tr>';
				$html .= '<td align="center" valign="middle">'.$count.'</td>';

				if (!$first_save) {
					$checked = ' checked="checked"';
				} else {
					// Note: dirs containing a period (.) are not retrieved with $this->_parent->get($name.'cb'.$template_dir)
					$checked = (isset($this->_parent->_registry['_default']['data']->{$name.'cb'.$template_dir}))? ' checked="checked"': null;
				}

				$html .= '<td align="center" valign="middle"><input type="checkbox" name="'.$control_name.'['.$name.'cb'.$template_dir.']" id="'.$control_name.$name.'cb'.$template_dir.'"'.$checked.' onclick="fnModTemplateChangerCheckboxes(this);" /></td>';
				$html .= '<td align="left" valign="middle">'.$template->name.'</td>';

				if (TemplatesHelper::isTemplateDefault($template_dir, $client->id)) {
					if (JFile::exists(JPATH_THEMES.DS.$mainframe->getTemplate().'/images/menu/icon-16-default.png')) {
						$img = '<img src="templates/'.$mainframe->getTemplate().'/images/menu/icon-16-default.png" alt="Default" />';
					} else {
						if (JFile::exists(JPATH_THEMES.'/khepri/images/menu/icon-16-default.png')) {
							$img = '<img src="templates/khepri/images/menu/icon-16-default.png" alt="Default" />';
						} else {
							$img = '*';
						}
					}
					$html .= '<td align="center" valign="middle">'.$img.'</td>';
				} else {
					$html .= '<td>&nbsp;</td>';
				}

				// Note: dirs containing a period (.) are not retrieved with $this->_parent->get($name.'name'.$template_dir)
				$displayed_name = (isset($this->_parent->_registry['_default']['data']->{$name.'name'.$template_dir}))? $this->_parent->_registry['_default']['data']->{$name.'name'.$template_dir}: '';
				$displayed_name = (trim((string)$displayed_name) == '')? $template->name: $displayed_name;
				$html .= '<td align="left" valign="middle"><input type="text" name="'.$control_name.'['.$name.'name'.$template_dir.']" id="'.$control_name.$name.'name'.$template_dir.'" value="'.$displayed_name.'" size="15" maxlength="100" class="text_area" /></td>';
			$html .= '</tr>';
			$count++;
		}

		$html .= '</tbody>';
		$html .= '</table>';
		$html .= '<input type="hidden" name="'.$control_name.'['.$name.'firstsave]" id="'.$control_name.$name.'firstsave" value="1" />';

		$html .=
		"<script type=\"text/javascript\">
		<!--
		var vModTemplateChangerReady;
		if (window.addEvent) {
			window.addEvent(\"domready\", function(){vModTemplateChangerReady = 1;fnModTemplateChangerCheckboxes();});
		} else {
			window.onload = function(){vModTemplateChangerReady = 1;fnModTemplateChangerCheckboxes();};
		}
		function fnModTemplateChangerCheckboxes(oCheckbox) {
			if (typeof vModTemplateChangerReady != \"undefined\") {
				if (document.getElementsByTagName(\"INPUT\") && document.getElementById(\"modTemplateChangerCheckboxController\")) {
					var oController = document.getElementById(\"modTemplateChangerCheckboxController\");
					var aInputs     = document.getElementsByTagName(\"INPUT\");
					var iCheckboxes = 0;
					var iChecked    = 0;
					if (typeof oCheckbox != \"undefined\" && oCheckbox == oController) {
						for (var a = 0, b = aInputs.length; a < b; a++) {
							if (aInputs[a] && aInputs[a].id && aInputs[a].id.match(/^".$control_name.$name."cb.*?$/g)) {
								if (oController.checked) {
									aInputs[a].checked = true;
								} else {
									aInputs[a].checked = false;
								}
							}
						}
					} else {
						for (var c = 0, d = aInputs.length; c < d; c++) {
							if (aInputs[c] && aInputs[c].id && aInputs[c].id.match(/^".$control_name.$name."cb.*?$/g)) {
								if (aInputs[c].checked) {
									iChecked++;
								}
								iCheckboxes++;
							}
						}
						if (iCheckboxes == iChecked) {
							oController.checked = true;
						} else {
							oController.checked = false;
						}
					}
				}
			} else {
				alert('".JText::_('Full functionality will be available when the page has loaded')."');
			}
		}
		//-->
		</script>";

		return $html;
	}
}

?>