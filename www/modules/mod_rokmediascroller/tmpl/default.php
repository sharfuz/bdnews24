<?php // no direct access
/**
* @package RokLatestNews
* @copyright Copyright (C) 2007 RocketWerx. All rights reserved.
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
*/
defined('_JEXEC') or die('Restricted access'); 
$doc = &JFactory::getDocument();
if ($params->get('jslib')==1) {
    $doc->addScript(JURI::base(false) . 'modules/mod_rokmediascroller/rokmediascroller-packed.js');
}
JHTML::_('behavior.mootools');
if ($feed->error()) {
    echo "<p>ERROR: " . $feed->error() . "</p>";
} else {
?>


<script type="text/javascript">
	window.addEvent('domready', function() {
		var x = new RokMediaScroller('<?php echo $params->get('moduleid'); ?>',{
			'duration': <?php echo $params->get('duration'); ?>
		});
	});
</script>
<div id="<?php echo $params->get('moduleid'); ?>" class="media-list">
<?php
$counter= 1;

foreach ($feed->get_items() as $item)
{
    if ($counter++ > $params->get('maxcount')) break;
	// As long as an enclosure exists...
	if ($enclosure = $item->get_enclosure())
	{
	    echo "<div class=\"media\">\n";
	    echo "\t<div class=\"left\">\n";
	    echo "\t\t<a href=\"" . $item->get_permalink() . "\" title=\"" . $item->get_title() . "\">";
	    echo "<img src=\"" . $enclosure->get_thumbnail() . "\" />";
	    echo "</a>\n";
	    echo "\t</div>\n";
	    echo "\t<div class=\"desc\">\n";
	    echo "\t\t<p><a href=\"" . $item->get_permalink() . "\" title=\"" . $item->get_title() . "\">" . $item->get_title() . "</a></p>\n";
	    echo "\t</div>\n";
	    echo "</div>\n";
	}
}
?>
</div>
<?php
}
?>