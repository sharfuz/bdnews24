<?php

/**
* Gavick News Highlighter - helper class
* @package Joomla!
* @Copyright (C) 2008 Gavick.com
* @ All rights reserved
* @ Joomla! is Free Software
* @ Released under GNU/GPL License : http://www.gnu.org/copyleft/gpl.html
* @version $Revision: 2.0 $
**/

// no direct access
defined('_JEXEC') or die('Restricted access');

require_once (JPATH_SITE.DS.'components'.DS.'com_content'.DS.'helpers'.DS.'route.php');

class NewsHighlighter
{	
	var $module_id, 
	$moduleHeight,
	$moduleWidth,
	$interfaceWidth,
	$extra_divs,
	$arrows,
	$news_amount,
	$section,
	$category,
	$sections,
	$categories,
	$ids,
	$news_frontpage,
    $news_sort_value,
	$news_sort_order,
	$startposition,
	$timezone,
	$links,
	$show_title,
	$show_description,
	$title_length,
	$desc_length,
	$bgcolor,
	$bordercolor,
	$linkcolor,
	$hlinkcolor,
	$textleft_color,
	$textleft_style,	
	$animation_type,
	$animation_fun,
	$animation_speed,
	$animation_interval,
	$mouseover,
	$useMoo, 
	$useScript, 
	$clean_code,
	$compress_js,
	$categories_tab,
	$sections_tab,
	$ids_tab,
	$SIDTab, 
	$titleTab,
	$textTab, 
	$idTab,
	$cidTab,
	$introtext;
	
