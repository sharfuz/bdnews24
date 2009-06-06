-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 24, 2008 at 02:53 AM
-- Server version: 5.0.45
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `bdnews24`
--

-- --------------------------------------------------------

--
-- Table structure for table `bak_banner`
--

CREATE TABLE IF NOT EXISTS `bak_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_banner`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_bannerclient`
--

CREATE TABLE IF NOT EXISTS `bak_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_bannerclient`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_bannertrack`
--

CREATE TABLE IF NOT EXISTS `bak_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_categories`
--

CREATE TABLE IF NOT EXISTS `bak_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_categories`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_components`
--

CREATE TABLE IF NOT EXISTS `bak_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `bak_components`
--

INSERT INTO `bak_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, 'administrator=en-GB\nsite=en-GB', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bak_contact_details`
--

CREATE TABLE IF NOT EXISTS `bak_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_contact_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_content`
--

CREATE TABLE IF NOT EXISTS `bak_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `bak_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_content_frontpage`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_content_rating`
--

CREATE TABLE IF NOT EXISTS `bak_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `bak_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_core_acl_aro`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `bak_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `bak_core_acl_aro_groups`
--

INSERT INTO `bak_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `bak_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `bak_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `bak_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `bak_core_acl_aro_sections`
--

INSERT INTO `bak_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bak_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `bak_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_core_acl_groups_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_core_log_items`
--

CREATE TABLE IF NOT EXISTS `bak_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `bak_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_groups`
--

CREATE TABLE IF NOT EXISTS `bak_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_groups`
--

INSERT INTO `bak_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `bak_menu`
--

CREATE TABLE IF NOT EXISTS `bak_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bak_menu`
--

INSERT INTO `bak_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=front\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bak_menu_types`
--

CREATE TABLE IF NOT EXISTS `bak_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bak_menu_types`
--

INSERT INTO `bak_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Table structure for table `bak_messages`
--

CREATE TABLE IF NOT EXISTS `bak_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `bak_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_messages_cfg`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `bak_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_modules`
--

CREATE TABLE IF NOT EXISTS `bak_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `bak_modules`
--

INSERT INTO `bak_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'left', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `bak_modules_menu`
--

CREATE TABLE IF NOT EXISTS `bak_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_modules_menu`
--

INSERT INTO `bak_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bak_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `bak_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_newsfeeds`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_plugins`
--

CREATE TABLE IF NOT EXISTS `bak_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `bak_plugins`
--

INSERT INTO `bak_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced\ncleanup=1\ncleanup_startup=0\nautosave=0\ncompressed=0\nrelative_urls=1\ntext_direction=ltr\nlang_mode=0\nlang_code=en\ninvalid_elements=applet\ncontent_css=1\ncontent_css_custom=\nnewlines=0\ntoolbar=top\nhr=1\nsmilies=1\ntable=1\nstyle=1\nlayer=1\nxhtmlxtras=0\ntemplate=0\ndirectionality=1\nfullscreen=1\nhtml_height=550\nhtml_width=750\npreview=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `bak_polls`
--

CREATE TABLE IF NOT EXISTS `bak_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_polls`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_poll_data`
--

CREATE TABLE IF NOT EXISTS `bak_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_poll_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_poll_date`
--

CREATE TABLE IF NOT EXISTS `bak_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_poll_date`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_poll_menu`
--

CREATE TABLE IF NOT EXISTS `bak_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_sections`
--

CREATE TABLE IF NOT EXISTS `bak_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_sections`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_session`
--

