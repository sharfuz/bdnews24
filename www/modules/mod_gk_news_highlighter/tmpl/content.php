<?php

/**
* Gavick News Highlighter - content template
* @package Joomla!
* @Copyright (C) 2008 Gavick.com
* @ All rights reserved
* @ Joomla! is Free Software
* @ Released under GNU/GPL License : http://www.gnu.org/copyleft/gpl.html
* @version $Revision: 2.0 $
**/

// access restriction
defined('_JEXEC') or die('Restricted access');

?>

<div class="gk_news_highlighter" id="<?php echo $this->module_id; ?>">
        <?php if($this->extra_divs == 1) : ?>
        <div class="gk_news_highlighter_interface">
                <span class="text"><?php echo $this->introtext; ?></span>
                <div><a href="#" class="prev"></a>
				<a href="#" class="next"></a></div>
        </div>
        <?php endif; ?>
        <div class="gk_news_highlighter_wrapper">
                <?php if($this->animation_type == 0) : ?>
                <div class="nowrap">
                <?php endif; ?>
                    <?php for($i = 0;$i < count($content); $i++) : ?>
                        <?php if($this->animation_type != 0) : ?>
                        	<div class="gk_news_highlighter_item"><?php echo $content[$i]; ?></div>
                        <?php else : ?>
                        	<?php echo $content[$i]; ?>
                        <?php endif; ?>
                    <?php endfor; ?>
                <?php if($this->animation_type == 0) : ?>
                </div>
                <?php endif; ?>
        </div>
</div>