	function init(&$params)
	{
		global $mainframe;
		//
		$this->module_id = $params->get('module_id',"news-highlight-1"); 
		$this->moduleHeight = $params->get('moduleHeight', 24);
		$this->moduleWidth = $params->get('moduleWidth' ,780);
		$this->interfaceWidth = $params->get('interfaceWidth', 120);
		$this->extra_divs = $params->get('extra_divs', 1);
		$this->arrows = $params->get('arrows', 1);
		$this->introtext = $params->get('introtext', 'HOT NEWS');
		//
        $this->news_amount = $params->get('news_amount', 10);
        $this->section = $params->get('section', 0);
        $this->category = $params->get('category', 0);
        $this->sections = $params->get('sections', '');
        $this->category = $params->get('category', '');
        $this->ids = $params->get('ids', '');
        $this->news_frontpage = $params->get('news_frontpage', 1);
        $this->news_sort_value = $params->get('news_sort_value', 0);
		$this->news_sort_order = $params->get('news_sort_order', 0);
		$this->startposition = $params->get('startposition', 0);
        $this->timezone = $params->get('timezone', 0);
    	//
        $this->links = $params->get('links', 1);
        $this->show_title = $params->get('show_title', 1);
        $this->show_description = $params->get('show_description', 1);
    	$this->title_length = $params->get('title_length', 50);
        $this->desc_length = $params->get('desc_length', 50);
        //
        $this->bgcolor = $params->get('bgcolor', '#FFFFEE');
        $this->bordercolor = $params->get('bordercolor', '#E9E9A1');
        $this->linkcolor = $params->get('linkcolor', '');
		$this->hlinkcolor = $params->get('hlinkcolor', '');
		$this->textleft_color = $params->get('textleft_color', '');
		$this->textleft_style = $params->get('textleft_style', 'normal');
		//
        $this->animation_type = $params->get('animationType', 1);
        $this->animation_fun = $params->get('animationFun', 'Fx.Transitions.linear');
		$this->animation_interval = $params->get('animationInterval', 5000);
		$this->animation_speed = $params->get('animationSpeed', 250);
		$this->mouseover = $params->get('mouseover', 1);
		//
		$this->useMoo = $params->get('useMoo',1);
		$this->useScript = $params->get('useScript',1);
		$this->compress_js = $params->get('compress_js', 1);
		$this->clean_code = $params->get('cleanCode', 1);
		//
		$db	=& JFactory::getDBO();
		$user =& JFactory::getUser();
		$aid = $user->get('aid', 0);
		$contentConfig = &JComponentHelper::getParams('com_content');
		$noauth	= !$contentConfig->get('shownoauth');
		$now = date('Y-m-d H:i:s', time() + $mainframe->getCfg('offset') * 60 * 60);
		$nullDate = $db->getNullDate();
		// przygotowanie zapytania MySQL
		$source = false;
		$where1 = '';
		$where2 = '';
		//
		if($this->section != 0 
			&& $this->category == 0 
			&& $this->sections == '' 
			&& $this->categories == ''
			&& $this->ids == ''
			)
		{
			$source = $this->section;
			$where1 = ' c.section = ';
			$where2 = ' OR c.section = ';
		}
		elseif($this->category != 0
			&& $this->sections == '' 
			&& $this->categories == ''
			&& $this->ids == ''
			)
		{
			$source = $this->category;
			$where1 = ' c.id = ';
			$where2 = ' OR c.id = ';
		}
		elseif($this->sections != ''
			&& $this->categories == ''
			&& $this->ids == ''
			)
		{
			$source = $this->sections;
			$where1 = ' c.section = ';
			$where2 = ' OR c.section = ';
		}
		elseif($this->categories != ''
			&& $this->ids == ''
			)
		{
			$source = $this->categories;
			$where1 = ' c.id = ';
			$where2 = ' OR c.id = ';		
		}
		else
		{
			$source = $this->ids;
			$where1 = ' content.id = ';
			$where2 = ' OR content.id = ';		
		}
		//	
		$content_tab = explode(',', $source);
		$where = ''; // initialize WHERE condition
		// generating WHERE condition
		for($i = 0;$i < count($content_tab);$i++)
		{
			//
			if($i == 0)
			{
				$where .= $where1.$content_tab[$i];
			}
			else //
			{
				$where .= $where2.$content_tab[$i];
			}			
		}
		//
		$query_name = '
			SELECT DISTINCT 
				c.id AS ID, 
				c.section AS SID, 
				c.title AS name, 
				m.id AS MID 
			FROM 
				#__categories AS c
			LEFT JOIN 
				#__menu AS m 
				ON 
				c.id = m.componentid 
			LEFT JOIN 
				#__content AS content 
				ON 
				c.id = content.catid 	
			WHERE 
				( '.$where.' ) 
				AND 
				c.published = 1'.($noauth ? ' 
				AND 
				c.access <= ' .(int) $aid : '').';
		';	
		// Executing SQL Query
		$db->setQuery($query_name);
		//
		$sql_where = ''; // initialize sql condition
		// if in database exist some needs datas
		if($categories = $db->loadObjectList())
		{
			//
			$j = 0;
			// getting categories ItemIDs
			foreach ($categories as $item) 
			{
				//
				if($j != 0)
				{
					$sql_where .= ' OR content.catid = '.$item->ID;
				}
				else
				{
					$sql_where .= ' content.catid = '.$item->ID;
				}
				//
				$j++;
			}	
		}
		//
		if($this->ids != '')
		{
			$sql_where = '';
			$idss = explode(',',$this->ids);
			for($z = 0; $z < count($idss); $z++ )
			{	
				if($z != 0)
				{
					$sql_where .= ' OR content.id = '.$idss[$z];
				}
				else
				{
					$sql_where .= ' content.id = '.$idss[$z];
				}
			}
		}
		// setting time variable as now
		if($this->timezone == '0')
		{ 
			$now = date('Y-m-d H:i:s',time());
		}
		else
		{
			$time = time() + ((int) $this->timezone * 3600);
			$now = date('Y-m-d H:i:s', $time);
		}
		//
		$frontpage_con = ($this->news_frontpage == 0) ? ' AND frontpage.content_id IS NULL ' : '';
		//
		$order_options = '';
		//
		if($this->news_sort_value == 'random')
		{
			$order_options = ' RAND() '; 
		}
		else //
		{
			$order_options = ' content.'.$this->news_sort_value.' '.$this->news_sort_order.' ';
		}
		//
		$query = '
		SELECT DISTINCT
			cats.section AS SID, 
			content.title AS title, 
			content.introtext AS text, 
			content.id as IID,
			CASE WHEN CHAR_LENGTH(content.alias) 
				THEN CONCAT_WS(":", content.id, content.alias) 
					ELSE content.id END as ID, 
			CASE WHEN CHAR_LENGTH(cats.alias) 
				THEN CONCAT_WS(":", cats.id, cats.alias) 
					ELSE cats.id END as CID 			
		FROM 
			#__content AS content 
			LEFT JOIN 
				#__categories AS categories 
				ON categories.id = content.catid 
			LEFT JOIN 
				#__sections AS sections 
				ON sections.id = content.sectionid 
			LEFT JOIN 
				#__menu AS menu 
				ON menu.componentid = content.id 
			LEFT JOIN 
				#__users AS users 
				ON users.id = content.created_by 
			LEFT JOIN 
				#__categories AS cats 
				ON content.catid = cats.id 
			LEFT JOIN 
				#__content_frontpage AS frontpage 
				ON content.id = frontpage.content_id 
		WHERE 
			content.state = 1'.($noauth ? ' 
				AND categories.access <= ' .(int) $aid . ' 
				AND content.access <= '.(int) $aid : '').' 
			AND categories.published = 1  
			AND ( content.publish_up = '.$db->Quote($nullDate).' 
				OR content.publish_up <= '.$db->Quote($now).' ) 
				AND ( content.publish_down = '.$db->Quote($nullDate).' 
				OR content.publish_down >= '.$db->Quote($now).' ) 
			AND ( '.$sql_where.' ) '.$frontpage_con.' 
		ORDER BY 
			'.$order_options.'
		LIMIT
			'.$this->startposition.','.($this->news_amount+$this->startposition).';
		';	
		// wykonanie zapytania MySQL
		$db->setQuery($query);
		// przetworzenie wyników zapytania
		$rows = $db->loadObjectList();
		//
		$this->SIDTab = array();
		$this->titleTab = array(); 
		$this->textTab = array(); 
		$this->idTab = array();
		$this->cidTab = array();
		//
		foreach($rows as $row)
		{
			$this->SIDTab[] = $row->SID; 
			$this->titleTab[] = $row->title; 
			$this->textTab[] = strip_tags($row->text); 
			$this->idTab[] = $row->ID;
			$this->cidTab[] = $row->CID;
		}
	}
	
