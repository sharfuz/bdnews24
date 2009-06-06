<?php
/**
* @package RokMediaScroller
* @copyright Copyright (C) 2007 RocketWerx. All rights reserved.
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once (JPATH_SITE.DS.'modules'.DS.'mod_rokmediascroller'.DS.'simplepie.inc');
define('FEED_DEFAULT', 'http://youtube.com/rss/global/top_favorites.rss');
define('FEED_CACHE_LOCATION', JPATH_SITE.DS.'cache');

class modRokMediaScrollerHelper
{
	
	function getFeed(&$params)
	{

        $maxcount 	= intval( $params->get( 'count', 9 ) );
        $feedurl    = trim( $params->get('feedurl', FEED_DEFAULT));
        $moolib     = intval( $params->get( 'moolib', 0));
        $jslib      = intval( $params->get( 'jslib', 1));
        $duration   = trim( $params->get( 'duration', 1000));
        $feed_cache = intval( $params->get( 'feed_cache', 1));
        

        $feed = new SimplePie();
        $feed->set_feed_url($feedurl); 
        $feed->set_stupidly_fast();
        $feed->set_cache_location(FEED_CACHE_LOCATION);
        $feed->enable_cache($feed_cache==1?true:false);
        $feed->init();
        $feed->handle_content_type();
        
		return $feed;
	}



}