CREATE TABLE IF NOT EXISTS `bak_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_session`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_stats_agents`
--

CREATE TABLE IF NOT EXISTS `bak_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_templates_menu`
--

CREATE TABLE IF NOT EXISTS `bak_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bak_templates_menu`
--

INSERT INTO `bak_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('rhuk_milkyway', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bak_users`
--

CREATE TABLE IF NOT EXISTS `bak_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `bak_weblinks`
--

CREATE TABLE IF NOT EXISTS `bak_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bak_weblinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(30) NOT NULL default 'banner',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL default '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, '', 'Lowest call rate - 89 paisa per minute', 'lowest-call-rate-89-paisa-per-minute', 0, 135, 1, 'warid_ad_01.jpg', 'http://www.waridtel.com.bd/', '2008-04-24 12:22:21', 1, 0, '0000-00-00 00:00:00', '', '', 30, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 2, '', 'At Square, we care', 'at-square-we-care', 0, 118, 0, 'square_ad_01.jpg', 'http://www.squarehospital.com/', '2008-04-24 12:22:36', 1, 0, '0000-00-00 00:00:00', '', '', 30, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `contact` varchar(255) NOT NULL default '',
  `email` varchar(255) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Warid Telecom', 'Ad Manager', 'warid@kodiva.com', '', 0, '00:00:00', ''),
(2, 'Square Hospitals', 'Ad Manager', 'square@kodiva.com', '', 0, '00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_bannertrack`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` varchar(255) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(16, 0, 'South Asia', '', 'south-asia', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(15, 0, 'World', '', 'world', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(14, 0, 'Sports', '', 'sports', '', '6', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(13, 0, 'Business', '', 'business', '', '5', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(12, 0, 'Politics', '', 'politics', '', '4', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(11, 0, 'Bangladesh', '', 'bangladesh', '', '3', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(10, 0, 'Breaking News', '', 'breaking-news', '', '2', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(17, 0, 'South East Asia', '', 'south-east-asia', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(18, 0, 'Asia Pacific', '', 'asia-pacific', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(19, 0, 'Middle East', '', 'middle-east', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 5, 0, 0, ''),
(20, 0, 'Americas', '', 'americas', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 7, 0, 0, ''),
(21, 0, 'Africa', '', 'africa', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 8, 0, 0, ''),
(22, 0, 'Europe', '', 'europe', '', '7', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(23, 0, 'Lifestyle', '', 'lifestyle', '', '9', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(24, 0, 'Technology', '', 'technology', '', '10', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(25, 0, 'Science', '', 'science', '', '11', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(26, 0, 'Health', '', 'health', '', '12', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(27, 0, 'Arts', '', 'arts', '', '13', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(28, 0, 'Entertainment', '', 'entertainment', '', '14', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(29, 0, 'Frontpage', '', 'frontpage', '', '15', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(30, 0, 'Bottom Right', '', 'bottom-right', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=flv\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=1\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=1\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\nfilter_tags=\nfilter_attritbutes=\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, 'administrator=en-GB\nsite=en-GB', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=1\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(46, 'Joom!Fish', 'option=com_joomfish', 0, 0, 'option=com_joomfish', 'Joom!Fish', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-joomfish.png', 0, '', 1),
(47, 'Control Panel', '', 0, 46, 'option=com_joomfish', 'Control Panel', 'com_joomfish', 0, 'components/com_joomfish/assets/images/icon-16-cpanel.png', 0, '', 1),
(48, 'Translation', '', 0, 46, 'option=com_joomfish&task=translate.overview', 'Translation', 'com_joomfish', 1, 'components/com_joomfish/assets/images/icon-16-translation.png', 0, '', 1),
(49, 'Orphan Translations', '', 0, 46, 'option=com_joomfish&task=translate.orphans', 'Orphan Translations', 'com_joomfish', 2, 'components/com_joomfish/assets/images/icon-16-orphan.png', 0, '', 1),
(50, 'Manage Translations', '', 0, 46, 'option=com_joomfish&task=manage.overview', 'Manage Translations', 'com_joomfish', 3, 'components/com_joomfish/assets/images/icon-16-manage.png', 0, '', 1),
(51, '', '', 0, 46, 'option=com_joomfish', '', 'com_joomfish', 4, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(52, 'Languages', '', 0, 46, 'option=com_joomfish&task=languages.show', 'Languages', 'com_joomfish', 5, 'components/com_joomfish/assets/images/icon-16-language.png', 0, '', 1),
(53, 'Content elements', '', 0, 46, 'option=com_joomfish&task=elements.show', 'Content elements', 'com_joomfish', 6, 'components/com_joomfish/assets/images/icon-16-extension.png', 0, '', 1),
(54, 'Plugins', '', 0, 46, 'option=com_joomfish&task=plugin.show', 'Plugins', 'com_joomfish', 7, 'components/com_joomfish/assets/images/icon-16-plugin.png', 0, '', 1),
(56, 'Help', '', 0, 46, 'option=com_joomfish&task=help.show', 'Help', 'com_joomfish', 9, 'components/com_joomfish/assets/images/icon-16-help.png', 0, '', 1),
(55, '', '', 0, 46, 'option=com_joomfish', '', 'com_joomfish', 8, 'components/com_joomfish/assets/images/icon-10-blank.png', 0, '', 1),
(57, 'About', '', 0, 46, 'option=com_joomfish&help.credits', 'About', 'com_joomfish', 10, 'components/com_joomfish/assets/images/icon-16-info.png', 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `con_position` varchar(255) default NULL,
  `address` text,
  `suburb` varchar(100) default NULL,
  `state` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `postcode` varchar(100) default NULL,
  `telephone` varchar(255) default NULL,
  `fax` varchar(255) default NULL,
  `misc` mediumtext,
  `image` varchar(255) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(255) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `mobile` varchar(255) NOT NULL default '',
  `webpage` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_contact_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `title_alias` varchar(255) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(255) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  `metadata` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(1, 'Arsonists burn 132 houses in Rangamati', 'arsonists-burn-132-houses-in-rangamati', '', 'A group of unidentified arsonists set 132 houses on fire in seven villages in Baghaihat area of Rangamati district Sunday night. <br /><br />Of the burnt-out houses, 79 belonged to Bangalee settlers and 53 to the indigenous community, according to the district police control room. <br /><br />The affected people have taken shelter in different Buddhist temples and houses of their relatives. Many are living in the open, witnesses said. <br /><br />Two local reporters said that the "miscreants" had set the houses on fire in seven villages sprawling over about 3.5 kilometres, burning 132 of them in Baghaichhari upazila of the hill district. <br /><br />On information, army personnel based in Baghaichhari went to the spot and brought the situation under control. <br /><br />Police said Rangamati deputy commissioner Nurul Amin, superintendent of police Abdul Baten, Rangamati Hill Council member Bihari Ranjan Chakma and senior army officials visited the scene. <br /><br />Rangamati Zila Parishad has allocated Tk 1 lakh for the affected people. <br /><br />The Rangamati DC rushed to the scene, said Md Abdul Kasim, an official with the Deputy Commissioner''s Office.', '', 1, 3, 0, 11, '2008-04-21 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-21 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 16, '', '', 0, 0, 'robots=\nauthor='),
(2, 'Probe opens into ''assault'' on British lawyer', 'probe-opens-into-assault-on-british-lawyer', '', 'The Bangladesh Air Force has formed a three-member high-powered committee to probe into a London-based lawyer''s allegations of ''assault'' by members of the joint forces at Zia International Airport, the Inter-Service Public Relations Directorate said in a statement Monday. <br /><br />The High Court issued a notice Sunday on the home secretary, chairman of the Civil Aviation Authority of Bangladesh and director general of the Department of Immigration over the alleged assaults on barrister Rezwan Hossain. <br /><br />The court notice came after Supreme Court advocate Manzil Morshed presented a newspaper report on the assaults to the court, saying airport officials manhandled Rezwan, a British citizen of Bangladeshi origin, on April 14. <br /><br />The court asked the lawyer to present a list of the people involved with the incident to the court. <br /><br />Monday''s ISPR press release said Rezwan came to the airport to bid farewell to a relative on the day, entering the airport''s check-in area in violation of airport rules and loitering at the check-in counter of Emirates airlines. <br /><br />The barrister failed to produce valid papers or give any explanation for his presence in the area to the on-duty security officer of the civil aviation department, according to the statement. <br /><br />He was taken to the civil aviation authority''s office at the airport where his violation of the rule was explained. <br /><br />At that time the London lawyer became incensed and started using abusive words in English at the top of his voice, and even made threats, the ISPR statement said. <br /><br />Finding no alternative, the on-duty security officer handed Rezwan over to the joint forces, who interrogated him. <br /><br />The lawyer, however, continued to avoid the issue of violating airport rules, instead trying to extract privileged treatment by mentioning his foreign citizenship and the status of his profession, the press release said. <br /><br />It was at this point, the ISPR statement says, that the members of the joint forces "harassed" barrister Rezwan. <br /><br />The air force authorities immediately took the taskforce members into custody in accordance with military law, the ISPR directorate said. <br /><br />Following media reports of barrister Rezwan''s allegations of assault, BAF formed the committee to investigate.', '', 1, 3, 0, 11, '2008-04-21 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-21 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 15, '', '', 0, 0, 'robots=\nauthor='),
(3, 'Writer knifed to death in capital', 'writer-knifed-to-death-in-capital', '', '<img src="images/stories/bangladesh/200804/writer_knifed_to_death_in_capital.jpg" border="0" align="right" />Writer Momena Ahmed, the wife of the late chairman of Dhaka University''s Applied Physics Department Sultan Ahmed, was knifed to death at her Dhanmondi home Monday, police and witnesses said. <br /><br />The police arrested a youth, named Faruq, on charges of being involved in the killing, and retrieved a blood-stained knife from the elevator of the building. <br /><br />A housemaid claimed that Faruq was held when he was fleeing the scene after slaughtering Momena at her home at about 1.30pm. Security guards held and handed Faruq over to the police. <br /><br />Investigators are chasing the leads to the killing of the 65-year-old woman, who had also worked for Udayan School as a librarian. <br /><br />Quoting Momena''s relatives, the police said the killing might have stemmed from her row with a publishing house. <br /><br />Momena wrote a number of books including Hashi-Khushi, School Library Parjalochona: Prekkhit Bangladesh and Bhuture Gappo under the name of Momena Deyasini. <br /><br />Mamota, a seven-year-old domestic help, told reporters that Faruq, who had a good relationship with the family, came to the house at about 12.30pm and ate lunch. <br /><br />After lunch, Faruq was watching TV, and Momena was ready to go out, Mamota said. <br /><br />"Then I went to the kitchen and heard boroma crying for help. I rushed into her room and found Faruq holding her by the hair to kill her," Mamota alleged. <br /><br />"Faruq told me ''I''ll kill you too if you get near me''." <br /><br />Mamota then ran out of the apartment and broke the news to neighbours. <br /><br />Lift operator Abdul Alim told bdnews24.com that Mamota and another domestic help of a different flat went downstairs crying for help. <br /><br />Meantime, an unnamed person from a flat in the same building told Alim by intercom that a man had killed Momena and was trying to flee. <br /><br />Faruq used the elevator to the ground floor but Alim and other security guards stopped him at the gate. <br /><br />"I found him covered in blood," Alim said. <br /><br />Momena''s relatives said Faruq used to go to the apartment once in a while. Momena had helped him with money, they said. <br /><br />Dhanmondi police chief Monwar Hossain told bdnews24.com that the police would investigate the alleged links of the publisher in the killing. <br /><br />Major Ehsan Ahmed of RAB-2 who rushed to the scene told reporters that Momena had lived with her son Mainul Ahmed and Mamota in the apartment. <br /><br />Her other son Saiful Ahmed lives in Russia. <br /><br />Momen''s husband Prof Sultan Ahmed died in 1994.', '', 1, 3, 0, 11, '2008-04-21 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-21 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 14, '', '', 0, 0, 'robots=\nauthor='),
(4, 'Amini demands freedom for Hasina, Khaleda', 'amini-demands-freedom-for-hasina-khaleda', '', 'A faction of Islami Oikya Jote, led by Fazlul Haque Amini, demanded freedom for former prime ministers Sheikh Hasina and Khaleda Zia, in talks with caretaker government advisers Monday. <br /><br />Leaders of the Islamist party in pre-dialogue talks with four advisers also demanded immediate implementation of the recommendations by a committee formed to review the government''s women development policy. <br /><br />Law adviser AF Hassan Ariff, communications adviser Ghulam Quader, LGRD adviser Anwarul Iqbal and commerce adviser Hossain Zillur Rahman represented the government in the meeting at state guesthouse Meghna. <br /><br />Ten leaders of the outfit were present at the talks. <br /><br />Amini told reporters: "We want a free and peaceful election. An election date has to be announced soon. Sheikh Hasina and Khaleda Zia have to be released." <br /><br />During the talks, Amini said, his party demanded an end to the state of emergency and an immediate publication of the electoral roll. <br /><br />Adviser Hassan Ariff said: "Oikya Jote leaders have given their opinion on qualitative changes expected in politics and the polls." <br /><br />The Islamist outfit asked the government to put up billboards for a countdown to the election in an attempt to dispel people''s doubt about the polls promised by the year-end. <br /><br />Before the Oikya Jote meeting, a group of Islami Shashantantro Andolon met the advisers.', '', 1, 4, 0, 12, '2008-04-21 00:00:00', 62, '', '2008-04-23 18:39:29', 62, 0, '0000-00-00 00:00:00', '2008-04-21 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 12, '', '', 0, 1, 'robots=\nauthor='),
(5, 'Hafiz makes gesture of reconciliation with Delwar faction', 'hafiz-makes-gesture-of-reconciliation-with-delwar-faction', '', 'BNP acting secretary general Hafizuddin Ahmed said Monday that he was willing to attend electoral reform dialogue—united with the other faction. <br /><br />Asked whether he would sit with opposing faction leader Khandaker Delwar Hossain if invited to talks for reconciliation, Hafiz said: "Yes." <br /><br />The pro-reform leader made the gesture of reconciliation at a press briefing in his Banani home. <br /><br />Hafizuddin also told the press briefing that 54 former lawmakers had sent a letter to the chief election commissioner Monday requesting the CEC to uphold continuity of the original letter of invite to Hafiz for electoral reform dialogue. <br /><br />"We are waiting for the Election Commission''s letter. If we get it, we will go to the dialogue along with the other faction," he told reporters. <br /><br />He added: "The party''s acting chairperson Saifur Rahman has always been calling for party unity. The party will be united if we sit for talks across the table." <br /><br />Hafizuddin said that they would also sit united in dialogue with the government. <br /><br />On why party unity had not been realised thus far, the acting secretary general said: "It is not a problem regarding party posts." <br /><br />"What we want is an end to nomination-related trade and corruption, and to the influence of black money in elections. We want elected committees at the grassroots level." <br /><br />"Why should such demands be obstacles to unity?" Hafizuddin asked.', '', 1, 4, 0, 12, '2008-04-21 00:00:00', 62, '', '2008-04-23 18:42:54', 62, 0, '0000-00-00 00:00:00', '2008-04-21 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 14, '', '', 0, 0, 'robots=\nauthor='),
(6, 'Police find early lead to the killing of writer', 'police-find-early-lead-to-the-killing-of-writer', '', '<img src="images/stories/bangladesh/200804/police_find_early_lead_to_the_killing_of_writer.jpg" border="0" align="right" />The police Monday cited demand for money as an early lead to the killing of writer Momena Ahmed, the widow of a Dhaka University teacher. <br /><br />The 65-year-old writer, the wife of the late chairman of Dhaka University''s Applied Physics Department Sultan Ahmed, was knifed to death at her Dhanmondi home Monday. <br /><br />The police arrested a youth, named Faruq Hossain, on charges of being involved in the killing, and retrieved a blood-stained knife from the elevator of the building. <br /><br />Later in the day, Momena''s son Mainul Ahmed filed a murder case against Faruq, an English honours student of Dhaka College. <br /><br />According to the police, Faruq confessed that he had killed Momena, angered by her refusal to give him Tk 300 as demanded. <br /><br />Faruq threatened Momena with a kitchen knife for money, Dhanmondi police chief Monwar Hossain told bdnews24.com, referring to early confession from the detainee. <br /><br />In a bid to avoid a knife attack, Momena had allegedly shoved Faruq onto the floor, the OC said. Apparently incensed by physical hurts, Faruq attacked and killed Momena with the knife, the police inspector told bdnews24.com. <br /><br />A housemaid said Faruq was held when he was fleeing the scene after slaughtering Momena at her home at about 1.30pm. Security guards held and handed Faruq over to the police. <br /><br />Quoting Momena''s relatives in the initial development of the case, the police said the killing might have stemmed from her row with a publishing house. <br /><br />The Dhanmondi police chief had earlier told bdnews24.com that the police would investigate the alleged links of the publisher in the killing. <br /><br />Momena wrote a number of books including Hashi-Khushi, School Library Parjalochona: Prekkhit Bangladesh and Bhuture Gappo under the name of Momena Deyasini. <br /><br />Mamota, a seven-year-old domestic help, told reporters that Faruq, who had a good relationship with the family, came to the house at about 12.30pm and ate lunch. <br /><br />After lunch, Faruq was watching TV, and Momena was ready to go out, Mamota said. <br /><br />"Then I went to the kitchen and heard boroma crying for help. I rushed into her room and found Faruq holding her by the hair to kill her," Mamota alleged. <br /><br />"Faruq told me ''I''ll kill you too if you get near me''." <br /><br />Mamota then ran out of the apartment and broke the news to neighbours. <br /><br />Lift operator Abdul Alim told bdnews24.com that Mamota and another domestic help of a different flat went downstairs crying for help. <br /><br />Meantime, an unnamed person from a flat in the same building told Alim by intercom that a man had killed Momena and was trying to flee. <br /><br />Faruq hurried to the ground floor by elevator but Alim and other security guards stopped him as the gate opened. <br /><br />"I found him covered in blood," Alim said. <br /><br />Momena''s relatives said Faruq used to go to the apartment once in a while. Momena had helped him with money, they said. <br /><br />Major Ehsan Ahmed of RAB-2 who rushed to the scene told reporters that Momena had lived with her son Mainul Ahmed and Mamota in the apartment. <br /><br />Momena had also worked for Udyana School as a librarian. Her other son Saiful Ahmed lives in Russia. <br /><br />Momen''s husband Prof Sultan Ahmed died in 1994.', '', 1, 3, 0, 11, '2008-04-22 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 13, '', '', 0, 0, 'robots=\nauthor='),
(7, 'CHT Land Commission to be active before CG term ends: aide', 'cht-land-commission-to-be-active-before-cg-term-ends-aide', '', '<p>The caretaker government has taken it upon itself to reactivate the Chittagong Hill Tracts Land Commission, after a long seven-year lull, Raja Devasish Roy told bdnews24.com Monday. </p><p>Devasish, the chief adviser''s special assistant in charge of CHT affairs, said: "The caretaker government has decided to take urgent steps to render the commission effective and functional before it transfers power to an elected government." </p><p>The Land Commission headquartered at Khagrachhari—with two other district offices at Rangamati and Bandarban—will play a crucial role in resolving the land disputes in the hill tract region, the special aide said. </p><p>On activating the commission as early as possible, Devasish said the government will review the relevant legislation through consultations with the CHT Regional Council. </p><p>"It will make any required amendments to the legislation, appoint a commission chairman, and allocate manpower and funds, as necessary."</p>"The new commission will have a full-time chairman and two members. It will undertake trial of land dispute cases in the hills on a daily basis to dispense justice." <p>As per the CHT Peace Accord signed on Dec 2, 1997, the government subsequently constituted a CHT Land Commission in 2001, but it has remained dormant since its inception due to paucity of manpower, funds and infrastructure. </p><p>Devasish said detailed discussion will be held with the concerned ministry and division to resolve debates and disputes over such land-related issues as the leasing of hill lands and resettlement of Bengalis in case their land allotments are annulled. </p><p>No mouza based surveys will be required to resolve land disputes, the special aide said. "Fresh land surveys will be undertaken using modern techniques once the bulk of the disputes have been sorted out." </p><p>The government is contemplating headquartering the commission at Khagrachhari as land disputes have assumed an exacerbated dimension and volume in this area. "Because of the greater number of settlers, both local Bengalis and Indians from the north-east," Devasish pointed out. </p><p>"Rangamati and Bandarban, however, will have district offices of the commission, housing their own investigation officers to probe land disputes." </p><p>Stressing that the commission will ensure and establish the land rights of both Bengalis and the indigenous communities of the hills, Devasish said: "The commission will at long last uphold the hill people''s traditions, rites and heritage regarding the land."</p>', '', 1, 3, 0, 11, '2008-04-23 14:53:54', 63, '', '2008-04-23 15:32:23', 62, 0, '0000-00-00 00:00:00', '2008-04-22 20:53:31', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 12, '', '', 0, 5, 'robots=\nauthor='),
(8, 'Govt staff still wasteful of electricity in own offices', 'govt-staff-still-wasteful-of-electricity-in-own-offices', '', 'Government officials are not complying with a government order to conserve power, especially when they are not in their offices, an official vigilance team found. <br /><br />Cabinet secretary Ali Imam Majumder has asked senior government employees to stop wasteful practices in order to save electricity, as the country is grinding under power shortages amid the seasonal heat wave. <br /><br />The vigilance team, constituted on Mar 13 last year, on a recent visit to the Bangladesh Secretariat found that lights, fans and air conditioners were unnecessarily turned on in the rooms of many senior officials. <br /><br />The finding prompted the cabinet secretary to remind senior staffers of the previous order. <br /><br />In a letter to the officials of various ministries and divisions, the cabinet secretary said: "Recently a vigilance team found that lights, fans and air conditioners were on although the officials were not in the office at the Secretariat. This goes against the government order, and it''s not acceptable." <br /><br />"It clearly indicates that the order that has come from the highest authority to save electricity is not being followed." <br /><br />There country suffers a current daily shortfall of well over 1,000 megawatts. Nationwide production of electricity amounted to 3,500 megawatts Monday, against the demand for 4,600 megawatts. <br /><br />Commercial activities, public and private life are being hugely hampered because of on-and-off power supplies. <br /><br />After taking over in 2007, the interim administration has taken various measures to conserve power, ordering shopping mall owners to curtail their business hours at night and asking officials to cut unnecessary use of electricity in government offices across the country.', '', 1, 3, 0, 11, '2008-04-22 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 0, 'robots=\nauthor='),
(9, 'Ex-BNP minister Shajahan gets 13 yrs for graft', 'ex-bnp-minister-shajahan-gets-13-yrs-for-graft', '', 'A Dhaka court Tuesday sentenced former jute and textiles minister Shajahan Siraj to 13 years'' rigorous imprisonment for amassing illegal wealth and concealing wealth-related information from the Anticorruption Commission. <br /><br />Justice Khandaker Kamaluzzaman of Special Judge''s Court-9 handed down the verdict, including a Tk 10 lakh fine or another year in jail on failure to pay. <br /><br />The court also sentenced Shahjahan''s wife Rabeya Haider to three years in prison, a Tk 5 lakh fine or another six months'' imprisonment. <br /><br />The verdict details said the ex-minister was sentenced to three years for concealing wealth-related information and another 10 years for amassing wealth illegally. Shahjahan will have to serve the two terms consecutively for a total of 13 years in prison. <br /><br />The ACC filed the case against Shajahan Siraj and Rabeya Haider on Sept 24, 2007, with Ramna police station. <br /><br />The verdicts will be effective from the date of surrender or arrest of the two. <br /><br />The court in addition ordered confiscation of the couple''s illegally acquired assets worth Tk 3.76 crore, which include Rabeya Haider''s shares in ''Garden Fresh Preservation'', the country''s only fruit and vegetable cold store facility. <br /><br />The ACC found that the cold storage facility took Tk 4 crore to establish. <br /><br />Shahjahan was previously sentenced to eight years in jail in 2007 for tax evasion and concealment of tax related information. <br /><br />Rabeya Haider has now been sentenced a total of 40 years in jail in five separate tax dodge cases. <br /><br />Their son Rajiv Siraj was also sentenced to a total of 40 years for his involvement in another five separate cases.', '', 1, 4, 0, 12, '2008-04-22 00:00:00', 62, '', '2008-04-23 18:38:55', 62, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 10, '', '', 0, 0, 'robots=\nauthor='),
(10, 'Adviser offers no concrete comment on formal dialogue', 'adviser-offers-no-concrete-comment-on-formal-dialogue', '', 'Specifics on the ''forthcoming'' formal dialogue between the government and political parties have yet to be pinned down, as a government adviser Tuesday made no clear statement about its fate following a meeting with the chief adviser. <br /><br />"We are unable to say (on our part) when the main dialogue will take place," communications adviser Ghulam Quader told reporters at the Bangladesh Secretariat. <br /><br />The adviser and three other interim cabinet members, who have been assigned to sit with political parties to build momentum before the expected dialogue, had earlier sat in a meeting with chief adviser Fakhruddin Ahmed at his Tejgaon office. <br /><br />The other three advisers who sat with parties in recent days are foreign affairs adviser Iftekhar Ahmed Chowdhury, LGRD adviser Anwarul Iqbal and commerce adviser Hossain Zillur Rahman. <br /><br />Asked if the final dialogue would be held by the end of this month, Quader said: "There is nothing certain or uncertain – no apprehension that it will not happen. I don''t say that it will be held, but I am not saying it will not." <br /><br />"I am not saying anything---whether it''s coming soon, or will be pushed back; not yes, not no." <br /><br />On why the advisers met with the chief adviser Tuesday, Quader said: "We discussed routine issues." <br /><br />On whether the government is considering freedom for Sheikh Hasina and Khaleda Zia, he replied: "It can''t be said." <br /><br />When the reporters brought up growing doubts among the public over whether elections would really take place in line with the roadmap, he said: "What can we do if they do not believe it?" <br /><br />But, the communications adviser said: "The countdown is going on for polls. The election is approaching." <br /><br />Asked to comment on the statement by new US ambassador James F Moriarty that it would be "extremely difficult" to hold elections under the state of emergency, he said: "That is his view." <br /><br />On whether the state of emergency would be lifted, Quader said: "I can''t say anything now." But he replied that the government was considering the suggestions made by political parties for relaxing emergency rules. <br /><br />On the still pending meeting with one faction of the BNP, he said: "They will let us know when they want to come (for talks)." <br /><br />When asked again whether the chief adviser gave any directive on the forthcoming dialogue, he repeated: "We discussed no directives or suggestions."', '', 1, 3, 0, 11, '2008-04-22 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 0, 'robots=\nauthor='),
(11, 'CEC has no mandate to talk about BNP unity: Delwar', 'cec-has-no-mandate-to-talk-about-bnp-unity-delwar', '', 'BNP leader Khandaker Delwar Hossain said Tuesday the Chief Election Commissioner has no mandate to talk about unification of his party. <br /><br />In a news briefing at his NAM flat residence, Delwar said: "Who is he to talk about the unification? The party is run by its constitution. It will not see rules imposed from outside. The people will not accept that." <br /><br />He said he would accept an invitation from the Election Commission for electoral reform dialogue, if the commission made an independent decision. <br /><br />"If the commission can independently take the decision, I will accept the invitation as secretary general of the mainstream BNP," he said. <br /><br />Delwar, a former chief whip, criticised the government for its "failure to tackle the famine-like situation" in the country. <br /><br />He also asked the party to stand by the people who are struggling to make their three meals. <br /><br />He announced a three-day programme from Apr 28, asking party workers to give one day''s food to destitute people. <br /><br />Replying to a query, he said intelligence officials are mounting pressure on BNP leaders. <br /><br />"A certain quarter is threatening our party activists, it is completely unexpected. It''s not right to display illegal influence," he said. <br /><br />Delwar said the party would soon declare a protest plan to realise freedom for detained party chief Khaleda Zia.', '', 1, 4, 0, 12, '2008-04-22 00:00:00', 62, '', '2008-04-23 18:41:30', 62, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 13, '', '', 0, 0, 'robots=\nauthor='),
(12, 'EC to invite Hafizuddin Ahmed to dialogue', 'ec-to-invite-hafizuddin-ahmed-to-dialogue', '', 'The Election Commission is set to invite BNP leader Hafizuddin Ahmed to dialogue for April 27, the chief election commissioner said Tuesday. <br /><br />The dialogue has been scheduled for a 10am start. <br /><br />"The invitation letter will reach the address by tonight," CEC ATM Shamsul Huda told reporters, after a meeting with his colleagues at the EC.', '', 1, 4, 0, 12, '2008-04-22 00:00:00', 62, '', '2008-04-23 18:38:13', 62, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 9, '', '', 0, 0, 'robots=\nauthor='),
(13, 'Purchase committee suspends wheat imports', 'purchase-committee-suspends-wheat-imports', '', 'The government has decided against further wheat imports for the time being, finance adviser AB Mirza Azizul Islam said on Tuesday after a meeting of the cabinet committee on public purchase. <br /><br />The finance adviser told reporters that the decision was taken when the purchase committee rejected a proposal for import of 43,000 metric tonnes of wheat. <br /><br />The food directorate had proposed to import the amount through private dealers by tender. <br /><br />"The government has decided not to import wheat for now for two reasons," said Mirza Aziz, who heads the purchase committee. <br /><br />"The first is there is adequate wheat in the country at present. The country this time had a bumper crop of wheat." <br /><br />"The second reason is the price of wheat in the international market is now showing a downward trend. It has been forecast that the wheat price will fall further." <br /><br />Mirza Aziz said taking these points into consideration the decision for suspending wheat imports was taken. <br /><br />The purchase committee did approve a Tk 139.57 crore proposal from the Japanese Marubeni Corporation for repair of 2 units at Karnaphuli hydropower station, the adviser said. <br /><br />The Karnaphuli hydropower plant was established in 1988. Marubeni Corporation was involved in its set up. The units 4 and 5 of the plant, once repaired, will have a generating capacity of 50 and 100 megawatts respectively.', '', 1, 3, 0, 11, '2008-04-22 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 0, 'robots=\nauthor='),
(14, 'Dialogue invite is a conspiracy: Rizvi', 'dialogue-invite-is-a-conspiracy-rizvi', '', 'BNP''s acting office secretary Rizvi Ahmed said Tuesday that an invitation to the party''s reformist leaders to dialogue by the Election Commission was a conspiracy. <br /><br />"It''s part of a blueprint to isolate the BNP from elections," Rizvi, loyal to a faction led by Khandaker Delwar Hossain, told bdnews24.com in instant reaction to the EC''s invitation letter. <br /><br />The EC has sent out a letter inviting BNP leader Hafizuddin Ahmed to dialogue for April 27, the chief election commissioner said. <br /><br />The dialogue has been scheduled for a 10am start. <br /><br />"The invitation letter will reach the address by tonight," CEC ATM Shamsul Huda had earlier told reporters, after a meeting with his colleagues at the EC. <br /><br />Rizvi has claimed that Delwar is the legitimate secretary general of the BNP. "Without him, a different leadership doesn''t represent the party," he said.', '', 1, 3, 0, 11, '2008-04-22 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 0, 'robots=\nauthor='),
(15, 'DESA official arrested for bribery', 'desa-official-arrested-for-bribery', '', 'The Rapid Action Battalion Tuesday arrested DESA executive engineer Shamsul Alam Bhuiyan for taking bribe from a utility client. <br /><br />The RAB-10 control room duty officer, Corporal Anwar Hossain, told bdnews24.com that a RAB team had arrested Bhuiyan in a raid on the Kajla power distribution office in Demra. <br /><br />The RAB officer said Abida Sultana Mitu, a Demra resident, filed an application with the office on March 22 to take a power connection to her house. <br /><br />Mitu met the executive engineer after the power connection was not given as promised. <br /><br />Bhuiyan demanded Tk 22,000 from her in return for a quick connection, the RAB officer said. <br /><br />Mitu gave Bhuiyan Tk 10,000, but the connection was not given to her house. Mitu again met Bhuiyan and he demanded the remaining Tk 12,000, prompting her to inform the RAB about the matter, Hossain said. <br /><br />Mitu assured the engineer of giving the rest of the amount on Tuesday and tipped off RAB officials on her move. <br /><br />The RAB members raided the power distribution office when Mitu was giving the money to Bhuiyan.', '', 1, 3, 0, 11, '2008-04-22 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(16, 'Salahuddin, Chunnu, Helal candidature cancellation demanded', 'salahuddin-chunnu-helal-candidature-cancellation-demanded', '', 'A councilor lodged an appeal with the election commission demanding cancellation of the candidatures of Kazi Salahuddin, Ahsrafuddin Ahmed Chunnu and Golam Rabbani Helal for hiding relevant information on nominations for the upcoming Bangladesh Football Federation election. <br /><br />Councilor Shamsul Haq from the Chittagong Football Association Monday appealed in writing that the above trio had hidden relevant information in part of nine and 10 sections on the nomination papers. <br /><br />According to nine and 10 sections, it is asked whether the candidate was earlier found guilty of criminal offences, and whether candidates were earlier convicted under the criminal code. <br /><br />Salahuddin is a president candidate while Chunnu and Helal vice president and member candidates respectively in the upcoming BFF election scheduled for April 28. <br /><br />Though the trio filled up the sections that they had not been found guilty or convicted under the criminal code, the complainant Tuesday in support of his appeal submitted two news clippings published in the Daily Ittefaq and the Dainik Bangla on September 23, 1982. <br /><br />The stories read that a court had convicted Helal and Anwar Hossain for one month, and Salahuddin and Chunnu for six months, and fined them Tk 1000 each for beating an assistant referee during the match against Mohammedan SC on September 21, 1982, during military rule. <br /><br />Four Abahani players were arrested for the incident and found guilty in a one-day trial under martial law the next day. <br /><br />All four footballers, however, came out of prison after 17 days following Presidential clemency. <br /><br />"Whether punishment under military rule could be taken into cognizance as punishment under penal code, was the question Salauddin posed. He was surprised over the allegation as it came after 26 years. <br /><br />"I don''t believe any Bangali from Bangladesh can raise this matter after 26 years as the whole nation knows the fact behind that incident," said Salahuddin. <br /><br />Chunni and Helal, denying they were convicted of criminal offences, said that it was just ''dirty play'' ahead of the BFF election, and that no one should stoop so low in the interest of the election. <br /><br />The final list of candidates is scheduled to be announced Thursday. Withdrawal of candidature is Wednesday. <br /><br />Chief election commissioner Mesbah Uddin told bdnews24.com that the matter would be heard Wednesday in presence of both complainant and defendants.', '', 1, 4, 0, 12, '2008-04-22 00:00:00', 62, '', '2008-04-23 18:43:18', 62, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 15, '', '', 0, 0, 'robots=\nauthor='),
(17, 'EC invites BNP''s ''reformist'' faction to dialogue', 'ec-invites-bnps-reformist-faction-to-dialogue', '', 'The Election Commission Tuesday invited BNP factional leader Hafizuddin Ahmed to dialogue for April 27, in a move that the rival faction of the divided party said was a conspiracy. <br /><br />Following the receipt of a letter from the EC, Hafizuddin, BNP''s acting secretary general, expressed hope that he would go to the dialogue with a united BNP, including Khandaker Delwar Hossain. <br /><br />In his instant reaction to reporters at his Banani home, Hafizuddin said: "I have got the Election Commission''s letter. I will decide on the next strategy after meeting acting chairman M Saifur Rahman." <br /><br />"I will also speak to Khandaker Delwar Hossain as well. We hope to go to the dialogue together." <br /><br />A special messenger for the EC carried the letter to his Banani home at 7.30pm Tuesday. <br /><br />"Preparation for the dialogue will be taken after discussion with senior leaders," he said. <br /><br />On the other front, BNP''s acting office secretary Rizvi Ahmed said the EC''s invitation to the party''s reformist leaders to dialogue was a conspiracy. <br /><br />"It''s part of a blueprint to isolate the BNP from elections," Rizvi, loyal to a faction led by Delwar, told bdnews24.com in his instant reaction to the invitation. <br /><br />Rizvi has claimed that Delwar is the legitimate secretary general of the BNP. "Without him, a different leadership doesn''t represent the party," he said.', '', 1, 4, 0, 12, '2008-04-22 00:00:00', 62, '', '2008-04-23 18:37:41', 62, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(18, 'Adviser invites Delwar to informal talks for Wednesday', 'adviser-invites-delwar-to-informal-talks-for-wednesday', '', 'A caretaker government adviser has invited a BNP faction led by Khandaker Delwar Hossain to "informal" talks for Wednesday, a BNP leader said. <br /><br />The party''s acting office secretary Rizvi Ahmed told bdnews24.com: "One adviser has talked to Khandaker Delwar Hossain today." <br /><br />The talks have been set for a 5pm start at state guesthouse Meghna. <br /><br />BNP''s joint secretary general Nazrul Islam Khan said they would join the talks. <br /><br />"We may have a meeting among ourselves ahead of the talks with the advisers," Khan said. <br /><br />Commerce adviser Hossain Zillur Rahman had earlier invited Delwar to the talks by SMS, but the meeting stalled as the BNP leaders did not show up. <br /><br />The pre-dialogue talks, as they are called, are meant to find ways to narrow the ever-growing gap between the government and political parties.', '', 1, 4, 0, 12, '2008-04-22 00:00:00', 62, '', '2008-04-23 18:37:03', 62, 0, '0000-00-00 00:00:00', '2008-04-22 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(19, 'Cherie Blair sits in on Hasina case proceedings', 'cherie-blair-sits-in-on-hasina-case-proceedings', '', 'British barrister Cherie Blair QC was present at the Supreme Court Wednesday to observe appeal proceedings involving a graft case against former prime minister Sheikh Hasina. <br /><br />The wife of former British PM Tony Blair arrived in Bangladesh Tuesday on a three-day visit at the invitation of barrister Ajmalul Hossain QC. <br /><br />Barrister Ajmalul told bdnews24.com: "Cherie Blair was my colleague. She came to Bangladesh on a personal invitation. Her visit does not have any relation with the political case." <br /><br />Blair came to the Supreme Court around 9.15 am to witness a hearing on the government appeal against a High Court verdict that scrapped the case filed by businessman Azam J Chowdhury against Hasina. <br /><br />She is scheduled to meet with foreign adviser Iftekhar Ahmed Chowdhury later in the day. <br /><br />Barrister Ajmalul has arranged a dinner party at the Hotel Sheraton Wednesday night in honour of Cherie Blair''s visit. <br /><br />The wife of the former British premiere will visit a hospital and a Brac project during her tour.', '', 1, 3, 0, 11, '2008-04-23 16:19:24', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 16:19:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(20, 'SC rules no court can grant bail in EPR cases', 'sc-rules-no-court-can-grant-bail-in-epr-cases', '', 'The Supreme Court has ruled against granting bail to detainees held in EPR cases that are under investigation. <br /><br />An full Appellate Division bench, headed by chief justice Md Ruhul Amin, gave the ruling Wednesday in favour of the government appeal challenging a High Court verdict that had granted bail in a case file under emergency powers rules last year. <br /><br />On Mar 29 last year, Khulna oil trader Maijuddin Shikder made a bail plea to the High Court in a case filed under EPR that accused him of selling adulterated oil. <br /><br />The second amendment to the Emergency Powers Ordinance dated Mar 21, 2007, had imposed strict and stringent conditions regarding bail in such cases. <br /><br />In the bail hearing the state''s counsel argued that as per section 19 (Gha) of the amendment, no accused can appeal for bail in any court or tribunal, including the High Court, while investigation in a case filed under EPR is ongoing. <br /><br />Attorney general barrister Fida M Kamal told bdnews24.com after the ruling: "The Supreme Court has granted the appeal filed by the government challenging the High Court verdict." <br /><br />Maijuddin''s lawyer advocate Abdul Matin Khasru told bdnews24.com: "The Supreme Court has nullified the High Court verdict." <br /><br />"The High Court had said, ''court or tribunal doesn''t refer to the higher court in this case''. Therefore, the High Court is able to accept bail pleas in such cases." <br /><br />"But the Supreme Court has made it clear that the nomenclature ''court'' or ''tribunal'' will also apply to the higher court in this case," Khasru said. <br /><br />The High Court bench had appointed senior lawyers of the higher courts as amici curiae for guidance during the original bail hearing. <br /><br />According to the senior lawyers and the bail petitioner''s counsel, the executive authorities did not have jurisdiction for formulating any rule that says ''an accused cannot appeal for bail in court'', which opposes the constitution and fundamental human rights. <br /><br />The terms ''court'' or ''tribunal'' cited in the Emergency Powers Ordinance do not apply to the higher court, they added. <br /><br />The amici curiae also argued that the matter of bail is not mentioned in the main body of the Emergency Powers Ordinance, yet the amendment attaches a prohibition on bail. No amendment can be formulated in contradiction of the main law, they said. <br /><br />On these arguments, the High Court bench of justices Nazrul Islam Chowdhury and SM Emdadul Haque granted Maijuddin bail on Apr 22. <br /><br />The government sought permission to appeal against the HC verdict, which the Appellate Division gave on Sept 20. <br /><br />The Appellate Division concluded hearing on the appeal on Apr 15, with barrister Fida M Kamal as the state''s counsel presenting the same arguments as in the HC bail hearing, based on the amendment to the Emergency Powers Ordinance.', '', 1, 4, 0, 12, '2008-04-23 16:20:25', 62, '', '2008-04-23 18:42:35', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:20:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 11, '', '', 0, 0, 'robots=\nauthor='),
(21, 'Ershad says elections should be held under emergency', 'ershad-says-elections-should-be-held-under-emergency', '', 'Jatiya Party chairman Hussain Mohammad Ershad said Wednesday national elections should be held amid the state of emergency. <br /><br />"If the elections are not held amid the state of emergency, detained politicians will come out of jail and the polls will turn into a money game," ', 'Ershad told reporters ahead of a JP presidium meeting at the chairman''s Banani office. <br /><br />The former president said his party would take part in the elections even if the two major parties decided not to. <br /><br />"As we believe in democracy, we will participate in the polls even if Awami League and BNP do not." <br /><br />Replying to reporters'' questions he said they were discussing the matter of forming a new alliance for elections. <br /><br />Ershad said he hoped local government elections would be held this year after the completion of voter listing, and the national elections at the beginning of 2009. <br /><br />Wednesday''s meeting was set to discuss selection of JP candidates for upazila elections, the JP chairman said.', 1, 4, 0, 12, '2008-04-23 16:21:36', 62, '', '2008-04-24 23:24:14', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:21:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 4, 0, 4, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(22, 'Bangladeshis will decide their own fate: Cherie Blair', 'bangladeshis-will-decide-their-own-fate-cherie-blair', '', '<img src="images/stories/bangladesh/200804/cherie_blair_01.jpg" border="0" align="right" />Cherie Blair, wife of former British prime minister Tony Blair, said Wednesday that Bangladeshis will decide for themselves how to protect their human rights and re-establish democratic practices. <br /><br />Speaking at a press conference arranged at the Supreme Court Bar Association chamber of fellow barrister Ajmalul Hossain QC, Blair said the purpose of her visit was to observe judicial proceedings and the human rights situation in Bangladesh, which were her special areas of interest as a lawyer. <br /><br />"I would like to observe the human rights situation in Bangladesh, because I am working with human rights worldwide." <br /><br />On the status of human rights amid a state of emergency, she said: "It''s a political question." <br /><br />Human rights were in conflict wherever states of emergencies were imposed around the world, Blair acknowledged. <br /><br />"But Bangladesh and its people will decide how they tackle human rights, and come back to democracy. It''s not my job." <br /><br />Blair, who is a barrister and QC, said she was invited to Bangladesh by her friend and colleague Ajmalul Hossain and Bangladeshi barrister Rafiqul Haque. <br /><br />She said she was enjoying her visit Bangladesh. "I am acquainted with Bangladeshis in London. Many of them are my friends." <br /><br />But this is her first visit to the country, she added. <br /><br />Cherie Blair was present at the Supreme Court earlier in the day, to observe appeal proceedings involving a graft case against former prime minister Sheikh Hasina. <br /><br />She stayed in the courtroom throughout the morning to 1.00 pm to observe the proceedings in the government appeal against a High Court verdict that scrapped the case filed by businessman Azam J Chowdhury against Hasina. <br /><br />The wife of the former British premiere arrived in Bangladesh Tuesday on a three-day visit at the invitation of Ajmalul Hossain QC. <br /><br />Barrister Ajmalul told bdnews24.com: "Cherie Blair was my colleague. She came to Bangladesh on a personal invitation. Her visit does not have any relation with the political case." <br /><br />She is scheduled to meet with foreign adviser Iftekhar Ahmed Chowdhury later in the day. She will also visit a hospital and a Brac project during her stay. <br /><br />Barrister Ajmalul has arranged a dinner party at the Hotel Sheraton Wednesday night in honour of Cherie Blair''s visit.', '', 1, 3, 0, 11, '2008-04-23 16:22:25', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 16:22:25', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(23, 'Delwar demands exit of CEC', 'delwar-demands-exit-of-cec', '', 'BNP factional leader Khandaker Delwar Hossain, disgruntled by the Election Commission''s invitation to his rival faction, Wednesday demanded the resignation of the chief election commissioner. <br /><br />Delwar told reporters on his NAM flat in the Sangsad Bhaban area that his faction would not take part in elections unless former prime ministers Khaleda Zia and Sheikh Hasina were freed.<br /><br />', ' <br />After a morning meeting with senior and central leaders of BNP, Delwar demanded that CEC ATM Shamsul Huda and two other commissioners resign and the state of emergency be lifted too. <br /><br />The meeting discussed such issues as the Election Commission''s invitation to the reformist faction of BNP, pre-dialogue talks with advisers and the government''s policy in dealing with BNP leaders and former lawmakers. <br /><br />Demanding the release of Khaleda and Hasina, the BNP leader said: "BNP will not take part in any election based on conspiracies to yield predetermined results." <br /><br />"The caretaker government has made a blueprint for an election and is working toward achieving the goal of holding the election in line with the blueprint," he alleged. <br /><br />"The government wants to form a parliament with the people of its own choice, excluding the chiefs of the two major political parties," Delwar alleged. <br /><br />"A certain group is calling up local chairmen and other influential people and asking them to join a purposively formatted BNP to participate in the polls," he alleged. <br /><br />"People of this country will never accept it." <br /><br />Criticising the EC''s activities, he said, "No free or fair election will be possible under this Election Commission. It must go. Its officials must resign. The commission has created a lot of controversy." <br /><br />Delwar alleged that certain quarters are intimidating party leaders such as Chowdhury Tanveer Ahmed Siddiqui and M Shamsul Islam. <br /><br />Delwar accused the reformist faction''s acting secretary general Hafizuddin Ahmed of breaching party discipline and code of conduct. <br /><br />Trashing Hafiz''s statement that he would take Delwar to the EC dialogue along with him, Delwar said: "Who is Hafiz that I should be going along with him? I don''t recognise him as anyone who matters." <br /><br />Replying to a query, he said the issue of the EC not inviting him to dialogue would be sorted out in discussion with senior lawyers. <br /><br />Among others, BNP chairperson Khaleda Zia''s adviser ASM Hannan Shah, joint secretaries general Selima Rahman and Nazrul Islam Khan and acting office secretary Rizvi Ahmed were present at the briefing.<p>&nbsp;</p>', 1, 4, 0, 12, '2008-04-23 16:24:52', 62, '', '2008-04-24 23:53:52', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:24:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 8, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(24, 'Govt open to suggestions on diesel subsidy: CS Karim', 'govt-open-to-suggestions-on-diesel-subsidy-cs-karim', '', 'The government will consider valid suggestions from any quarter on the diesel subsidy programme for small farmers that began Apr 14, adviser CS Karim said Wednesday. <br /><br />The agriculture adviser, at a seminar on the effects of diesel subsidy, said that the government had asked the authorities concerned to make lists of farmers receiving subsidies to be affixed in front of Union Parishad offices. <br /><br />CS Karim said that the government directive was intended to bring transparency in the subsidy distribution process. <br /><br />He added that farmers using electricity for irrigation would get 20 percent rebate on their bills and that the government had given approximately Tk 4,000 crore in fertiliser subsidies this year. <br /><br />The government decided on direct subsidies to marginalised boro farmers to help them recover the cost of diesel used for irrigation. <br /><br />Farmers who have grown boro paddy on less than 2.5 acres of land are eligible to receive the subsidy, Tk 545 per acre of land cultivated. The government will pay out a total of Tk 250 crore to 67 lakh farmers under the programme. <br /><br />An official of the agriculture ministry said that names of farmers, measures of land and the amount of money they were receiving would be recorded on the lists. <br /><br />Finance adviser AB Mirza Azizul Islam inaugurated the diesel subsidy programme on April 14 at Dighi Union Parishad in Manikganj. <br /><br />He had asked local authorities to undertake measures to ensure that farmers got due prices for their agricultural output. <br /><br />The agriculture ministry estimated that boro paddy was being grown on 46 lakh hectares of land this year with the target to grow 1.69 crore metric tonnes of paddy.', '', 1, 4, 0, 12, '2008-04-23 16:27:08', 62, '', '2008-04-23 18:40:45', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:27:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 8, '', '', 0, 1, 'robots=\nauthor='),
(25, 'DIG warns against jail visitors airing political comments of detainees', 'dig-warns-against-jail-visitors-airing-political-comments-of-detainees', '', 'Prisons authorities will take action against visitors if they violate prison rules by airing politically-motivated comments of detainees, an official said Wednesday. <br /><br />"The situation has come to such a point that it compels prison authorities to take measures," deputy inspector general of prisons Shamsul Haider Siddiqui told reporters as he left Square Hospital after visiting detained former prime minister Sheikh Hasina. <br /><br />"As per the prison rules relatives and lawyers are allowed to meet with the detainees. But they do not have right to pass on any political statements," Siddiqui said. <br /><br />Asked about a public statement made Tuesday by a lawyer of detained former prime minister Khaleda Zia, he said: "Some action will come into effect from yesterday''s incident." <br /><br />"If any allegation against any visitor is proved he or she will not be allowed to meet the detainee for three months." <br /><br />After visiting detained BNP chairperson Khaleda Zia in special jail, her lawyer Masud Ahmed told reporters that Khaleda would fight a legal battle if the Election Commission sent an invitation for electoral reform dialogue to BNP''s reformist faction. <br /><br />Masud said Khaleda also requested the EC to send an invitation to the BNP secretary general nominated by her, Khandaker Delwar Hossain. <br /><br />The DIG prisons said: "Many visitors take permission from court. We will request the court to caution them to not pass on any political statements." <br /><br />On whether acting BNP secretary general Hafizuddin Ahmed, nominated by the party''s standing committee, would be allowed to meet the chairperson, Siddiqui said: "We have not received any letter yet. We will take a decision after getting the letter." <br /><br />Asked about Sheikh Hasina''s physical condition, the DIG prisons said: "Hasina''s pressure is under control and she is doing fine. She will be taken to the court tomorrow if remains well."', '', 1, 4, 0, 12, '2008-04-23 16:28:07', 62, '', '2008-04-23 18:44:08', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:28:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(26, 'Chinese FM arrives in Dhaka Thursday', 'chinese-fm-arrives-in-dhaka-thursday', '', 'Chinese foreign minister Yang Jiechi arrives in Dhaka Thursday on a two-day visit, a foreign ministry official said. <br /><br />The ministry confirmed that foreign affairs adviser Iftekhar Ahmed Chowdhury would receive his Chinese counterpart at Zia International Airport at 3.40pm. <br /><br />The adviser will hold bilateral talks with Jiechi at state guesthouse Padma Thursday, according to the foreign ministry. <br /><br />The Chinese foreign minister will leave for his next destination Pakistan on Friday. <br /><br />Analysts say the Chinese foreign minister''s visit to regional countries was aimed at mobilising support in its favour on the Tibet issue and uninterrupted holding of the Olympic Games in Beijing in August. <br /><br />The communist China is under pressure from the western countries since the "Free Tibet" uprising in March was controlled allegedly by force. <br /><br />Some countries have been threatening China of boycotting the inaugural function of the Beijing Olympic. <br /><br />Bangladesh in a statement termed the political unrest an "internal affairs" of China.', '', 1, 3, 0, 11, '2008-04-23 16:28:39', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 16:28:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(27, 'Election date will reassure people about polls: UK envoy', 'election-date-will-reassure-people-about-polls-uk-envoy', '', 'British High Commissioner Anwar Choudhury expressed the UK''s hope Wednesday that the Election Commission would announce an election date and that the emergency would be lifted before the election. <br />He told reporters after a meeting with adviser Hossain Zillur Rahman: "People will be secure in their minds about the election when the date is announced. They will be confident of it." ', '<br /><br />When asked about doubt in the minds of people on whether the election would be held according to the roadmap, Chowdhury said: "The government has pledged both nationally and internationally to hold the election in time. We are also hopeful". <br /><br />"In our opinion announcement of the election date will be helpful to remove all doubt." <br /><br />"But that is not our decision to make," the high commissioner said. <br /><br />Regarding polls amid a state of emergency Chowdhury stated: "Our stand is clear. We are optimistic that emergency will be lifted". <br /><br />People should have all freedom to prepare for the election so that they can enjoy it fully, he said, adding that in Bangladesh election is a joyous occasion for which people want freedom. "We hope such a climate will be created. We all want such a climate to prevail." <br /><br />"I feel it is possible to withdraw emergency before the election," said the British envoy. <br /><br />Replying to a question on what would happen if the emergency were not withdrawn, he said: "The emergency should at least be relaxed at all levels so that it is possible to hold free, fair and acceptable election. But, law and order also has to be maintained so that the people feel the electoral process is secure." <br /><br />"Sixty million voters have been enlisted by now. We hope this programme will be over by June, July. Institutional reform is going on. We also acknowledge the programme for political reforms". <br /><br />On pre-dialogue talks between the government and political parties, he said: "I am not the proper person to comment on it. But I want good to come out of it. Out of this, a commitment will come from the political parties". <br /><br />When Anwar Choudhury took up his post as British High Commissioner in Dhaka, Khaleda Zia was prime minister and Sheikh Hasina was opposition leader. As his tenure comes to en end, both leaders are now in jail. When reporters asked him to comment in this regard, Anwar said: "It is sorrowful. But I have hope the matter will be resolved in the right way ."', 1, 4, 0, 12, '2008-04-23 16:29:26', 62, '', '2008-04-24 23:21:38', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:29:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 5, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(28, 'Chaos-ridden Abahani-Mohammedan hockey semifinal', 'chaos-ridden-abahani-mohammedan-hockey-semifinal', '', 'The chaos-filled first semifinal of the Club Cup Hockey between archrivals Abahani Limited and Mohammedan SC ended in an incomplete 1-1 result following a demand of goal cancellation in the eleventh hour of the game Wednesday. <br /><br />Masum restored the margin for holders Mohammedan three minutes from time after Rocky put Abahani ahead in the 34th minute at Moulana Bhasani National Hockey Stadium. <br /><br />"The remainder of the game will be held later as umpire Golam Kibria has declined to conduct the match citing insecurity," said umpire Latifur Rahman after the final whistle. <br /><br />"We will decide the matter in an emergency meeting after getting report from umpires," said tournament committee general secretary Iftesham Sultan, who failed to let reporters know whether the second semifinal between Usha KC and Sonali Bank would take place Thursday. <br /><br />The play remained stopped for nearly 30 minutes after Mohammedan''s equaliser as Abahani players demanded its cancellation. <br /><br />According to Abahani players, Mohammedan''s Masum did not score as the ball found the back of the Abahani net kissing their fellow defender Khokon''s stick, which is not treated as a goal in hockey. <br /><br />In the match, it seemed that the players from both sides were more interested in disputing the umpires'' decisions whenever against them rather than concentrating on a planned and fair game. <br /><br />However, many blamed the umpires for poor refereeing. The game remained stop for five minutes in the first half when Abahani players demanded a penalty corner from umpire Golam Kibria, who however, was later able to resume the game. <br /><br />Afterwards, Kibria took no action despite being kicked by Mohammedan''s skipper Prince and other players, who protested his decision on a penalty corner in favour of Abahani. <br /><br />Mohammedan players once again surrounded umpire Kibria following a decision against them, and some players pushed him before police intervened to stop them. <br /><br />Kibria warned Prince with a green card though the former national striker deserved a yellow card, and he ultimately lost control over the players. <br /><br />"We have no good umpires except these two," said Iftesham Sultan when his attention was drawn to poor refereeing.', '', 1, 3, 0, 11, '2008-04-23 16:30:13', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 16:30:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(29, 'ACC sues Coco, Sheikh Selim', 'acc-sues-coco-sheikh-selim', '', 'The Anticorruption Commission Wednesday filed a case against former prime minister Khaleda Zia''s son Arafat Rahman Coco on charges of amassing illegal wealth. <br /><br />The ACC filed another case against Awami League leader Sheikh Fazlul Karim Selim for submitting a skewed wealth statement to the corruption watchdog.', ' <br /><br />ACC deputy director Md Abu Sayeed filed the case against Coco with Ramna Police Station, the police said. The case against Sheikh Selim was filed by another ACC deputy director, Abdul Karim, with the same police station. <br /><br />According to case details, Coco made property worth Tk 2.23 crore by illegal means and concealed information about Tk 11.20 lakh in the statement submitted to corruption watchdog. <br /><br />Arafat owns a string of businesses, including river transport company Rahman Navigations and advertising firm Advance Ad. <br /><br />Joint forces arrested Coco at their cantonment home on Sept 3, along with his mother. <br /><br />Businessman Abu Ahmed Zaidan Rabbi, managing director of advertising firm AD MEDIA, sued Coco and his two brothers-in-law for extorting over Tk 1 crore from him on May 16. <br /><br />The case was brought under emergency powers rules. <br /><br />In the details of the case against Sheikh Selim, the ACC alleged that the former minister had concealed information about Tk 22.29 lakh worth of wealth and earned Tk 3.38 crore in illegal assets.', 1, 4, 0, 12, '2008-04-23 16:30:51', 62, '', '2008-04-24 23:19:13', 62, 0, '0000-00-00 00:00:00', '2008-04-23 16:30:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 1, '', '', 0, 7, 'robots=\nauthor='),
(30, 'Indian classical singer Shanti Sharma ''jumps to death''', 'indian-classical-singer-shanti-sharma-jumps-to-death', '', '<!--IMAGE images/stories/breaking_news/200804/shanti_sharma_01.jpg IMAGE--> <img class="content-left" src="images/stories/breaking_news/200804/shanti_sharma_01.jpg" border="0" align="left" />Indian classical singer Shanti Sharma died in mysterious circumstances after she fell from the second storey of her south Delhi home, the family said Wednesday. <br /><br />Sharma was 52. <br /><br />News agency IANS quoted her husband Dinesh Sharma as saying: "Shanti jumped to death from our Malviya Nagar home Tuesday morning." <br /><br />"I am not in a position to say whether she was depressed. I rated her very highly among the singers of her age group. My teenaged son is taking it very badly," he said. <br /><br />One of Sharma''s students in Bangladesh, Dithi Hasnat, also confirmed the news of her death to bdnews24.com. <br /><br />Contrary to the reports that she was disturbed after her daughter''s death in an accident a few years ago, Shobha Deepak Singh, a close friend and director of the Bharatiya Kala Kendra, said: "Shanti was in a fine frame of mind." <br /><br />"Shanti spoke to her house-helps on Tuesday morning shortly before she died. She was supposed to go for a song recording. She seemed perfectly all right a day before her death when she performed at the India Habitat Centre," Singh said. <br /><br />Senior police officials, when contacted by IANS, said they have not received any report about the death. <br /><br />"Nobody has approached us about any such incident," said a senior police officer.', '', 1, 7, 0, 16, '2008-04-23 17:03:20', 62, '', '2008-04-24 01:22:04', 62, 0, '0000-00-00 00:00:00', '2008-04-23 17:03:20', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 1, '', '', 0, 8, 'robots=\nauthor='),
(31, 'Gem Diamonds core earnings $74 mln, outlook upbeat', 'gem-diamonds-core-earnings-74-mln-outlook-upbeat', '', 'Gem Diamonds posted full-year core earnings just ahead of forecasts on Wednesday, as prices for top-end diamonds rose and it expanded production, and gave an upbeat outlook. <br /><br />Gem, which floated on the London Stock Exchange in February 2007, operates mines in southern and central Africa, Indonesia and Australia. <br /><br />The company said it was expanding three producing mines and its outlook was extremely positive. <br /><br />Shares in Gem Diamonds, which have fallen around 9 percent in the past year, jumped 8 percent in early trade but gave back gains to trade flat at 957.5 pence at 0929 GMT. <br /><br />"Material developments across a wide range of assets are happening fast not only adding to near term earnings and cashflow but increasing option value aggressively," analysts at Cazenove said in a note. <br /><br />"Yet this has not filtered through in any way to the share price ... (leaving) the stock trading on amongst the cheapest multiples of any of the diamond juniors," they added. <br /><br />Gem Diamonds posted earnings before interest, tax, depreciation and amortisation (EBITDA) of $74 million compared with an average forecast from analysts of $70 million provided by the company. Full-year revenue was $153 million. The firm also posted first-quarter revenue of $56.1 million. <br /><br />Development projects throughout Africa provided an opportunity to more than double the current production levels, the company said. <br /><br />"These strong financial results demonstrate the merit of the company''s strategy to focus on the top end of the diamond market -- a sector that continues to show remarkable price increases," Chief Executive Clifford Elphick said in a statement. <br /><br />The firm, which last year sold one of the largest rough diamonds ever found for $10.4 million, has a specific focus on higher-value diamonds, which it says will deliver superior long-term returns. <br /><br />Elphick said the market for large, high-quality diamonds was very strong, driven by dwindling stockpiles and demand from China, Russia and the Middle East. <br /><br />"Whilst the current U.S. economic climate presents a challenge, opportunities abound throughout the diamond value chain to deliver returns to our shareholders," said Elphick, who founded Gem Diamonds in July 2005 and was formerly the right-hand man of South African diamond magnate Harry Oppenheimer. <br /><br />The company said it had used the $636 million raised through its initial public offering on the acquisition of projects in Australia, Botswana, the Democratic Republic of Congo and Indonesia.', '', 1, 5, 0, 13, '2008-04-23 18:51:13', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:51:13', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 0, 'robots=\nauthor='),
(32, 'What will be shape of recovery?', 'what-will-be-shape-of-recovery', '', 'On Wall Street there is little doubt the U.S. economy is in recession, and analysts now are beginning to wonder, and worry, about the type of recovery that lies ahead. <br /><br />Often, a simple letter of the alphabet is used to describe a recovery''s shape. While economists are uncertain what the future may hold, few expect a sharp V-shaped recovery in which economic growth would bounce back quickly from a slump. <br /><br />"Certainly no one has projected a V-shaped recovery," said Bernard Baumohl, managing director of the Economic Outlook Group. "The nature of the problems that we are facing are very serious and as a result this is not some garden variety recession that we are having." <br /><br />Instead, analysts say a crumbling housing market, and persistent credit and liquidity problems in money markets, suggest the letters W, L or U are more likely to describe the shape of the path economic growth will likely follow. <br /><br />"We''re in recession right now and it''s going to last significantly longer and probably get a lot deeper," said Brian Fabbri, managing director of economic research at BNP Paribas. <br /><br />Fabbri warns that banks still need to unwind a lot of mortgage-related bets, which will likely keep credit conditions tight. "They are doing it in a recession and it''s exacerbating the recession," he said. <br /><br />RECESSION FIGHT <br /><br />The warnings come against a backdrop of aggressive efforts in Washington to keep the economy afloat. <br /><br />Since mid-September, the Federal Reserve has reduced its benchmark interest rate three full percentage points and policy-makers are expected to cut the Fed funds rate further at its meeting next week. <br /><br />In addition, the central bank has provided billions of dollars in liquid funds to near-frozen markets and stepped in to prevent what would have been an unprecedented collapse of the investment bank Bear Stearns, which some believed could have driven the economy into a 1930s style depression. <br /><br />Congress and the Bush administration also moved quickly to put in place an economic stimulus package that will put tax rebate checks in consumers hands to boost spending and likely will provide a boost to economic growth through at least the third quarter of 2008. <br /><br />These efforts should cushion the blow as banks sell off or write down mortgage related assets and a rising number of homeowners brace for foreclosure, but many economists think more will need to be done and some think a second stimulus package may be needed next year to assure a more certain recovery. <br /><br />"Clearly there is still risk in bank portfolios," said Fabbri. "Monetary policy has been diluted as we speak by tightening of credit lending standards." <br /><br />RECESSION? <br /><br />While Wall Street is convinced the economy entered recession late last year, the private-sector Business Cycle Dating Committee at the National Bureau of Economic Research, the accepted recession arbiter, has yet to make that call. <br /><br />But panel members have become increasingly gloomy. <br /><br />"With monthly GDP down sharply and three consecutive months of decline in payroll employment, there seems little doubt about a genuine decline (in economic activity), though nowhere near enough to call a recession soon," said Stanford University professor Robert Hall, who chairs the committee. <br /><br />So far this year the economy has shed a quarter of a million jobs, far less than the 1 million to 2 million typically lost in a downturn, although economists warn the toll will mount in the months ahead. <br /><br />"Things don''t look good. I know the unemployment rate doesn''t look that bad, but in my view that is because so many people have dropped out of the work force compared to the last cyclical peak in 2000," said Harvard University professor Jeffrey Frankel, another member of the NBER panel. <br /><br />"A W-shaped recession is certainly a possibility," he said, alluding to the chance of a double-dip recession. <br /><br />Michael Feroli, an economist at JPMorgan, thinks the stimulus plan now in place will help bridge the economy to a point where the Fed''s interest rate reductions finally start making themselves felt. <br /><br />But even he doesn''t rule out the need for further action. <br /><br />"We may need another boost," Feroli said. "It''s getting better, but it''s getting better pretty slowly." <br /><br />Troubles in the housing and credit markets have already begun to spread more widely. <br /><br />On Tuesday, the nation''s largest health insurer, UnitedHealth Group, announced a lower-than-expected first quarter profit and slashed its outlook, saying a weak economy is causing customers to seek leaner benefits. <br /><br />"If you take consumers and housing out of the equation, you effectively set aside 80 percent of the economy and that tells you this is going to be a very weak and difficult environment," said Baumohl.', '', 1, 5, 0, 13, '2008-04-23 18:51:57', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:51:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(33, 'Mumbai''s bid to be global finance hub laden with hurdles', 'mumbais-bid-to-be-global-finance-hub-laden-with-hurdles', '', 'With one of Asia''s largest slums, congested streets and sometimes startling whiffs of human waste, Mumbai may not be everyone''s first choice for a world-class financial centre. <br /><br />Yet that is exactly what India hopes it will become in the next decade as it rises to the challenge of financing one of the world''s fastest growing major economies after China. <br /><br />"I think we are where China was with a lag of maybe 10 years," K.V. Kamath, chief executive of ICICI Bank, India''s largest private bank, told a conference recently. <br /><br />"That is the catch-up time that we need to build various structures whether they are financial or whether they are real ... to provide the sort of momentum that we need." <br /><br />Formerly known as Bombay, Mumbai is a bustling port on India''s west coast. Home to 17 million people, it is already a base for two stock markets, their watchdog and the central bank. <br /><br />The city which overlooks the Arabian Sea is the face of old and new India: bullock carts toil alongside shiny sedans, shanties slope from walls near glazed offices, and sea vistas take your breath away with the low-tide stench of sewage. <br /><br />But India''s central government envisages a time when Mumbai will be a gleaming financial hub not too far removed from London, Dubai and Singapore. <br /><br />To this end it has appointed a panel to study ways of turning Mumbai into the sort of place where a high-rolling banker might want to live. <br /><br />Democratic government, a vast and growing economy, a large English-speaking workforce and a time zone overlapping Asia and Europe all work in the city''s favour, although markets need to be liberalised and the financial and legal system must improve. <br /><br />But financial reforms are nothing compared to the Herculean task of revamping Mumbai''s infrastructure and housing, an initiative that will probably cost tens of billions of dollars. <br /><br />HERCULEAN TASK <br /><br />With its pockets of faded British colonial grandeur, Mumbai is beset by infrastructure problems: debilitating traffic, a lack of housing, poor water delivery, with some homes served simply by water trucks, and an unreliable power system that results in routine power cuts in the suburbs. <br /><br />Even the geography of the city, a series of islands joined by reclamation, works against it. Space is at a premium and the city is getting increasingly cramped as an estimated 300 poor families arrive each day in search of work. <br /><br />The city''s infrastructure is rusty and overloaded. Six million people a day cram into -- or on top of -- its battered commuter trains. <br /><br />Efforts are underway to modernise the infrastructure, but observers say the massive sums of money involved are just a drop in the ocean. <br /><br />The Municipal Corporation of Greater Mumbai has budgeted 18 billion rupees ($450 million) to upgrade roads and bridges and 29 billion rupees to improve water supply this fiscal year. <br /><br />"Our journey on urban investment is just beginning," Ramesh Ramanathan, founder of the group Janaagraha, which pushes for civic reform, told a conference recently. <br /><br />"These numbers are insignificant ... compared to the true amount of money that will have to be invested in infrastructure over the next 15 to 20 years," he said. <br /><br />Officials are tackling some issues: corporation figures show 19 billion rupees allocated to widen century-old storm drains after about 1,000 people died in severe monsoon floods in 2005. <br /><br />Sanjay Ubale, secretary of special projects for the state of Maharashtra, of which Mumbai is the capital, says 250 new trains are on the way. <br /><br />Last year, a law that controlled urban land holdings was scrapped, potentially freeing large areas for development. <br /><br />High-rises increasingly dot the skyline and a second international airport is planned for the city''s outskirts. <br /><br />DEMOCRACY, BUREAUCRACY <br /><br />Further progress is hampered by miles of red tape and the housing shortage is not helped by a 1947 rent control act, that keeps rents for long-time tenants far below modern-day market rates and makes it difficult to get people out. <br /><br />So while a well-to-do family may live in a three-bedroom apartment in a choice part of town for just 250 rupees ($6.25) a month, newcomers are likely to pay 800 times that sum at $5,000 or more -- similar to rentals in London or New York. <br /><br />"Mumbai has been plagued by draconian urban regulations for the past 50 years," said Alain Bertrand, an urban development expert who previously worked for the World Bank. "(We must) find an equitable solution to get out of rent control." <br /><br />For the less well-off, there are plans to tear down one particular shantytown, Dharavi, a thriving slum considered to be one of Asia''s largest, and resettle families in high-rises. Many slum residents are opposed as they fear losing their livelihood. <br /><br />"It''s impossible to arrive in Mumbai and offer any solutions because everything is paled by the complexities of the problem," Ramanathan said. <br /><br />Authorities aim to attract $39 billion in private investment and Ubale says firms are interested in bidding for projects such as a light rail system in the north of the city. <br /><br />But implementation is fraught with problems. Bureaucracy, land acquisition and perhaps most importantly finding a fair solution to rehouse displaced people, estimated at 57,000 in the case of Dharavi alone, are a few of the obstacles. <br /><br />"It''s not just a question of funding, but of executing projects on time and maintaining them properly," Urban Development Minister S. Jaipal Reddy said. <br /><br />Despite all the challenges ahead, ICICI''s Kamath is upbeat on Mumbai''s progress towards becoming a world-class centre. <br /><br />"It may not happen tomorrow, but it is inevitable," he said.', '', 1, 5, 0, 13, '2008-04-23 18:52:44', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:52:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(34, 'Inflation hits new highs in Asia, currencies rise', 'inflation-hits-new-highs-in-asia-currencies-rise', '', 'Inflation hit a 26-year peak in Singapore and a 13-month high in Malaysia as governments across Asia grapple with the problem of containing surging food and energy costs without choking off economic growth. <br /><br />Australian inflation accelerated to its fastest pace in 17 years, Indonesia and Vietnam raised their inflation forecasts, and the Philippine central bank said it would look at raising rates if commodity price rises began feeding into wages and other costs. <br /><br />Authorities across the region, where economies are powered by exports, are reluctant to raise rates in the teeth of a financial crisis that has taken the United States to the brink of recession, if it isn''t in recession already. <br /><br />The International Monetary Fund and the Asian Development Bank urged governments this week to use direct fiscal measures to cushion the impact of rising prices that stirred protests from the Philippines to Bangladesh. <br /><br />Markets are betting on more drastic action, and currencies rose across the region on Wednesday, partly in anticipation that authorities would either turn to rate hikes or exchange rate appreciation to contain inflation being driven by record price rises in essentials like rice and oil. <br /><br />The Malaysian ringgit hit an 11-year high and the Australian dollar a 24-year peak. The Singapore dollar, the central bank''s main monetary policy tool, hit a record high. <br /><br />While economic growth in Asia is expected to slow this year as a struggling U.S. economy drags on the region''s exports, rising consumer prices have made it difficult for central banks to ease monetary policy. <br /><br />Prices in Singapore rose in March by 6.7 percent from a year earlier, their biggest annual gain since 1982. <br /><br />The core rate of annual inflation in Australia rose in the first quarter by a larger-than-expected 4.25 percent over a year earlier as the cost of eating, driving and renting all rose. <br /><br />SUPPLY SHOCKS <br /><br />Malaysia''s consumer prices climbed in March by a relatively sedate 2.8 percent from a year earlier, but that was still the highest level in well over a decade, although economists saw no reason for a rate hike. <br /><br />"Monetary policy can''t help much when inflation is driven by supply shocks," said Prakash Sakpal, a regional economist at ING Financial Markets in Singapore. <br /><br />"Central banks hiking interest rates is basically not an effective option. It basically leaves them with the exchange rate, which Singapore is doing," Sakpal said. <br /><br />Singapore''s central bank tightened monetary policy earlier this month by allowing the Singapore dollar, its main policy tool, to rise further. <br /><br />The Reserve Bank of Australia (RBA), the central bank, raised rates in both February and March to a 12-year high of 7.25 percent. But analysts said that may not be enough to contain the country''s inflation. <br /><br />"The RBA will be taking comfort from the rapid slowdown in demand seen in the first quarter, and that should allow them to skip another tightening for the time being," said Brian Radican, a senior economist at Macquarie bank. <br /><br />"But if inflation doesn''t slow by the third quarter, things could get nasty again," he said. "The Reserve Bank has a real struggle on its hands." <br /><br />Analysts said only countries such as Singapore, China and South Korea, which have budget surpluses, can afford to subsidise the high costs of food or let their currencies rise, leaving many Asian governments that are running budget deficits in a bind. <br /><br />"Countries such as Indonesia, India, Malaysia and the Philippines, which lack balance of payments support, will be more constrained," Sakpal said. <br /><br />The Philippine central bank said on Wednesday it would review its monetary policy stance, and possibly raise rates, if inflationary pressures spread to other parts of the economy. <br /><br />Vietnam''s planning and investment minister, Vo Hong Phuc, said the government expected it would be difficult to contain inflation, which is running at its highest level in more than 12 years at close to 20 percent, as it had wished. <br /><br />WHile, in Indonesia, the head of the country''s statistics bureau said April inflation would be higher than March, which was already an 18-month high. <br /><br />China, where consumer price inflation is running near 12-year highs, has allowed the Chinese yuan to keep strengthening to help contain inflation. <br /><br />The Asian Development Bank said on Tuesday Asian governments should use direct fiscal measures to tackle inflation rather than monetary policy moves because the poor need to receive help immediately. <br /><br />India, where inflation hit a three-year high at the end of March, is considering more export curbs and fiscal steps to put a lid on soaring prices that threaten to hurt the government at the ballot box.', '', 1, 5, 0, 13, '2008-04-23 18:53:27', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:53:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(35, 'Stocks end downbeat on profit taking', 'stocks-end-downbeat-on-profit-taking', '', 'Dhaka stocks ended downbeat Wednesday as investors locked in profits, while the country''s twin bourses witnessed declines in trading volume and turnover. <br /><br />"We dealt with selling orders of oil companies and major issues in banks, pharmaceuticals, cement and leather," an official with brokerage house Anchor Securities told bdnews24.com. <br /><br />Buying pressure led mutual funds, textile issues, non-bank financial institutions and power companies to end higher, the official added. <br /><br />Market observers termed the day''s trading optimistic, saying that a fall in indices was anticipated following a couple of days of flat trading. <br /><br />"Well everything seems quite normal. The fall in indices was pretty much expected after days of flat trading," said DSE vice-president Ahmad Rashid. <br /><br />The benchmark DGEN or general index rose in the first two and a half hours of trade but maintained a downward curve afterwards to finish down 31.45 points, or 1.01 percent, at 3053.31. <br /><br />The DSI or all-share price index ended on 2580.84, falling 20.97 points, or 0.80 percent from the previous day. <br /><br />The bourse''s blue-chip DSE-20 also lost 18.33 points, or 0.76 percent, to close at 2368.91. <br /><br />Turnover slipped to Tk 3.14 billion from Tuesday''s Tk 3.55 billion, with 20,340,754 shares changing hands. <br /><br />Of the traded issues, 136 advanced, 118 declined and three remained unchanged. <br /><br />Square Pharma topped the turnover board, falling 1.66 percent to Tk 4559.50. <br /><br />AB Bank followed it to end on Tk 3648.75, down 2.37 percent. <br /><br />State owned Jamuna Oil continued to lose, slumping 4.60 percent from the previous day to end on Tk 279.70. <br /><br />Apex Adelchi Footwear also crept down on profit-taking, closing 0.96 percent down at Tk 4830.50. <br /><br />UCBL however, rose 0.91 percent to close at Tk 4903.25. <br /><br />Among the other scrips on the turnover board, Lanka Bangla Finance, Summit Power and AIMS 1st mutual fund,. <br /><br />Heidelberg Cement and ACI declined after investors locked in profits. <br /><br />Indices on the Chittagong Stock Exchange edged up paced by huge gains in leasing & finance and ceramics. <br /><br />The CSCX or selective categories index rose 4.22 points or 0.07 percent to 5522.39 while the CASPI or all-share price index ended on 8553.57, up 11.13 points or 0.13 percent. <br /><br />The CSE-30 blue-chip index, however, slumped 71.51 points or 0.95 percent to close at 7395.98. <br /><br />Turnover on the port city''s bourse fell to Tk 446.17 million from Tk 586.80 million the previous day from 3,973,739 traded shares.', '', 1, 5, 0, 13, '2008-04-23 18:54:05', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:54:05', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(36, 'High tariff hinders RMG exports to US market: trade analyst', 'high-tariff-hinders-rmg-exports-to-us-market-trade-analyst', '', 'Bangladeshi garments face challenges entering the US market as high tariff is imposed on textile products from Asian and Middle Eastern countries, said a US trade policy analyst Wednesday. <br /><br />Bangladesh recorded $3.4 billion in readymade garments exports last year, which could increase substantially if the US tariff structure was reviewed, said Edward Gresser, one of the directors of Progressive Policy Institute, a US-based nongovernmental organisation. <br /><br />"A bill in the US Congress has been put forward proposing Bangladesh along with other Asian countries and the Middle East could enjoy the same tariff as the Sub-Sahara African countries get now," he said while speaking at a seminar titled "Livelihood Implication of RMG Industry" organised by Bangladesh Garment Manufacturers and Exporters Association. <br /><br />Gresser suggested that RMG industry leaders speak to their African counterparts to address the issue. <br /><br />The former member of a trade and commerce body under the Clinton administration said Bangladesh''s RMG industry was quite successful and proved wrong the speculations of collapse in the post-multi-fibre arrangement quota period. <br /><br />MFA was the 10-year phase-out of import quotas under the World Trade Organisation that was supposed to provide for an orderly transition for the world''s textile industry to a more open, market-driven economy. <br /><br />"Though the Bangladeshi RMG industry still needs to do a lot regarding compliance issues," said the former US government''s trade policy analyst. <br /><br />Speaking on duty free access by the US on Bangladeshi products he said that it would create job opportunities of 180,000 people of which 144,000 would be women. <br /><br />Senior lawyer Dr Kamal Hossain in his speech as the chief guest stressed meeting the challenges of global economy and specialisations in the RMG sector. <br /><br />"The country''s future depends a lot on the RMG sector." <br /><br />On problems in the industry, Hossain said solutions should be formulated in such a manner that it meets the interests of all stakeholders, including buyers and workers. <br /><br />"Let us all go forward with a problem solving approach," Hossain said. <br /><br />He stressed coordinated efforts by workers and manufacturers to work out solutions. <br /><br />"Everyone concerned should sit with an open mind with an informative and logical approach to uproot the problems in the sector," Hossain said. <br /><br />The seminar was also attended by industry leaders, NGO representatives and members of labour organisations. <br /><br />Representatives of workers'' organisations said efforts should focus on a broader picture of the problems rather than on specific organisations. <br /><br />They also asked for increased campaigns for new markets and duty-free access to the US.', '', 1, 5, 0, 13, '2008-04-23 18:55:15', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:55:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(37, 'Oil rallies to record near $120 on supply worries', 'oil-rallies-to-record-near-120-on-supply-worries', '', 'Oil surged to records near $120 a barrel on Tuesday on the weaker dollar, export disruptions from Nigerian rebel attacks and concerns a Scottish refinery strike could hit North Sea production. <br /><br />Further support came from data showing demand in China, the world''s No. 2 consumer, leaped 8 percent in March from a year ago, the fastest rate in 19 months as refiners boosted imports ahead of the Olympics. ID:nPEK292273 <br /><br />U.S. crude CLc1&gt; settled up $1.89 at $119.37 a barrel after hitting an all-time peak of $119.90 earlier. London Brent crude LCOc1&gt; gained $1.52 to settle at $115.95 a barrel, after rising to a record peak of $116.75. <br /><br />Oil''s fresh highs extended a rally that has seen prices climb more than five-fold since 2002, as booming demand from emerging markets such as China has coincided with long-term supply constraints. <br /><br />The slumping U.S. greenback, which tumbled to fresh lows against the euro on Tuesday, has also helped boost dollar-denominated commodities like oil and attracted speculative inflows from hedge funds. ID:nN22296501 <br /><br />"The trend is up and the market didn''t break down when it moved lower in the morning, and you have the weak dollar and the supply disruptions are in the mix," said Eric Wittenauer, analyst at Wachovia Securities. <br /><br />Pipeline attacks in OPEC member Nigeria last week shut 169,000 barrels per day (bpd) of Bonny Light production, forcing Royal Dutch Shell Plc to declare force majeure on crude oil exports. ID:nL21117737 <br /><br />Nigerian rebels also attacked two Shell oil pipelines in the Niger Delta on Monday. ID:n21129451 <br /><br />Management and union officials are in talks to avoid a planned two-day strike at Scotland''s Grangemouth refinery, which could force the shut-in of some oil and natural gas production from the North Sea. ID:nL22601976 <br /><br />Oil producers gathered in Rome for the International Energy Forum said they can do nothing to halt oil''s rally and the world might have to live with even higher prices if it wants supplies for the future. ID:nL22840262 <br /><br />Ali al-Naimi, oil minister to OPEC kingpin Saudi Arabia, said a lack of investment in crude and refining capacity -- not a lack of reserves -- was driving prices higher. ID:nL22855792 <br /><br />"Recently, I have observed an unprecedented level of uncertainty, doubt and even fear in discussions about the future of energy and its impact on global economic prospects," Naimi said. <br /><br />"I can assure you unequivocally that the world is not running out of oil." <br /><br />Rising energy costs and the U.S. economic crisis have forced analysts to revise downward oil demand growth forecasts for the world''s largest consumer, which has lobbied OPEC to increase output to help lower prices. <br /><br />U.S. President George W. Bush on Tuesday said he was concerned about record-high crude oil and gasoline prices, and said the United States needs to tap an Alaskan wildlife refuge to boost supply.', '', 1, 5, 0, 13, '2008-04-23 18:55:47', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:55:47', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(38, 'Govt okays Tk 2,000 crore plan for BAPEX', 'govt-okays-tk-2000-crore-plan-for-bapex', '', 'The government Tuesday accepted a Tk 2,000 crore proposal to shore up Bangladesh Petroleum Exploration and Production Company (BAPEX). <br /><br />The approval came from a meeting chaired by chief adviser Fakhruddin Ahmed in his office. <br /><br />Finance adviser AB Mirza Azizul Islam, the CA''s special assistant in charge of the industry ministry Mahbub Jamil and special assistant in charge of power, energy and mineral resources Prof M Tamim also attended the meeting. <br /><br />After the meeting, Prof Tamim told bdnews24.com that the government had accepted the proposal to make BAPEX, a company of Petrobangla, stronger and agreed in principle to take the proposal ahead. <br /><br />"BAPEX has so far been neglected. I hope BAPEX will become an organisation of international standards." <br /><br />In no country did a state-run firm conduct exploration and production unilaterally, Tamin said. <br /><br />"There was the need for international organisations, but the local organistion must be made stronger," he said. <br /><br />A proposal had been sent to the Chief Adviser''s Office from the Energy Division in March to strengthen BAPEX, which emerged as a company in 1989. <br /><br />Initially, BAPEX was given permission to carry out only exploration activities. In 2000, the government authorised the company to carry out both exploration and production activities. <br /><br />Part of the proposal emphasised increasing the prices of gas extracted by BAPEX and creating an opportunity for quick purchase by relaxing government policy. <br /><br />Energy secretary Mohammad Mohsin hoped that BAPEX would become a self-sustaining firm in seven years. <br /><br />"We want to make BAPEX self-reliant in explorations of oil, gas and extraction," he said.', '', 1, 5, 0, 13, '2008-04-23 18:56:28', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 18:56:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(39, 'Salahuddin, Chunnu, Helal candidature cancellation demanded', 'salahuddin-chunnu-helal-candidature-cancellation-demanded', '', 'A councilor lodged an appeal with the election commission demanding cancellation of the candidatures of Kazi Salahuddin, Ahsrafuddin Ahmed Chunnu and Golam Rabbani Helal for hiding relevant information on nominations for the upcoming Bangladesh Football Federation election. <br /><br />Councilor Shamsul Haq from the Chittagong Football Association Monday appealed in writing that the above trio had hidden relevant information in part of nine and 10 sections on the nomination papers. <br /><br />According to nine and 10 sections, it is asked whether the candidate was earlier found guilty of criminal offences, and whether candidates were earlier convicted under the criminal code. <br /><br />Salahuddin is a president candidate while Chunnu and Helal vice president and member candidates respectively in the upcoming BFF election scheduled for April 28. <br /><br />Though the trio filled up the sections that they had not been found guilty or convicted under the criminal code, the complainant Tuesday in support of his appeal submitted two news clippings published in the Daily Ittefaq and the Dainik Bangla on September 23, 1982. <br /><br />The stories read that a court had convicted Helal and Anwar Hossain for one month, and Salahuddin and Chunnu for six months, and fined them Tk 1000 each for beating an assistant referee during the match against Mohammedan SC on September 21, 1982, during military rule. <br /><br />Four Abahani players were arrested for the incident and found guilty in a one-day trial under martial law the next day. <br /><br />All four footballers, however, came out of prison after 17 days following Presidential clemency. <br /><br />"Whether punishment under military rule could be taken into cognizance as punishment under penal code, was the question Salauddin posed. He was surprised over the allegation as it came after 26 years. <br /><br />"I don''t believe any Bangali from Bangladesh can raise this matter after 26 years as the whole nation knows the fact behind that incident," said Salahuddin. <br /><br />Chunni and Helal, denying they were convicted of criminal offences, said that it was just ''dirty play'' ahead of the BFF election, and that no one should stoop so low in the interest of the election. <br /><br />The final list of candidates is scheduled to be announced Thursday. Withdrawal of candidature is Wednesday. <br /><br />Chief election commissioner Mesbah Uddin told bdnews24.com that the matter would be heard Wednesday in presence of both complainant and defendants.', '', 1, 6, 0, 14, '2008-04-23 19:01:36', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:01:36', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 12, '', '', 0, 0, 'robots=\nauthor='),
(40, 'Chelsea force draw at Anfield', 'chelsea-force-draw-at-anfield', '', 'Chelsea escaped from Liverpool with a 1-1 draw after the first leg of their Champions League semi-final on Tuesday, rescued by an injury time own goal from substitute John Arne Riise. <br />Dirk Kuyt had given Liverpool the lead after 43 minutes when he fired between goalkeeper Petr Cech''s legs and with almost five minutes of injury time played, it looked as though Liverpool would take a deserved lead to Stamford Bridge for next week''s second leg. <br />However with Austrian referee Konrad Plautz looking at his watch, Chelsea substitute Salomon Kalou lofted one last high ball into the Liverpool penalty area. <br />Riise, who had replaced the injured Fabio Aurelio after 62 minutes, stooped to try and head the ball clear, but instead headed it past helpless goalkeeper Pepe Reina and into the roof of his own net. <br />It gave Chelsea a share of the spoils they hardly deserved as Liverpool dominated for long periods but were denied by some outstanding saves from Cech. <br />With time almost up it looked as though the seventh meeting between the teams in the Champions League in the last four seasons was about to end in a 1-0 scoreline for the fourth time. <br />Instead this match became the first to produce two goals and leave the tie on a knife-edge with Chelsea the slight favourites to advance to the final in Moscow on May 21. <br />Barcelona and Manchester United open their semi-final battle at the Nou Camp on Wednesday. <br />BRIGHT START <br />Although Chelsea started the brighter they failed to create any real scoring chances. Their best opportunity in the opening exchanges came after only three minutes when Didier Drogba saw his free-kick deflected to safety by the wall. <br />Joe Cole should have done better when he miscued a shot after being played clear by Frank Lampard. <br />As in the quarter-final second leg against Arsenal two weeks ago, Liverpool weathered the early storm and gradually began to take control of the game. <br />They began to force Chelsea on to the back foot and went close to taking the lead after 31 minutes when Cech made an outstanding save to deny Fernando Torres in front of the Kop. <br />The breakthrough eventually came two minutes before halftime after a sustained period of Liverpool pressure. <br />The move began with a quickly taken free kick by Xabi Alonso who found Kuyt. <br />His cross was headed clear by John Terry to Lampard who was dispossessed by Kuyt. The ball ran to Alonso who found Javier Mascherano, and his miscued shot beat Claude Makelele''s attempted header, allowing Kuyt to fire through Cech''s legs to put Liverpool ahead. <br />It was the third time he had scored in the knockout rounds after goals against Inter Milan and Arsenal and looked to have done enough to win the match. <br />Chelsea not only have Riise to thank, but also Cech who made a stunning late save to deny Steven Gerrard a goal with a brilliant dipping volley.', '', 1, 6, 0, 14, '2008-04-23 19:05:14', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:05:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 11, '', '', 0, 0, 'robots=\nauthor='),
(41, 'Bulgaria suspends six referees for poor performances', 'bulgaria-suspends-six-referees-for-poor-performances', '', 'Bulgaria''s soccer federation has suspended six referees for making significant mistakes in recent premier league and Bulgarian Cup matches. <br /><br />Angel Bekyarov, who was temporarily removed from officials list for errors and poor fitness in October 2006, was one of three referees banned until the end of the season. <br /><br />Bekyarov was suspended after making mistakes during Litex Lovech''s 1-1 draw at Beroe Stara Zagora on Sunday and during Cherno More Varna''s 3-1 win at Kaliakra Kavarna in the Cup semi-final four days earlier. <br /><br />Trendafil Dumbalakov, Bekyarov''s assistant at one of the games, was also banned until the end of the season while another assistant, Nikolay Angelov, has been suspended for five matches. <br /><br />Kaliakra has threatened to boycott the Cup unless the officials are heavily punished. Litex also reacted angrily and called for Bekyarov to be given a life ban. <br /><br />"Through these punishments the (federation''s) referee commission is showing that it will not tolerate officials who do not apply the rules," the commission said. <br /><br />Bekyarov could not escape the punishment despite agreeing to have a lie-detector test. He was accused publicly by several Litex players of favouring Beroe in the league game last weekend. <br /><br />Another linesman, Georgi Kovachev, has been banned for the rest of the season for making bad decisions. Asen Nikolov was handed a three-match ban and Martin Bogdev was banned for two matches. <br /><br />Referee suspensions are not uncommon in Bulgaria, where two officials were given life bans last season.', '', 1, 6, 0, 14, '2008-04-23 19:05:55', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:05:55', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 10, '', '', 0, 0, 'robots=\nauthor='),
(42, 'Barca take on United in mouth-watering Nou Camp showdown', 'barca-take-on-united-in-mouth-watering-nou-camp-showdown', '', 'Manchester United return to the scene of one of their most memorable European triumphs when they take on Barcelona at the Nou Camp in a mouth-watering Champions League semi-final on Wednesday (kickoff 1845 GMT). <br /><br />United clinched their second European Cup with their dramatic last-gasp 2-1 victory over Bayern Munich at the Barcelona stadium almost 10 years ago and they are aiming to lay the foundations for a third final appearance with a winning performance against the Catalans. <br /><br />Barcelona-Manchester United clashes tend to be goal-laden affairs with 28 scored in seven previous games and the last two matches ending in entertaining 3-3 draws. <br /><br />Both sides are unbeaten in Europe this season and the game will be even more eagerly anticipated given that it will provide a showcase to compare two of the world''s most exciting players in Cristiano Ronaldo and Lionel Messi. <br /><br />"If it had been the final it would have been a fantastic stage for big clubs like us," said United manager Alex Ferguson. "I think the winners will stand a great chance in the final." <br /><br />For Premier League leaders United there is still the prospect of completing a memorable domestic and European double, but for Barcelona Champions League triumph is their only way of salvaging a traumatic season. <br /><br />Barcelona have not won any of their last three home games against English clubs, losing 2-1 to Liverpool at the Nou Camp last season and drawing twice with Chelsea before that, but United have only won once in 16 away trips to Spain. <br /><br />"For us it is a dream to be here and we are all really motivated," said Barca coach Frank Rijkaard. "We have respect for our opponents but we are determined to win."', '', 1, 6, 0, 14, '2008-04-23 19:06:33', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:06:33', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 9, '', '', 0, 0, 'robots=\nauthor='),
(43, 'Savage Sehwag stars in thumping win', 'savage-sehwag-stars-in-thumping-win', '', 'A typically explosive innings from Sehwag, who blasted 10 fours and 6 sixes in a 41-ball unbeaten 94 sealed a thumping 9-wicket win against the Deccan Chargers. Sehwag became the first Indian to receive the Man of the Match award in the IPL. <br /><br />The Delhi openers Sehwag and Gambhir came out to bat with the knowledge that they didn''t have to do anything spectacular to overtake the modest Deccan Chargers total. <br />Gambhir was dismissed by Vaas in the fourth over when he flashed hard at a rising delivery to give keeper Gilchrist an easy catch. <br /><br />The in-form Shikhar Dhawan then came to the crease and went about his business in a calm and collected fashion taking the singles and twos. His partner,though, sent the Hyderabad bowlers on a serious leather hunt with powerful shots all around the ground. <br /><br />Sehwag was given a reprieve on 63 when Gilchrist missed a simple stumping chance off Ojha and the ball went on to hit the helmet placed behind him. <br /><br />Gilchrist wasn''t at his best , earlier in the over, he failed to latch onto two wide deliveries. <br /><br />Hyderabad captain VVS Laxman tried his best to control the Delhi Dasher by ringing in the bowling changes but Sehwag was particularly severe on Aussie Andrew Symonds when he hit the helpless bowler for a record breaking 30 runs in the 13th over to all but finish the match. <br /><br />Earlier, a brilliant 66 off 36 balls from Rohit Sharma lifted Deccan Chargers to a respectable total of 142. Sharma smashed 6 fours and 4 sixes on a relatively flat track where his more illustrious team mates failed to prosper. <br /><br />With the likes of Gilchrist, Symonds and Afridi in their ranks, the Deccan Chargers will be disappointed with their second straight loss while their star players will be required to justify their high price with some performances to help their team be a force to reckon with in the IPL.', '', 1, 6, 0, 14, '2008-04-23 19:06:58', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:06:58', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 8, '', '', 0, 0, 'robots=\nauthor='),
(44, 'Pollock to play Twenty for Durham', 'pollock-to-play-twenty-for-durham', '', 'Former South Africa all rounder Shaun Pollock will play for English county Durham in the Twenty20 Cup this season, the club said on Wednesday. <br /><br />Pollock, who retired from international cricket in February having played in 108 test matches and more than 300 one-day internationals, will join up with Durham in June. <br /><br />"When I got the offer from Durham I really jumped at the chance to get on board, they are determined to do well in the Twenty20 Cup and I want to contribute to that success," Pollock told the Durham Web site (www.durhamccc.co.uk). <br /><br />Pollock, who will be commentating for television during South Africa''s tour to England this year, joins former international team mates Dale Benkenstein, Durham''s captain, and Albie Morkel at the north east club.', '', 1, 6, 0, 14, '2008-04-23 19:07:34', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:07:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(45, 'Lampard says mum''s illness was hardest moment of his life', 'lampard-says-mums-illness-was-hardest-moment-of-his-life', '', 'Chelsea midfielder Frank Lampard described the last week as the hardest of his life after his mother was rushed to hospital with a serious illness. <br /><br />Lampard returned to action for the first time since the news against Liverpool in the Champions League semi-final first leg on Tuesday when Chelsea snatched a 1-1 draw at Anfield. <br /><br />The England international said any thoughts of a Champions League final had been put firmly to the back of his mind while his mother Pat battled with pneumonia. <br /><br />"This time last week was very bleak," Lampard, who missed the Premier League games against Wigan Athletic and Everton, told the Chelsea Web site (www.chelseafc.com) on Wednesday. <br /><br />"I won''t go into details but we were getting a very bleak outlook. That was the hardest moment for me in my life." <br /><br />His mother''s condition improved enough for Lampard to play against Liverpool, although he said he had resigned himself to missing the match. <br /><br />"Three days ago I wasn''t playing in my mind. But we got some decent news on Saturday afternoon and my head came round a little bit then. I made a decision to go in training on Sunday to see how I felt," the 29-year-old said. <br /><br />"The manager and the club have been fantastic and have not put any pressure on me whatsoever. I felt I could come and play and in a way the training and the playing has helped to take my mind off things, whereas last week I was in a bad situation." <br /><br />Lampard was at fault for Liverpool''s goal when he got caught in possession just outside his own area. He said the past week had taken its toll. <br /><br />"I have been in better shape for games both mentally and physically but it has been a very difficult week," he said. <br /><br />Lampard is hopeful of playing in Chelsea''s must-win Premier League match against Manchester United at Stamford Bridge on Saturday. They trail United by three points with three games remaining.', '', 1, 6, 0, 14, '2008-04-23 19:08:10', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:08:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(46, 'U.S. athletes divided on politicising Games', 'us-athletes-divided-on-politicising-games', '', 'A nervous smile steals across Jessica Mendoza''s face when the U.S. Olympic women''s softball player is asked whether she plans to demonstrate her outrage over China''s policy on Darfur at the Beijing Games. <br /><br />"I''ve thought about that...I don''t have a plan. My first goal is to talk to other athletes there," said the 27-year-old Mendoza. <br /><br />She is one of a handful of Olympic athletes to sign up for Team Darfur, an informal, 300-strong group created two years ago by former American speed skater Joey Cheek to draw attention to the conflict affecting millions in western Sudan. <br /><br />International experts estimate that some 200,000 people have died and 2.5 million been driven from their homes since rebels took up arms in Darfur five years ago. Washington calls the violence genocide, a term European governments have been reluctant to use. <br /><br />China, which is a major investor in Sudan''s oil industry and the country''s largest supplier of weapons, has been accused by human rights groups of not doing enough to press the Sudanese government to end the bloodshed. It has also faced harsh criticism from Western governments for a bloody crackdown in Tibet. <br /><br />Mendoza, women''s soccer player Abby Wambach and some other athletes appearing at a U.S. team media summit ahead of the Games were struggling with a dilemma: a desire to express their views on the violence in Darfur and Tibet, while clinging to the belief that sport should be insulated from politics. <br /><br />"Are we human? Do we have consciousness? Of course. By winning the gold medal, we can best express our sense of unity," Wambach said. <br /><br /><br />LONG HOURS <br /><br />Several athletes said they did not want to violate what they described as the peaceful, communal spirit of the Olympics which features participants from more countries than there are members of the United Nations. <br /><br />They also wanted to avoid offending their Chinese hosts, distracting from their team mates'' achievements or risking their own long hours of training for a moment of controversy that might have little impact. <br /><br />"We are truly focused on our training," said gymnast Shayla Worley, 17. "We''re young...we leave all the political stuff to other people, that''s their job." <br /><br />Pro-Tibet protests following the Olympic torch relay have stolen headlines in the run-up to August''s Games. <br /><br />Politics has occasionally intruded on the Olympics in the form of boycotts, violence or excessive displays of nationalism, but China''s debut as hosts in the light of the Tibetan unrest has intensified political sentiments. <br /><br />Some have suggested that world leaders should consider boycotting the Games'' opening ceremony. Actress Mia Farrow sought a one-month "Olympic Truce" in Darfur and elsewhere but the International Olympic Committee (IOC) said it had "no political mandates to instruct countries how to behave". <br /><br />Film director Steven Spielberg withdrew from his role as an artistic advisor to the Games to protest at China''s inaction over Darfur. <br /><br />A few countries sought to have athletes sign pledges not to demonstrate in Beijing but backed off after a public outcry. Cheek said governments might be pressuring athletes not to speak out at the Olympics. <br /><br />U.S. Olympic Committee chief Jim Scherr said athletes were free to speak their minds but ought to do it privately and not violate Article 51 of the Olympic charter. <br /><br />The rule states: "No kind of demonstration or political, religious or racial propaganda is permitted in any Olympic sites, venues or other areas." <br /><br /><br />SENT HOME <br /><br />"I''m not going to ask anyone to (unfurl a protest banner) because it would risk them being sent home from the Olympics," Cheek said in a telephone interview from Princeton University where he is studying economics and Chinese. <br /><br />"That being said, making some sort of gesture, showing that you believe the Olympics can stand for more than just a sporting competition, that idea is sound," Cheek, 28, said. <br /><br />He said he understood the "fantastic pressure" athletes were under, having trained all their lives for a few moments in the spotlight. That spotlight also offered them a once-in-a-lifetime opportunity to speak out, he added. <br /><br />Forty years ago, U.S. sprinters Tommie Smith and John Carlos grabbed the moment and faced scorn in some quarters for raising their fists in a black-power salute on the Olympic medals podium in a protest against racial discrimination. <br /><br />"They were expected to go to the Olympics, represent the U.S., win medals...and come home and be second-class citizens," Cheek said. <br /><br />Some in Mexico City that day sat in stunned confusion and the athletes were ostracised for some time after their long-planned protest, recalled Olympic historian John Lucas. <br /><br />At the 1936 Berlin Olympics, a subtle protest by Korean marathon winner Sohn Kee-chung went largely unnoticed for years, Lucas said. Sohn, having been forced by Japan''s occupation of Korea to compete for Japan with a Japanese name, bowed and shook his head during the playing of the anthem -- saying later he was protesting with every fibre of his being.', '', 1, 6, 0, 14, '2008-04-23 19:08:41', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:08:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(47, 'Berlusconi to step down as AC Milan president', 'berlusconi-to-step-down-as-ac-milan-president', '', 'Silvio Berlusconi said on Wednesday he would step down as AC Milan president when he starts his third stint as Italian prime minister. <br /><br />"I will have to give up the presidency of Milan and this pains me. My new role is incompatible," Berlusconi, who is expected to be sworn in early next month after winning last week''s general election, told Italy''s Radio Radio station. <br /><br />The move is unlikely to cause upheaval at the seven-times European champions as vice president Adriano Galliani is in charge of the day-to-day running of the club anyway. <br /><br />Berlusconi also stepped down as president of Milan while remaining its owner during his last term at the helm of government, between 2001 and 2006. <br /><br />Berlusconi added that the high asking price Barcelona have put on Ronaldinho had not destroyed Milan''s hopes of signing the Brazil forward. <br /><br />"We still want to have him and we know that he wants Milan," Berlusconi said. "Barcelona presented a request that everyone considers excessive. We are moving forward and we''ll see. We are still interested." <br /><br />According to Italian media, Barcelona asked for 50 million euros ($80 million) for Ronaldinho, whom Milan have agreed personal terms with, plus Italy full back Gianluca Zambrotta. <br /><br /><br />FOREIGN INVESTORS <br /><br />Berlusconi also denied media speculation that he might seek to block a potential move by George Soros to take over AS Roma after the club confirmed they met a representative of a group linked to the American billionaire financier last week. <br /><br />"I''m not against the arrival of foreign investors for Roma," he said. <br /><br />"It''s a consolidated practice in Europe now. Just think of the English teams, with (Roman) Abramovich who has taken over a club (Chelsea) that is dear to the hearts of many English people. <br /><br />"Roma fans want a winning team, so if someone comes in who can put in the resources to build a winning team who will be protagonists in Italy and Europe, they will be enthusiastic and I hope things develop as they want them to. <br /><br />"I don''t see how I could get in the way of something like this." <br /><br />He also suggested cutting small clubs from the bigger teams'' fixtures lists. <br /><br />"I think the big clubs should have their own championship," he said, although it was not clear whether his proposal referred to Italy or Europe as a whole. <br /><br />"When you assemble a team that costs a lot, it''s unthinkable to go to go a provincial capital''s team with a stadium of 20,000 people, which maybe isn''t even full. The big clubs from the big cities should have their own championship and there should be another for clubs with fewer fans."', '', 1, 6, 0, 14, '2008-04-23 19:09:21', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:09:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(48, 'Chaos-ridden Abahani-Mohammedan hockey semifinal', 'chaos-ridden-abahani-mohammedan-hockey-semifinal', '', 'The chaos-filled first semifinal of the Club Cup Hockey between archrivals Abahani Limited and Mohammedan SC ended in an incomplete 1-1 result following a demand of goal cancellation in the eleventh hour of the game Wednesday. <br /><br />Masum restored the margin for holders Mohammedan three minutes from time after Rocky put Abahani ahead in the 34th minute at Moulana Bhasani National Hockey Stadium. <br /><br />"The remainder of the game will be held later as umpire Golam Kibria has declined to conduct the match citing insecurity," said umpire Latifur Rahman after the final whistle. <br /><br />"We will decide the matter in an emergency meeting after getting report from umpires," said tournament committee general secretary Iftesham Sultan, who failed to let reporters know whether the second semifinal between Usha KC and Sonali Bank would take place Thursday. <br /><br />The play remained stopped for nearly 30 minutes after Mohammedan''s equaliser as Abahani players demanded its cancellation. <br /><br />According to Abahani players, Mohammedan''s Masum did not score as the ball found the back of the Abahani net kissing their fellow defender Khokon''s stick, which is not treated as a goal in hockey. <br /><br />In the match, it seemed that the players from both sides were more interested in disputing the umpires'' decisions whenever against them rather than concentrating on a planned and fair game. <br /><br />However, many blamed the umpires for poor refereeing. The game remained stop for five minutes in the first half when Abahani players demanded a penalty corner from umpire Golam Kibria, who however, was later able to resume the game. <br /><br />Afterwards, Kibria took no action despite being kicked by Mohammedan''s skipper Prince and other players, who protested his decision on a penalty corner in favour of Abahani. <br /><br />Mohammedan players once again surrounded umpire Kibria following a decision against them, and some players pushed him before police intervened to stop them. <br /><br />Kibria warned Prince with a green card though the former national striker deserved a yellow card, and he ultimately lost control over the players. <br /><br />"We have no good umpires except these two," said Iftesham Sultan when his attention was drawn to poor refereeing.', '', 1, 6, 0, 14, '2008-04-23 19:10:04', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:10:04', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(49, 'Pakistan emerge Academy Cup champions', 'pakistan-emerge-academy-cup-champions', '', 'The Pakistan Academy team clinched the Grameenphone tri-nation Academy Cup title with a hard fought 39-run win against their Bangladesh counterparts at Sher-e-Bangla National Stadium Wednesday. <br /><br />Bangladesh ended up at 237 all out in 46.3 overs after Pakistan racked up a challenging total of 276 for six. <br /><br />Opener Shamsur Rahman (37) and one-down Farhad Hossain (26) contributed a fine 57 runs for the second wicket after opener Imrul Kayes fell on five. <br /><br />Yasir broke the stand having Shamsur caught behind the wicket, and Bangladesh slipped to 95 for four before middle orders Mehrab Hossain (22), Nasir Hossain (52) and Mushfiqur Rahim (56) steadied the innings. <br /><br />Nasir and Mushfiq took the side to 217 for six from 124 for five, before Nasir was run out for a fine 52 off 67 balls featuring two fours and one six. <br /><br />After his departure, Bangladesh needed 60 runs in 7.2 overs but the last four wickets toppled for just 17 runs, leaving them 39 runs short of the target. <br /><br />Earlier, opener Khurram Manzoor hammered 107 and one-down Khalid Latif struck 81 to power Pakistan to 276 for six in 50 overs. <br /><br />Raheel Majeed (43) and Ahmed Shehzad (31) were other notable scorers for the visitors.', '', 1, 6, 0, 14, '2008-04-23 19:10:29', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:10:29', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(50, 'Salahuddin, Chunnu, Helal cleared to contest BFF election', 'salahuddin-chunnu-helal-cleared-to-contest-bff-election', '', 'The election commission of the Bangladesh Football Federation Wednesday rejected an appeal to scrap the candidatures of Kazi Salahuddin, Ashrafuddin Ahmed Chunnu and Golam Rabbani Helal. <br /><br />"It was settled earlier as the complaint did not file the allegations in time," said chief election commissioner Mesbah Uddin after hearing the issue for one and an half hours at the BFF House in Arambagh. <br /><br />The commission scrutinised the nominations on April 21. <br /><br />Replying to a query, Mesbah said he had arranged the hearing to prove himself unbiased. <br /><br />The verdict meant there is no barrier for Salahuddin, Chunnu and Helal to contest as president, vice president and member respectively. <br /><br />Barrister Tania Amir stood for the defendants, while Barrister Omar Sadat for the complaint. <br /><br />Shamsul Haq Chowdhury, councillor from the Chittagong Football Association Monday, lodged an appeal with the election commission demanding the cancellation of the three candidates for hiding relevant information in their nominations for the April 28 election. <br /><br />The nomination rules asked whether the candidate was earlier found guilty of criminal offences or convicted of crimes. <br /><br />The three filled out the nomination applications saying they had not been found guilty or convicted under the Criminal Procedure Code, but the complainant Tuesday in support of his appeal submitted two news clippings published in the Daily Ittefaq and the Dainik Bangla on Sept 23, 1982. <br /><br />The stories say a court had sentenced Helal and Anwar Hossain to six months and Salahuddin and Chunnu to one month and fined each Tk 1,000 for beating an assistant referee during a match against Mohammedan SC in 1982. <br /><br />Four Abahani players were arrested for the incident and found guilty in a one-day trial under the martial law the next day. <br /><br />All four footballers, however, came out of prison after 17 days following presidential clemency.', '', 1, 6, 0, 14, '2008-04-23 19:11:02', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:11:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(51, 'Somali pirates have not demanded ransom: Spain', 'somali-pirates-have-not-demanded-ransom-spain', '', 'Somali pirates who seized a Spanish tuna fishing boat at the weekend have not yet made any demands for a ransom, Spanish Foreign Minister Miguel Angel Moratinos said on Wednesday. <br /><br />Somalia said on Tuesday it had sent forces to free the boat, carrying 26 crew, after troops stormed another hijacked ship, freed its crew and arrested seven pirates. <br /><br />"There hasn''t been an offer from the hijackers and we don''t know what they want," Moratinos said in remarks broadcast on television. "First we have to hear what they are asking for, what they want ... so we''re going to wait." <br /><br />A surge in maritime hijackings for ransom in the waters off the coast of lawless Somalia have made it one of the world''s most dangerous shipping zones. French troops last week arrested six pirates who had seized a French luxury yacht and held its crew hostage for a week. <br /><br />Spain has sent one of its frigates and its ambassador to Kenya to Somalia to try and rescue the ship. <br /><br />France and the United States, with the help of Britain, are drafting a U.N. Security Council resolution authorizing countries to fight piracy off Somalia and elsewhere, France''s U.N. envoy said on Tuesday. <br /><br />Moratinos said Spain would support the resolution and would call a meeting between various countries involved to work out a way of improving security in the region.', '', 1, 7, 0, 21, '2008-04-23 19:48:07', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:48:07', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(52, 'Burundi rebels bomb capital, hit papal envoy`s home', 'burundi-rebels-bomb-capital-hit-papal-envoys-home', '', 'Rebels in Burundi fired mortar bombs at the capital Bujumbura, hitting the residence of the Pope''s envoy in the latest flare-up of violence that has killed 33 people in a week, the army said on Wednesday. <br /><br />Fighters from the Forces for National Liberation (FNL), the last active rebel group in the tiny central Africa nation, launched their attack from outside the city on Tuesday night. <br /><br />"We know that the FNL threw several bombs from hills around the capital," army spokesman Adolphe Manirakiza said. <br /><br />There were no reports of casualties from the latest in a series of clashes and bombardments in the last week that have undermined a shaky peace process in a country whose stability is seen as crucial to the volatile Great Lakes region. <br /><br />Witnesses said one mortar hit the residence of Vatican representative Paul Richard Gallagher. He was out of the country at the time, and it did not appear to be a targeted attack. <br /><br />FNL said the attack was self-defence against the military. <br /><br />"The army continues its harassment of our fighters using helicopters and other heavy arsenal, so what we are doing is to defend ourselves," rebel spokesman Pasteur Habimana said. <br /><br />The FNL''s persistent insurgency is seen by many as the final barrier to lasting stability in the coffee growing country of 8 million which is emerging from more then a decade of ethnic war that killed 300,000 people. <br /><br />Despite a 2006 peace deal, FNL have mounted sporadic attacks after talks to implement the accord were suspended last July when it quit a truce monitoring team accusing mediators of bias. <br /><br />Burundi has urged the United Nations and regional countries to take tough measures against the FNL rebels. <br /><br />"We should oblige the FNL to give up its arrogance and attacks so that it returns to the negotiating table unconditionally," Burundi''s Defence Minister Germain Niyoyankana told a meeting of military chiefs from neighbouring countries.', '', 1, 7, 0, 21, '2008-04-23 19:48:51', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:48:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(53, 'Confusion increases over Zimbabwe election', 'confusion-increases-over-zimbabwe-election', '', 'Uncertainty increased in Zimbabwe on Wednesday over a disputed election as pressure intensified for results to be announced from a presidential vote more than three weeks ago. <br /><br />Former colonial power Britain called for an arms embargo on Zimbabwe while analysts dismissed as unlikely a proposal that President Robert Mugabe should lead a unity government until new polls. <br /><br />Prime Minister Gordon Brown said he would propose an arms embargo, joining calls by South Africa''s Anglican church leader and Amnesty International. Brown repeated British accusations that Mugabe was trying to rig the elections and said this was "completely unacceptable". <br /><br />Pro-government commentator Obediah Mukura Mazombwe introduced new uncertainty by suggesting Mugabe should lead a transitional government to end the deadlock while new elections were organised. <br /><br />He said the solution should be mediated by Zimbabwe''s neighbours. But analysts said Mugabe and his ZANU-PF party were pressing ahead with plans for a runoff vote against opposition leader Morgan Tsvangirai. <br /><br />If adopted, Mazombwe''s idea would delay even longer any outcome from an electoral process that Zimbabweans hoped would end their misery under an economic collapse that has saddled them with the world''s highest inflation rate -- 165,000 percent. <br /><br />No results have been announced from a March 29 presidential vote which the opposition says it won, while the outcome of a parliamentary poll is also in doubt because of partial recounts. Officials said the first of 23 recounts had confirmed victory in one constituency for the ruling ZANU-PF party, which lost control of parliament for the first time in the election. <br /><br /><br />RECOUNTS <br /><br />The recounts could overturn the MDC parliamentary victory. <br /><br />Analysts said Mazombwe holds no position in the ruling ZANU-PF party and his comments may not have official backing. <br /><br />"There is no likelihood of that. A government of national unity is highly unlikely if you consider ZANU-PF''s hardening attitude and rhetoric," said Lovemore Madhuku, a Mugabe critic and chairman of the National Constitutional Assembly pressure group. <br /><br />"That is reading too much into an opinion which does not reflect what we are witnessing on the ground," Madhuku said. <br /><br />Tsvangirai''s Movement for Democratic Change (MDC), human rights groups and Western powers accuse ZANU-PF of launching a campaign of post-election violence. <br /><br />Tsvangirai says 10-15 MDC supporters have already been killed in the crackdown. <br /><br />The opposition leader says he won the presidential election outright and Mugabe''s 28-year rule is over. <br /><br />The government has clearly indicated it expects a runoff -- necessary if neither candidate wins an absolute majority. Such a vote would be held three weeks after the result is announced. <br /><br />Further muddying the waters, Zimbabwe postponed an annual summit of Africa''s COMESA trading bloc which it was due to host in the first half of May -- suggesting the government may expect electoral developments in that period. <br /><br />Cape Town Archbishop Thabo Makgoba called for a U.N. arms embargo against Zimbabwe, saying the plight of its people was heartbreaking. <br /><br />He said the delay in releasing election results eroded "any remaining trust the people may have in the electoral process". <br /><br />The South African army said there had been a clear increase in the number of people fleeing Zimbabwe since the election with almost 1,800 illegal immigrants caught at the border. Millions of economic migrants have already fled. <br /><br />Zimbabwe''s neighbours, previously passive despite the collapse of the country''s economy, this week took a harder line towards Mugabe, refusing to allow a Chinese ship to unload arms headed for the landlocked country. <br /><br />The United States has led international calls for Africa to do more to end the Zimbabwe crisis. Washington''s chief Africa diplomat, Assistant Secretary of State Jendayi Frazer, was due in South Africa on a previously-arranged regional tour. <br /><br />Archbishop Makgoba, in a clear reference to President Thabo Mbeki''s softly softly approach to Zimbabwe, said South Africa''s leaders appeared to many outside the country to be "heartless and unmoved by the suffering of Zimbabweans".', '', 1, 7, 0, 21, '2008-04-23 19:50:04', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:50:04', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(54, 'Carter denies State Dept. told him to shun Hamas', 'carter-denies-state-dept-told-him-to-shun-hamas', '', 'Former U.S. President Jimmy Carter denied on Wednesday that the State Department warned him not to meet with leaders of the Islamist group Hamas before he made a recent trip to the Middle East. <br /><br />Carter said Hamas'' top official Khaled Meshaal told him during meetings in Damascus on Friday and Saturday that Hamas would "accept a Palestinian state on the 1967 borders if approved by Palestinians." <br /><br />The United States brushed off the comments on Monday, arguing that Hamas'' basic stance, which includes a call in its charter for the destruction of Israel, had not changed. <br /><br />The State Department has said U.S. Assistant Secretary of State David Welch, the top U.S. diplomat for the Middle East, urged Carter not to meet with Hamas, a position restated by Secretary of State Condoleezza Rice, but Carter denied this. <br /><br />"No one in the State Department or any other department of the U.S. government ever asked him (Carter) to refrain from his recent visit to the Middle East or even suggested that he not meet with Syrian President (Bashar) Assad or leaders of Hamas," said a statement released by the Atlanta-based Carter Center, which speaks on the former president''s behalf. <br /><br />Hamas, which controls Gaza, is viewed as a terrorist organization by the United States, the European Union and Israel. <br /><br />The Carter Center statement said the former president attempted to call Rice before making the trip and a deputy returned his call since Rice was in Europe. <br /><br />"They had a very pleasant discussion for about 15 minutes, during which he never made any of the negative or cautionary comments described above. He never talked to anyone else," the Carter Center statement said. <br /><br />"President Carter has the greatest respect for ... Rice and believes her to be a truthful person. However, perhaps inadvertently, she is continuing to make a statement that is not true," the statement said. <br /><br />Carter''s reference to the 1967 borders spoke of the West Bank and Gaza Strip, which Israel occupied in the 1967 Middle East War, and to a referendum on a peace deal Washington hopes to clinch this year. <br /><br />Hamas won a 2006 election and briefly formed a unity government with Palestinian President Mahmoud Abbas. It seized control of Gaza from Abbas'' secular Fatah faction in fighting in June. <br /><br />Hamas has refused to accept major conditions laid down by the quartet of Middle East peace mediators. Those nations include the United States, Russia, the United Nations and the European Union.', '', 1, 7, 0, 20, '2008-04-23 19:51:14', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:51:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(55, 'Bush meets Jordan''s king before Palestinian talks', 'bush-meets-jordans-king-before-palestinian-talks', '', 'U.S. President George W. Bush held White House talks with Jordan''s King Abdullah on Wednesday as part of a diplomatic flurry this week aimed at shoring up the fragile Israeli-Palestinian peace process. <br /><br />Facing deep skepticism over his chances of forging a Middle East peace deal before he leaves office in January, Bush met Abdullah, an important player in regional diplomacy, on the eve of a meeting with Palestinian President Mahmoud Abbas in Washington. <br /><br />Abdullah stressed the need for U.S. support for Israeli-Palestinian negotiations, telling Bush the talks "should be based on clear grounds and fixed timeframes," the Jordanian Embassy in Washington said in a statement. <br /><br />Negotiations between Abbas and Israeli Prime Minister Ehud Olmert have shown little progress since a U.S.-hosted conference in Annapolis, Maryland, in November, where they pledged to try to reach a peace deal by the end of the year. <br /><br />Bush failed to achieve any breakthroughs during a visit to the region in January, and he will travel to Israel again in mid-May to celebrate the Jewish state''s 60th anniversary and try to advance peace efforts. <br /><br />Bush, who once disdained a hands-on role in Middle East peacemaking, seems intent on using the waning months of his presidency to shape a foreign policy legacy that encompasses more than the unpopular war in Iraq. <br /><br />Many analysts say that if Israelis and Palestinians are to resolve their decades-old differences, it will require direct, sustained presidential engagement. But Bush has made clear he has no intention of adopting what his administration once derided as predecessor Bill Clinton''s "shoot the moon" approach to peacemaking that failed at the end of his presidency. <br /><br />INCREMENTAL STRATEGY <br /><br />Bush''s talks with Abdullah -- whose country is one of two Arab states to have signed a peace treaty with Israel -- fit a more incremental strategy of lessening any damage to U.S. prestige in the Arab world should the overall initiative fail. <br /><br />White House spokeswoman Dana Perino dismissed the notion that Bush might cancel his Israel trip unless there is some kind of deal at hand. "The president looks forward to going," she told reporters. <br /><br />Secretary of State Condoleezza Rice was to meet Abbas on Wednesday to lay the groundwork for his talks with Bush. <br /><br />The Bush administration hopes to bolster Abbas, who essentially just controls the West bank after Hamas'' violent takeover of the Gaza Strip in June. <br /><br />Abbas wants U.S. pressure on Israel for a framework agreement that would outline the way sensitive final status issues can be resolved to establish a Palestinian state. <br /><br />"There is a chance and we don''t want it to be lost," Nabil Abu Rdainah, a senior Abbas aide, told Reuters. <br /><br />Olmert, also politically weak at home, has made clear he is looking for a vaguer list of "understandings." <br /><br />Negotiations have been bogged down by differences over Israeli settlement building in the occupied West Bank and violence in and around Gaza, where Hamas cross-border rocket fire has drawn an Israeli military response. <br /><br />In talks with Bush, Jordan''s Embassy said Abdullah told him Israel should refrain from "measures that would jeopardize negotiations with the Palestinians, and called for an end to all Israeli settlement activities, a lifting of the blockade and restrictions on the movement of Palestinians." <br /><br />Israel insists it is acting for its own security and self-defense, demands that the Palestinians do more to rein in militants and says it it has the right to build in large settlements it intends to keep in any final peace deal. <br /><br />Palestinian officials say if Abbas fails to win a framework deal by year-end, his credibility among his own people would be jeopardized and his Islamist rivals strengthened.', '', 1, 7, 0, 20, '2008-04-23 19:51:57', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:51:57', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(56, 'Gen. Petraeus picked to lead Iraq, Afghan wars', 'gen-petraeus-picked-to-lead-iraq-afghan-wars', '', 'U.S. Defense Secretary Robert Gates on Wednesday picked Gen. David Petraeus, widely praised as the top commander in Iraq, to lead all Middle East operations, including the Iraq and Afghanistan wars. <br /><br />Gates also chose Lt. Gen. Raymond Odierno, who recently served as Petraeus'' No. 2, to take over as the top commander in Iraq. <br /><br />Gates said Petraeus, who has overseen a military strategy credited with a dramatic reduction in violence in Iraq, was the most qualified general to lead U.S. Central Command and manage counterinsurgency operations in both wars. <br /><br />"I recommended him to the president because I am absolutely confident he is the best man for the job," Gates said. <br /><br />Gates said Petraeus has the ability to take on non-traditional threats, such as insurgencies, Islamic extremism and state-sponsored terrorism, that arise in the Central Command region. <br /><br />"I don''t know anybody in the United States military better qualified to lead that effort," Gates said. <br /><br />The Pentagon chief said President George W. Bush had approved both recommendations and would send the nominations to the U.S. Senate. <br /><br />Gates asked the Senate to approve the nominations by the end of May but said he did not anticipate the changes taking effect until "late summer or early fall." <br /><br />If confirmed by the Senate, Petraeus will replace former Adm. William Fallon, who resigned after a reported break with the Bush administration over Iran policy. <br /><br />At Florida-based Central Command, Petraeus will oversee U.S. operations in a region that includes Iran and 26 other countries as well as international waters that are both strategically and economically significant. That includes the Gulf and Straits of Hormuz. <br /><br />Central Command is considered the toughest combatant command assignment. <br /><br />"I am honored to be nominated for this position and to have an opportunity to continue to serve with America''s soldiers, sailors, airmen, Marines, coast guardsmen and civilians," Petraeus said in a prepared statement. <br /><br />Some lawmakers quickly praised Gates'' picks. <br /><br />"As the former commander of U.S. troops in Iraq, Ray Odierno clearly understands the broad picture," said Rep. Duncan Hunter of California, top Republican on the U.S. House of Representatives committee on armed services. <br /><br />"He worked hand in glove with Gen. Petraeus to implement the new counter-insurgency strategy in Iraq. He is enormously qualified and will do a superb job in his new role."', '', 1, 7, 0, 20, '2008-04-23 19:52:38', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:52:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(57, 'EU demands release of Belarussian activists', 'eu-demands-release-of-belarussian-activists', '', 'The European Union condemned on Wednesday the arrest and jailing of Belarussian opposition activist Andrei Kim and called for his immediate release. <br /><br />Kim was sentenced on Tuesday to 1-1/2 years in jail after being convicted of attacking a policeman at a protest by small entrepreneurs in January. <br /><br />EU External Relations Commissioner Benita Ferrero-Waldner, condemned the arrest and sentencing of Kim and seven others, calling the actions politically motivated. <br /><br />"They stand in direct contradiction with the fundamental values of freedom of expression and assembly that form an essential part of democracy, respect for human rights and the rule of law," she said in a statement. <br /><br />"I call for the immediate and unconditional release of all those arrested while demonstrating peacefully, as well as all other political prisoners." <br /><br />The seven other activists from the entrepreneur movement were given suspended sentences of up to two years. Two were fined. <br /><br />Western countries accuse Belarus President Alexander Lukashenko of flouting freedom of speech and assembly and hounding the small liberal and nationalist opposition. <br /><br />He has nevertheless tried to improve ties with the West, particularly the 27-nation EU, since quarrelling with his traditional ally Russia last year over energy supplies. <br /><br />EU ambassadors have welcomed earlier releases of jailed activists and have said a parliamentary election due in September could help consolidate ties', '', 1, 7, 0, 22, '2008-04-23 19:55:16', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:55:16', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(58, 'Britain says will push for arms embargo on Zimbabwe', 'britain-says-will-push-for-arms-embargo-on-zimbabwe', '', 'British Prime Minister Gordon Brown said on Wednesday he would put forward proposals for an embargo on all arms going to Zimbabwe. <br /><br />Brown said the situation in Zimbabwe, where there is a tense political standoff in the absence of results from the March 29 presidential election, was "completely unacceptable". <br /><br />"A message should be sent from the whole of the United Kingdom that what is happening in Zimbabwe -- failing to announce an election result, trying to rig an election result -- is completely unacceptable," Brown told parliament. <br /><br />A Chinese ship carrying arms to Zimbabwe was turned away from South Africa last week after workers there refused to unload the weapons because of concerns that Zimbabwean President Robert Mugabe''s government might use them against his opponents. <br /><br />Other neighbouring countries refused to let the vessel dock. <br /><br />"Because of what has happened in South Africa ... we will promote proposals for an embargo on all arms to Zimbabwe," Brown said, giving no further details. <br /><br />Zimbabwe is among the issues due to be discussed by European Union foreign ministers at a meeting in Luxembourg next week. <br /><br />Opposition leader Morgan Tsvangirai says he won the presidential poll. The ruling ZANU-PF lost its parliamentary majority in a parallel election, but a recount is underway in 23 constituencies. <br /><br />Brown urged all African nations and the international community to "make their views known about the unfairness of this election".', '', 1, 7, 0, 22, '2008-04-23 19:56:29', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:56:29', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(59, 'Jury shown new footage of July 7 London bombers', 'jury-shown-new-footage-of-july-7-london-bombers', '', 'Previously unseen surveillance footage of two of the July 7 London suicide bombers meeting a "committed terrorist" was shown on Wednesday to a court where three men accused of helping them are on trial. <br /><br />Mohammad Sidique Khan and Shehzad Tanweer, two of the four British Islamists who killed 52 commuters in the 2005 attacks, were shown walking down a road in east London with Waheed Ali, who is accused of involvement in the plot. <br /><br />The covert film was made in March 2004 by the security services who were monitoring another man, referred to as Ausman, who was described by prosecutors as a "committed terrorist". <br /><br />In the film, Ali, 24, is seen wearing a baseball cap walking in front of the bearded Khan with Ausman wearing a white shirt and Tanweer a woollen hat. <br /><br />Kingston Crown Court has already been told that Ali and co-defendants Mohammed Shakil, 31, and Sadeer Saleem, 27 are accused of helping the July 7 bombers scout for potential targets in the capital. <br /><br />During a reconnaissance weekend seven months before the bombings, two of the accused visited the London Eye, the Natural History Museum and the London Aquarium, prosecutors said. <br /><br />The court has also heard the men had extensive contact with the bombers, which had been uncovered through mobile records, fingerprints on documents, family videos and surveillance. <br /><br />Ali, Shakil and Saleem, from Beeston, Leeds, all deny a charge of conspiracy to cause explosions and say that although they knew the bombers, their friendship was innocent.', '', 1, 7, 0, 22, '2008-04-23 19:57:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:57:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(60, 'Hamas shows Carter its pragmatic face', 'hamas-shows-carter-its-pragmatic-face', '', 'Former US President Jimmy Carter extracted a whiff of pragmatism but no policy shift from Hamas chief Khaled Meshaal in talks that irritated US, Israeli and Palestinian leaders bent on isolating the Islamist group. <br /><br />After meeting Meshaal in Damascus at the weekend, Carter brandished his conditional agreement to a two state-solution as proof that Hamas would "accept Israel''s right to live in peace". <br /><br />Meshaal himself later made clear Hamas would not formally recognise Israel, but would accept a Palestinian state in all of the West Bank and Gaza Strip, with Jerusalem as its capital, full sovereignty and the right of refugees to return. <br /><br />No such peace deal is even remotely on the horizon -- Israel rejects each of these widely shared Palestinian demands -- but at least Meshaal spelled out publicly and clearly Hamas''s offer of a long-term accommodation with the Jewish state in its pre-1967 war borders. <br /><br />"What may have appeared as concessions when Carter spoke are in fact statements they (Hamas) have been promoting for some time," analyst Mouin Rabbani said by telephone from Jerusalem. <br /><br />"For Hamas, the meeting was a significant achievement in itself," he added. "They see Carter as a messenger to both Israel and the United States. They may see this, erroneously in my view, as opening some kind of channel of communication." <br /><br />President George W. Bush has shunned and vilified Hamas, whose triumph in Palestinian elections in 2006 shocked a U.S. administration that was advocating democracy in the Arab world. <br /><br />Dismissing Carter''s outreach to Hamas as unhelpful, U.S. Secretary of State Condoleezza Rice this week reiterated that President Mahmoud Abbas was the only Palestinian interlocutor. <br /><br />He embodied "the Palestinian leadership that has renounced violence and has negotiated with the Israeli government". <br /><br />Yet it remains unclear how Abbas and Israeli Prime Minister Ehud Olmert can advance toward the peace deal Bush had wanted by the end of 2008 while excluding Hamas, a powerful group which seized control of Gaza from Abbas''s Fatah faction last year. <br /><br />Carter''s overtures may have represented a modest step towards breaking an international boycott of Hamas, at little cost to itself, but are unlikely to open any doors in the United States under the next president, let alone the incumbent. <br /><br /><br />PRICE TOO STEEP <br /><br />"Even in a successor administration, direct dialogue is unlikely," said Nathan Brown, senior associate at the Washington-based Carnegie Endowment for International Peace. <br /><br />"The U.S. conditions -- acceptance of Israel, renunciation of violence, acceptance of past (Israeli-Palestinian) agreements -- are simply too steep a price for Hamas," Brown declared. <br /><br />Democratic White House contender Barack Obama on Tuesday described Carter''s talks with Hamas as a "bad idea". <br /><br />Hamas has in the past agreed that Abbas, as head of the PLO, could negotiate with Israel. Meshaal told Carter that any peace agreement reached must be subject to a referendum, preceded by reconciliation between Hamas and the secular Fatah faction. <br /><br />For now the two sides remain bitterly divided, with Fatah demanding that Hamas cede control of Gaza before any Palestinian power-sharing accord is reached. That makes it hard to see how any deal that Abbas might strike with Israel could stick. <br /><br />"It would be impossible for such an agreement to be properly ratified or implemented in the context of a continued schism between the two largest (Palestinian) movements," Rabbani said. <br /><br />Israel, which judged that Carter''s talks had produced "no change in Hamas''s extremist positions", is itself dealing with the Islamist group, albeit indirectly via Egyptian mediators. <br /><br />A Palestinian official familiar with those talks said he expected Hamas to reach an agreement with Israel this week on a reciprocal truce "in the Gaza Strip, at this stage". Hamas has previously insisted any ceasefire apply also to the West Bank. <br /><br />Carter had urged Hamas to agree a unilateral halt to rocket fire into Israel from Gaza, but Meshaal turned him down. <br /><br />"They (Hamas) said they''d prefer to continue and conclude the discussions with the Egyptians, which is another way of saying ''the Israelis are offering us more than you are, why should we accept your proposal?''," Rabbani said. <br /><br />Israel and Hamas might each have an interest in such pragmatic deals, without shedding their mutual hostility. <br /><br />"Some Israelis are interested in pursuing a modus vivendi with Hamas because they think that any comprehensive settlement ...is beyond reach at this point anyway," Carnegie''s Brown said. <br /><br />But the Israeli government does not want outsiders like Carter to help Hamas gain status as a negotiating partner -- even if that might improve prospects for a two-state solution. <br /><br />"The decision-makers want to retain the severe international isolation of Hamas and worry about any breach in that wall," Brown added.', '', 1, 7, 0, 19, '2008-04-23 19:58:23', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:58:23', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(61, 'Iran agrees to address atom arms allegations: IAEA', 'iran-agrees-to-address-atom-arms-allegations-iaea', '', 'Iran has agreed on steps to clarify Western intelligence alleging that it secretly studied how to design nuclear bombs, the UN atomic watchdog said on Wednesday, after earlier refusing to address the reports. <br /><br />Iran had previously rejected the reports as baseless or forged and said exchanges with U.N. investigators on the matter had resolved it and there would be no more discussions. But the U.N. watchdog insisted Iran back up its denials with evidence. <br /><br />"An agreement was reached during meetings in Tehran (on Monday and Tuesday) on a process that aims to clarify the so-called alleged studies during the month of May," International Atomic Energy Agency spokeswoman Melissa Fleming said in statement from IAEA headquarters in Vienna. <br /><br />Iran had given an upbeat assessment on Tuesday of the two days of talks with Olli Heinonen, the IAEA''s safeguards chief and top investigator, saying they were "positive" but not saying what was discussed. <br /><br />Diplomats close to the IAEA had said the point of the talks was to get substantive Iranian responses to intelligence reports alleging illicit nuclear bomb research. <br /><br />Iranian officials had said Heinonen''s visit was intended to "advance cooperation" with the IAEA, the U.N. body which monitors Iran''s declared nuclear activity and has been investigating the programme since 2003. <br /><br />Iran says its nuclear programme is a peaceful drive to produce electricity so that the world''s fourth-largest crude exporter can sell more of its oil and gas abroad. <br /><br />However, it has failed to convince the West, which believes Tehran is seeking technology so it can build atomic weapons. <br /><br />U.S. President George W. Bush and British Prime Minister Gordon Brown last week vowed to prevent Iran from developing a nuclear bomb, possibly by expanding sanctions.', '', 1, 7, 0, 19, '2008-04-23 19:59:15', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:59:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(62, 'US military says kills 15 gunmen in Baghdad', 'us-military-says-kills-15-gunmen-in-baghdad', '', 'US troops said on Wednesday they had killed 15 gunmen overnight in Shia areas of Baghdad, where fighting has raged for weeks between militiamen loyal to Iraqi cleric Moqtada al-Sadr and security forces. <br /><br />In a statement, the U.S. military said ground forces and aircraft had been involved in several attacks. The first began around dusk on Tuesday, the military said. <br /><br />One hospital in Sadr City, the Shi''ite cleric''s bastion in eastern Baghdad, said it had received five bodies overnight from clashes and air strikes. It said 22 people had been wounded. <br /><br />Police said it was one of the heaviest nights of clashes in weeks in the slum, home to two million people. <br /><br />Hundreds have died in and around Sadr City since Prime Minister Nuri al-Maliki, himself a Shi''ite, launched a crackdown on the cleric''s Mehdi Army militia last month. <br /><br />Sadr has demanded a withdrawal of U.S. troops from Iraq and threatened over the weekend to wage "open war" if Maliki did not call off the campaign against his fighters in Baghdad, the southern oil hub of Basra and other Shi''ite areas. <br /><br />Since Sadr issued his threat on Saturday -- which threatens to unravel months of security gains in Iraq -- the U.S. military says it has killed around 65 militiamen in Sadr City and other Shi''ite parts of Baghdad. <br /><br />The military said in one of the incidents overnight, troops were attacked with rocket-propelled grenades after a roadside bomb exploded. Soldiers returned fire, killing six gunmen. <br /><br />In another incident, it said an unmanned drone spotted two militants putting a mortar tube into a vehicle and then driving off. The drone fired a Hellfire missile, killing the two. <br /><br />"Along with our Iraqi security forces partners, we are targeting individual terrorists, criminal networks, and anyone involved in violent crimes against the Iraqi people," said U.S. Lieutenant-Colonel Steven Stover, a spokesman in Baghdad. <br /><br />Maliki has refused to back down in his confrontation with Sadr. The cleric backed the prime minister''s rise to power in 2006 but has since split with him over Maliki''s refusal to set a timetable for the withdrawal of U.S. troops from Iraq. <br /><br />At a meeting of foreign ministers from the region and Western powers in Kuwait on Tuesday, Maliki noted he had strong political support for his campaign to disarm militias. <br /><br />Maliki has threatened to bar Sadr''s movement from provincial elections on Oct. 1 if he does not disband the Mehdi Army. <br /><br />Sadr''s mass movement, which boycotted the last local elections in 2005, is expected to perform well at the expense of parties that backed Maliki, especially in the Shi''ite south.', '', 1, 7, 0, 19, '2008-04-23 19:59:48', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 19:59:48', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(63, 'Australia resorts to ''dynamic'' torch relay', 'australia-resorts-to-dynamic-torch-relay', '', 'Australian police promised on Wednesday a "dynamic" torch relay to dodge protesters when the Olympic flame travels the Australian leg of its troubled journey around the world. <br /><br />China had hoped the torch''s progress would be a symbol of unity in the run-up to the Beijing Games, but at several previous relays the flame has drawn anti-China protests over human rights and Beijing''s crackdown in Tibet, as well as pro-China demonstrations. <br /><br />The Australian relay is on Thursday, but Pro-Tibet demonstrators have already beamed laser signs onto the iconic Sydney Harbour Bridge reading "Don''t Torch Tibet", and a group of Tibetans on hunger strike was on a 70 km (43 mile) march to Canberra to rally against the torch relay. <br /><br />The flame landed at an air force base in the capital under the kind of protection usually afforded visiting world leaders. <br /><br />Thousands of pro-Tibet supporters have promised peaceful rallies during Thursday''s torch relay, while thousands of Chinese students were expected to rally in support of China. <br /><br />The Olympic torch''s appearance worldwide has been marked by heavy security and sharply curtailed celebrations. Tibet supporters disrupted the relay in London, Paris and San Francisco, prompting officials to boost security and shorten the torch relay in India, Malaysia and Indonesia. <br /><br />Australian organisers have dropped plans to run the torch past the Chinese embassy, near Australia''s national parliament, fearing the embassy could become a flashpoint for protests. <br /><br />Hundreds of extra police have been called in to protect the flame, which will be carried by 80 runners through barricaded streets on Thursday. <br /><br />Media reports said the Chinese embassy had hired 20 buses to bring supporters from Sydney and the southern city of Melbourne, an eight-hour drive from Canberra, to counter protesters. <br /><br />"We''re in a democratic country. If people want to protest, that''s a matter for them, as long as they do it peacefully," International Olympic spokesman Kevan Gosper told Reuters after watching the torch arrive. <br /><br />Aborigine Bunja Smith, who presented Chinese torch officials in Canberra with a traditional wooden message stick inscribed with the word "Peace", said Australia''s Aborigines understood the need for protest. <br /><br />"We are a people who have been repressed, but we ask the protesters to keep it a protest and not violent," he said. Australia''s five-time Olympic gold medal swimmer Ian Thorpe, who will run the final leg of the Canberra relay, said he also understood why people were demonstrating. <br /><br />"I''d just like to think that if you are going to protest on issues like this, it shouldn''t be centred around a particular event," said Thorpe. <br /><br />Relay organiser Ted Quinlan said he did not expect clashes, while a spokeswoman for China''s Foreign Ministry said on Tuesday she was confident the Canberra torch relay would be a success. <br /><br />DYNAMIC ROUTE <br /><br />Canberra police commander Mike Phelan said the torch route, expected to start with a lake-crossing, would have contingencies in place if expected protests turned violent. <br /><br />"The route as published is something that will be dynamic on the day," he said. <br /><br />Phelan stressed Australian police alone would handle security after Beijing Olympic Committee Spokesman Qu Yingpu hinted Chinese attendants could step in, prompting hurried denials from city officials. <br /><br />The chaotic scenes and perceived biased Western media coverage of the Tibet riots and the torch disruptions have sparked an outpouring of patriotic fervour among Chinese in and outside China. <br /><br />Chinese Internet users have rushed to send thousands of red national flags overseas to support the troubled torch relay ahead of the Olympics, state media said.', '', 1, 7, 0, 18, '2008-04-23 20:00:35', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:00:35', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(64, 'Modern-day geisha triumphs in closed, traditional world', 'modern-day-geisha-triumphs-in-closed-traditional-world', '', 'Just eight years ago, Komomo was a Japanese teenager living in Beijing, riding her bicycle around the city and playing pool with her friends on weekends. <br /><br />Now she is a geisha in Kyoto, Japan''s ancient capital, a proudly elegant member of a centuries-old but fading profession of female entertainers celebrated for their beauty, skill at traditional dance and music, and witty conversation. <br /><br />Unlike the old days when girls would become geisha through personal connections, 23-year-old Komomo (Little Peach) took her first steps towards the vocation by e-mail. <br /><br />As Komomo recounted in "A Geisha''s Journey," a book of essays and photographs by Naoyuki Ogino due out in May, she had no way of learning about the remote and secretive geisha world until she found a website run by Koito, a Kyoto geisha who also ran an okiya (geisha house). (http://www.e-koito.com) <br /><br />"I wanted to know more about my own country and that''s why I chose this world," Komomo told Reuters. <br /><br />Dressed in a formal crested black kimono with a brocade sash, her face covered in white makeup with just a touch of red at the eyes, she added: "I wanted to make Japanese history and customs a part of my daily life, not just wearing a kimono occasionally but every day and living life as they did in the old days." <br /><br />But this seemed impossible until she found Koito''s website, one of the first written by a working geisha. <br /><br />"I was so excited that I e-mailed Koito-san right away, telling her my dream of becoming a maiko, an apprentice geisha, but that I didn''t know how to begin," she wrote. <br /><br />The two corresponded for three years, until Komomo graduated from junior high school. Shrugging off the opposition of her parents, who wanted her to take a more conventional path of university and marriage, the 15-year-old headed for Kyoto. <br /><br />"I thought she wouldn''t last," said Kimiko Nasu, Komomo''s mother, who was visiting her only child. "She has a strong will, and in the geisha world you have to make yourself disappear." <br /><br />LESSONS DRIVEN HOME <br /><br />Komomo moved into Koito''s okiya in Miyagawa-cho, a cluster of narrow, stone-paved streets lined with wooden houses in central Kyoto. Her first weeks were spent learning to greet people with polite bows, wear kimono, and speak in the soft Kyoto dialect. <br /><br />"In the first year, every single day, it seemed I was scolded all the time. That was my job, to be scolded," said Komomo, who stands barely 150 cm (4 ft 11 inches) tall. <br /><br />"At evening gatherings, no mistakes are permitted, and this isn''t something you can just learn suddenly. It has to be driven home, as part of your daily life, so you won''t do anything embarrassing in front of the guests." <br /><br />Each demanding day begins with lessons in dance, singing, tea ceremony and music, and continues with parties -- the geisha''s real work -- from six until midnight. <br /><br />With only one day off every two or three months, Komomo at first sometimes longed for the life of an ordinary teenager, able to see movies on a whim. <br /><br />But she only thought of quitting briefly, during her first two weeks, when another girl decided to leave. <br /><br />"I realised then what my true feelings were. I thought, since I decided to do this, I might as well try really hard." <br /><br />Wearing an elaborate maiko kimono with long sleeves and a wide, trailing sash, and learning to walk in the costume without bumping into anything or anyone, especially during dance performances, was hard. Komomo also forgot rules and lost hair ornaments. <br /><br />"In our okiya we didn''t cry that much," she said. "My time in China was actually much harder at first." <br /><br />Komomo''s life overseas -- born in Mexico, she spent some years in Japan before moving to China -- has been a plus by helping her break the ice with guests. But there were problems. <br /><br />"At first I think I had some friction with ordinary life in Japan, and I was a bit cheeky. Here they say it''s best to act as if you know nothing, but actually be really clever. <br /><br />"Every so often, I got conceited from all the attention, but somebody soon brought me down to earth," Komomo said of her five years as a maiko. <br /><br />"It was actually refreshing to finally become a geisha because you''re not forced to be ''on'' for 24 hours a day." <br /><br />She declined to say what she earns, but bystanders at the theatre where she took part in a dance performance said she is popular. She owns a house, and its main room boasts a huge flat-screen TV and new model Macintosh computer. <br /><br />"I was told when I began that I''m not an incredible beauty so I should try to always keep a smile on my face. Beauties get work easily, but I need to work at it," she said. <br /><br />FUTURE FEARS <br /><br />Even so, she confessed to worries about the future. There are no pensions for geisha and they are not permitted to marry, though in the past some were supported as mistresses. Some even became single mothers. <br /><br />Though Komomo says she wants children, she has only been a geisha for two years and hasn''t thought about the future yet. <br /><br />"I don''t even have a boyfriend," she said. "I''m too busy to meet anyone, and the guests at the parties are my father''s age." <br /><br />Of greater concern is the fate of the geisha world itself. <br /><br />Geisha numbers in Japan peaked at 80,000 in 1928, but now only 1,000 are left. One of the six geisha districts in tradition-bound Kyoto has folded due to lack of business. <br /><br />The economic woes of the 1990s slashed the expense accounts of business executives who were once the mainstays of geisha, while politicians now shun lavish spending after scandals. <br /><br />A dinner with a geisha present can cost around 80,000 yen ($785) a person, depending on the venue and the number of geisha. <br /><br />Another problem is that men today tend to prefer less formal entertainment like karaoke or hostess bars. <br /><br />Many people, including Komomo, say the geisha world needs to open up more, and they say the Internet is an ideal tool. <br /><br />"In the old days, people only got to know geisha through introductions, but now people rely on the Internet to gather information," said Kyoko Aihara, a geisha expert and author. <br /><br />"Miyagawa-cho has introduced themselves on the net. They''re more flexible than some of the more traditional geisha areas, they want people to have fun -- and this is working for them." <br /><br />In a move to gently ease neophytes into the geisha world, Koito, who trained Komomo, runs an elegant bar on the first floor of her okiya where guests can meet geisha for relatively inexpensive prices. <br /><br />"History changes, so if you just offer the same thing it''s no good," she said. "The service you provide has to match the age." <br /><br />"We need to keep providing things the world needs," she added. "If we''re not needed anymore, all we can do is disappear." <br /><br />($1=101.89 Yen)', '', 1, 7, 0, 18, '2008-04-23 20:01:39', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:01:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(65, 'WTO should pressure food exporters: Mandelson', 'wto-should-pressure-food-exporters-mandelson', '', 'The World Trade Organization (WTO) should push food-producing countries to maintain exports to prevent a worsening of the international food crisis, EU Trade Commissioner Peter Mandelson said on Wednesday. <br /><br />Ballooning food prices have sparked riots in Bangladesh and brought down the government of Haiti, while some countries have banned exports of staple foodstuffs in an attempt to avert domestic shortages. <br /><br />Prices of rice, a staple in most of Asia, have risen 68 percent since the start of 2008. U.S. rice futures rose to an all-time high on Wednesday. <br /><br />"If we restrict trade, we''re simply going to add food scarcity to the already large problems of food shortages that exist in different countries," Mandelson said in an interview during a visit to Tokyo with an EU delegation. <br /><br />"The WTO stands for free trade. It needs to exert its pressure and influence to reduce tariffs and thereby encourage trade," he added. <br /><br />"It''s also got to stand up against export restrictions, export taxes, which too will stop the free flow of trade in foodstuffs and agricultural produce." <br /><br />Mandelson''s comments came a day after a concerned Japan, which relies on imports for much of its food, said it would propose the WTO set clear rules on food export restrictions. <br /><br />Trade bans on rice have been put in place by India, the world''s second largest exporter in 2007, and Vietnam, the third biggest, in the hopes of cooling domestic prices of the staple food. <br /><br />The export curbs have been criticised by the Asian Development Bank, which said Asian governments were over-reacting to surging food prices by resorting to market-distorting measures. <br /><br />In Thailand, the world''s largest rice exporter, farmers have planted a rare third crop and are expected to reap another 1.6 million tonnes of rice paddy this year. <br /><br />An incomplete 500,000 tonne tender by Manila last week has reinforced a perception in the Thai rice industry that demand is far outstripping supply, suggesting prices are set to continue the unprecedented surge of the last four months, exporters said. <br /><br />FOOD SPURS DOHA TALKS <br /><br />Mandelson said concerns over food and global financial turmoil were spurring progress towards an agreement on the Doha round of WTO negotiations, which aims to forge a deal to liberalise world trade. <br /><br />The next ministerial meeting on the Doha round may be held in late May or June, after speculation it could be in the week of May 19, Kyodo news agency quoted Mandelson as saying on Tuesday. <br /><br />European Commission President Jose Manual Barroso and Japanese Prime Minister Yasuo Fukuda on Wednesday expressed "strong concern" about rising food and fuel prices and agreed on the urgent need to address the issue, especially in developing countries. <br /><br />Mandelson and other European Commission officials leave Japan on Thursday for China, hoping to resolve disagreements over climate change and trade.', '', 1, 7, 0, 18, '2008-04-23 20:02:27', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:02:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(66, 'Samsung chief stands down; sorry for tax scandal', 'samsung-chief-stands-down-sorry-for-tax-scandal', '', 'South Korea''s most powerful businessman said on Tuesday he would step down after 20 years at the head of the giant Samsung Group following his indictment last week for tax evasion and breach of trust. <br /><br />The televised announcement by Lee Kun-hee, 66, who has achieved almost heroic status in South Korea for his role in the fortunes of Samsung, came as a shock even in a society long used to its top businessmen being hauled into court. <br /><br />But analysts pointed out Lee and his family still control the country''s largest conglomerate, sometimes dubbed the "Republic of Samsung" and whose dozens of affiliates account for around a fifth of South Korea''s exports. The group''s products range from computer chips and handphones to supertankers. <br /><br />"I will step down from the Samsung chairman position today. I am saddened as there is still much to do and a way to go," an apologetic but expressionless Lee said in a brief statement broadcast on national television. <br /><br />The group will dismantle its powerful strategic planning office, which critics say is an opaque organisation able to wield influence across some 60 affiliates, including flagship company Samsung Electronics, a world leader in computer memory chips and flat display screens. <br /><br />"I don''t see anything more than a change of people in charge. There''s no change at all in the fact that (the Lee family) will remain the owner," said Oh Suk-tae, an economist at Citibank. <br /><br />Lee''s son, Lee Jae-yong, seen as being groomed to take over, will step down from his executive post and work abroad for the group in another, unspecified role. <br /><br />Four other top executives also quit, including the head of the group''s strategic division and the CEOs of Samsung Fire and Marine Insurance and Samsung Securities Co Ltd. <br /><br />Shares in affiliates such as Samsung Securities and Samsung Construction & Trading fell by 4-8 percent on the news, that stunned markets and a public fascinated by the reclusive Lee, one of South Korea''s richest men and most revered business leaders. <br /><br />Samsung group firms account for 20 percent of total market capitalisation on the main board of the South Korean bourse. <br /><br />The group has more than 250,000 employees and its annual revenues of $160 billion are around the size of Singapore''s GDP. <br /><br />NO BANKING <br /><br />On two key issues, Samsung said it would not move into the banking sector, nor would it set up a holding company. <br /><br />There has been widespread speculation that once the government eases restrictions, the major family-run "chaebol", or conglomerates, would snap up local banks. <br /><br />A special prosecutor in January launched a probe into corruption allegations after a former top legal executive at the group said some of its top management hid money and kept a slush fund to bribe politicians, prosecutors and officials. <br /><br />The prosecutor indicted nine other Samsung executives. But it found no evidence to support the bribery allegation. <br /><br />If found guilty of tax evasion Lee could serve from five years to life in jail. <br /><br />South Korean conglomerates powered South Korea from the ashes of the 1950-53 Korean War to become Asia''s fourth-largest economy, but have been accused for years of creating impenetrable management structures. <br /><br />Critics say few changes have been made over the years at the family-run business groups, despite a number of high-profile convictions of their leaders. <br /><br />"This cannot be considered a major reform measure even with Lee stepping down, because the management structure of Samsung is built up so that he can influence it as he wishes anyway," said Park Won-suk, a senior official with the People''s Solidarity for Participatory Democracy. <br /><br />"We see this announcement as one with perhaps symbolic and visible results, but all the essential points related to the management structure are not included. It failed to address the core of the issue," said Park, whose group has for years called for reform of Samsung management practices. <br /><br />In contrast, pro-business groups have voiced concerns that the probe has delayed important management decisions at Samsung. <br /><br />The Korean Federation of Industries called the announcement "shocking".', '', 1, 7, 0, 17, '2008-04-23 20:03:27', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:03:27', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(67, 'Malaysia rights panel sees migrant social time bomb', 'malaysia-rights-panel-sees-migrant-social-time-bomb', '', 'Malaysia''s crackdown on illegal immigrants is taking a toll on the government as detention camps are filled to the brim and deportation plans have hit snags, the country''s rights body said on Tuesday. <br /><br />"It is like a time bomb," said Siva Subramaniam, a member of Malaysia''s national human rights commission, Suhakam. "There should be a rethinking of the situation." <br /><br />Malaysia holds some 10,000 illegal immigrants at immigration detention camps which rights campaigners say are more like "caves" due to overcrowding and appalling conditions. <br /><br />"These are not healthy places and are too overcrowded," Subramaniam said. "Some people have been languishing for too long. Some of them are mentally disturbed." <br /><br />His comments came after detainees from Myanmar rioted at a Malaysian holding camp on Monday, torching a building, after hearing they had apparently been denied asylum in a third country. <br /><br />In the incident at the Lenggeng camp just south of Kuala Lumpur, some 72 Myanmarese forced their way into an administrative block and set it ablaze. <br /><br />"They were disappointed on hearing the UNHCR (the U.N. Nations High Commissioner for Refugees) couldn''t get a placement for them in a third country," the Immigration''s head of enforcement, Ishak Mohammad said on Monday. <br /><br />The UNHCR said no refugees detained in Lenggeng had been delivered any news that their resettlement request was denied. <br /><br />There are 75 refugees and asylum-seekers known to UNHCR in Lenggeng. "Our records indicate that their cases are still being actively processed by our office," a UNHCR spokesperson in Malaysia said. <br /><br />Subramaniam said he would lead a Sukaham mission to the camp on Thursday to investigate Monday''s riot. Malaysia, a magnet for unskilled and semi-skilled Asian labour, is home to around 3 million foreign workers, 1 million of whom are working illegally. <br /><br />In addition, the country has about 39,000 refugees registered with the UNHCR, the body said. <br /><br />Home (Interior) Minister Syed Albar said at the weekend the government was up to its neck with foreign worker problems. <br /><br />"Malaysia cannot take more foreign workers," he told the Star newspaper. He said Taiwan, with a population of 23 million people, has only 400,000 foreign workers. Malaysia has 27 million people.', '', 1, 7, 0, 17, '2008-04-23 20:04:08', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:04:08', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(68, 'China says Hu''s Japan visit won''t resolve gas row', 'china-says-hus-japan-visit-wont-resolve-gas-row', '', 'China''s ambassador to Japan has played down expectations that a row over natural gas resources in the East China Sea can be settled during a May visit by President Hu Jintao, the Foreign Ministry reported on Wednesday. <br /><br />A dozen rounds of official-level talks between the Asian giants have failed to yield a resolution over how to use the resources in parts of the sea over which both sides claim economic rights. <br /><br />"Of course we hope the problem can be resolved at an early date," Ambassador Cui Tiankai said in an interview with Japan''s Fuji TV reprinted on the Web site of the Chinese Foreign Ministry (www.fmprc.gov.cn). <br /><br />"But the East China Sea question is very complicated and there are many technical questions to be resolved so it would be inadvisable to directly connect it with the leadership visit." <br /><br />"Otherwise, not only will it interfere with the visit, it will not be helpful to resolving the problem," Cui said. <br /><br />Earlier, Cui had said China hoped the issue could be settled in time for Hu''s trip, which is expected in early May and which will be the first by a Chinese head of state to Japan in 10 years. <br /><br />It follows reciprocal visits by Chinese Premier Wen Jiabao and Japanese Prime Minister Yasuo Fukuda in the past year, as ties warm between the former wartime foes despite the outstanding gas issue. <br /><br />Japan''s World War Two invasion of China has shadowed relations and, as China has grown into the world''s fourth-largest economy, the two have become strategic competitors for influence in the region. <br /><br />But leaders of both countries have indicated they are keen to keep ties on a more even keel after they reached a crisis point three years ago when anti-Japanese protests erupted across China.', '', 1, 7, 0, 17, '2008-04-23 20:04:38', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:04:38', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(69, '	Iran`s leader to visit India to deepen energy ties', '-irans-leader-to-visit-india-to-deepen-energy-ties', '', 'Iranian President Mahmoud Ahmadinejad will make his first official visit to India next week in a sign of the two countries'' ambitions to deepen energy ties despite opposition from the United States. <br /><br />Ahmadinejad will spend only a few hours in India on April 29 in a stop-over after a visit to Sri Lanka. He is due to talk to Prime Minister Manmohan Singh in a trip that has already sparked diplomatic barbs between New Delhi and Washington. <br /><br />Energy issues will top the agenda during the visit, a government official told Reuters. <br /><br />Nuclear-armed India, hungry to tap new sources of energy to fuel its booming economy, is looking to Iran as a long-term energy partner. <br /><br />New Delhi is hoping to kickstart stalled negotiations over a multi-billion dollar deal to pipe natural gas to India from Iran via Pakistan. <br /><br />New Delhi also wants to revive a 2005 agreement to import 5 millions of tonnes of liquefied natural gas from Iran. <br /><br />Washington has opposed the pipeline, which its fears will fund Iran''s nuclear ambitions. <br /><br />Washington urged India this week to use Ahmadinejad''s visit to encourage Iran to stop nuclear enrichment. India responded late on Tuesday by saying that it did not need "any guidance" on conducting its bilateral relations. <br /><br />"Both nations are perfectly capable of managing all aspects of their relationship with the appropriate degree of care and attention," the Ministry of External Affairs said in a statement. <br /><br />India will also hope to improve diplomatic relations with Tehran after it voted against Iran at the International Atomic Energy Agency in 2006, as well as its launch of an Israeli spy satellite earlier this year. <br /><br />DAMAGE CONTROL <br /><br />"India is now eager to repair the damage and is looking at its long-term strategic interest by playing their Iran card, like on energy issues," said Brahma Chellaney at the Centre for Policy Research. <br /><br />India has been boycotting trilateral meetings on the Iran pipeline since mid-2007, citing it first wanted to resolve the issues of transit fees and transportation tariffs with Pakistan. <br /><br />The proposed pipeline would initially carry 60 million cubic metres (2.2 billion cubic feet) of gas daily to Pakistan and India, half for each country. The capacity would be raised to 150 million cubic metres at a later date. <br /><br />India''s Petroleum Minister Murli Deora is also visiting Pakistan this week to talk about the pipeline, the first formal contact between the two countries since a new coalition government took office in Islamabad last month, according to state-run media. <br /><br />There have been no indications India will discuss nuclear technology with the Iranian president. <br /><br />In the early 1990s, India was reported to have offered some help on building a civilian research reactor in Iran under international safeguards but backed down after U.S. pressure. There have been no reported offers of assistance since, Chellaney said. <br /><br />India has invested in civilian nuclear reactors to help fulfil its increasing power demand and plans to nearly double capacity by 2011. India conducted a nuclear weapons test in 1998, leading then to sanctions from the United States. <br /><br />Under discussion will be the role of Indian companies in the development of Iran''s energy sector amid U.S. pressure not to invest in the country. <br /><br />Last year, India''s privately run firm Essar backed down from setting up a refinery in Iran that would have violated U.S. sanctions. <br /><br />Oil and Natural Gas Corp (ONGC), India''s top explorer, has been in talks to develop oil and gas fields in Iran. <br /><br />Iran has the world''s second-largest reserves of oil and gas, and sees companies in India as less susceptible than many others to Western pressure over Tehran''s nuclear programme.', '', 1, 7, 0, 16, '2008-04-23 20:05:42', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:05:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(70, 'Mumbai`s bid to be global finance hub laden with hurdles', 'mumbais-bid-to-be-global-finance-hub-laden-with-hurdles', '', 'With one of Asia''s largest slums, congested streets and sometimes startling whiffs of human waste, Mumbai may not be everyone''s first choice for a world-class financial centre. <br /><br />Yet that is exactly what India hopes it will become in the next decade as it rises to the challenge of financing one of the world''s fastest growing major economies after China. <br /><br />"I think we are where China was with a lag of maybe 10 years," K.V. Kamath, chief executive of ICICI Bank, India''s largest private bank, told a conference recently. <br /><br />"That is the catch-up time that we need to build various structures whether they are financial or whether they are real ... to provide the sort of momentum that we need." <br /><br />Formerly known as Bombay, Mumbai is a bustling port on India''s west coast. Home to 17 million people, it is already a base for two stock markets, their watchdog and the central bank. <br /><br />The city which overlooks the Arabian Sea is the face of old and new India: bullock carts toil alongside shiny sedans, shanties slope from walls near glazed offices, and sea vistas take your breath away with the low-tide stench of sewage. <br /><br />But India''s central government envisages a time when Mumbai will be a gleaming financial hub not too far removed from London, Dubai and Singapore. <br /><br />To this end it has appointed a panel to study ways of turning Mumbai into the sort of place where a high-rolling banker might want to live. <br /><br />Democratic government, a vast and growing economy, a large English-speaking workforce and a time zone overlapping Asia and Europe all work in the city''s favour, although markets need to be liberalised and the financial and legal system must improve. <br /><br />But financial reforms are nothing compared to the Herculean task of revamping Mumbai''s infrastructure and housing, an initiative that will probably cost tens of billions of dollars. <br /><br />HERCULEAN TASK <br /><br />With its pockets of faded British colonial grandeur, Mumbai is beset by infrastructure problems: debilitating traffic, a lack of housing, poor water delivery, with some homes served simply by water trucks, and an unreliable power system that results in routine power cuts in the suburbs. <br /><br />Even the geography of the city, a series of islands joined by reclamation, works against it. Space is at a premium and the city is getting increasingly cramped as an estimated 300 poor families arrive each day in search of work. <br /><br />The city''s infrastructure is rusty and overloaded. Six million people a day cram into -- or on top of -- its battered commuter trains. <br /><br />Efforts are underway to modernise the infrastructure, but observers say the massive sums of money involved are just a drop in the ocean. <br /><br />The Municipal Corporation of Greater Mumbai has budgeted 18 billion rupees ($450 million) to upgrade roads and bridges and 29 billion rupees to improve water supply this fiscal year. <br /><br />"Our journey on urban investment is just beginning," Ramesh Ramanathan, founder of the group Janaagraha, which pushes for civic reform, told a conference recently. <br /><br />"These numbers are insignificant ... compared to the true amount of money that will have to be invested in infrastructure over the next 15 to 20 years," he said. <br /><br />Officials are tackling some issues: corporation figures show 19 billion rupees allocated to widen century-old storm drains after about 1,000 people died in severe monsoon floods in 2005. <br /><br />Sanjay Ubale, secretary of special projects for the state of Maharashtra, of which Mumbai is the capital, says 250 new trains are on the way. <br /><br />Last year, a law that controlled urban land holdings was scrapped, potentially freeing large areas for development. <br /><br />High-rises increasingly dot the skyline and a second international airport is planned for the city''s outskirts. <br /><br />DEMOCRACY, BUREAUCRACY <br /><br />Further progress is hampered by miles of red tape and the housing shortage is not helped by a 1947 rent control act, that keeps rents for long-time tenants far below modern-day market rates and makes it difficult to get people out. So while a well-to-do family may live in a three-bedroom apartment in a choice part of town for just 250 rupees ($6.25) a month, newcomers are likely to pay 800 times that sum at $5,000 or more -- similar to rentals in London or New York. <br /><br />"Mumbai has been plagued by draconian urban regulations for the past 50 years," said Alain Bertrand, an urban development expert who previously worked for the World Bank. "(We must) find an equitable solution to get out of rent control." <br /><br />For the less well-off, there are plans to tear down one particular shantytown, Dharavi, a thriving slum considered to be one of Asia''s largest, and resettle families in high-rises. Many slum residents are opposed as they fear losing their livelihood. <br /><br />"It''s impossible to arrive in Mumbai and offer any solutions because everything is paled by the complexities of the problem," Ramanathan said. <br /><br />Authorities aim to attract $39 billion in private investment and Ubale says firms are interested in bidding for projects such as a light rail system in the north of the city. <br /><br />But implementation is fraught with problems. Bureaucracy, land acquisition and perhaps most importantly finding a fair solution to rehouse displaced people, estimated at 57,000 in the case of Dharavi alone, are a few of the obstacles. <br /><br />"It''s not just a question of funding, but of executing projects on time and maintaining them properly," federal Urban Development Minister S. Jaipal Reddy said. <br /><br />Despite all the challenges ahead, ICICI''s Kamath is upbeat on Mumbai''s progress towards becoming a world-class centre. <br /><br />"It may not happen tomorrow, but it is inevitable," he said.', '', 1, 7, 0, 16, '2008-04-23 20:06:19', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:06:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(71, 'India begins massive census to map future', 'india-begins-massive-census-to-map-future', '', 'India has begun preparing for what is one of the world''s biggest ever censuses, a survey by millions of volunteers that could affect government policies and reveal how economic growth has affected the population. <br /><br />Thousands of officials have started the long-drawn process of mapping cities, towns and villages that is likely to throw up new information on the changing demographic profile in the country. <br /><br />Millions of volunteers and census officials will visit every household around the country in the next few years to gather information on jobs, education and quality of life. <br /><br />India''s population is projected to grow to 1.19 billion in 2011 from 1.13 billion in 2008, according to census authorities. <br /><br />More than a decade of reform programmes is estimated to have pushed India''s long-term economic growth rate to around 8.7 percent this fiscal year. But India urgently requires more infrastructure and creation of new jobs. <br /><br />India produces 2.5 million graduates every year, but only about 15 percent are suitable for jobs in technology and outsourcing, home ministry officials say. Millions still live in acute poverty. <br /><br />"The census will be a review of trends of the high growth rate economy and it is going to be the report card on how the population has responded to it," Abheek Barua, chief economist at the HDFC Bank said. <br /><br />India''s last census in 2001 revealed an increasing demographic divide between poorer states in the north and the economically better-off south. <br /><br />Experts say the imbalances have fanned political tensions, with Hindu hardline groups in India''s financial capital of Mumbai threatening poorer migrant labourers from north India. <br /><br />"The census will tell us the patterns of migration and where is the emergence of the young urban population taking place," Barua says. <br /><br />Unlike China, which has an ageing population, the result of the country''s one-child policy, half of India''s population according to the 2001 census was younger than 25 years. <br /><br />"It is an advantage to India and this census will provide vital information about the young population and where exactly is all the so-called development heading," Bikram Sen, a former census director, said.', '', 1, 7, 0, 16, '2008-04-23 20:06:54', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:06:54', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(72, 'China to reopen Tibet to foreign tourists soon', 'china-to-reopen-tibet-to-foreign-tourists-soon', '', '<img src="images/stories/lifestyle/200804/tibet_namtso_lake_01.jpg" border="0" align="right" />China will reopen the restive mountainous region of Tibet to foreign tourists "soon" and temples will also resume religious activities, state media said on Saturday, in the wake of pro-independence protests last month. <br /><br />"The Tibet tourism bureau is doing its utmost to prepare for the reopening of all tourist spots," the official China Daily cited a government statement as saying, though it did not provide an exact date. <br /><br />Chinese media had reported that the region would reopen to foreign tourists from May 1, though officials have not confirmed this and a U.S.-based rights group says Beijing does not plan to allow foreigners in until after this August''s Olympics. <br /><br />Tourism is a vital source of cash for the impoverished region, where 4 million tourists last year flocked to see historic temples, experience Tibetan culture and enjoy breathtaking natural scenery. <br /><br />All foreigners visiting Tibet need special permits. <br /><br />The Xinhua news agency added that Lhasa temples affected by the unrest would also restart their religious activities soon. <br /><br />It paraphrased Tibetan official Tubdain Cewang as saying "Lhasa''s temples were recovering from the riot, with religious activities returning to order, and would reopen to tourists in the near future". <br /><br />The Drepung Monastery "will soon hold activities including Buddhist services and debates on Buddhist doctrines five times every month, as before the March 14 riot hit the city", it quoted the temple''s administrative director Ngawang Dongjue, as saying. <br /><br />That report did not provide a date either. <br /><br />Beijing has accused the Dalai Lama, Tibet''s exiled spiritual leader, of masterminding the unrest as part of a bid for independence and with an eye to spoiling the Beijing Games. The Dalai Lama rejects the accusations and says he does not seek independence for Tibet. <br /><br />China continued its verbal attacks on the Dalai Lama on Saturday, blasting him in the overseas edition of the Communist Party mouthpiece the People''s Daily for trying to use the cause of human rights to advance his agenda. <br /><br />"''Human rights'' seems like a trump card that the Dalai has a keen interest in. He loves to play it, and he plays it well," the newspaper said in a commentary on its front page signed by a senior editor. <br /><br />But his failure to condemn "the cruel injuries inflicted on innocent Tibetans and Chinese by hooligans and their burning of shops and schools", showed his true colours, it added. <br /><br />"In the history of China and other countries, is it possible to find a ''human rights guard'' like this?" the newspaper said. <br /><br />The Dalai Lama has spoken out against the use of violence, calling for talks with China and backing the Beijing Games. <br /><br />China says he is insincere, though.', '', 1, 9, 0, 23, '2008-04-19 00:00:00', 62, '', '2008-04-23 20:46:39', 62, 0, '0000-00-00 00:00:00', '2008-04-19 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(73, 'Australia`s brightest brain-storm for progress', 'australias-brightest-brain-storm-for-progress', '', '<img src="images/stories/lifestyle/200804/sydney_opera_house_01.jpg" border="0" align="right" />Aborigines with didgeridoos and wearing loin cloths opened a summit of Australia''s brightest minds on Saturday, with Prime Minister Kevin Rudd urging fresh ideas to solve indigenous inequality and ease climate change. <br /><br />"Today we are throwing open the windows of our democracy to let a little bit of fresh air in," Rudd told the gathering of corporate chiefs, scientists, unionists and central bankers, as well as Hollywood actors Cate Blanchett and Hugh Jackman. <br /><br />The two-day summit at parliament aims to throw up at least 10 big ideas to improve Australia''s future by 2020, including governance, lifting creativity and how to narrow a 17-year life expectancy gap between black and white Australians. <br /><br />Other issues for the 1,000 attendees include tackling drought, how to spend billions of dollars from the country''s China-driven resource export boom and keep economic growth rolling at near 3.9 percent a year. <br /><br />"We need to anticipate change ahead or else we''ll be swamped by it," Rudd said, pointing to the rise of China and India fast re-shaping the world''s future, before appearing to doze off in one televised session on climate change. <br /><br />Power participants included the chief executive of mining giant BHP Billiton, Marius Kloppers, and Australia''s richest man and Fortescue Metals mining head Andrew Forrest, who mingled with military commanders and welfare workers. <br /><br />Treasurer Wayne Swan told economic thinkers, including Reserve Bank chief Glenn Stevens, they had "a hunting licence for new ideas" on dealing with an ageing population, inflation touching 3.6 percent and not squandering the resource boom. <br /><br />"Our terms of trade are likely to increase more in the coming year than they have in any year since the boom began," Swan said, just weeks from an austere May 13 Budget delivering a expected surplus of around A$20 billion to combat rising inflation. <br /><br />MAD, BAD -- OR BOTH <br /><br />Aboriginal Ngambri tribe elder Matilda House-Williams, wearing a cape of possum fur, opened the summit with a challenge to improve the lives of indigenous people, who often live in remote settlements with poor access to health and education. <br /><br />"I want to see our people healthy, living in this lucky country. That''s a target," House-Williams said, urging Rudd and others to be open to ideas "mad or bad, or both". <br /><br />Rudd, whose centre-left Labor government ended almost 12 years of conservative rule in November, said he would respond to summit suggestions by the end of the year. <br /><br />"I say it''s worth having a go through this summit, even if we fail. What is there to be lost from trying?" Rudd said. <br /><br />Oscar-winning actress Cate Blanchett, chairing a creativity brainstorming panel, brought her third son Ignatius, born only six days earlier. <br /><br />"Cate Blanchett is a superwoman. I think she is flawless as a person and I am thrilled that she is leading our stream," said fellow participant Hugh Jackman, who starred as "Wolverine" in the X-Men cinema franchise. <br /><br />($1=A$1.07)', '', 1, 9, 0, 23, '2008-04-19 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-19 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(74, 'Smoke cloud engulfs Argentine capital for 5th day', 'smoke-cloud-engulfs-argentine-capital-for-5th-day', '', '<img src="images/stories/lifestyle/200804/cape_town_fire_01.jpg" border="0" align="right" />A thick cloud of smoke covered Buenos Aires for a fifth day on Saturday, the fallout of field burning that has forced the closure of highways, flight delays and traffic congestion. <br /><br />The smoke started to appear over the Argentine capital more than a week ago, but visibility deteriorated considerably in the city on Friday and Saturday, with an acrid smell pervading homes and causing watery eyes and sore throats among city residents. <br /><br />Visibility downtown was barely 500 yards (metres). <br /><br />Emergency services marshaled traffic in some areas of the city, while the capital''s domestic airport Jorge Newbery diverted incoming aircraft to the international airport outside Buenos Aires -- where the smoke also caused some flight departure delays. <br /><br />The dense smoke along highways in rural areas north of Buenos Aires caused traffic accidents that killed at least nine people, officials said on Friday. <br /><br />Health officials sought to reassure the public that the smoke was not toxic, saying the material burnt was organic. However the municipality of Buenos Aires issued a "yellow alert" as a precaution. <br /><br />Authorities said ranchers caused the haze by igniting fires across 70,000 hectares (173,000 acres) of pasture. The fires clear vegetation and renews soil nutrients and fresh pasture growth for their cattle. <br /><br />Satellite images showed wind carrying a swathe of white over the capital and across the River Plate as far as Uruguay. <br /><br />The government said on Friday efforts to contain the fires were failing and that it would prosecute farmers. <br /><br />The national meteorological service said northerly winds would continue to carry the smoke toward the densely populated Buenos Aires area in coming days. It said there were no rains on the way to help extinguish the blaze. <br /><br />Setting light to grasslands is common practice in Argentina, but the smoke cloud shrouding the capital is unusual. Officials put the phenomenon down to the extreme dryness of pastures coupled with a northerly wind,', '', 1, 9, 0, 23, '2008-04-19 00:00:00', 62, '', '2008-04-23 20:57:31', 62, 0, '0000-00-00 00:00:00', '2008-04-19 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(75, 'Woman pleads guilty in Craigslist murder-for-hire', 'woman-pleads-guilty-in-craigslist-murder-for-hire', '', '<img src="images/stories/lifestyle/200804/craigslist_bust_01.jpg" border="0" align="right" />A Michigan woman who advertised online for a hitman to kill her lover''s wife pleaded guilty to the murder-for-hire scheme, prosecutors said on Friday. <br /><br />Anne Marie Linscott, 49, faces 10 years in prison for each of three federal charges, including intent to commit murder, the U.S. Attorneys for the Western District of Michigan and the Eastern District of California said in a joint statement. <br /><br />In November 2007, three California residents searching job listings on Craigslist.com found an advertisement for a "freelance" position posted by Linscott, according to court documents. The three job seekers contacted California police. <br /><br />The defendant asked two of the respondents via e-mail to "eradicate" the victim and provided the victim''s name, age and employment address. In one correspondence, she said she was looking for "silent assassins" and offered to pay $5,000 to kill the victim, who was not identified by the court. <br /><br />"This IS a serious proposition," Linscott said via e-mail. Her account name was "bourne2run." <br /><br />Linscott, a resident of Rockford, Michigan, met her lover while taking an online college course several years ago. Linscott and the man, identified in court documents only as Duane, carried on a sexual affair, meeting in Reno, Nevada, in 2005 and 2007. They spoke on the phone and corresponded by e-mail, filings said. <br /><br />As part of a plea deal between the government and Linscott, prosecutors agreed to drop charges she had left an incendiary device outside her rival''s house in April 2007. <br /><br />Sentencing has yet to be scheduled.', '', 1, 9, 0, 23, '2008-04-19 00:00:00', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-19 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 1, 'robots=\nauthor='),
(76, 'Texting while driving? Time to unplug', 'texting-while-driving-time-to-unplug', '', '<img src="images/stories/lifestyle/200804/texting%20while%20driving_01.jpg" border="0" align="right" />Sharon Sarmiento knew it was time to unplug when she realized she was blogging in her dreams and hearing imaginary instant messages. <br /><br />For Ariel Meadow Stallings, it was the hours lost while surfing the Internet that left her feeling like she had been in a drunken blackout. <br /><br />Both women are part of a new grass-roots movement in which tech geeks, Internet addicts, Blackberry thumbers and compulsive IMers are deciding to wrest back control of their lives by daring to switch off -- if only for a day. <br /><br />"I think there is some common-sense part of us that says, ''Wait a second. This has gone too far. We are too plugged-in,''" said Sarmiento, a 30-something virtual business owner and professional blogger in Alabama. <br /><br />"It''s like our mind is going in a million different directions all the time. So taking a day when you are completely cut off from technology forces you to re-engage with the real world," she said. <br /><br />Some call it the "secular Sabbath." For others it is "unplugged day." In Quebec, Canada, professional computer developers Denis Bystrov and Ashutosh Rajekar are organizing a global "Shutdown Day" in May. <br /><br />Stallings, 33, a Seattle author, blogger and part-time marketing manager for Microsoft Corp, made a resolution in January to spend "52 Nights Unplugged" this year. <br /><br />"I love technology. I''m not a Luddite. But I realized it was a problem when I would sit down to check my email and it was almost like I would wake up six hours later and find I was watching videos of puppies on YouTube. <br /><br />"I''d try and think what I had been doing for the past two hours and I had no idea. I associate that kind of time loss with blackouts when you''re drunk," she said. <br /><br />So Stallings took the plunge, accompanied by twitchy emotional withdrawal symptoms, and turned off her computer, email, cellphone and television on Wednesday nights. <br /><br />In an ironic twist, she quickly spread the word through her blog (http://52nightsunplugged.ning.com), and connected with thousands of people across the world who habitually text while driving, take their laptops to the bathroom, or check e-mail during dinner. <br /><br />"I thought it was just a problem that affected me and my geeky colleagues. But then I started hearing from Italians with similar issues, and Poles and Czechs, and I even got a query from someone in Colombia. <br /><br />"So I realize it''s not just an American problem but an international one," Stallings said. <br /><br />THOU SHALT UNPLUG <br /><br />Dr. Dave Greenfield, who runs the Center for Internet Behavior in Connecticut, said most people thought it was a joke when he first started warning about compulsive Internet use in his 1999 book "Virtual Addiction." <br /><br />Greenfield said various studies estimate that 1 to 10 percent of the U.S. population uses technology in a way that negatively impacts their lives, relationships, health or jobs. <br /><br />But he says it''s rare for any kind of addict -- be it to drugs, alcohol, gambling or technology -- to take the kind of initiative seen by the unplugged movement. <br /><br />"It is very unusual for somebody to present for help without having been dragged there by a parent or loved one, unless they have gotten in trouble with the law or with their job," he said. <br /><br />"The collective denial that any culture has around new technology takes a long time to erode," Greenfield said. <br /><br />Sarmiento, who writes a blog called eSoup (http://www.esoupblog.com/), said she has taken up painting again and become involved in volunteer projects since beginning her own "digital day of rest" two months ago. <br /><br />Now she sometimes unplugs for an entire weekend. "I had to work up to that," she admits. "It is nice. It feels like you are going on a little retreat. It has opened up more quality of life for me." <br /><br />"I have dream blogged. I have surfed the Internet in my dreams sometimes. If I start hearing imaginary incoming message chimes on my computer when I am out in the back yard, it tells me I have spent too much time online," she said. <br /><br />Stallings has started dance classes with her husband, meeting with friends for craft nights, and writing letters -- by hand. <br /><br />She looks forward to when technology catches up to the need to unplug. "There will be phones that let you say you don''t want to hear e-mail after 5 p.m. or on Sundays," she said. <br /><br />"A lot of time you have nothing to show for hours spent online but a hunch back and a sore butt."', '', 1, 9, 0, 23, '2008-04-19 00:00:00', 62, '', '2008-04-23 20:54:40', 62, 0, '0000-00-00 00:00:00', '2008-04-19 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 1, 'robots=\nauthor='),
(77, 'Country reels under power crunch, heat wave', 'country-reels-under-power-crunch-heat-wave', '', '<img src="images/stories/lifestyle/200804/country_reels_under_power_crunch_01.jpg" border="0" align="right" />Officials warn that power generation in the country is unlikely to improve before the boro season comes to an end. <br /><br />With many parts of Bangladesh experiencing a heat wave, demand is set to remain high. <br /><br />The Met Office has warned the ''mild-to-moderate heat wave'' is likely to continue for some time as temperatures reached 40 degrees Celsius in Chuadanga, the country''s highest for Sunday. <br /><br />M Tamim, the chief adviser''s special assistant in charge of the power, energy and mineral resources ministry, told reporters Sunday that the power situation may improve by the end of April. <br /><br />He said an idea had been floated to reduce power allocations for irrigation and increase the supply to the capital city, although it had been rejected in favour of maintaining irrigation needs. <br /><br />Sunday saw widespread power cuts throughout the country as increased temperatures heighten demand for electricity. <br /><br />The day''s peak demand for power was 4600 MW, with an estimated maximum production of 3820 MW. Peak-hour load shedding was fixed at 658 MW. <br /><br />Power Development Board officials said the daytime load shortage on Sunday stood at 275 MW, while demand for the period crossed 4,000 MW from eight in the morning. <br /><br />Some areas of Dhaka experienced power outages up to six times over the day, with outages continuing for up to one-and-a-half hours. <br /><br />Various government efforts to save power have so far proved ineffective: including advice to households to rely more on their own generators during peak hours. <br /><br />The city corporation also considered shutting down the street lights on one side of certain roads in the city in addition to advising limited use of air conditioning systems. <br /><br />PDB officials said up to 400 MW could be saved if the use of air conditioning could be limited. <br /><br />Titas Gas Transmission and Distribution Company has asked certain industrial units to minimise their use of power by 40 percent during peak hours to increase the gas supply to power plants. <br /><br />However, none of the business owners has responded to the ministry directive. <br /><br />WASA''s managing director for Dhaka, Raihanul Abedin, told bdnews24.com that the government''s request to close water tank pumps during peak hours was impractical. <br /><br />"There is not a water crisis in the WASA area. There are problems in one or two areas but it will be OK. We are attempting to solve any problems using generators in certain areas," said Abedin. <br /><br />Meanwhile, the Met Office''s chief meteorologist, Sujit Kumar Deb Sharma, told bdnews24.com that the elevated temperatures were likely to continue, although possible storms at the end of the month would bring the temperature down. <br /><br />The weather forecast until 6pm Monday said a mild-to-medium heat wave would continue through Dhaka, Rajshahi, Khulna and Barisal divisions. <br /><br />A temporary gusty wind may blow over Tangail, Mymensingh and Comilla regions in addition to one or two places over Rajshahi and Sylhet divisions. <br /><br />Partial cloud cover will remain, although it is unlikely to rain. Temperatures will remain steady.', '', 1, 9, 0, 23, '2008-04-20 00:00:00', 62, '', '2008-04-23 20:53:39', 62, 0, '0000-00-00 00:00:00', '2008-04-20 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(78, 'Saudi guardianship key to women rights abuse: report', 'saudi-guardianship-key-to-women-rights-abuse-report', '', '<img src="images/stories/lifestyle/200804/saudi_women_01.jpg" border="0" align="right" />Saudi Arabia''s system of male "guardianship" or wide-ranging control over women lies at the heart of rights abuse in the conservative Islamic state, US-based Human Rights Watch (HRW) said on Monday. <br /><br />Saudi women must usually obtain permission from a "guardian" -- father, husband, or son -- to work, travel, study, marry, or get access to healthcare, the group said. <br /><br />"The Saudi government sacrifices basic human rights to maintain male control over women," Farida Deif, Human Rights Watch women''s rights researcher for the Middle East, said in a statement sent to Reuters. <br /><br />"Saudi women won''t make any progress until the government ends the abuses that stem from these misguided policies," she said. <br /><br />Saudi Arabia is one of the most conservative countries in the world, where tradition and the Islamic clerical establishment restrict women''s movement, even preventing them from driving cars. <br /><br />Since King Abdullah came to power in 2005, the government has said it supports a reform agenda but that it cannot enforce changes if significant sections of society continue to resist. <br /><br />The government has allowed Human Rights Watch unprecedented access over the past two years, and more women have been able to enter the workforce. This year new regulations allow women to stay in hotels without a guardian. <br /><br />But clerics of the state-sanctioned school of Islamic law, a strict form of Sunni Islam often termed Wahhabism, see the "muhrim", or guardian of women''s honour, as central to the system of social and moral control in place in the country. <br /><br />The rules -- the subject of heated national debate -- are enforced by the judiciary and a morals police body, both of which are run by Wahhabi clerics. <br /><br />"The authorities essentially treat adult women like legal minors who are not entitled to authority over their lives and well-being," the HRW report says, citing a list of complaints based on interviews with about 100 women. <br /><br />It says women cannot open bank accounts for children, enrol them in school, obtain school files, or travel with their children without written permission from the child''s father. <br /><br />Women are also prevented from accessing government agencies that have not established female sections unless they have a male representative, and the need to establish separate office space discourages firms from hiring women, it said. <br /><br />Deif said the authorities had placed women in an impossible situation by holding them criminally responsible for their actions from puberty at the same time as imposing legal guardianship upon them.', '', 1, 9, 0, 23, '2008-04-23 20:51:44', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 20:51:44', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(79, 'Intel to invest $500 mln in Taiwan, most in WiMax', 'intel-to-invest-500-mln-in-taiwan-most-in-wimax', '', 'Intel Corp said on Monday it will invest $500 million in Taiwan over the next five years, with a large amount of the investment targeted at the island''s WiMax sector. <br /><br />The chip giant said there are still technical challenges that need to be solved for the new super-high-speed wireless standard, but that the firm has been encouraged by the development of WiMax in the last two years. <br /><br />"This investment is largely for WiMax," Lil Mohan, managing director of Intel''s WiMax program, told reporters on the sidelines of a news conference. <br /><br />Mohan added that Intel expects WiMax to be commercially deployed in the second or third quarter this year in the United States, and that infrastructure in Asia should be ready by 2009-2010. <br /><br />Late last year, Taiwan''s government said it planned to spend $664 million in the next few years on the WiMax technology -- seen as the more advanced standard to WiFi, which only works near a transmitter. <br /><br />WiMax allows anyone with a WiMax enabled laptop or media device to download songs, movies and business presentations over distances of up to 30 miles. <br /><br />"Japan will probably launch the first (WiMax standard in Asia), since they have already invested lots of money," said Mohan. Taiwan and India could follow suit, he said. <br /><br />Acer Inc, the world''s third-largest laptop vendor, said on Monday that it is planning to launch laptops with WiMax capabilities in June or July this year. <br /><br />Acer said it will ship a significant amount of notebook PCs with WiMax capabilities, but declined to give shipment forecast. <br /><br />"WiMax is a good solution for broadband and it is an affordable answer in terms of price and mobility. It''s going to be huge in the coming several years," Acer Chairman J.T. Wang told reporters at the same news conference. <br /><br />"This is also a great opportunity to boost the information technology industry in Taiwan," added Wang. <br /><br />Starting from a small base, WiMax is expected to grow much faster than the broader networking industry, with spending forecast to rise at a compounded annual rate of about 150 percent between 2006 and 2008, according to MIC, a top Taiwan think-tank. <br /><br />Wireless and WiMax technology product makers in Taiwan include D-Link, ZyXEL and Gemtek Technology. <br /><br />Other countries in various stages of WiMax network development include South Korea, Vietnam, Thailand, Singapore and Australia. <br /><br />(US$1=T$30.3)', '', 1, 10, 0, 24, '2008-04-23 21:47:34', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:47:34', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(80, 'Web guru targets malaria with social network site', 'the-british-entrepreneur-who-sold-a-soccer-web-site-at-the-age-of-17-for-40-million-has-switched-his-attention-to-help-launch-a-social-networking-site-on-sunday-designed-to-fight-malaria-', '', 'The British entrepreneur who sold a soccer Web site at the age of 17 for $40 million has switched his attention to help launch a social networking site on Sunday designed to fight malaria. <br /><br />Tom Hadfield set up Soccer.net in his bedroom before selling it to U.S. sports network ESPN, but now hopes the power of sites such as Facebook can curb a disease that kills an estimated one million people a year, many of them in Africa. <br /><br />"I believe in the power of friends telling friends telling friends," self-styled part-time student and full-time entrepreneur Hadfield told Reuters in an interview. <br /><br />"Our dream is tens of thousands of people will use social networking tools to build a movement that eradicates malaria." <br /><br />Now 25 and a fourth-year political science student at Harvard university, Hadfield came up with the idea for www.MalariaEngage.org after a trip to Zambia last summer that gave him a close-up look at the mosquito-born disease. <br /><br />"Traveling across Africa and seeing the devastation caused by malaria made me realize there was more to life than putting up soccer scores," said Hadfield. <br /><br />"Everyone I met at an aid project making mosquito nets in Zambia had either lost a child to malaria or knew someone who had." <br /><br />Hadfield then traveled to Dar es Salaam in Tanzania where he met researchers working on malaria treatments and discovered that their efforts were being held back by a lack of resources. <br /><br />"It''s shocking that thousands of people are dying every day from a preventable disease," said Hadfield, who was honored as Global Leader of Tomorrow by the World Economic Forum in Davos, Switzerland, in 2001. <br /><br />"When I came back from Africa last summer, a lot of people asked me what they can do to help." <br /><br />The site encourages people to donate $10 or more to help support seven different research projects in Tanzania, such as developing plants like lemongrass to repel mosquitoes. But Hadfield sees MalariaEngage.org as more than a fundraising tool. <br /><br />"MalariaEngage.org increases the return on investment of donors by connecting them directly with researchers working on malaria prevention treatment," said Hadfield. <br /><br />"It''s about more than about giving money -- it''s about creating connections. By encouraging individual participation and involvement, we will create international communities of common interest. This is the essence of social networking." <br /><br />The seven projects were recommended by Tanzania''s National Institute for Medical Research and once those have been funded, MalariaEngage.org will look to support new schemes across developing countries. <br /><br />Due to marry in November, Hadfield co-founded the site with health professors Peter A. Singer and Abdallah S. Daar at Canada''s McLaughlin-Rotman Centre for Global Health at University Health Network as well as the University of Toronto. <br /><br />"We feel young African scientists have very good ideas that end up in the dustbin," said Singer. "This is about helping committed young researchers with good ideas to help themselves create a better future."', '', 1, 10, 0, 24, '2008-04-23 21:48:30', 62, '', '2008-04-23 21:49:13', 62, 0, '0000-00-00 00:00:00', '2008-04-23 21:48:30', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(81, 'EU tells videogame industry to protect minors better', 'eu-tells-videogame-industry-to-protect-minors-better', '', 'Videogame makers and shops have two years to come up with a widely accepted industry code of conduct to better protect children from violent images, the European Union''s executive body said on Tuesday. <br /><br />"Creators have to enjoy freedom of expression but at the same time it''s an industry that impacts society," EU Information Society Commissioner Viviane Reding told a news conference. <br /><br />Worldwide revenues from videogaming are expected to reach 30 billion euros ($47.5 billion) within two years, of which the 27-nation EU will account for about one-third, Reding said. <br /><br />Public concerns that videogames can cause aggressive behavior have been heightened by school shootings such as that in Finland last November, and have led to several countries banning games such as "Manhunt 2", Reding added. <br /><br />The EU executive has powers to propose legislation, but decided to give the sector two years to come up with a code of conduct that has wider industry backing than the current one. The industry is also being asked to spend more on advertising its symbols denoting the age suitability of games. <br /><br />"When children go out to play today they enter the world of joysticks. We are not quite sure where they go and there is real anxiety from parents," EU Consumer Protection Commissioner Meglena Kuneva said. <br /><br />The industry''s age classification system -- Pan European Games Information (PEGI) -- is sponsored by more than 200 industry members and used in 20 of the 27 EU states. There is also an online version but with far fewer industry backers. <br /><br />The Entertainment and Leisure Software Publishers'' Association (ELSPA), a videogame industry lobby, said the PEGI age rating system was robust. <br /><br />"Importantly, it protects children as games move increasingly online and therefore should be adopted by UK regulators. We look forward to discussing this at the forthcoming UK consultation," ELSPA''s director general Paul Jackson said. <br /><br />The European Commission wants PEGI''s age symbols to become familiar to the public but it accepts there is no conclusive evidence that violent videogames influence children''s behavior. <br /><br />"We want to work in this environment on a precautionary principle," Kuneva said. <br /><br />Last year a U.S. federal judge struck down a 2005 California state law barring the sale of violent videogames to minors as unconstitutional, adding there was no evidence such games were any more harmful than some television shows and movies. <br /><br />Scenes of bloody killings were scaled back to allow Manhunt 2 to go on sale to U.S. players aged 17 years and older. <br /><br />Making a game for adults only is seen as uncommercial as hardware makers such as Sony, Microsoft and Nintendo do not allow such content on their machines, which are popular with children.', '', 1, 10, 0, 24, '2008-04-23 21:52:04', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:52:04', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(82, 'Sony to delay ''Home'' online service for PS3 again', 'sony-to-delay-home-online-service-for-ps3-again', '', 'Sony Corp''s game unit said on Tuesday it was delaying the launch of its "Home" 3D virtual online community service for the PlayStation 3 game console to autumn of this year, the second such delay. <br /><br />Sony last year postponed the launch of the "Home" service, which is aimed at giving users a place to interact with other PS3 users, to early this year from last autumn. <br /><br />As in the "Second Life" virtual world, Home users create online characters or avatars. They can chat with other visitors, play games and customize their own rooms located in the virtual world. <br /><br />Sony, locked in a three-way battle with Microsoft Corp and Nintendo Co Ltd in the global game industry, said it was delaying the launch to improve product quality, the same reason it cited for the first delay. <br /><br />"We understand that we are asking PS3 and prospective PS3 users to wait a bit longer," Sony Computer Entertainment Chief Executive Kazuo Hirai said in a statement. <br /><br />"But we have come to the conclusion that we need more time to refine the service to ensure a more focused gaming entertainment experience than what it is today." <br /><br />Offering an innovative online service is important for the PS3, which has been running behind Nintendo''s Wii and Microsoft''s Xbox 360 in total unit sales. <br /><br />The original PlayStation and PlayStation 2 sold more than 100 million units each worldwide, helping Sony dominate the game industry for a decade from the mid-1990s. <br /><br />But its latest machine has had a slow start due to high prices and scarcity of strong game titles at the launch. <br /><br />"I don''t get the impression that ''Home'' is something drastically new. There may be something hidden that is amazing, but I can''t spot it at the moment," Okasan Securities senior analyst Masashi Morita said. <br /><br />"This delay won''t be a problem if it helps them offer something epoch-making, something totally different from the rest," he said. <br /><br />Shares in Sony closed down 2.8 percent at 4,510 yen, underperforming the Tokyo stock market''s electrical machinery index, which fell 2.2 percent.', '', 1, 10, 0, 24, '2008-04-23 21:52:48', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:52:48', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(83, 'Yahoo results won''t affect Microsoft offer: Ballmer', 'yahoo-results-wont-affect-microsoft-offer-ballmer', '', 'Microsoft Corp (MSFT.O: Quote, Profile, Research) will hold firm on its $43.2 billion offer for Yahoo Inc (YHOO.O: Quote, Profile, Research), regardless of whether Yahoo''s quarterly results impress or disappoint investors, Chief Executive Steve Ballmer said on Tuesday. <br /><br />"We think we can accelerate our strategy by buying Yahoo and will pay what makes sense for our shareholders," Ballmer said. "I wish Yahoo all the success with its results but it doesn''t affect the value of Yahoo to Microsoft." <br /><br />Ballmer, speaking at the launch of Microsoft''s Web portal for North Africa, MSN Maghreb, has set a Saturday deadline for Yahoo''s board to accept a deal with Microsoft or face a lower bid that it takes directly to Yahoo''s shareholders. <br /><br />In its first-quarter results, due later on Tuesday, Yahoo is expected to show progress in stabilizing its Web media and advertising business after two years of decline. In Yahoo''s favor are low expectations from investors accustomed to seeing the company fall short in recent quarters. <br /><br />Yahoo officials are expected to use the results to argue why Microsoft''s $31 a share cash-and-stock offer undervalues its growth potential and give the company ammunition in arguing for a higher price. <br /><br />Microsoft has said its offer is "full and fair," refusing to sweeten its bid since it has yet to see Yahoo raise a credible alternative. <br /><br />On January 29 -- the day before Microsoft presented Yahoo''s board with an unsolicited takeover bid -- Yahoo warned it had a tough year ahead as it cut jobs and spent more to shore up its advertising business. <br /><br />Projections for Yahoo profits range from between 6 cents to 13 cents per share. On average, Wall Street expects 9 cents, down from 10 cents a year earlier, according to Reuters Estimates.', '', 1, 10, 0, 24, '2008-04-23 21:53:17', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:53:17', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(84, 'Web criminals fuel big rise in trojans', 'web-criminals-fuel-big-rise-in-trojans', '', 'Cyber-criminals are behind a dramatic rise in stealthy programs called "trojans" that infect computers to sell rogue software, send unwanted email or steal personal data, a study has found. <br /><br />In a report released in London, Microsoft said the number of trojans removed from computers around the world in the second half of 2007 rose by 300 percent from the first half. <br /><br />The figure has risen so sharply because more computers are fitted with software that detects malicious programs and because criminals had come to see trojans as their "tool of choice", the report said. <br /><br />"The numbers have simply exploded, it''s huge," said Vinny Gullotto, general manager of the Microsoft Malware Protection Center. "There is a lot of criminal intent there." <br /><br />Trojans can log keystrokes to gather passwords, send spam from private computers or harvest email addresses or personal information for criminal purposes. <br /><br />The most common family of trojans last year was "Win32/Zlob", a piece of malicious software, or malware, that people unwittingly download from the Internet. <br /><br />Its designers trick people into saving it by telling them they need a new piece of software to watch video online. <br /><br />Once installed, it bombards people with pop-up messages and bogus flashing warnings that their computer is infected. <br /><br />The messages say: "Your computer is infected! Windows has detected spyware infection. Click here to protect your computer." <br /><br />The trojan then sends adverts offering to sell rogue anti-spyware on sites that could expose customers to credit card fraud. Microsoft said the problem is global and linked to organised criminal gangs. <br /><br />"The majority (of trojans) come from the States, China, Russia and South America," Gullotto said on the fringes of the Infosecurity Europe trade conference on Tuesday. <br /><br />Microsoft said the number of computers around the world that were made safe after being infected with trojans rose from one million in the second half of 2006 to 19 million in the second half of 2007. <br /><br />The report is online: www.microsoft.com/security/portal/sir.aspx', '', 1, 10, 0, 24, '2008-04-23 21:53:42', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:53:42', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(85, 'Debate rages over plastic bottle chemical''s safety', 'debate-rages-over-plastic-bottle-chemicals-safety', '', 'Canada is moving to get rid of products with a chemical common in plastic baby bottles, the United States is expressing concern over its safety and some retailers are planning to stop selling these items. <br /><br />But whether the chemical bisphenol A poses genuine health risks in people remains a matter of debate, with industry groups defending its safety and environmental activists saying studies involving animals show otherwise. <br /><br />Bisphenol A, or BPA, is used to make polycarbonate plastic, a clear shatter-resistant material in products ranging from plastic baby and water bottles to sports safety equipment and medical devices. <br /><br />It also is used to make durable epoxy resins used as the coating in most food and beverage cans. <br /><br />People can eat or drink the chemical when it leaches out of the plastic into liquid such as baby formula, water or food inside the container. <br /><br />"At this point, the writing is on the wall for bisphenol A. Major retailers and governments all across the country and the world are now recognizing that this chemical is extremely toxic at very low levels of exposure," Michael Schade of the U.S. environmental group Center for Health, Environment and Justice said in a telephone interview. <br /><br />Critics of BPA said more than 150 scientific studies involving laboratory rodents show BPA to be harmful at even low levels. But some experts are not convinced. <br /><br />"For me, the big question is: what levels of exposures are we getting and are those levels of exposure sufficient to cause harm?" Carl Winter, director of the Food Safety Program at the University of California-Davis, said in a telephone interview. <br /><br />"There still does not exist strong evidence supporting significant impacts on human health for bisphenol A," he said. <br /><br />"NEGLIGIBLE RISK" <br /><br />Steven Hentges of the American Chemistry Council downplayed the animal studies, saying they "have not been corroborated between labs and the entire data set is not coherent." <br /><br />He added: "We do believe that bisphenol A poses negligible risk to human health." <br /><br />On Tuesday the National Toxicology Program, part of the U.S. government''s National Institutes of Health, issued a draft report expressing concern that BPA could cause neural and behavioral problems in fetuses, infants and children. <br /><br />Relying on the results of animal studies, it expressed concern about possible links between BPA exposure and early puberty and prostate and breast cancer. <br /><br />Dr. Anila Jacob of the activist Environmental Working Group said using rodent studies to assess toxicity is a well-established practice given that scientists cannot expose humans to possible toxins in research for ethical reasons. <br /><br />Canadian Health Minister Tony Clement said on Friday his country intends to become the first to ban the import and sale of some types of plastic baby bottles because they contain BPA. He expressed concern that overexposure at an early age could cause later behavioral and neurological symptoms. <br /><br />Wal-Mart, the world''s largest retailer, announced on Thursday it plans to offer more BPA-free products and intends to stop selling baby bottles made with BPA early next year. <br /><br />Rochester, New York-based bottle maker Nalgene said on Friday it will phase out production of bottles made with BPA. Nalgene is owned by Thermo Fisher Scientific Inc. <br /><br />U.S. states including California, Maryland, Minnesota and Michigan are considering bills to ban or restrict bisphenol A in children''s products. <br /><br />In Washington, Democratic Reps. John Dingell and Bart Stupak have been investigating BPA in products intended for use by infants and children. They are calling on the Food and Drug Administration to reconsider its view that it is safe.', '', 1, 11, 0, 25, '2008-04-23 21:54:28', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:54:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(86, 'US teams aim to grow ears, skin for war wounded', 'us-teams-aim-to-grow-ears-skin-for-war-wounded', '', 'Teams of university scientists backed by U.S. government funds hope to grow new skin, ears, muscles and other body tissue for troops injured in Iraq and Afghanistan, the Defense Department said this week. <br /><br />The $250 million effort aims to address the Pentagon''s unprecedented challenge of caring for troops returning from the war zones with multiple traumatic injuries, many of which would have been fatal years ago. <br /><br />"We''ve had just over 900 people, men, some women with amputations of some kind or another since the start of the conflicts in Afghanistan and Iraq," said Ward Casscells, assistant secretary of defense for health affairs. Many have also suffered burns, spinal cord injuries and vision loss. <br /><br />"Getting these people up to where they are functioning and reintegrated, employed, able to help their families and be fully participating members of society, this is our task," he said. <br /><br />Under the initiative, the Pentagon launched the Armed Forces Institute of Regenerative Medicine made up of two teams -- the first led by Wake Forest University in North Carolina and the University of Pittsburgh and the second led by Rutgers University in New Jersey and the Cleveland Clinic. <br /><br />Their goal is to develop within five years therapies for burn repair, wound healing without scarring, facial reconstruction and limb reconstruction or regeneration. <br /><br />Scientists with the university teams said such work was already being done and had been demonstrated on animals. Clinical trials on people have not started. <br /><br />Lt. Gen. Eric Schoomaker, the Army''s surgeon general, expressed hope the therapies could help badly injured troops within just a few years. <br /><br />He showed a photo of a Marine with burns covering his head. He said the Marine had undergone 40 operations, but there was currently no way to rebuild his ears or nose. <br /><br />Using methods being studied, the Marine''s stem cells could be used to grow more cells that are then painted on a scaffold in the shape of his ears and nose. After an incubation period of weeks, the biodegradable scaffold would be implanted on the skin and absorbed, ultimately becoming fully functional, Schoomaker said. <br /><br />"We''re embarking on a new generation of research that''s going to redefine the Army and military medicine as we know it today," he told reporters at the Pentagon. <br /><br />Roadside bombs, known as improvised explosive devices, and suicide bombs in Iraq and Afghanistan have led to a dramatic increase in blast trauma among U.S. troops. Medical advances have kept many of those service members alive, requiring long-term specialized care from a military health system under fire for miring troops in bureaucracy. <br /><br />The Defense Department has dedicated $85 million to the regenerative health project. The rest of the funding comes from other parts of the federal government, state agencies and academic institutions.', '', 1, 11, 0, 25, '2008-04-23 21:56:19', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:56:19', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(87, 'Edward Lorenz, father of chaos theory, dead at 90', 'edward-lorenz-father-of-chaos-theory-dead-at-90', '', 'Edward Lorenz, the father of chaos theory, who showed how small actions could lead to major changes in what became known as the "butterfly effect," died of cancer on Wednesday at the age of 90, the Massachusetts Institute of Technology said. <br /><br />Lorenz, a meteorologist, figured out in the 1960s that small differences in a dynamic system such as the atmosphere could set off enormous changes. In 1972 he presented a study entitled "Predictability: Does the Flap of a Butterfly''s Wings in Brazil Set Off a Tornado in Texas?" <br /><br />Born in 1917 in West Hartford, Connecticut, Lorenz earned degrees in mathematics from Dartmouth College in 1938, from Harvard University in 1940, and degrees in meteorology from MIT in 1943 and 1948. <br /><br />While serving as a weather forecaster for the U.S. Army Air Corps in World War Two, he decided to study meteorology. <br /><br />"As a boy I was always interested in doing things with numbers, and was also fascinated by changes in the weather," Lorenz wrote in an autobiography. <br /><br />"By showing that certain deterministic systems have formal predictability limits, Lorenz put the last nail in the coffin of the Cartesian universe and fomented what some have called the third scientific revolution of the 20th century, following on the heels of relativity and quantum physics," said Kerry Emanuel, professor of atmospheric science at MIT. <br /><br />"He was also a perfect gentleman, and through his intelligence, integrity and humility set a very high standard for his and succeeding generations," Emanuel added in a statement. <br /><br />In 1991, Lorenz won the Kyoto Prize for basic sciences in the field of earth and planetary sciences. <br /><br />The prize committee said Lorenz "made his boldest scientific achievement in discovering ''deterministic chaos,'' a principle which has profoundly influenced a wide range of basic sciences and brought about one of the most dramatic changes in mankind''s view of nature since Sir Isaac Newton." <br /><br />Lorenz, who enjoyed hiking and cross-country skiing, stayed active until two weeks before his death at home in Cambridge, Massachusetts, his family said. He is survived by three children and four grandchildren.', '', 1, 11, 0, 25, '2008-04-23 21:56:52', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 21:56:52', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(88, 'Zinc reduces common cold symptoms', 'zinc-reduces-common-cold-symptoms', '', 'Zinc acetate lozenges taken within 24 hours of developing symptoms of the common cold reduce the duration and severity of symptoms, according to a report in The Journal of Infectious Diseases. <br /><br />Previous studies of zinc treatment for common cold symptoms have yielded conflicting results, the authors explain. <br /><br />Dr. Ananda S. Prasad from Wayne State University School of Medicine, Detroit, and associates investigated the effects of zinc acetate lozenges in treating the common cold in 50 volunteers who had cold symptoms for 24 hours or less. The participants took one zinc acetate lozenge containing 13.3 milligrams of zinc or an inactive "placebo" every 2 to 3 hours while awake. <br /><br />The average duration of cold symptoms (including cough, runny nose, and muscle ache) was about 4 days in the zinc group compared with 7 in the placebo group, the authors report. <br /><br />After 4 days, 56 percent of the zinc group had complete resolution of their colds, whereas none of the placebo group was free of cold symptoms. The results of a number of biochemical tests suggested that zinc was having a true effect on the colds. The investigators observed no zinc side effects. <br /><br />"Zinc acetate preparation, as used in our study, was significantly effective in decreasing the (average) duration of cold symptoms," the authors conclude. "We propose that the beneficial clinical effects seen in the zinc group were due to the antioxidant and anti-inflammatory effects of zinc." <br /><br />SOURCE: Journal of Infectious Diseases, March 15, 2008.', '', 1, 12, 0, 26, '2008-04-23 22:00:41', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:00:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 7, '', '', 0, 0, 'robots=\nauthor='),
(89, 'Childhood trauma may spur unhealthy eating later', 'childhood-trauma-may-spur-unhealthy-eating-later', '', 'College students who went through traumatic experiences as children may be at greater risk of developing an eating disorder, a new study suggests. <br /><br />Two hundred nine freshmen students completed questionnaires on trauma history at the beginning and at the end of a semester. The students were also asked if they had ever suffered various broad categories of trauma -- such as violent trauma, sexual trauma or the death of a loved one -- and had them rate how severely they had been affected the event. <br /><br />The subjects were between 18 and 19 years old, 55 percent were female and most - 96.3 percent - were Caucasian. Over the course of the study, 30 students dropped out. <br /><br />The researchers found that students with a history of trauma -- ranging from the divorce of their parents, to the death of a loved one, to physical or sexual abuse -- were more likely to have symptoms of an eating disorder. <br /><br />Students who, for example, said they''d suffered a "violent trauma" in the past were more likely than their peers to skip meals, fast, binge-eat or abuse diet pills or laxatives. Bingeing, laxative abuse and vomiting were also more common among students who said they''d been traumatized by divorce or the death of someone they loved. <br /><br />Previous studies have found that victims of childhood sexual abuse are at increased risk of bulimia and, to a lesser extent, anorexia. <br /><br />The current findings suggest that a range of childhood traumas may contribute to eating disorder risk, according to the researchers, led by Dr. Joshua M. Smyth, an associate professor of psychology at Syracuse University in New York. <br /><br />They report the results in the International Journal of Eating Disorders. <br /><br />Overall, Smyth''s team found, students with a history of childhood trauma were both more likely to already have eating-related problems and more likely to develop new problems over the course of the semester. <br /><br />The findings have implications for screening and prevention of eating disorders in college, according to the researchers. It''s estimated that 2 percent to 4 percent of college students have an eating disorder, they note, and many more have symptoms that fall short of an eating disorder diagnosis, but are nonetheless serious. <br /><br />The "most direct" way to reach at-risk college students, Smyth and his colleagues suggest, would be to screen incoming freshman for past traumas, then provide them with information on how to get help. <br /><br />However, if that is too intrusive, they add, colleges could instead offer an information session to all incoming students on how to get counseling or other supportive services. <br /><br />SOURCE: International Journal of Eating Disorders, April 2008.', '', 1, 12, 0, 26, '2008-04-23 22:02:39', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:02:39', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 6, '', '', 0, 0, 'robots=\nauthor='),
(90, 'Ovarian cancers may begin in the fallopian tube', 'ovarian-cancers-may-begin-in-the-fallopian-tube', '', 'New research suggests that fallopian tube cells rather than ovarian surface cells are the probable site of origin of most cases of ovarian serous carcinoma, the most common type of ovarian cancer. <br /><br />This finding may lead to earlier detection, as well as better treatment and perhaps prevention, of ovarian cancer, Dr. Keren Levanon of the Dana Farber Cancer Institute in Boston told the annual gathering of the American Association for Cancer Research in San Diego. <br /><br />As there is no early diagnostic test for ovarian cancer, roughly 80 percent of cases are diagnosed at a very late stage. "One fascinating fact," Levanon highlighted, "is that when you diagnose ovarian cancer you find massive invasive tumors on the surface of the ovary -- usually the tumor does not invade the ovary -- but you never find early pre-invasive in situ tumors." <br /><br />"We do not believe that these invasive tumors arise as invasive cancers," she said, adding that "the foundation of our research is to look for precursor lesions." Precursor lesions are clusters of irregular cells representing the stage just before the formation of cancer cells -- in this case, ovarian cancer cells. <br /><br />Levanon and colleagues studied a group of women at very high risk for ovarian cancer due to family history who underwent removal of their fallopian tubes and ovaries as a preventive measure. <br /><br />When these women were closely evaluated, the researchers found that they had early cancerous growths -- and these early growths were in the fallopian tube, not on the surface of the ovary, Levanon said. <br /><br />"Even more surprisingly," she said, the growths were confined to a particular area within the fallopian tube called the fimbria, which is located close to the ovary. <br /><br />Levanon said these early precursor cell clusters were in "close to 100 percent" of the fallopian tubes in a group of women who already had ovarian cancer. <br /><br />These data, the researcher said, "support our hypothesis that ovarian cancer originates in the fallopian tube and exfoliates or falls over the surface of the ovary and that''s why these tumors develop on the surface of the ovary and not inside the ovary." <br /><br />She hopes these data help in the design of future studies aimed at gaining a greater understanding of the basic process involved in the origin and growth of serous ovarian carcinoma, which could lead to targeted therapies and perhaps prevention strategies.', '', 1, 12, 0, 26, '2008-04-23 22:03:03', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:03:03', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(91, 'Traditional breast-feeding schedule best approach', 'traditional-breast-feeding-schedule-best-approach', '', 'Following a traditional breast-feeding schedule appears more beneficial for early infant weight gain and is more supportive of continued breast-feeding than a "baby-led" routine, UK researchers report. <br /><br />The traditional recommendations have been largely replaced by "baby-led" breast-feeding which advises letting infants feed for an unlimited time from the first breast and that both breasts need not be used at each feeding, Dr. C. Anne Walshaw and colleagues note. <br /><br />"Such advice is not backed up by evidence-based lactation physiology," Walshaw, of Bradford and Airedale Teaching Primary Care Trust, in Bradford, told Reuters Health. <br /><br />After noticing poor weight gain among breast-fed babies after baby-led breast-feeding became more common, Walshaw and colleagues compared early weight gain in infants who were exclusively breast fed. Thirty one healthy mother/baby pairs followed the baby-led advice and a similar group of 32 mother/baby pairs followed the traditional breast-feeding advice. <br /><br />The traditional breast-feeding approach involves breast-feeding using both breasts at each feeding for no more than 10 minutes per breast. <br /><br />They found that infants were more likely to be exclusively breast-fed for up to 12 weeks when their mothers followed traditional rather than baby-led breast-feeding practices. <br /><br />Furthermore, feeding more than 10 minutes from the first breast was associated with poor weight gain during the first 6 to 8 weeks of exclusive breast-feeding, the researchers report in the Archives of Disease in Childhood. <br /><br />Traditional methods take advantage of the physiological mechanisms of breast-feeding, Walshaw said. The regular, short-term use of both breasts at each feeding conditions the let-down reflex. Moreover, draining milk from both breasts at each feeding inhibits the slowing of milk production in an unused breast, and takes advantage of the higher fat and protein content of early-released milk from each breast. <br /><br />By contrast, baby-led breast-feeding can decondition the let-down reflex through prolonged suckling at each feed, and can gradually enhance lesser milk production by using only one breast at each feeding. <br /><br />Walshaw and colleagues conclude that strategies encouraging breast feeding must heed lactation physiology. <br /><br />SOURCE: Archives of Disease in Childhood, April 2008', '', 1, 12, 0, 26, '2008-04-23 22:03:28', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:03:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(92, 'Eating disorders may be contagious: study', 'eating-disorders-may-be-contagious-study', '', 'A study in US high school students provides additional evidence that eating disorders may be contagious. <br /><br />In a study, researchers found that binging, fasting, diet pill use and other eating disorder symptoms clustered within counties, particularly among female students. <br /><br />"These findings confirm the strong social influences on female adolescents in the US to be thin, sometimes using unhealthy behaviors to achieve this goal," the researchers write in the current issue of the International Journal of Eating Disorders. <br /><br />Research in the 1980s in female college students first suggested that disordered eating behavior spread through "social contagion," demonstrating that binge eating clustered within sororities, Dr. Valerie L. Forman-Hoffman and Cassie L. Cunningham of the VA Iowa City Health Care System note in their report. <br /><br />In the current study, they looked at whether a similar pattern would be seen among high school students at the county-wide level by analyzing nationally representative data on 15,349 high school students. <br /><br />There was indeed a small but significant clustering effect, the researchers found. A pair of students from the same county was 4 percent to 10 percent more likely to share an eating-disordered behavior when compared to pairs in which each person came from a different county. <br /><br />Severe food intake restriction, dieting, exercising and diet pill use all showed clustering by county, as did any weight control symptom overall or any eating disorder symptom. But no clustering was seen for purging, possibly due to the "secretive," less socially acceptable nature of this behavior, the researchers suggest. <br /><br />Clustering patterns were the same in rural, suburban and urban counties. <br /><br />While the study wasn''t designed to look at why these behaviors might be clustering in certain counties, the researchers suggest that peer pressure, information sharing or students modeling their behavior on one another are possible mechanisms. <br /><br />Based on their results, the researchers think it may be more effective to target eating disorder prevention efforts to counties or schools where they are more common, rather than individual students. <br /><br />SOURCE: International Journal of Eating Disorders, April 2008.', '', 1, 12, 0, 26, '2008-04-23 22:04:01', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:04:01', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(93, 'S Korea has new bird flu case, culling 5 mln birds', 's-korea-has-new-bird-flu-case-culling-5-mln-birds', '', 'South Korea on Monday said it planned to cull a record 5.3 million birds as it announced its 17th case of bird flu in three weeks, in what has become the country''s fastest and biggest outbreak of avian influenza. <br /><br />South Korea has culled 4.86 million chickens and ducks since the beginning of April, as the highly virulent H5N1 strain, first reported in the southwest, has been confirmed in five provinces. <br /><br />The agriculture ministry said on Monday it would start probing all of the country''s 260 duck farms as a preemptive measure and continue quarantine work. Some 360 soldiers have been sent to the hardest-hit North Jeolla province to help slaughtering and burying farmed birds. <br /><br />South Korea had to kill 5.29 million birds in its first outbreak between late 2003 and early 2004. The second outbreak in 2006-2007 saw about half that number culled. <br /><br />No human deaths from the disease have been reported so far from the country. <br /><br />Some 240 human deaths have been reported globally from the H5N1 strain and 381 confirmed cases of infection since 2003, according to World Health Organisation data.', '', 1, 12, 0, 26, '2008-04-23 22:04:28', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:04:28', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(94, 'Skipping breakfast may mean your baby is a girl', 'skipping-breakfast-may-mean-your-baby-is-a-girl', '', 'Women on low-calorie diets or who skip breakfast at the time of conception are more likely to give birth to girls than boys, British scientists said on Wednesday. <br /><br />New research by the universities of Exeter and Oxford provides the first evidence that a child''s sex is associated with the mother''s diet, and higher energy intake is linked to males. <br /><br />"This research may help to explain why in developed countries, where many young women choose to have low-calorie diets, the proportion of boys born is falling," said Fiona Mathews of the University of Exeter. <br /><br />There has been a small but consistent decline, of about one per 1,000 births annually, in the proportion of boys being born in industrialised countries over the past 40 years. <br /><br />In humans, going without breakfast may be interpreted by the body as signalling low food availability, since it depresses levels of blood sugar. <br /><br />Although sex is genetically determined by fathers, it is known that high levels of glucose encourage the growth and development of male embryos while inhibiting female ones, although the exact mechanism is unclear. <br /><br />Mathews and colleagues studied 740 first-time pregnant mothers in Britain and found 56 percent of those in the group with the highest energy intake at conception had sons, compared with 45 percent in the lowest group. <br /><br />In evolutionary terms, this correlation may make sense. <br /><br />Males'' breeding potential is strongly influenced by fitness, while females breed more consistently. <br /><br />"If a mother has plentiful resources then it can make sense to invest in producing a son because he is likely to produce more grandchildren than would a daughter. However, in leaner times having a daughter is a safer bet," Mathews said. <br /><br />Some researchers have been sounding alarms for years over the change in sex ratios in developed countries and have in the past blamed pollutants and synthetic chemicals such as those found in some pesticides which disrupt human hormones. <br /><br />The latest findings were published in the journal Proceedings of the Royal Society B: Biological Sciences.', '', 1, 12, 0, 26, '2008-04-23 22:04:53', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-23 22:04:53', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 1, '', '', 0, 1, 'robots=\nauthor='),
(95, 'Breaking News', 'breaking-news', '', '{loadposition rotator}', '', 1, 2, 0, 10, '2020-01-01 00:00:00', 62, '', '2008-04-24 23:08:33', 62, 0, '0000-00-00 00:00:00', '2001-01-01 00:00:00', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 6, 0, 6, '', '', 0, 2, 'robots=\nauthor=');
INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(98, 'Spared Cyclone’s Worst, Area Still Suffers', 'spared-cyclones-worst-area-still-suffers', '', '<!--IMAGE images/stories/breaking_news/200804/spared-cyclones-worst-area-still-suffers.jpg IMAGE--> <img class="content-left" src="images/stories/breaking_news/200804/spared-cyclones-worst-area-still-suffers.jpg" border="0" align="left" />KANAINAGAR, Bangladesh, Nov. 21 — To the naked eye, this looks like a village that Cyclone Sidr barely grazed. Most of the houses are standing. No one has died. The trees are not even decapitated, as they are in so many hamlets swallowed by the storm.<br /><br />Women hung onto one another as they stood in line for food aid. Millions of Bangladeshis are in dire need of clean water, food and shelter after the cyclone. <br /><br />But in this part of the world, where life revolves around water, look more closely and see how the storm has fouled so much of everyday life. Rice fields are waterlogged. Shrimp ponds have rotted. Women worry what their children will drink once their pots of rainwater run out. Not enough water, too much water, dirty water. Water bedevils everyone.<br /><br />Aid began to trickle in across the cyclone zone on Wednesday, nearly a week after the storm. In this village, a long line of supplicants received sacks of rice, lentils and salt, and the country’s neighbors, allies and rivals seemed to fall over themselves to offer charity and succor.<br /><br />Pakistan, the country’s former ruler, which Bangladesh fought a bitter war of independence against in 1971, announced that it would send two military planes full of medical supplies and blankets. India said that an air force cargo plane would arrive Thursday with 38 tons of aid.<br /><br />Two United States Navy vessels were en route and expected to arrive with helicopters within days. Saudi Arabia pledged $100 million early this week, the largest amount, until the World Bank offered $250 million on Wednesday. Whether and how soon the pledged support will materialize is a mystery.<br /><br />Neither the government nor aid agencies had an estimate on how much money was necessary to meet the humanitarian need, but a World Food Program assessment found that $30 million would be required for food just for the next three months. The United Nations resident representative for Bangladesh, Renata Lok Dessalien, said food, water and shelter were the immediate needs, and were all the more acute for cyclone victims who were already poor, likely to be malnourished and vulnerable to disease.<br /><br />Cyclone Sidr cut a wide and debilitating swath through southern Bangladesh. The government estimates that four million people have been affected, and the full scope of its impact may not be felt for many weeks. By the Bangladeshi Army’s latest count, 3,167 people have died.<br /><br />In Kanainagar, near Dhaka, the capital, Sunita Mondol, 15, was feeling the cyclone’s toll. She stood at the side of her family’s pond Wednesday morning and found no more than two tiny shrimps clinging to her net. On a normal morning, she would haul in a full basket and take it to the market to sell. <br /><br />But the storm had spoiled the pond, shaking the leaves and branches from the trees and fouling the water, so much that the shrimps died and floated belly up. On the first morning after the storm, Sunita and her family pulled up more than 13 pounds of dead fish. They threw most away.<br /><br />Families like hers, who make their living from selling the fish and shrimps they cultivate in their ponds, expect to feel the economic pinch of the cyclone for months. Every family in this village has a small pond, and family after family complained of theirs having been fouled.<br /><br />Half of the fish in Pinjira Begum’s two big ponds floated belly up, which meant that her daily earnings plummeted by nearly half. The moneylender came to her home last Saturday for his weekly payment. “We told him we didn’t have money to buy rice for the children,” she said. She gave him half of what she owed. He cursed her and left.<br /><br />Southern Bangladesh is one of the world’s most productive shrimp hubs. Shrimp is one of the country’s largest exports to the United States.<br /><br />The lucky ones here had rainwater left in their traditional earthen pots. Those whose water had run out, or whose pots had broken, had to drink the pond water, which had turned salty from seawater and had begun to stink from putrefying leaves.<br /><br />A rickshaw puller down the road wondered aloud how long it would be until dysentery struck. Even without a cyclone, he said, water brings a constant specter of disease. <br /><br />In the hot months, when the rainwater stores run out and the ponds start drying up, the people of Kanainagar suffer rashes, dysentery and diarrhea. The cyclone made a chronic concern potentially acute. <br /><br />“Water is our main problem,” said Alamgir Hossain. “People get too sick to work, and still they have to buy medicine.”<br /><br />Across the Mongla River, Muhammad Nantu Mian worked feverishly to salvage what the water had not wrecked. His rice field was flooded, just two weeks before the harvest was due. The stalks were blown down like scarecrows by the brute wind. He had drained some of the water by cutting channels in his fields. He hired workers to cut what rice stalks had not yet rotted. He figured a third of his crop was gone.<br /><br />Normally, Mr. Mian said, he sold half of what he produced, saving the rest for his own family and for next year’s seeds. This year, he said, he could reasonably hope to be able to feed his family, and not much more.', '', 1, 2, 0, 10, '2008-04-24 23:26:55', 62, '', '2008-04-24 23:39:15', 62, 0, '0000-00-00 00:00:00', '2008-04-24 23:26:55', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 4, '', '', 0, 0, 'robots=\nauthor='),
(96, 'Summer heat hikes diarrhoea risks', 'summer-heat-hikes-diarrhoea-risks', '', '<!--IMAGE images/stories/breaking_news/200804/summer_heat_01.jpg IMAGE--><img class="content-left" src="images/stories/breaking_news/200804/summer_heat_01.jpg" border="0" align="left" />Diarrhoea is the latest cause of concern for Dhaka residents and others, already affected by summer heat and power cuts. <br /><br />According to the latest count, 519 diarrhoea patients are taking treatment at the ICDDR,B, with 392 admitted on Wednesday. <br /><br />The Directorate General of Health Services says 2,089 people have been affected by diarrhoea across the country. Two people died from diarrhoea this week. <br /><br />"On average, 480 to 520 diarrhoea patients are getting admitted every day. Of the total, 50 percent are under 5 years of age," Dr Azharul Islam, chief of the short-stay unit of the ICDDR,B, told bdnews24.com. <br /><br />"The situation may aggravate if the heat wave and humidity continue," he said. <br /><br />A mild to moderate heat wave has been prevailing in much of the country over the last few days. <br /><br />It is likely to continue, said the Meteorological Department Wednesday. <br /><br />The consumption of power has increased forcing the electricity authorities to resort to frequent load-shedding. <br /><br />There are reports of up to 10 power outages a day in different parts of the country. <br /><br />According to the Power Development Board, Tuesday''s demand for power was 4650 megawatts against the production of 3794 megawatts. <br /><br />Load-shedding Tuesday was 742 megawatts and approximately 733 megawatts Wednesday, according to the PDB control room. <br /><br />The Met office said that slight to mild heat waves were going on in the regions of Dhaka, Khulna, Rajshahi and Chittagong. <br /><br />"Such a heat wave generally starts in May, the warmest month in Bangladesh. The present temperature is higher than the normal trend," Sujit Kumar Sharma, the chief weather officer of the Met office, told bdnews24.com. <br /><br />The country''s highest temperature for Wednesday, 40.6 degrees Celsius, was recorded in Ishwardi. Dhaka''s highest temperature was 36.1 degrees Celsius for the day. <br /><br />The temperatures in Rajshahi, Khulna, Barisal and Sylhet were 38, 37.2, 36 and 36.1 degrees Celsius respectively.', '', 1, 3, 0, 11, '2008-04-24 01:23:14', 62, '', '2008-04-24 10:18:09', 62, 0, '0000-00-00 00:00:00', '2008-04-24 01:23:14', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 5, 'robots=\nauthor='),
(97, 'AL calls countrywide hunger strike for Hasina', 'al-calls-countrywide-hunger-strike-for-hasina', '', '<!--IMAGE images/stories/breaking_news/200804/hasina_01.jpg IMAGE--><img class="content-left" src="images/stories/breaking_news/200804/hasina_01.jpg" border="0" align="left" />The Awami League will observe a symbolic hunger strike across the country on April 29 to demand the immediate release of former prime minister Sheikh Hasina, said a party leader Wednesday. <br /><br />The decision was taken at an evening meeting at acting AL president Zillur Rahman''s Gulshan home. <br /><br />After the meeting, acting AL general secretary Syed Ashraful Islam told reporters that the hunger strike would start at 10.00am and end at 4.00pm. <br /><br />The hunger strike will be observed in the AL offices on Bangabandhu Avenue and in Dhanmondi and in other 20 thanas of Dhaka city. <br /><br />Ashraful Islam said the presidium meeting had demanded national polls before the local polls. <br /><br />"We are not against the local polls. As the Election Commission has already lagged in its roadmap by more than three months, we want national polls to be held before the local government polls," he said. <br /><br />The AL also demanded a quick end to the state of emergency to help enable candidates to prepare for the polls. <br /><br />Ashraful referred to allegations by lawyers for Hasina of intimidation by an unnamed quarter. "It will be very unfortunate if the allegations are true." <br /><br />On reconciliation of the BNP, the AL general secretary said it was not the Election Commission''s job to settle an internal feud of a political party. "It made the commission controversial." <br /><br />Asked if he had any doubt over the polls in time, he said: "We hope the election will be held in line with the roadmap. But there are possibilities that the EC may fall short of its goals. The EC has to be more active."', '', 1, 2, 0, 10, '2008-04-24 01:26:51', 62, '', '2008-04-24 21:24:37', 62, 0, '0000-00-00 00:00:00', '2008-04-24 01:26:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 5, '', '', 0, 0, 'robots=\nauthor='),
(99, 'In Bangladesh, Picking Through the Pieces', 'in-bangladesh-picking-through-the-pieces', '', '<!--IMAGE images/stories/breaking_news/200804/in-bangladesh-picking-through-the-pieces.jpg IMAGE--> <img class="content-left" src="images/stories/breaking_news/200804/in-bangladesh-picking-through-the-pieces.jpg" border="0" align="left" />KHATACHIRA, Bangladesh, Nov. 20 — The wind whipped through the sky. The river swelled above the tree line. And in a flash, Mamataz Begum’s youngest child, barely 2 years old, was swept from her arms, as a tidal wave smashed through the fragile mud homes of this village and scooped up everything in its watery arms.<br /><br />Children stood amid the wreckage of their destroyed village of Khatachira on Tuesday. More Photos &gt; <br /><br />In this hamlet on the southernmost fringe of Bangladesh, cut by rivers that empty into the Bay of Bengal, nothing was spared by the cyclone that ripped through here last Thursday. Barely a single house was standing; they were all made of mud and they simply collapsed into the earth. The meager food stocks of the village had washed away. Fishing boats and nets, a principal source of income here, were gone. The paddies had filled up with brackish water, which meant there would be no harvest. <br /><br />On Tuesday, animal carcasses, stinking and bloated, lay scattered along the river bank. There was no drinking water left. A small bag of food from the government, the sole aid so far for this village of about 1,000 families, had run out. <br /><br />The people of Khatachira are a testament to the bittersweet blessings of the latest natural calamity to befall Bangladesh. Relatively speaking, the death toll from the cyclone was small — some 3,167 according to the latest official count, roughly double the death toll of Hurricane Katrina but far less than the 140,000 killed in 1991 after the last cyclone hit Bangladesh. In large measure, that was because of an early warning system that had announced the storm and had urged people to head to shelters. <br /><br />But in claiming relatively few lives, it left many more people in utter ruin. The government estimates that about four million people have been affected.<br /><br />“The crisis is just beginning,” said Suman Islam, humanitarian assistance coordinator with the aid agency Care, which had sent its first relief assessment team here Tuesday afternoon. “We have saved lives. But now, the challenge is the same.”<br /><br />In Khatachira, near the edge of the Sunderbans, the world’s largest mangrove forest, villagers have so far buried 57 of their own, nearly half of them children under age 10. Many probably died because they could not swim or cling to trees. On Tuesday morning another body, that of a local woman, was found in the bush of a neighboring village; she had yet to be brought home for burial. All but seven people had been accounted for. <br /><br />An old man who lost his entire family was searching for the bodies of his two grandchildren. Another old man said his granddaughter, age 8, was still missing. A woman with a hideous gash on her right foot — from a piece of tin roofing that fell and sliced her skin — said four in her family had been killed, and five were left to carry on. <br /><br />The nearest cyclone shelter was about two and a half miles away, and it had swelled well past capacity by the time most people in this village were ready to evacuate. One woman even went to the shelter, went home after it seemed that the storm was not coming, and was killed. <br /><br />“See over there, that was our house,” said Muhammad Himayat, pointing at an open stretch of paddy. The house is gone, along with two dozen goats, two cows and three fishing boats that together were the family’s livelihood. “It is all river now.”<br /><br />This is what the villagers said among themselves:<br /><br />“Where’s Salem?” one man asked.<br /><br />“He lost his son,” someone responded.<br /><br />“Has the grandson been found?”<br /><br />“No.”<br /><br />Scientists studying climate change in this part of the world say they expect extreme weather, including cyclones and powerful tropical storms, to rise in frequency here. And the United Nations has increasingly warned of the high toll these disasters exact on the poor.<br /><br />The survivors of Cyclone Sidr are among the poorest of the poorest, in one of the most disaster-prone countries in the world. <br /><br />Dysentery was the next demon that aid workers were guarding against. In this watery land, clean drinking water is in short supply. There are only a few water wells. The ponds, from which many villagers get their drinking water, are contaminated with rotting leaves and animals. Toilets are rare, and the practice of defecating in the fields makes it much easier for disease to spread. <br /><br />The government has appealed for international aid and in a rare gesture, opened its visa gates to foreigners, including journalists. Officials said relief workers and the military had reached the last remaining pockets of the devastated areas on Tuesday, Reuters reported.<br /><br />But food supplies remained woefully inadequate. “Hundreds of hands go up to grab just one food packet,” said a relief worker in the Patuakhali district.<br /><br />Donor countries have pledged $142 million in emergency aid. The United Nations World Food Program has distributed nearly 100 tons of high-energy biscuits and was to begin delivering rice on Friday. The United States has offered two C-130 transport planes and two amphibious naval vessels with helicopters. <br /><br />But delivering aid to places like Khatachira is not easy. Getting here means a long drive, crossing a narrow river whose only ferry has been destroyed, driving through a fetid market town that smells of dead flesh and taking a two-hour boat ride along the Baleshwar River, afloat with dead goats and ducks. <br /><br />Along the journey, one can see evidence of life limping back. A village government office, relatively untouched, has placed its documents on the front porch to dry. A remote college had its roof and walls blown off, but someone has neatly arranged the desks. The roads had been cleared of fallen logs. Banana trees and palms lay crumpled, like victims of an all-night brawl. <br /><br />The day after the cyclone, villagers here had hoisted red flags at the edge of the hamlet. Aid workers had been slow to arrive but those who had were besieged by villagers, who knew that only in narrating their losses could they expect to gain anything. <br /><br />On the edge of the water, near a tree whose roots were barely hanging onto the earth, stood a couple of cooking pots — remnants of Mamataz Begum’s kitchen. Her son’s body had washed up in another village, and they brought his corpse here. Her other children survived. Her husband broke his leg as he swam through the waves. <br /><br />On Tuesday, she was still dazed, and had no idea where the family’s next meal would come from. <br /><br />“If God will feed us, we will eat,” she said.', '', 1, 2, 0, 10, '2008-04-24 23:39:26', 62, '', '2008-04-24 23:45:04', 62, 0, '0000-00-00 00:00:00', '2008-04-24 23:39:26', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 0, 'robots=\nauthor='),
(100, 'Cyclone Toll Exceeds 3,100 in Bangladesh', 'cyclone-toll-exceeds-3100-in-bangladesh', '', '<!--IMAGE images/stories/breaking_news/200804/cyclone-toll-exceeds-3100-in-bangladesh.jpg IMAGE--><img class="content-left" src="images/stories/breaking_news/200804/cyclone-toll-exceeds-3100-in-bangladesh.jpg" border="0" align="left" />The number of people left dead after the powerful cyclone that swept through Bangladesh on Thursday rose to more than 3,100 yesterday, the government said. The United Nations estimated that a million people had been left homeless, many of them in remote areas without predictable food supplies.<br /><br />Rice was distributed Monday in Patuakhali, one of the districts in Bangladesh that was badly hit Thursday by a cyclone. More Photos » <br /><br />The Bangladesh Red Crescent Society warned Sunday that the number of dead could conceivably be 5,000 to 10,000, and the United Nations World Food Program said yesterday that it would not be surprised by such a tally. But yesterday the International Federation of Red Cross and Red Crescent Societies said that reports from its officials who had been to the hardest-hit areas led the organization to expect a final toll in line with the government’s official assessment.<br /><br />“What we are seeing on the ground is not as horrifying,” said Devendra Tak, a senior regional spokesman for the federation, who spoke from Khulna, a town in southern Bangladesh, after visiting some of the districts that took the worst pounding from the cyclone, which had winds of more than 100 miles an hour. “We don’t see the level of destruction that we had feared earlier.” <br /><br />Mr. Tak said thousands of fishermen who had been missing along the coastal areas and presumed dead had begun to turn up in their villages. “We are very optimistic that the overall disaster will not be on a very high level,” Mr. Tak said by telephone. <br /><br />The United Nations said that it was waiting for a fuller picture to emerge and that the final death toll could still be significantly higher. Usha Mishra, a senior adviser at the United Nations World Food Program, said food supplies had been severely disrupted, creating a risk of famine.<br /><br />She said the program had begun to distribute food and that more serious emergency operations were being considered, including broader food distribution and rebuilding of homes. “Shelter is the big need right now,” she said. “One million people have been turned homeless.”<br /><br />The government’s officially confirmed death toll from the cyclone reached 3,113, said Lt. Col. Main Ullah Chowdhury, a spokesman for the army, according to The Associated Press.', '', 1, 2, 0, 10, '2008-04-24 23:45:24', 62, '', '2008-04-24 23:48:05', 62, 0, '0000-00-00 00:00:00', '2008-04-24 23:45:24', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(101, 'Embryonic stem cells coaxed into key heart cells', 'embryonic-stem-cells-coaxed-into-key-heart-cells', '', 'WASHINGTON, April 24 (bdnews24.com/Reuters) - Scientists say they have coaxed human embryonic stem cells into becoming three of the major cell types in the human heart, and they improved cardiac function when transplanted into mice. <br /><br />The findings, published in the journal Nature on Wednesday, showed that scientists can efficiently make different kinds of human heart cells for use in basic and clinical research. <br /><br />The researchers said that in the short term, they could be used to test how heart cells respond to different drugs. In the long term, the cells may be useful in developing new ways to repair damaged hearts following a heart attack. <br /><br />The study marks the latest step toward possibly using embryonic stem cells -- master cells that can transform into all types of cells in the body -- to treat disease in people. <br /><br />Canadian, US and British scientists said they succeeded in the laboratory in directing human embryonic stem cells to turn into the most immature possible heart cell in human development. This cell is called a heart progenitor cell. <br /><br />The scientists then encouraged these cells to develop into three types of human heart cells: cardiomyocytes, which are cardiac muscle cells that contract with the beating heart; and two other types called endothelial cells and vascular smooth muscle cells that make the blood vessels in the heart. <br /><br />When the scientists transplanted the three types into mice with simulated heart disease, their heart function was improved, offering hope to researchers who may want to develop this technique for treating human hearts. <br /><br />"We''re not the first group to show that you can make heart cells from embryonic stem cells. That''s been done before," Gordon Keller of the McEwen Centre for Regenerative Medicine in Toronto, who led the research, said in a telephone interview. <br /><br />"So what''s different here? We''ve taken more of a step-wise approach to following the progression of how these embryonic stem cells move through development to make the first type of heart cells," Keller said.', '', 1, 11, 0, 25, '2008-04-25 01:19:43', 62, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-25 01:19:43', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 1, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(102, 'How sweet: Papaya genome bares evolution`s secrets', 'how-sweet-papaya-genome-bares-evolutions-secrets', '', 'WASHINGTON, April 24 - Papayas have extra copies of genes that make them sweet and nutritious, researchers reported on Wednesday in a study that can help shed light on how flowering plants evolved. <br /><br />They published the complete genetic sequence of the "SunUp" papaya, a tree genetically engineered to be virus resistant. <br /><br />Writing in the journal Nature, they said the plant has fewer genes than the more thoroughly studied weed Arabdopsis, yet has a longer DNA sequence. <br /><br />They believe they have pinpointed genes responsible for helping tree-like plants evolve, and genes that helped make it smell and taste so good, attracting animals and people to spread its seeds. <br /><br />Papayas have extra genes that appear to code for these aromas and for storing starch, presumably in the fruit. <br /><br />"This also foreshadows what we might expect to discover in the genomes of other fragrant-fruited trees, as well as plants with striking fragrance of leaves (herbs), flowers or other organs," Maqsudul Alam of the University of Hawaii and colleagues wrote. <br /><br />"Papaya is an exceptionally promising system for the exploration of tropical-tree genomes and fruit-tree genomics," they added. <br /><br />"Arguably, the sequencing of the genome of SunUp papaya makes it the best-characterized commercial transgenic crop." <br /><br />The fruit is commercially valuable. <br /><br />"Papaya is ranked first on nutritional scores among 38 common fruits, based on the percentage of the United States Recommended Daily Allowance for vitamin A, vitamin C, potassium, folate, niacin, thiamine, riboflavin, iron and calcium, plus fibre," they wrote. <br /><br />"Consumption of its fruit is recommended for preventing vitamin A deficiency, a cause of childhood blindness in tropical and subtropical developing countries."', '', 1, 11, 0, 25, '2008-04-25 01:20:21', 62, '', '2008-04-25 12:50:06', 62, 0, '0000-00-00 00:00:00', '2008-04-25 01:20:21', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 1, '', '', 0, 1, 'robots=\nauthor='),
(103, 'Ordinances ban war criminals from local polls', 'ordinances-ban-war-criminals-from-local-polls', '', 'Dhaka, April 24 (bdnews24.com) – The cabinet Thursday approved three ordinances that prescribe a series of provisions, including a ban on convicted war criminals from taking part in the local government polls, a government spokesman said. Updated <br /><br />Two of the ordinances—similar in nature—also enable the authorities to appoint an administrator to a local government body if there is no election in 180 days from the expiry of its term. <br />', '<br />Political leaders and private service holders will be able to contest the local government polls. <br /><br />The Local Government (City Corporation) Ordinance 2008 and Local Government (Municipalities) Ordinance 2008 kept a provision for a ban on the war criminals convicted by any local or international court or tribunal, the chief adviser''s press secretary Syed Fahim Munaim told reporters after a cabinet meeting. <br /><br />The council of advisers held the meeting at the Chief Adviser''s Office, chaired by CA Fakhruddin Ahmed. <br /><br />The ordinances were designed in line with the recommendations of a committee the government formed last year to strengthen local government bodies. Adviser AMM Shawkat Ali led the seven-member committee. <br /><br />The ordinance related to city corporations will bring all city corporations under the same law. The city corporations had earlier been running on separate laws. <br /><br />According to the ordinances, the term of the elected public representatives at every level will be five years. <br /><br />The proposed ordinances specify the election spending ceiling at every level of the local government. <br /><br />The ordinances specify election spending at every level of the local government and have a provision to ensure accountability. <br /><br />Bangladeshi nationals of age 25 or over are eligible to contest the local government elections. <br /><br />A candidate must be on the voter list and be a permanent resident of the ward from where he wants to participate in the polls. <br /><br />The ordinances listed 20 crimes that disqualify the guilty to contest the polls. <br /><br />A person who lost Bangladeshi citizenship or was declared insane by any court, or suffered at least two years in jail for criminal offences or was a bank loan defaulter would be barred from the polls. <br /><br />The Local Government Commission Ordinance 2008, a third law approved by the cabinet Thursday, says the commission''s chairman must have expertise in the related field. <br /><br />Two members, apart from the chairman of the commission, must have administrative and legal expertise. <br /><br />The chairman of the Public Service Commission will be the ex-officio chairman of the commission''s search committee. The comptroller and auditor general and the local government secretary would be its members. <br /><br />The President will appoint the commission''s chairman and two members from the panel selected by the search committee. <br /><br />The Local Government Division will ensure financial allocation to the unions, upazilas, districts, municipalities and city corporations as per the recommendations of the Local Government Commission. <br /><br />New city corporations, districts, upazilas and municipalities can be set up in line with the commission''s recommendations.', 1, 4, 0, 12, '2008-04-25 01:27:41', 62, '', '2008-05-04 11:24:41', 62, 0, '0000-00-00 00:00:00', '2008-04-25 01:27:41', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 3, 0, 16, '', '', 0, 0, 'robots=\nauthor='),
(104, 'Top Videos', 'top-videos', '', 'Please choose a video by clicking on one of the small thumbnails. Then click the play icon to view the video.\r\n<br/>\r\n<br/>\r\n\r\n<table border=0 cellpadding="0" cellspacing="0">\r\n<tr>\r\n  <td>\r\n    <table cellpadding="1" cellspacing="0">\r\n    <tr><td><a href="javascript:void()" onclick="javascript:video(1);"><img src="/images/stories/movies/200804/george-harrison-in-concert-for-bangladesh.jpg" border="0" width="88" height="49"/></a></td></tr>\r\n    <tr><td><a href="javascript:void()" onclick="javascript:video(2);"><img src="/images/stories/movies/200804/ravi-shankar-in-concert-for-bangladesh.jpg" border="0" width="88" height="49"/></a></td></tr>\r\n    <tr><td><a href="javascript:void()" onclick="javascript:video(3);"><img src="/images/stories/movies/200804/shakira-appeals-for-bangladesh.jpg" border="0" width="88" height="49"/></a></td></tr>\r\n    <tr><td><a href="javascript:void()" onclick="javascript:video(4);"><img src="/images/stories/movies/200804/history-of-bangladesh-independence.jpg" border="0" width="88" height="49"/></a></td></tr>\r\n    <tr><td><a href="javascript:void()" onclick="javascript:video(5);"><img src="/images/stories/movies/200804/hardworking-rural-bangladesh.jpg" border="0" width="88" height="49"/></a></td></tr>\r\n    </table>\r\n  </td>\r\n  <td style="width: 10px;"></td>\r\n  <td bgcolor="black"><div id="video" align="center"></div></td>\r\n</tr>\r\n</table>\r\n\r\n<br/>\r\n<br/>\r\n\r\n<script language="javascript">\r\n\r\nfunction gup( name )\r\n{\r\n  name = name.replace(/[\\[]/,"\\\\\\[").replace(/[\\]]/,"\\\\\\]");\r\n  var regexS = "[\\\\?&]"+name+"=([^&#]*)";\r\n  var regex = new RegExp( regexS );\r\n  var results = regex.exec( window.location.href );\r\n  if( results == null )\r\n    return "";\r\n  else\r\n    return results[1];\r\n}\r\n\r\nfunction video(id) {\r\n\r\n  video_file = "";\r\n  video_image = "";\r\n  if (id == 1) {\r\n    video_file = "/images/stories/movies/200804/george-harrison-in-concert-for-bangladesh.flv";\r\n    video_image = "/images/stories/movies/200804/george-harrison-in-concert-for-bangladesh.png";\r\n  } else if (id == 2) {\r\n    video_file = "/images/stories/movies/200804/ravi-shankar-in-concert-for-bangladesh.flv";\r\n    video_image = "/images/stories/movies/200804/ravi-shankar-in-concert-for-bangladesh.png";\r\n  } else if (id == 3) {\r\n    video_file = "/images/stories/movies/200804/shakira-appeals-for-bangladesh.flv";\r\n    video_image = "/images/stories/movies/200804/shakira-appeals-for-bangladesh.png";\r\n  } else if (id == 4) {\r\n    video_file = "/images/stories/movies/200804/history-of-bangladesh-independence.flv";\r\n    video_image = "/images/stories/movies/200804/history-of-bangladesh-independence.png";\r\n  } else if (id == 5) {\r\n    video_file = "/images/stories/movies/200804/hardworking-rural-bangladesh.flv";\r\n    video_image = "/images/stories/movies/200804/hardworking-rural-bangladesh.png";\r\n  }\r\n  document.getElementById(''video'').innerHTML = ''<embed '' +\r\n      ''src="/mediaplayer.swf" '' +\r\n      ''width="666" '' +\r\n      ''height="500" '' +\r\n      ''allowscriptaccess="always" '' +\r\n      ''allowfullscreen="true" '' +\r\n      ''flashvars="width=666&height=500&file=''+ video_file +''&image='' + video_image + ''&displayheight=500"/>'';\r\n}\r\n\r\nvid = gup("vid");\r\n//alert("vid" + vid);\r\nif (vid == '''') {\r\n  video(1);\r\n} else {\r\n  video(vid);\r\n}\r\n\r\n</script>', '', 1, 0, 0, 0, '2008-04-25 23:09:49', 62, '', '2008-04-26 01:16:55', 62, 62, '2008-05-10 10:06:26', '2008-04-25 23:09:49', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=0\nshow_create_date=0\nshow_modify_date=0\nshow_pdf_icon=0\nshow_print_icon=0\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 19, 0, 2, '', '', 0, 36, 'robots=\nauthor='),
(105, 'Hasina won''t quit politics under pressure: lawyers  ', 'hasina-wont-quit-politics-under-pressure-lawyers-', '', 'Dhaka, April 27 - Former prime minister Sheikh Hasina said Sunday she would not give up on politics under any pressure.\r\n\r\n"I will not retire from politics. I will not quit politics under any pressure," Hasina was quoted as telling her lawyers after she was produced in the Special Divisional Judge''s Court for Dhaka as part of the proceedings of a graft case involving the purchase of MiG-29 warplanes.\r\n\r\n"Countrymen will decide whether I will do politics or not. I will not yield to anybody else''s decision," the detained Awami League president was quoted as saying.\r\n\r\nThe court permitted Hasina to speak to her lawyers after the hearing of the case. Her lawyers Quamrul Islam, Sahara Khatun and Abdul Mannan briefed reporters emerging from the court.\r\n\r\nThe lawyers quoted Hasina as saying that it would not be wise to quit politics "leaving people in such a condition".\r\n\r\nHasina was said to have protested Dr Kamal Hossain''s statement that those who demanded the release of corrupt politicians should also be punished.\r\n\r\nReferring to Hasina, her lawyers alleged that the prison authorities had ignored doctors'' suggestion that she should have stayed one more week at Square Hospital.\r\n\r\n"I was asked to return to jail suddenly on Saturday afternoon," the AL chief was quoted to have said.', '', 1, 2, 0, 10, '2008-04-27 10:03:10', 62, '', '2008-04-27 10:20:34', 62, 0, '0000-00-00 00:00:00', '2008-04-27 10:03:10', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 2, '', '', 0, 0, 'robots=\nauthor='),
(106, 'gfdgdgfgfgf', 'gfdgdgfgfgf', '', '<h1>rgwergrerwgweg</h1><p>egwewergwergwerg</p><p>rgwe</p><p>rg</p><p>weg</p><p>we</p><p>gwe</p><p>&nbsp;</p>', '', -2, 0, 0, 0, '2008-04-27 11:01:25', 63, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2008-04-27 00:00:00', '0000-00-00 00:00:00', '', '', '', 1, 0, 0, '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(95, 5),
(29, 4),
(27, 3),
(23, 2),
(103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'bdnews24.com', 0),
(11, 'users', '63', 0, 'Biplob Rahman', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  `value` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL default '0',
  `section_value` varchar(230) NOT NULL default '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY  (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_aro_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(19, '', 11),
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_items`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_jf_content`
--

CREATE TABLE IF NOT EXISTS `jos_jf_content` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `language_id` int(11) NOT NULL default '0',
  `reference_id` int(11) NOT NULL default '0',
  `reference_table` varchar(100) NOT NULL default '',
  `reference_field` varchar(100) NOT NULL default '',
  `value` text NOT NULL,
  `original_value` varchar(255) default NULL,
  `original_text` text,
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_jf_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_jf_tableinfo`
--

CREATE TABLE IF NOT EXISTS `jos_jf_tableinfo` (
  `id` int(11) NOT NULL auto_increment,
  `joomlatablename` varchar(100) NOT NULL default '',
  `tablepkID` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `jos_jf_tableinfo`
--

INSERT INTO `jos_jf_tableinfo` (`id`, `joomlatablename`, `tablepkID`) VALUES
(1, 'banner', 'bid'),
(2, 'bannerclient', 'cid'),
(3, 'categories', 'id'),
(4, 'contact_details', 'id'),
(5, 'content', 'id'),
(6, 'menu', 'id'),
(7, 'modules', 'id'),
(8, 'newsfeeds', 'id'),
(9, 'poll_data', 'id'),
(10, 'polls', 'id'),
(11, 'sections', 'id'),
(12, 'users', 'id'),
(13, 'weblinks', 'id');

-- --------------------------------------------------------

--
-- Table structure for table `jos_languages`
--

CREATE TABLE IF NOT EXISTS `jos_languages` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `active` tinyint(1) NOT NULL default '0',
  `iso` varchar(20) default NULL,
  `code` varchar(20) NOT NULL default '',
  `shortcode` varchar(20) default NULL,
  `image` varchar(100) default NULL,
  `fallback_code` varchar(20) NOT NULL default '',
  `params` text,
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_languages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(75) default NULL,
  `name` varchar(255) default NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL default '0',
  `rgt` int(11) unsigned NOT NULL default '0',
  `home` int(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=0\norderby_pri=\norderby_sec=rdate\nshow_pagination=0\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=0\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'usermenu', 'Add Article', 'add-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(3, 'mainmenu', 'Bangladesh', 'bangladesh', 'index.php?option=com_content&view=category&layout=blog&id=11', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(4, 'mainmenu', 'Politics', 'politics', 'index.php?option=com_content&view=category&layout=blog&id=12', 'component', 1, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(5, 'mainmenu', 'Business', 'business', 'index.php?option=com_content&view=category&layout=blog&id=13', 'component', 1, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(6, 'mainmenu', 'Sports', 'sports', 'index.php?option=com_content&view=category&layout=blog&id=14', 'component', 1, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(7, 'mainmenu', 'World', 'world', 'index.php?option=com_content&view=section&layout=blog&id=7', 'component', 1, 0, 20, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(8, 'mainmenu', 'South Asia', 'south-asia', 'index.php?option=com_content&view=category&layout=blog&id=16', 'component', 1, 7, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(9, 'mainmenu', 'South East Asia', 'south-east-asia', 'index.php?option=com_content&view=category&layout=blog&id=17', 'component', 1, 7, 20, 1, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(10, 'mainmenu', 'Asia Pacific', 'asia-pacific', 'index.php?option=com_content&view=category&layout=blog&id=18', 'component', 1, 7, 20, 1, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(11, 'mainmenu', 'Middle East', 'middle-east', 'index.php?option=com_content&view=category&layout=blog&id=19', 'component', 1, 7, 20, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(12, 'mainmenu', 'Europe', 'europe', 'index.php?option=com_content&view=category&layout=blog&id=22', 'component', 1, 7, 20, 1, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(13, 'mainmenu', 'Americas', 'americas', 'index.php?option=com_content&view=category&layout=blog&id=20', 'component', 1, 7, 20, 1, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(14, 'mainmenu', 'Africa', 'africa', 'index.php?option=com_content&view=category&layout=blog&id=21', 'component', 1, 7, 20, 1, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(15, 'mainmenu', 'Lifestyle', 'lifestyle', 'index.php?option=com_content&view=category&layout=blog&id=23', 'component', 1, 0, 20, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(16, 'mainmenu', 'Technology', 'technology', 'index.php?option=com_content&view=category&layout=blog&id=24', 'component', 1, 0, 20, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(17, 'mainmenu', 'Science', 'science', 'index.php?option=com_content&view=category&layout=blog&id=25', 'component', 1, 0, 20, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(18, 'mainmenu', 'Health', 'health', 'index.php?option=com_content&view=category&layout=blog&id=26', 'component', 1, 0, 20, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=\nshow_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_item_navigation=\nshow_readmore=\nshow_vote=\nshow_icons=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nshow_hits=\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `menutype` varchar(75) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_messages_cfg`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY  (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_migration_backlinks`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(50) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  `control` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=_menu\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(17, 'Login', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 0, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=0\nname=0\nusesecure=0\n\n', 0, 0, ''),
(18, 'User Menu', '', 1, 'user9', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu\nmenu_style=list\nstartLevel=0\nendLevel=0\nshowAllChildren=0\nwindow_open=\nshow_whitespace=0\ncache=1\ntag_id=\nclass_sfx=\nmoduleclass_sfx=\nmaxdepth=10\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nactivate_parent=0\nfull_active_id=0\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=\nspacer=\nend_spacer=\n\n', 0, 0, ''),
(19, 'RokMediaScroller', '', 1, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_rokmediascroller', 0, 0, 1, 'moduleid=media-list\nfeed_cache=1\nmaxcount=9\nfeedurl=http://youtube.com/rss/global/top_favorites.rss\njslib=1\nduration=1000\n', 0, 0, ''),
(20, 'RokNewsflash News', '', 1, 'newsflash', 0, '0000-00-00 00:00:00', 1, 'mod_roknewsflash', 0, 0, 0, 'type=1\nshow_front=0\ncount=10\ncatid=0\nsecid=0\njslib=0\nusetitle=0\npretext=Newsflash:\ncontrols=1\nduration=600\ndelay=2500\npreview_count=65\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(21, 'RokNewsRotator News', '', 1, 'rotator', 0, '0000-00-00 00:00:00', 1, 'mod_roknewsrotator', 0, 0, 0, 'linktitle=1\nlinkimage=1\nshow_front=0\ncount=5\ncatid=10\nsecid=0\njslib=0\nreadmore=Read More\nduration=800\ndelay=7000\ncorners=1\nautoplay=1\npreview_count=300\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(24, 'Hours of Fun and Activities for Kidz', '<img class="content-left" src="images/stories/kidz_th.jpg" border="0" />Hours of fun, games, puzzles, stories and activities for kids. Parents will love them too! <a class="readon" href="http://kidz.bdnews24.com">Go to site...</a>', 2, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=-hilite1a\n\n', 0, 0, ''),
(22, 'Opinion Poll', '', 3, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_poll', 0, 0, 1, 'id=1\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(23, 'Search', '', 1, 'search', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 0, 'moduleclass_sfx=\nwidth=20\ntext=\nbutton=\nbutton_pos=right\nimagebutton=\nbutton_text=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(25, 'Get the latest scoop from the entertainment world', '<img class="content-left" src="images/stories/glitz_th.jpg" border="0" />Ask your question and let your favorite star answer! Get the latest scoop from the entertainment world! <a class="readon" href="http://glitz.bdnews24.com">Go to site...</a>', 4, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=-hilite2b\n\n', 0, 0, ''),
(33, 'Who''s Online', '', 7, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_whosonline', 0, 0, 0, 'cache=0\nshowmode=0\nmoduleclass_sfx=\n\n', 0, 0, ''),
(34, 'The Truth Behind Power Outages', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nunc euismod mi quis augue. Morbi mattis ante ut massa. In tincidunt. Mauris ornare mi eget odio. Fusce nec ante et sem auctor adipiscing. Maecenas libero nisl, venenatis ac, iaculis a, bibendum sit amet, lectus. Phasellus dictum urna sed lacus. Donec a lacus. Proin ut est quis tellus adipiscing hendrerit. Integer sem eros, ullamcorper ac, porta nec, egestas sed, quam.', 1, 'user12', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(35, '1 on 1 with Dr. Yunus', 'Mauris sit amet nibh. Fusce elit lacus, aliquam vel, mattis id, sollicitudin ac, dolor. In metus eros, imperdiet eget, rutrum vitae, faucibus non, eros. Aenean mauris nulla, volutpat sodales, tincidunt ut, porta in, dui. Donec quam. Mauris nulla. Curabitur faucibus molestie purus. Vivamus a orci sed elit gravida scelerisque. Nam bibendum. Ut id massa. Sed feugiat, est vel suscipit posuere, odio nisi bibendum mi, eget ultricies pede nibh quis tortor. Aenean feugiat justo quis lorem. Vestibulum mauris mauris, laoreet ac, scelerisque sed, volutpat ut, mi. In semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc viverra lorem vitae risus. Aenean sed justo eu tellus laoreet viverra. Fusce molestie accumsan pede. Phasellus a augue. Aliquam sed risus.', 1, 'user13', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(36, 'Best Bangla Food', 'Praesent viverra odio nec leo. Donec vehicula tortor quis ante. Integer pede. Donec sapien ligula, euismod porta, adipiscing auctor, rutrum ac, turpis. Fusce nisl nisi, tincidunt eu, elementum vitae, commodo vitae, ante. Maecenas neque lectus, rhoncus sed, imperdiet nec, egestas eget, elit. Aenean eleifend felis non eros. Vestibulum massa nisl, condimentum non, vestibulum a, congue at, ante. Phasellus dictum quam ut nibh. Mauris ipsum dui, molestie eleifend, pretium at, faucibus non, dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum gravida velit ut arcu. Sed bibendum, nisl eget egestas vulputate, pede metus semper dolor, vel volutpat est felis non velit. Suspendisse lorem ligula, sodales nec, sollicitudin id, vehicula ac, erat. Sed gravida ligula vulputate neque. Donec pharetra. Nullam nec purus non lectus vulputate bibendum. Nulla congue arcu ac lectus. Etiam risus arcu, feugiat venenatis, semper a, sagittis ac, leo. Aenean quis urna vel massa porta malesuada.', 1, 'user14', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(37, 'Highest Interest on Savings', 'Aenean ut elit. Vivamus lacinia. Vivamus nec ipsum. Vivamus semper. Cras ac elit. Sed euismod magna quis est. Nam adipiscing. Vivamus convallis. Duis id mi. Vestibulum commodo pede in lectus. Quisque congue. Sed sapien diam, feugiat eu, mattis ut, varius eget, velit. Duis vel quam quis felis dapibus ultrices. Curabitur hendrerit risus ac nisl congue eleifend. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;', 1, 'user15', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(38, 'How to Manage Your Todo List', 'Vestibulum nisl. Donec ac ipsum vitae elit tempus tempor. Sed sed leo sed lorem pulvinar lobortis. Cras pretium. Maecenas urna est, ullamcorper eget, vestibulum posuere, ultricies sit amet, ligula. Vestibulum orci arcu, eleifend at, consequat quis, pretium at, est. Praesent magna mauris, ornare sed, hendrerit sed, semper vel, ipsum. Cras mollis. In non purus nec purus euismod aliquam. Mauris eros augue, pulvinar vitae, ultricies nec, sodales pellentesque, lectus. Etiam a felis at ante lacinia imperdiet. Duis molestie dignissim nisi. Vestibulum in dolor. Mauris est. Mauris mi purus, interdum fermentum, interdum ac, convallis id, ligula. Cras nisi neque, pretium id, rhoncus non, mattis a, dolor. Curabitur ac velit viverra justo ultricies commodo. Phasellus molestie massa nec eros. Vivamus ut nibh.', 1, 'user16', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(40, 'Business', '<span class="headline-red">iSteve Jobs</span><img src="images/stories/arts/steve-jobs.jpg" alt="" /><br /><br />\r\nIt''s rare that you see an artist in his 30s or 40s able to really contribute something amazing...\r\n<a href="http://biz.bdnews24.com/" class="readon">Read More</a>', 1, 'user1', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=-headline-red\n\n', 0, 0, ''),
(32, 'Most Read News', '', 5, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_mostread', 0, 0, 1, 'moduleclass_sfx=-hilite3a\nshow_front=1\ncount=5\ncatid=\nsecid=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(28, 'Top Videos', '<script type="text/javascript" src="templates/rt_mediamogul_j15/js/rokvideoscroller.js"></script>\r\n<script type="text/javascript">\r\n	window.addEvent(''domready'', function() {\r\n		var x = new RokVideoScroller(''video-list'',{\r\n			''duration'': 1000\r\n		});\r\n	});\r\n</script>\r\n<div id="video-list" class="video-list">\r\n	<div class="video">\r\n    	<div class="left">\r\n        	<img alt="" src="images/stories/movies/200804/george-harrison-in-concert-for-bangladesh.jpg" />\r\n        </div>\r\n        <div class="desc">\r\n        	<p>George Harrison in Concert for Bgd</p>\r\n            <p><a href="/component/content/article/104-top-videos/?vid=1">Watch Video</a></p>\r\n        </div>\r\n    </div>\r\n	<div class="video">\r\n    	<div class="left">\r\n        	<img alt="" src="images/stories/movies/200804/ravi-shankar-in-concert-for-bangladesh.jpg" />\r\n        </div>\r\n        <div class="desc">\r\n        	<p>Ravi Shankar in Concert for Bgd</p>\r\n            <p><a href="/component/content/article/104-top-videos/?vid=2">Watch Video</a></p>\r\n        </div>\r\n    </div>\r\n	<div class="video">\r\n    	<div class="left">\r\n        	<img alt="" src="images/stories/movies/200804/shakira-appeals-for-bangladesh.jpg" />\r\n        </div>\r\n        <div class="desc">\r\n        	<p>Shakira appeals for Bangladesh</p>\r\n            <p><a href="/component/content/article/104-top-videos/?vid=3">Watch Video</a></p>\r\n        </div>\r\n    </div>\r\n	<div class="video">\r\n    	<div class="left">\r\n        	<img alt="" src="images/stories/movies/200804/history-of-bangladesh-independence.jpg" />\r\n        </div>\r\n        <div class="desc">\r\n        	<p>Bangladesh Independence</p>\r\n            <p><a href="/component/content/article/104-top-videos/?vid=4">Watch Video</a></p>\r\n        </div>\r\n    </div>\r\n	<div class="video">\r\n    	<div class="left">\r\n        	<img alt="" src="images/stories/movies/200804/hardworking-rural-bangladesh.jpg" />\r\n        </div>\r\n        <div class="desc">\r\n        	<p>Hardworking Rural</p>\r\n            <p><a href="/component/content/article/104-top-videos/?vid=5">Watch Video</a></p>\r\n        </div>\r\n    </div>\r\n</div>', 1, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=-hilite2\n\n', 0, 0, ''),
(29, 'Politics', '', 1, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=1\nsecid=\ncatid=12\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(42, 'Sports', '', 3, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=\ncatid=14\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(41, 'Business', '', 2, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=\ncatid=13\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(31, 'Advertisement', '', 6, 'right', 0, '0000-00-00 00:00:00', 1, 'mod_banners', 0, 0, 1, 'target=1\ncount=1\ncid=0\ncatid=30\ntag_search=0\nordering=random\nheader_text=\nfooter_text=\nmoduleclass_sfx=-ad\ncache=0\ncache_time=900\n\n', 0, 0, ''),
(43, 'World', '', 4, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=7\ncatid=\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(44, 'Lifestyle', '', 1, 'user5', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=\ncatid=23\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(45, 'Technology', '', 2, 'user5', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=\ncatid=24\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(46, 'Science', '', 3, 'user5', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=\ncatid=25\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(47, 'Health', '', 4, 'user5', 0, '0000-00-00 00:00:00', 1, 'mod_latestnews', 0, 0, 1, 'count=5\nordering=c_dsc\nuser_id=0\nshow_front=0\nsecid=\ncatid=26\nmoduleclass_sfx=\ncache=1\ncache_time=900\n\n', 0, 0, ''),
(48, 'Arts', '<span class="headline">Did Shakespeare Plagiarize?</span><img src="images/stories/arts/shakespeare.jpg" alt="" /><br /><br />\r\nWilliam Shakespeare has been accused of plagiarism on grounds that he pirated plots, phrases, lines...\r\n<a href="http://arts.bdnews24.com/" class="readon">Read More</a>', 1, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(49, 'Entertainment', '<span class="headline-orange">Hunt Calls the Shots</span><img src="images/stories/arts/helen-hunt.jpg" alt="" /><br /><br />\r\nFor her new film, "Then She Found Me," which took more than a decade to make, Helen Hunt is credited as...\r\n<a href="http://glitz.bdnews24.com/" class="readon">Read More</a>', 1, 'user2', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=-headline-orange\n\n', 0, 0, ''),
(51, 'Weather', 'Dhaka: 82°F, Feels Like 90°F<br/>\r\nSylhet: 81°F, Feels Like 87°F<br/>\r\nBarisal: 82°F, Feels Like 90°F<br/>\r\nBogra: 82°F, Feels Like 90°F<br/>\r\nRangpur: 37°F, Feels Like 33°F<br/>', 1, 'user8', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=-weather\n\n', 0, 0, ''),
(52, 'Cricket Score', 'West Indies vs. Sri Lanka, Guyana, 26 MAR 2008: West Indies 269/9 106.0 ov<br /> Bangladesh vs. Ireland, Mirpur, 22 MAR 2008: Ireland 214/10 45.3 ov', 1, 'user6', 0, '0000-00-00 00:00:00', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, ''),
(53, 'Stock Watch', '<table cellpadding="0" cellspacing="0">\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>Index</td>\r\n<td>Points</td>\r\n<td>Percent</td>\r\n</tr>\r\n<tr>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n<td>&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td>DSI</td>\r\n<td>2599.6027</td>\r\n<td>18.7569</td>\r\n<td>.726776</td>\r\n</tr>\r\n<tr>\r\n<td>DS20</td>\r\n<td>2394.8771</td>\r\n<td>25.95925</td>\r\n<td>1.09582</td>\r\n</tr>\r\n<tr>\r\n<td>DGEN</td>\r\n<td>3079.3462</td>\r\n<td>26.0267</td>\r\n<td>.852409</td>\r\n</tr>\r\n</table>', 1, 'user7', 62, '2008-04-26 22:02:29', 1, 'mod_custom', 0, 0, 1, 'moduleclass_sfx=\n\n', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(28, 1),
(29, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(51, 1),
(52, 1),
(53, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL default '',
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `rtl` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_newsfeeds`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE 2.0', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'theme=advanced\ncleanup=1\ncleanup_startup=0\nautosave=0\ncompressed=0\nrelative_urls=1\ntext_direction=ltr\nlang_mode=0\nlang_code=en\ninvalid_elements=applet\ncontent_css=1\ncontent_css_custom=\nnewlines=0\ntoolbar=top\nhr=1\nsmilies=1\ntable=1\nstyle=1\nlayer=1\nxhtmlxtras=0\ntemplate=0\ndirectionality=1\nfullscreen=1\nhtml_height=550\nhtml_width=750\npreview=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'Joomfish - Abstraction Layer', 'jfdatabase', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 'determitLanguage=1\nnewVisitorAction=browser\nenableCookie=1\n'),
(35, 'Search - Joomfish Categories', 'jfcategories', 'search', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(1, 'Former MPs, being asked to vacate NAM flats or pay rents, demand that the government scrap the allotments of the plush homes to officials of ministries, ACC and SSF. Do you support the demand?', 'former-mps-being-asked-to-vacate-nam-flats-or-pay-rents-demand-that-the-government-scrap-the-allotments-of-the-plush-homes-to-officials-of-ministries-acc-and-ssf-do-you-support-the-demand', 0, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(11) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 1, 'Yes', 0),
(2, 1, 'No', 0),
(3, 1, '', 0),
(4, 1, '', 0),
(5, 1, '', 0),
(6, 1, '', 0),
(7, 1, '', 0),
(8, 1, '', 0),
(9, 1, '', 0),
(10, 1, '', 0),
(11, 1, '', 0),
(12, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_poll_date`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_poll_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(30) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(2, 'Virtual', '', 'virtual', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 1, 0, 4, ''),
(3, 'Bangladesh', '', 'bangladesh', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 2, 0, 3, ''),
(4, 'Politics', '', 'politics', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 3, 0, 3, ''),
(5, 'Business', '', 'business', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 4, 0, 1, ''),
(6, 'Sports', '', 'sports', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 5, 0, 1, ''),
(7, 'World', '', 'world', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 6, 0, 8, ''),
(8, 'Kids', '', 'kids', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 7, 0, 0, ''),
(9, 'Lifestyle', '', 'lifestyle', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 8, 0, 1, ''),
(10, 'Technology', '', 'technology', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 9, 0, 1, ''),
(11, 'Science', '', 'science', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 10, 0, 1, ''),
(12, 'Health', '', 'health', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 11, 0, 1, ''),
(13, 'Arts', '', 'arts', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 12, 0, 1, ''),
(14, 'Entertainment', '', 'entertainment', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 13, 0, 1, ''),
(15, 'Frontpage', '', 'frontpage', '', 'content', 'left', '', 1, 0, '0000-00-00 00:00:00', 14, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  `client_id` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext,
  PRIMARY KEY  (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1224805695', 'o5g3qhpbrff8p4rhu52ns6u5l0', 1, 0, '', 0, 0, '__default|a:8:{s:15:"session.counter";i:2;s:19:"session.timer.start";i:1224805384;s:18:"session.timer.last";i:1224805384;s:17:"session.timer.now";i:1224805695;s:22:"session.client.browser";s:47:"Opera/9.61 (Windows NT 5.1; U; en) Presto/2.1.1";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:108:"C:\\Documents and Settings\\sanjib\\My Documents\\vhost\\bdnews24.san\\www\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"92e3f54211cb78d55cf3f465ca1a5ef4";}'),
('admin', '1224805684', '05mbh358atl752meu21kgb4au3', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:4;s:19:"session.timer.start";i:1224805425;s:18:"session.timer.last";i:1224805460;s:17:"session.timer.now";i:1224805684;s:22:"session.client.browser";s:47:"Opera/9.61 (Windows NT 5.1; U; en) Presto/2.1.1";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:2:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:12:"bdnews24.com";s:8:"username";s:5:"admin";s:5:"email";s:22:"sanjib.ahmad@gmail.com";s:8:"password";s:65:"516c1e36a55818012e96168da6b02ee9:KXIl9oP5nNKmgf3bmagpTvqRZATtosRZ";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2008-04-19 08:17:38";s:13:"lastvisitDate";s:19:"2008-05-10 10:05:31";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:108:"C:\\Documents and Settings\\sanjib\\My Documents\\vhost\\bdnews24.san\\www\\libraries\\joomla\\html\\parameter\\element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"0";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"723764bf8e7bcd056a5824a6be9aa580";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_stats_agents`
--


-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('rt_mediamogul_j15', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `username` varchar(150) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'bdnews24.com', 'admin', 'sanjib.ahmad@gmail.com', '516c1e36a55818012e96168da6b02ee9:KXIl9oP5nNKmgf3bmagpTvqRZATtosRZ', 'Super Administrator', 0, 1, 25, '2008-04-19 08:17:38', '2008-10-23 23:44:19', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(63, 'Biplob Rahman', 'biplob.rahman', 'biplob.rahman@kodiva.com', '2b45064cc60dcad671bbdc10da67a7d5:v4MWvzkN7rOLa5osKbKBiZCUGbo55G4V', 'Author', 0, 0, 19, '2008-04-23 14:37:57', '2008-04-27 11:00:25', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `alias` varchar(255) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `jos_weblinks`
--