	function render(&$params)
	{
		$content = array();
		//
		for($i = 0; $i < count($this->idTab); $i++)
		{
			$content[$i] = '';
			//
			if($this->links == 1)
			{
				if($this->textTab[$i] != 'blank') {
					$content[$i] .= '<a href="'.JRoute::_(ContentHelperRoute::getArticleRoute($this->idTab[$i], $this->cidTab[$i], $this->SIDTab[$i])).'">';
				}
			}
			//
			if($this->show_title == 1)
			{
				$content[$i] .= '<span class="gk_news_highlighter_title">'.substr($this->titleTab[$i], 0, $this->title_length).((strlen($this->titleTab[$i]) > $this->title_length) ? '...' : '').'</span>';
			}
			//
			if($this->show_description == 1)
			{
				if($this->show_title == 1)$content[$i] .= ' &raquo; ';
				// 
				$content[$i] .= '<span class="gk_news_highlighter_desc">'.substr($this->textTab[$i], 0, $this->desc_length).((strlen($this->textTab[$i]) > $this->desc_length) ? '...' : '').'</span>';
			}
			//
			if($this->links == 1)
			{
				$content[$i] .= '</a>';
			}
		}
		
		// create instances of basic Joomla! classes
		$document =& JFactory::getDocument();
		$uri = JURI::getInstance();
		// add stylesheets to document header
		$document->addStyleSheet( $uri->root().'modules/mod_gk_news_highlighter/style/style.php?suffix='.$this->module_id.'&amp;moduleHeight='.$this->moduleHeight.'&amp;moduleWidth='.$this->moduleWidth.'&amp;interfaceWidth='.$this->interfaceWidth.'&amp;extra_divs='.$this->extra_divs.'&amp;bgcolor='.substr($this->bgcolor, 1).'&amp;bordercolor='.substr($this->bordercolor, 1).'&amp;set='.$this->arrows.'&amp;linkcolor='.substr($this->linkcolor, 1).'&amp;hlinkcolor='.substr($this->hlinkcolor, 1).'&amp;textleft_color='.substr($this->textleft_color, 1).'&amp;textleft_style='.$this->textleft_style, 'text/css' );	
		// init $headData variable
		$headData = false;
		// add scripts with automatic mode to document header
		if($this->useMoo == 2)
		{
			// getting module head section datas
			unset($headData);
			$headData = $document->getHeadData();
			// generate keys of script section
			$headData_keys = array_keys($headData["scripts"]);
			// set variable for false
			$mootools_founded = false;
			// searching phrase mootools in scripts paths
			for($i = 0;$i < count($headData_keys); $i++)
			{
				if(preg_match('/mootools/i', $headData_keys[$i]))
				{
					// if founded set variable to true and break loop
					$mootools_founded = true;
					break;
				}
			}
			// if mootools file doesn't exists in document head section
			if(!$mootools_founded)
			{
				// add new script tag connected with mootools from module
				$headData["scripts"][$uri->root().'modules/mod_gk_news_highlighter/js/mootools.js'] = "text/javascript";
				// if added mootools from module then this operation have sense
				$document->setHeadData($headData);
			}
		}
		
		if($this->useScript == 2)
		{
			// getting module head section datas
			unset($headData);
			$headData = $document->getHeadData();
			// generate keys of script section
			$headData_keys = array_keys($headData["scripts"]);
			// set variable for false
			$engine_founded = false;
			// searching phrase mootools in scripts paths
			if(array_search($uri->root().'modules/mod_gk_news_highlighter/scripts/engine'.(($this->compress_js == 1) ? '_compress' : '').'.js', $headData_keys) > 0)
			{
				// if founded set variable to true
				$engine_founded = true;
			}
			// if mootools file doesn't exists in document head section
			if(!$engine_founded)
			{
				// add new script tag connected with mootools from module
				$headData["scripts"][$uri->root().'modules/mod_gk_news_highlighter/scripts/engine'.(($this->compress_js == 1) ? '_compress' : '').'.js'] = "text/javascript";
				// if added mootools from module then this operation have sense
				$document->setHeadData($headData);
			}
		}
	
		// if clean code is enable use importer.php to include 
		// module settings in head section of document
		if($this->clean_code == 1)
		{
			/* 
				add script tag with module configuration to document head section
			*/	
			
			// get head document section data 
			unset($headData);
			$headData = $document->getHeadData();
			// add new script tag to head document section data array				
			$headData["scripts"][$uri->root().'modules/mod_gk_news_highlighter/scripts/importer.php?module_id='.$this->module_id.'&amp;animation_type='.$this->animation_type.'&amp;animation_speed='.$this->animation_speed.'&amp;animation_interval='.$this->animation_interval.'&amp;animation_fun='.$this->animation_fun.'&amp;mouseover='.$this->mouseover] = "text/javascript";
			// if added mootools from module then this operation have sense
			$document->setHeadData($headData);
		} 
						
		// add default.php template to parse if it's needed
		if($this->useMoo != 2 || $this->useScript != 2 || $this->clean_code == 0)
		{
			require(JModuleHelper::getLayoutPath('mod_gk_news_highlighter', 'default'));
		}
		
		require(JModuleHelper::getLayoutPath('mod_gk_news_highlighter', 'content'));
	}
}

?>