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

defined('_JEXEC') or die('Restricted access'); ?>

<?php if (empty($templates->options)) { ?>
<!-- START - JoomlaGear Template Changer v1.2.0 for Joomla 1.5 -->
<!-- Copyright (c) 2008 - 2009 JoomlaGear.com All rights reserved -->
<!-- Website: http://www.joomlagear.com/ -->
<form style="border:none" action="#">
	<div style="margin:12px 0 6px 0;padding:0;border:none;background:none;overflow:hidden">
		<fieldset style="margin:0;padding:0;border:none;background:none">
			<div style="margin:0;padding:0;border:none;background:none;text-align:center">
				<?php echo JText::_('No templates available for selection'); ?>
			</div>
		</fieldset>
	</div>
</form>
<!-- END - JoomlaGear Template Changer v1.2.0 for Joomla 1.5 -->
<?php return; } ?>
<!-- START - JoomlaGear Template Changer v1.2.0 for Joomla 1.5 -->
<!-- Copyright (c) 2008 - 2009 JoomlaGear.com All rights reserved -->
<!-- Website: http://www.joomlagear.com/ -->
<script type="text/javascript">
<!--
var vModTemplateChangerReady;
if (window.addEvent) {
	window.addEvent("domready", function(){vModTemplateChangerReady = 1;});
} else {
	window.onload = function(){vModTemplateChangerReady = 1;};
}
<?php if ($params->get('enablecookie', 0) > 0) { ?>
	function fnModTemplateChangerCookie(b) {
		if (typeof vModTemplateChangerReady != "undefined") {
			var o = b.form.template.options[b.form.template.selectedIndex];
			<?php if ($params->get('enablecookie') == 2) { ?>
				document.cookie = "template="+encodeURIComponent(o.value)+"; expires="+(new Date(Date.parse(new Date())+(1000*60*60*24*365)).toGMTString())+"; path=/";
			<?php } else { ?>
				document.cookie = "template="+encodeURIComponent(o.value)+"; path=/";
			<?php } ?>
			b.form.submit();
		} else {
			alert("<?php echo JText::_('This will be available when the page has loaded'); ?>");
		}
	}
<?php } ?>
<?php if ($params->get('showpreview', 1)) { ?>
	var aModTemplateChangerImages = new Array();
	<?php foreach ($templates->images as $template => $image) { ?>
		aModTemplateChangerImages["<?php echo $template; ?>"] = new Image(<?php echo $image->width; ?>, <?php echo $image->height; ?>);
		aModTemplateChangerImages["<?php echo $template; ?>"].src = "<?php echo $image->src; ?>";
	<?php } ?>
	function fnModTemplateChangerShowImage(s) {
		if (typeof vModTemplateChangerReady != "undefined") {
			var o = s.options[s.selectedIndex];
			if (aModTemplateChangerImages[o.value]) {
				if (!document.images["modtemplatechanger"]) {
					document.getElementById("modtemplatechanger").innerHTML = decodeURIComponent("%3C")+'img name="modtemplatechanger" width="<?php echo $templates->imagewidth; ?>" style="margin:0;padding:0;border:none" /'+decodeURIComponent("%3E");
				}
				document.images["modtemplatechanger"].alt = o.text;
				document.images["modtemplatechanger"].src = aModTemplateChangerImages[o.value].src;
			} else {
				document.getElementById("modtemplatechanger").innerHTML = "<?php echo JText::_('No Image Available'); ?>";
			}
		} else {
			alert("<?php echo JText::_('This will be available when the page has loaded'); ?>");
		}
	}
<?php } ?>
<?php if ($templates->enableemail) { ?>
	function fnModTemplateChangerEmail(oInput) {
		if (typeof vModTemplateChangerReady != "undefined") {
			var aModTemplateChangerEmail = new Array();
			<?php foreach ($templates->email as $template_dir => $array) { ?>
			aModTemplateChangerEmail["<?php echo $template_dir; ?>"] = new Array("<?php echo $array[0]; ?>", "<?php echo $array[1]; ?>");
			<?php } ?>
			var oSelected = oInput.form.template.options[oInput.form.template.selectedIndex];
			if (aModTemplateChangerEmail[oSelected.value]) {
				if (aModTemplateChangerEmail[oSelected.value][0] == aModTemplateChangerEmail[oSelected.value][1]) {
					var sTemplateEmailName = aModTemplateChangerEmail[oSelected.value][1];
				} else {
					var sTemplateEmailName = aModTemplateChangerEmail[oSelected.value][1] + " (" + aModTemplateChangerEmail[oSelected.value][0] + ")";
				}
				location.href = "mailto:<?php echo $templates->emailaddress.$templates->emailsubject; ?>" + sTemplateEmailName;
			}
		} else {
			alert("<?php echo JText::_('This will be available when the page has loaded'); ?>");
		}
	}
<?php } ?>
//-->
</script>
<form method="get" style="border:none" action="<?php echo $uri->current(); ?>">
	<?php if ($params->get('showpreview', 1)) { ?>
	<div style="height:102px;margin:12px 0 0 0;padding:0;border:none;background:none;overflow:hidden">
		<fieldset style="margin:0;padding:0;border:none;background:none">
			<div style="margin:0;padding:0;border:none;background:none">
				<table border="0" cellpadding="0" cellspacing="0" style="width:100%;margin:0;padding:0;border:none;background:none">
					<tr>
						<td id="modtemplatechanger" style="height:102px;padding:0;border:none;background:none;text-align:center;vertical-align:middle">
							<?php
							if (array_key_exists(strtolower($mainframe->getTemplate()), $templates->options) && array_key_exists(strtolower($mainframe->getTemplate()), $templates->images)) {
								echo '<img name="modtemplatechanger" src="'.$templates->images[strtolower($mainframe->getTemplate())]->src.'" width="'.$templates->imagewidth.'" style="margin:0;padding:0;border:none" alt="'.$templates->images[strtolower($mainframe->getTemplate())]->name.'" />';
							} elseif (!array_key_exists(strtolower($mainframe->getTemplate()), $templates->options) && array_key_exists(key($templates->options), $templates->images)) {
								echo '<img name="modtemplatechanger" src="'.$templates->images[key($templates->options)]->src.'" width="'.$templates->imagewidth.'" style="margin:0;padding:0;border:none" alt="'.$templates->images[key($templates->options)]->name.'" />';
							} else {
								echo JText::_('No Image Available');
							}
							?></td>
					</tr>
				</table>
			</div>
		</fieldset>
	</div>
	<?php } ?>
	<div style="margin:6px 0;padding:0;border:none;background:none;overflow:hidden">
		<fieldset style="margin:0;padding:0;border:none;background:none">
			<div style="margin:0;padding:0;border:none;background:none">
				<table border="0" cellpadding="0" cellspacing="0" style="width:100%;margin:0;padding:0;border:none;background:none">
					<tr>
						<td style="height:24px;padding:0;border:none;background:none;text-align:center">
							<?php $onchange = ($params->get('showpreview', 1))? " onchange=\"fnModTemplateChangerShowImage(this)\"": null; ?>
							<?php $onclick  = " onclick=\"if(typeof vModTemplateChangerReady == 'undefined'){alert('".JText::_('This will be available when the page has loaded')."');return false;}\""; ?>
							<?php echo JHTML::_('select.genericlist', $templates->options, 'template', 'class="inputbox" style="margin:0"'.$onclick.$onchange, 'value', 'text', strtolower($mainframe->getTemplate()), 'modTemplateChangerSelect'); ?></td>
					</tr>
					<tr>
						<td style="padding:6px 0 0 0;border:none;background:none;text-align:center">
							<?php $onclick = ($params->get('enablecookie', 0) > 0)? "fnModTemplateChangerCookie(this)": "if(typeof vModTemplateChangerReady != 'undefined'){this.form.submit();}else{alert('".JText::_('This will be available when the page has loaded')."');}"; ?>
							<input class="button" type="button" style="margin:0" value="<?php echo JText::_('Select'); ?>" onclick="<?php echo $onclick; ?>" /></td>
					</tr>
					<?php if ($templates->enableemail) { ?>
						<?php if ($templates->emailbuttonpretext) { ?>
						<tr>
							<td style="padding:6px 0 0 0;border:none;background:none;text-align:center">
								<?php echo $templates->emailbuttonpretext; ?></td>
						</tr>
						<?php } ?>
					<tr>
						<td style="padding:6px 0 0 0;border:none;background:none;text-align:center">
							<input class="button" type="button" style="margin:0" value="<?php echo $templates->emailbuttontext; ?>" onclick="fnModTemplateChangerEmail(this)" /></td>
					</tr>
					<?php } ?>
				</table>
			</div>
		</fieldset>
	</div>
<?php
$query = $uri->getQuery(true);
foreach ($query as $k => $v) {
	if (strtolower($k) != 'template') {
		echo "\t<input type=\"hidden\" name=\"$k\" value=\"$v\" />\n";
	}
}
?>
</form>
<!-- END - JoomlaGear Template Changer v1.2.0 for Joomla 1.5 -->