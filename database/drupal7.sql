-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2018 at 08:12 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drupal7`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores action information.';

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`aid`, `type`, `callback`, `parameters`, `label`) VALUES
('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment'),
('comment_save_action', 'comment', 'comment_save_action', '', 'Save comment'),
('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment'),
('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make content sticky'),
('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make content unsticky'),
('node_promote_action', 'node', 'node_promote_action', '', 'Promote content to front page'),
('node_publish_action', 'node', 'node_publish_action', '', 'Publish content'),
('node_save_action', 'node', 'node_save_action', '', 'Save content'),
('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove content from front page'),
('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish content'),
('pathauto_node_update_action', 'node', 'pathauto_node_update_action', '', 'Update node alias'),
('pathauto_taxonomy_term_update_action', 'taxonomy_term', 'pathauto_taxonomy_term_update_action', '', 'Update taxonomy term alias'),
('pathauto_user_update_action', 'user', 'pathauto_user_update_action', '', 'Update user alias'),
('system_block_ip_action', 'user', 'system_block_ip_action', '', 'Ban IP address of current user'),
('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user');

-- --------------------------------------------------------

--
-- Table structure for table `authmap`
--

CREATE TABLE `authmap` (
  `aid` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique authmap ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'User’s users.uid.',
  `authname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Unique authentication name.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'Module which is controlling the authentication.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores distributed authentication mapping.';

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `bid` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores details about batches (processes that run in...';

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `bid` int(11) NOT NULL COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...';

--
-- Dumping data for table `block`
--

INSERT INTO `block` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `visibility`, `pages`, `title`, `cache`) VALUES
(1, 'system', 'main', 'bartik', 1, 0, 'content', 2, 0, '', '', -1),
(2, 'search', 'form', 'bartik', 1, -1, 'sidebar_first', 0, 0, '', '', -1),
(3, 'node', 'recent', 'seven', 1, 10, 'dashboard_main', 0, 0, '', '', -1),
(4, 'user', 'login', 'bartik', 1, 0, 'sidebar_first', 0, 0, '', '<none>', -1),
(5, 'system', 'navigation', 'bartik', 1, 0, 'sidebar_first', 0, 0, '', '', -1),
(6, 'system', 'powered-by', 'bartik', 1, 10, 'footer', 0, 0, '', '', -1),
(7, 'system', 'help', 'bartik', 1, 0, 'help', 0, 0, '', '', -1),
(8, 'system', 'main', 'seven', 1, 0, 'content', 2, 0, '', '', -1),
(9, 'system', 'help', 'seven', 1, 0, 'help', 0, 0, '', '', -1),
(10, 'user', 'login', 'seven', 1, 10, 'content', 0, 0, '', '<none>', -1),
(11, 'user', 'new', 'seven', 1, 0, 'dashboard_sidebar', 0, 0, '', '', -1),
(12, 'search', 'form', 'seven', 1, -10, 'dashboard_sidebar', 0, 0, '', '', -1),
(13, 'comment', 'recent', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(14, 'node', 'syndicate', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(15, 'node', 'recent', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(16, 'shortcut', 'shortcuts', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(17, 'system', 'management', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(18, 'system', 'user-menu', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(19, 'system', 'main-menu', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(20, 'user', 'new', 'bartik', 0, 0, '-1', 0, 0, '', '', 1),
(21, 'user', 'online', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(22, 'comment', 'recent', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', 1),
(23, 'node', 'syndicate', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(24, 'shortcut', 'shortcuts', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(25, 'system', 'powered-by', 'seven', 0, 10, '-1', 0, 0, '', '', -1),
(26, 'system', 'navigation', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(27, 'system', 'management', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(28, 'system', 'user-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(29, 'system', 'main-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(30, 'user', 'online', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', -1),
(31, 'comment', 'recent', 'bootstrap', 0, 0, '-1', 0, 0, '', '', 1),
(32, 'node', 'recent', 'bootstrap', 0, 0, '-1', 0, 0, '', '', 1),
(33, 'node', 'syndicate', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(34, 'search', 'form', 'bootstrap', 0, -1, '-1', 0, 0, '', '', -1),
(35, 'shortcut', 'shortcuts', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(36, 'system', 'help', 'bootstrap', 1, -9, 'help', 0, 0, '', '', -1),
(37, 'system', 'main', 'bootstrap', 1, -9, 'content', 2, 0, '', '', -1),
(38, 'system', 'main-menu', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(39, 'system', 'management', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(40, 'system', 'navigation', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(41, 'system', 'powered-by', 'bootstrap', 0, -8, '-1', 0, 0, '', '', -1),
(42, 'system', 'user-menu', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(43, 'user', 'login', 'bootstrap', 0, -8, '-1', 0, 0, '', '<none>', -1),
(44, 'user', 'new', 'bootstrap', 0, 0, '-1', 0, 0, '', '', 1),
(45, 'user', 'online', 'bootstrap', 0, 0, '-1', 0, 0, '', '', -1),
(46, 'views', 'home_banner-block', 'bootstrap', 1, 0, 'content', 0, 0, '', '', -1),
(47, 'views', 'banner_-block', 'bootstrap', 1, 0, 'header', 0, 0, '', '', -1),
(48, 'views', 'banner_image-block', 'bootstrap', 1, 0, 'header', 0, 1, '<front>', '', -1),
(49, 'views', 'banner_image-block', 'bartik', 0, 0, '-1', 0, 1, '<front>', '', -1),
(50, 'views', 'banner_image-block', 'seven', 0, 0, '-1', 0, 1, '<front>', '', -1),
(54, 'menu', 'menu-top-link', 'bootstrap', 1, 0, 'logo', 0, 0, '', '<none>', -1),
(55, 'menu', 'menu-top-link', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(56, 'menu', 'menu-top-link', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(57, 'views', 'homebanner-block', 'bootstrap', 1, 0, 'header', 0, 1, '<front>', '', -1),
(58, 'views', 'homebanner-block', 'bartik', 0, 0, '-1', 0, 1, '<front>', '', -1),
(59, 'views', 'homebanner-block', 'seven', 0, 0, '-1', 0, 1, '<front>', '', -1),
(60, 'block', '1', 'bartik', 0, 0, '-1', 0, 0, '', '', -1),
(61, 'block', '1', 'bootstrap', 1, 0, 'footer', 0, 0, '', '', -1),
(62, 'block', '1', 'seven', 0, 0, '-1', 0, 0, '', '', -1),
(63, 'views', 'hotel-block', 'bootstrap', 0, 0, '-1', 0, 1, '<front>', '<none>', -1),
(64, 'views', 'hotel-block', 'bartik', 0, 0, '-1', 0, 1, '<front>', '<none>', -1),
(65, 'views', 'hotel-block', 'seven', 0, 0, '-1', 0, 1, '<front>', '<none>', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

CREATE TABLE `blocked_ips` (
  `iid` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT 'IP address'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores blocked IP addresses.';

-- --------------------------------------------------------

--
-- Table structure for table `block_custom`
--

CREATE TABLE `block_custom` (
  `bid` int(10) UNSIGNED NOT NULL COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.';

--
-- Dumping data for table `block_custom`
--

INSERT INTO `block_custom` (`bid`, `body`, `info`, `format`) VALUES
(1, '<div><a href=\"#\">@ Copyright NIC </a></div>\r\n', 'footer-text', 'filtered_html');

-- --------------------------------------------------------

--
-- Table structure for table `block_node_type`
--

CREATE TABLE `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up display criteria for blocks based on content types';

-- --------------------------------------------------------

--
-- Table structure for table `block_role`
--

CREATE TABLE `block_role` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` int(10) UNSIGNED NOT NULL COMMENT 'The user’s role ID from users_roles.rid.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up access permissions for blocks based on user roles';

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_admin_menu`
--

CREATE TABLE `cache_admin_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for Administration menu to store client-side...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_block`
--

CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Block module to store already built...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_bootstrap`
--

CREATE TABLE `cache_bootstrap` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for data required to bootstrap Drupal, may be...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_field`
--

CREATE TABLE `cache_field` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Field module to store already built...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_filter`
--

CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Filter module to store already...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_form`
--

CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the form system to store recently built...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_image`
--

CREATE TABLE `cache_image` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store information about image...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_libraries`
--

CREATE TABLE `cache_libraries` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table to store library information.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_menu`
--

CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the menu system to store router...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_page`
--

CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_path`
--

CREATE TABLE `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for path alias lookup.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_token`
--

CREATE TABLE `cache_token` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for token information.';

-- --------------------------------------------------------

--
-- Table structure for table `cache_update`
--

CREATE TABLE `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Update module to store information...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_views`
--

CREATE TABLE `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

-- --------------------------------------------------------

--
-- Table structure for table `cache_views_data`
--

CREATE TABLE `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for views to store pre-rendered queries,...';

-- --------------------------------------------------------

--
-- Table structure for table `ckeditor_input_format`
--

CREATE TABLE `ckeditor_input_format` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor role',
  `format` varchar(128) NOT NULL DEFAULT '' COMMENT 'Drupal filter format ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor input format assignments';

--
-- Dumping data for table `ckeditor_input_format`
--

INSERT INTO `ckeditor_input_format` (`name`, `format`) VALUES
('Advanced', 'filtered_html'),
('Full', 'full_html');

-- --------------------------------------------------------

--
-- Table structure for table `ckeditor_settings`
--

CREATE TABLE `ckeditor_settings` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor profile',
  `settings` text COMMENT 'Profile settings'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor profile settings';

--
-- Dumping data for table `ckeditor_settings`
--

INSERT INTO `ckeditor_settings` (`name`, `settings`) VALUES
('Advanced', 'a:27:{s:11:\"filebrowser\";s:4:\"none\";s:11:\"quickupload\";s:1:\"f\";s:2:\"ss\";s:1:\"2\";s:7:\"filters\";a:1:{s:11:\"filter_html\";i:1;}s:7:\"default\";s:1:\"t\";s:11:\"show_toggle\";s:1:\"t\";s:5:\"popup\";s:1:\"f\";s:7:\"toolbar\";s:596:\"\n[\n    [\'Source\'],\n    [\'Cut\',\'Copy\',\'Paste\',\'PasteText\',\'PasteFromWord\',\'-\',\'SpellChecker\', \'Scayt\'],\n    [\'Undo\',\'Redo\',\'Find\',\'Replace\',\'-\',\'SelectAll\'],\n    [\'Image\',\'Media\',\'Flash\',\'Table\',\'HorizontalRule\',\'Smiley\',\'SpecialChar\'],\n    [\'Maximize\', \'ShowBlocks\'],\n    \'/\',\n    [\'Format\'],\n    [\'Bold\',\'Italic\',\'Underline\',\'Strike\',\'-\',\'Subscript\',\'Superscript\',\'-\',\'RemoveFormat\'],\n    [\'NumberedList\',\'BulletedList\',\'-\',\'Outdent\',\'Indent\',\'Blockquote\'],\n    [\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\'],\n    [\'Link\',\'Unlink\',\'Anchor\',\'Linkit\']\n]\n    \";s:6:\"expand\";s:1:\"t\";s:5:\"width\";s:4:\"100%\";s:4:\"lang\";s:2:\"en\";s:9:\"auto_lang\";s:1:\"t\";s:18:\"language_direction\";s:7:\"default\";s:10:\"enter_mode\";s:1:\"p\";s:16:\"shift_enter_mode\";s:2:\"br\";s:11:\"font_format\";s:35:\"p;div;pre;address;h1;h2;h3;h4;h5;h6\";s:13:\"format_source\";s:1:\"t\";s:13:\"format_output\";s:1:\"t\";s:17:\"custom_formatting\";s:1:\"f\";s:10:\"formatting\";a:1:{s:25:\"custom_formatting_options\";a:4:{s:6:\"indent\";s:6:\"indent\";s:15:\"breakBeforeOpen\";s:15:\"breakBeforeOpen\";s:14:\"breakAfterOpen\";s:14:\"breakAfterOpen\";s:15:\"breakAfterClose\";s:15:\"breakAfterClose\";}}s:8:\"css_mode\";s:4:\"none\";s:8:\"css_path\";s:0:\"\";s:11:\"user_choose\";s:1:\"f\";s:20:\"ckeditor_load_method\";s:11:\"ckeditor.js\";s:22:\"ckeditor_load_time_out\";i:0;s:17:\"scayt_autoStartup\";s:1:\"f\";s:13:\"html_entities\";s:1:\"f\";}'),
('CKEditor Global Profile', 'a:1:{s:13:\"ckeditor_path\";s:33:\"//cdn.ckeditor.com/4.5.4/full-all\";}'),
('Full', 'a:27:{s:11:\"filebrowser\";s:4:\"none\";s:11:\"quickupload\";s:1:\"f\";s:2:\"ss\";s:1:\"2\";s:7:\"filters\";a:0:{}s:7:\"default\";s:1:\"t\";s:11:\"show_toggle\";s:1:\"t\";s:5:\"popup\";s:1:\"f\";s:7:\"toolbar\";s:709:\"\n[\n    [\'Source\'],\n    [\'Cut\',\'Copy\',\'Paste\',\'PasteText\',\'PasteFromWord\',\'-\',\'SpellChecker\', \'Scayt\'],\n    [\'Undo\',\'Redo\',\'Find\',\'Replace\',\'-\',\'SelectAll\'],\n    [\'Image\',\'Media\',\'Flash\',\'Table\',\'HorizontalRule\',\'Smiley\',\'SpecialChar\',\'Iframe\'],\n    \'/\',\n    [\'Bold\',\'Italic\',\'Underline\',\'Strike\',\'-\',\'Subscript\',\'Superscript\',\'-\',\'RemoveFormat\'],\n    [\'NumberedList\',\'BulletedList\',\'-\',\'Outdent\',\'Indent\',\'Blockquote\',\'CreateDiv\'],\n    [\'JustifyLeft\',\'JustifyCenter\',\'JustifyRight\',\'JustifyBlock\',\'-\',\'BidiLtr\',\'BidiRtl\',\'-\',\'Language\'],\n    [\'Link\',\'Unlink\',\'Anchor\',\'Linkit\'],\n    [\'DrupalBreak\'],\n    \'/\',\n    [\'Format\',\'Font\',\'FontSize\'],\n    [\'TextColor\',\'BGColor\'],\n    [\'Maximize\', \'ShowBlocks\']\n]\n    \";s:6:\"expand\";s:1:\"t\";s:5:\"width\";s:4:\"100%\";s:4:\"lang\";s:2:\"en\";s:9:\"auto_lang\";s:1:\"t\";s:18:\"language_direction\";s:7:\"default\";s:10:\"enter_mode\";s:1:\"p\";s:16:\"shift_enter_mode\";s:2:\"br\";s:11:\"font_format\";s:35:\"p;div;pre;address;h1;h2;h3;h4;h5;h6\";s:13:\"format_source\";s:1:\"t\";s:13:\"format_output\";s:1:\"t\";s:17:\"custom_formatting\";s:1:\"f\";s:10:\"formatting\";a:1:{s:25:\"custom_formatting_options\";a:4:{s:6:\"indent\";s:6:\"indent\";s:15:\"breakBeforeOpen\";s:15:\"breakBeforeOpen\";s:14:\"breakAfterOpen\";s:14:\"breakAfterOpen\";s:15:\"breakAfterClose\";s:15:\"breakAfterClose\";}}s:8:\"css_mode\";s:4:\"none\";s:8:\"css_path\";s:0:\"\";s:11:\"user_choose\";s:1:\"f\";s:20:\"ckeditor_load_method\";s:11:\"ckeditor.js\";s:22:\"ckeditor_load_time_out\";i:0;s:17:\"scayt_autoStartup\";s:1:\"f\";s:13:\"html_entities\";s:1:\"f\";}');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments and associated data.';

-- --------------------------------------------------------

--
-- Table structure for table `ctools_css_cache`
--

CREATE TABLE `ctools_css_cache` (
  `cid` varchar(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` varchar(255) DEFAULT NULL COMMENT 'The filename this CSS is stored in.',
  `css` longtext COMMENT 'CSS being stored.',
  `filter` tinyint(4) DEFAULT NULL COMMENT 'Whether or not this CSS needs to be filtered.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store CSS that must be non-volatile.';

-- --------------------------------------------------------

--
-- Table structure for table `ctools_object_cache`
--

CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(128) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` longblob COMMENT 'Serialized data being stored.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store objects that are being...';

-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE `date_formats` (
  `dfid` int(10) UNSIGNED NOT NULL COMMENT 'The date format identifier.',
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.';

--
-- Dumping data for table `date_formats`
--

INSERT INTO `date_formats` (`dfid`, `format`, `type`, `locked`) VALUES
(1, 'm/d/Y - H:i', 'short', 1),
(2, 'd/m/Y - H:i', 'short', 1),
(3, 'Y/m/d - H:i', 'short', 1),
(4, 'd.m.Y - H:i', 'short', 1),
(5, 'Y-m-d H:i', 'short', 1),
(6, 'm/d/Y - g:ia', 'short', 1),
(7, 'd/m/Y - g:ia', 'short', 1),
(8, 'Y/m/d - g:ia', 'short', 1),
(9, 'M j Y - H:i', 'short', 1),
(10, 'j M Y - H:i', 'short', 1),
(11, 'Y M j - H:i', 'short', 1),
(12, 'M j Y - g:ia', 'short', 1),
(13, 'j M Y - g:ia', 'short', 1),
(14, 'Y M j - g:ia', 'short', 1),
(15, 'D, m/d/Y - H:i', 'medium', 1),
(16, 'D, d/m/Y - H:i', 'medium', 1),
(17, 'D, Y/m/d - H:i', 'medium', 1),
(18, 'D, Y-m-d H:i', 'medium', 1),
(19, 'F j, Y - H:i', 'medium', 1),
(20, 'j F, Y - H:i', 'medium', 1),
(21, 'Y, F j - H:i', 'medium', 1),
(22, 'D, m/d/Y - g:ia', 'medium', 1),
(23, 'D, d/m/Y - g:ia', 'medium', 1),
(24, 'D, Y/m/d - g:ia', 'medium', 1),
(25, 'F j, Y - g:ia', 'medium', 1),
(26, 'j F Y - g:ia', 'medium', 1),
(27, 'Y, F j - g:ia', 'medium', 1),
(28, 'j. F Y - G:i', 'medium', 1),
(29, 'l, F j, Y - H:i', 'long', 1),
(30, 'l, j F, Y - H:i', 'long', 1),
(31, 'l, Y,  F j - H:i', 'long', 1),
(32, 'l, F j, Y - g:ia', 'long', 1),
(33, 'l, j F Y - g:ia', 'long', 1),
(34, 'l, Y,  F j - g:ia', 'long', 1),
(35, 'l, j. F Y - G:i', 'long', 1);

-- --------------------------------------------------------

--
-- Table structure for table `date_format_locale`
--

CREATE TABLE `date_format_locale` (
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats for each locale.';

-- --------------------------------------------------------

--
-- Table structure for table `date_format_type`
--

CREATE TABLE `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date format types.';

--
-- Dumping data for table `date_format_type`
--

INSERT INTO `date_format_type` (`type`, `title`, `locked`) VALUES
('long', 'Long', 1),
('medium', 'Medium', 1),
('short', 'Short', 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_config`
--

CREATE TABLE `field_config` (
  `id` int(11) NOT NULL COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_config`
--

INSERT INTO `field_config` (`id`, `field_name`, `type`, `module`, `active`, `storage_type`, `storage_module`, `storage_active`, `locked`, `data`, `cardinality`, `translatable`, `deleted`) VALUES
(1, 'comment_body', 'text_long', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a363a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a31323a227472616e736c617461626c65223b623a303b733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d7d, 1, 0, 0),
(2, 'body', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a363a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a343a226e6f6465223b7d733a31323a227472616e736c617461626c65223b623a303b733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d7d, 1, 0, 0),
(3, 'field_tags', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a363a7b733a383a2273657474696e6773223b613a313a7b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a343a2274616773223b733a363a22706172656e74223b693a303b7d7d7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a31323a227472616e736c617461626c65223b623a303b733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22746964223b613a323a7b733a353a227461626c65223b733a31383a227461786f6e6f6d795f7465726d5f64617461223b733a373a22636f6c756d6e73223b613a313a7b733a333a22746964223b733a333a22746964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d7d, -1, 0, 0),
(4, 'field_image', 'image', 'image', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a383a2273657474696e6773223b613a323a7b733a31303a227572695f736368656d65223b733a363a227075626c6963223b733a31333a2264656661756c745f696d616765223b693a303b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32323a226669656c645f646174615f6669656c645f696d616765223b613a353a7b733a333a22666964223b733a31353a226669656c645f696d6167655f666964223b733a333a22616c74223b733a31353a226669656c645f696d6167655f616c74223b733a353a227469746c65223b733a31373a226669656c645f696d6167655f7469746c65223b733a353a227769647468223b733a31373a226669656c645f696d6167655f7769647468223b733a363a22686569676874223b733a31383a226669656c645f696d6167655f686569676874223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32363a226669656c645f7265766973696f6e5f6669656c645f696d616765223b613a353a7b733a333a22666964223b733a31353a226669656c645f696d6167655f666964223b733a333a22616c74223b733a31353a226669656c645f696d6167655f616c74223b733a353a227469746c65223b733a31373a226669656c645f696d6167655f7469746c65223b733a353a227769647468223b733a31373a226669656c645f696d6167655f7769647468223b733a363a22686569676874223b733a31383a226669656c645f696d6167655f686569676874223b7d7d7d7d7d733a31323a22656e746974795f7479706573223b613a303a7b7d733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22666f726569676e206b657973223b613a313a7b733a333a22666964223b613a323a7b733a353a227461626c65223b733a31323a2266696c655f6d616e61676564223b733a373a22636f6c756d6e73223b613a313a7b733a333a22666964223b733a333a22666964223b7d7d7d733a323a226964223b733a313a2234223b7d, 1, 0, 0),
(5, 'field_country', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a313a7b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a373a22636f756e747279223b733a363a22706172656e74223b733a313a2230223b7d7d7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32343a226669656c645f646174615f6669656c645f636f756e747279223b613a313a7b733a333a22746964223b733a31373a226669656c645f636f756e7472795f746964223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32383a226669656c645f7265766973696f6e5f6669656c645f636f756e747279223b613a313a7b733a333a22746964223b733a31373a226669656c645f636f756e7472795f746964223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22746964223b613a323a7b733a353a227461626c65223b733a31383a227461786f6e6f6d795f7465726d5f64617461223b733a373a22636f6c756d6e73223b613a313a7b733a333a22746964223b733a333a22746964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d733a323a226964223b733a313a2235223b7d, 1, 0, 0),
(6, 'field_state', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a313a7b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a353a227374617465223b733a363a22706172656e74223b733a313a2230223b7d7d7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32323a226669656c645f646174615f6669656c645f7374617465223b613a313a7b733a333a22746964223b733a31353a226669656c645f73746174655f746964223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32363a226669656c645f7265766973696f6e5f6669656c645f7374617465223b613a313a7b733a333a22746964223b733a31353a226669656c645f73746174655f746964223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22746964223b613a323a7b733a353a227461626c65223b733a31383a227461786f6e6f6d795f7465726d5f64617461223b733a373a22636f6c756d6e73223b613a313a7b733a333a22746964223b733a333a22746964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d733a323a226964223b733a313a2236223b7d, 1, 0, 0),
(7, 'field_city', 'taxonomy_term_reference', 'taxonomy', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a313a7b733a31343a22616c6c6f7765645f76616c756573223b613a313a7b693a303b613a323a7b733a31303a22766f636162756c617279223b733a343a2263697479223b733a363a22706172656e74223b733a313a2230223b7d7d7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32313a226669656c645f646174615f6669656c645f63697479223b613a313a7b733a333a22746964223b733a31343a226669656c645f636974795f746964223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a32353a226669656c645f7265766973696f6e5f6669656c645f63697479223b613a313a7b733a333a22746964223b733a31343a226669656c645f636974795f746964223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22746964223b613a323a7b733a353a227461626c65223b733a31383a227461786f6e6f6d795f7465726d5f64617461223b733a373a22636f6c756d6e73223b613a313a7b733a333a22746964223b733a333a22746964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22746964223b613a313a7b693a303b733a333a22746964223b7d7d733a323a226964223b733a313a2237223b7d, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_config_instance`
--

CREATE TABLE `field_config_instance` (
  `id` int(11) NOT NULL COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `field_config_instance`
--

INSERT INTO `field_config_instance` (`id`, `field_id`, `field_name`, `entity_type`, `bundle`, `data`, `deleted`) VALUES
(1, 1, 'comment_body', 'comment', 'comment_node_page', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(2, 2, 'body', 'node', 'page', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b693a2d343b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(3, 1, 'comment_body', 'comment', 'comment_node_article', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(4, 2, 'body', 'node', 'article', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b693a2d343b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(5, 3, 'field_tags', 'node', 'article', 0x613a363a7b733a353a226c6162656c223b733a343a2254616773223b733a31313a226465736372697074696f6e223b733a36333a22456e746572206120636f6d6d612d736570617261746564206c697374206f6620776f72647320746f20646573637269626520796f757220636f6e74656e742e223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32313a227461786f6e6f6d795f6175746f636f6d706c657465223b733a363a22776569676874223b693a2d343b733a383a2273657474696e6773223b613a323a7b733a343a2273697a65223b693a36303b733a31373a226175746f636f6d706c6574655f70617468223b733a32313a227461786f6e6f6d792f6175746f636f6d706c657465223b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b693a31303b733a353a226c6162656c223b733a353a2261626f7665223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d733a363a22746561736572223b613a353a7b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a363a22776569676874223b693a31303b733a353a226c6162656c223b733a353a2261626f7665223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a303b7d, 0),
(6, 4, 'field_image', 'node', 'article', 0x613a363a7b733a353a226c6162656c223b733a353a22496d616765223b733a31313a226465736372697074696f6e223b733a34303a2255706c6f616420616e20696d61676520746f20676f207769746820746869732061727469636c652e223b733a383a227265717569726564223b623a303b733a383a2273657474696e6773223b613a393a7b733a31343a2266696c655f6469726563746f7279223b733a31313a226669656c642f696d616765223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b623a313b733a31313a227469746c655f6669656c64223b733a303a22223b733a31333a2264656661756c745f696d616765223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d733a363a22776569676874223b693a2d313b733a363a226d6f64756c65223b733a353a22696d616765223b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a353a226c61726765223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a22776569676874223b693a2d313b733a363a226d6f64756c65223b733a353a22696d616765223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a353a22696d616765223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a363a226d656469756d223b733a31303a22696d6167655f6c696e6b223b733a373a22636f6e74656e74223b7d733a363a22776569676874223b693a2d313b733a363a226d6f64756c65223b733a353a22696d616765223b7d7d7d, 0),
(7, 1, 'comment_body', 'comment', 'comment_node_hotel', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(9, 5, 'field_country', 'node', 'hotel', 0x613a373a7b733a353a226c6162656c223b733a373a22636f756e747279223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a323a222d34223b733a343a2274797065223b733a31343a226f7074696f6e735f73656c656374223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a303a7b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b693a313b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(10, 6, 'field_state', 'node', 'hotel', 0x613a373a7b733a353a226c6162656c223b733a353a227374617465223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a323a222d33223b733a343a2274797065223b733a31343a226f7074696f6e735f73656c656374223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a303a7b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a363a22776569676874223b693a313b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(11, 7, 'field_city', 'node', 'hotel', 0x613a373a7b733a353a226c6162656c223b733a343a2263697479223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a323a222d32223b733a343a2274797065223b733a31343a226f7074696f6e735f73656c656374223b733a363a226d6f64756c65223b733a373a226f7074696f6e73223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a303a7b7d7d733a383a2273657474696e6773223b613a313a7b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a32383a227461786f6e6f6d795f7465726d5f7265666572656e63655f6c696e6b223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a383a227461786f6e6f6d79223b733a363a22776569676874223b693a323b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0),
(12, 1, 'comment_body', 'comment', 'comment_node_banner', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(14, 4, 'field_image', 'node', 'banner', 0x613a363a7b733a353a226c6162656c223b733a353a22496d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a323a222d33223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a31353a22666c6578736c696465725f66756c6c223b7d7d733a383a2273657474696e6773223b613a393a7b733a31343a2266696c655f6469726563746f7279223b733a303a22223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a303b733a31313a227469746c655f6669656c64223b693a303b733a31333a2264656661756c745f696d616765223b733a313a2231223b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a353a22696d616765223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a303a22223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b693a313b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0),
(15, 4, 'field_image', 'node', 'hotel', 0x613a363a7b733a353a226c6162656c223b733a31313a22486f74656c20496d616765223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2230223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b7d7d733a383a2273657474696e6773223b613a393a7b733a31343a2266696c655f6469726563746f7279223b733a31303a22686f74656c696d616765223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a303a22223b733a31343a226d61785f7265736f6c7574696f6e223b733a303a22223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a303b733a31313a227469746c655f6669656c64223b693a303b733a31333a2264656661756c745f696d616765223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a353a22696d616765223b733a383a2273657474696e6773223b613a323a7b733a31313a22696d6167655f7374796c65223b733a303a22223b733a31303a22696d6167655f6c696e6b223b733a303a22223b7d733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22776569676874223b693a333b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_body`
--

CREATE TABLE `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_comment_body`
--

CREATE TABLE `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_city`
--

CREATE TABLE `field_data_field_city` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_city_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 7 (field_city)';

--
-- Dumping data for table `field_data_field_city`
--

INSERT INTO `field_data_field_city` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_city_tid`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 5),
('node', 'hotel', 0, 2, 2, 'und', 0, 6),
('node', 'hotel', 0, 6, 6, 'und', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_country`
--

CREATE TABLE `field_data_field_country` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_country_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 5 (field_country)';

--
-- Dumping data for table `field_data_field_country`
--

INSERT INTO `field_data_field_country` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_country_tid`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 1),
('node', 'hotel', 0, 2, 2, 'und', 0, 2),
('node', 'hotel', 0, 6, 6, 'und', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_image`
--

CREATE TABLE `field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) UNSIGNED DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) UNSIGNED DEFAULT NULL COMMENT 'The height of the image in pixels.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';

--
-- Dumping data for table `field_data_field_image`
--

INSERT INTO `field_data_field_image` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_image_fid`, `field_image_alt`, `field_image_title`, `field_image_width`, `field_image_height`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 5, '', '', 1170, 360),
('node', 'hotel', 0, 2, 2, 'und', 0, 4, '', '', 1170, 360),
('node', 'banner', 0, 4, 4, 'und', 0, 11, '', '', 960, 460),
('node', 'banner', 0, 5, 5, 'und', 0, 12, '', '', 960, 460),
('node', 'hotel', 0, 6, 6, 'und', 0, 6, '', '', 1170, 360);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_state`
--

CREATE TABLE `field_data_field_state` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_state_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 6 (field_state)';

--
-- Dumping data for table `field_data_field_state`
--

INSERT INTO `field_data_field_state` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_state_tid`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 3),
('node', 'hotel', 0, 2, 2, 'und', 0, 4),
('node', 'hotel', 0, 6, 6, 'und', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_tags`
--

CREATE TABLE `field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_body`
--

CREATE TABLE `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_comment_body`
--

CREATE TABLE `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_city`
--

CREATE TABLE `field_revision_field_city` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_city_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 7 (field_city)';

--
-- Dumping data for table `field_revision_field_city`
--

INSERT INTO `field_revision_field_city` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_city_tid`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 5),
('node', 'hotel', 0, 2, 2, 'und', 0, 6),
('node', 'hotel', 0, 6, 6, 'und', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_country`
--

CREATE TABLE `field_revision_field_country` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_country_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 5 (field_country)';

--
-- Dumping data for table `field_revision_field_country`
--

INSERT INTO `field_revision_field_country` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_country_tid`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 1),
('node', 'hotel', 0, 2, 2, 'und', 0, 2),
('node', 'hotel', 0, 6, 6, 'und', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_image`
--

CREATE TABLE `field_revision_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) UNSIGNED DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) UNSIGNED DEFAULT NULL COMMENT 'The height of the image in pixels.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 4 (field_image)';

--
-- Dumping data for table `field_revision_field_image`
--

INSERT INTO `field_revision_field_image` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_image_fid`, `field_image_alt`, `field_image_title`, `field_image_width`, `field_image_height`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 5, '', '', 1170, 360),
('node', 'hotel', 0, 2, 2, 'und', 0, 4, '', '', 1170, 360),
('node', 'banner', 0, 4, 4, 'und', 0, 11, '', '', 960, 460),
('node', 'banner', 0, 5, 5, 'und', 0, 12, '', '', 960, 460),
('node', 'hotel', 0, 6, 6, 'und', 0, 6, '', '', 1170, 360);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_state`
--

CREATE TABLE `field_revision_field_state` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_state_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 6 (field_state)';

--
-- Dumping data for table `field_revision_field_state`
--

INSERT INTO `field_revision_field_state` (`entity_type`, `bundle`, `deleted`, `entity_id`, `revision_id`, `language`, `delta`, `field_state_tid`) VALUES
('node', 'hotel', 0, 1, 1, 'und', 0, 3),
('node', 'hotel', 0, 2, 2, 'und', 0, 4),
('node', 'hotel', 0, 6, 6, 'und', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_tags`
--

CREATE TABLE `field_revision_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (field_tags)';

-- --------------------------------------------------------

--
-- Table structure for table `file_managed`
--

CREATE TABLE `file_managed` (
  `fid` int(10) UNSIGNED NOT NULL COMMENT 'File ID.',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.';

--
-- Dumping data for table `file_managed`
--

INSERT INTO `file_managed` (`fid`, `uid`, `filename`, `uri`, `filemime`, `filesize`, `status`, `timestamp`) VALUES
(1, 1, '11-min.jpg', 'public://default_images/11-min.jpg', 'image/jpeg', 91270, 1, 1531666085),
(4, 1, '01_hotel_exterior_wweb-min.jpg', 'public://hotelimage/01_hotel_exterior_wweb-min.jpg', 'image/jpeg', 108706, 1, 1532248246),
(5, 1, '1170x360_hotel2-min.jpg', 'public://hotelimage/1170x360_hotel2-min.jpg', 'image/jpeg', 162858, 1, 1532248269),
(6, 1, 'banner3-min.jpg', 'public://hotelimage/banner3-min.jpg', 'image/jpeg', 73733, 1, 1532258826),
(11, 1, '6257_1_delll-min.jpg', 'public://6257_1_delll-min.jpg', 'image/jpeg', 107003, 1, 1534930741),
(12, 1, '6263_1_ascddf-min.jpg', 'public://6263_1_ascddf-min.jpg', 'image/jpeg', 127978, 1, 1534930763);

-- --------------------------------------------------------

--
-- Table structure for table `file_usage`
--

CREATE TABLE `file_usage` (
  `fid` int(10) UNSIGNED NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';

--
-- Dumping data for table `file_usage`
--

INSERT INTO `file_usage` (`fid`, `module`, `type`, `id`, `count`) VALUES
(1, 'image', 'default_image', 14, 1),
(4, 'file', 'node', 2, 1),
(5, 'file', 'node', 1, 1),
(6, 'file', 'node', 6, 1),
(11, 'file', 'node', 4, 1),
(12, 'file', 'node', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` (`format`, `module`, `name`, `weight`, `status`, `settings`) VALUES
('filtered_html', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d),
('filtered_html', 'filter', 'filter_html', 1, 1, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('filtered_html', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d),
('filtered_html', 'filter', 'filter_html_escape', -10, 0, 0x613a303a7b7d),
('filtered_html', 'filter', 'filter_url', 0, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d),
('full_html', 'filter', 'filter_autop', 1, 1, 0x613a303a7b7d),
('full_html', 'filter', 'filter_html', -10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('full_html', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d),
('full_html', 'filter', 'filter_html_escape', -10, 0, 0x613a303a7b7d),
('full_html', 'filter', 'filter_url', 0, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d),
('phpcode', 'filter', 'filter_autop', 0, 0, 0x613a303a7b7d),
('phpcode', 'filter', 'filter_html', -10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('phpcode', 'filter', 'filter_htmlcorrector', 10, 0, 0x613a303a7b7d),
('phpcode', 'filter', 'filter_html_escape', -10, 0, 0x613a303a7b7d),
('phpcode', 'filter', 'filter_url', 0, 0, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b733a323a223732223b7d),
('phpcode', 'php', 'php_code', 0, 1, 0x613a303a7b7d),
('php_code', 'filter', 'filter_autop', 0, 0, 0x613a303a7b7d),
('php_code', 'filter', 'filter_html', -10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('php_code', 'filter', 'filter_htmlcorrector', 10, 0, 0x613a303a7b7d),
('php_code', 'filter', 'filter_html_escape', -10, 0, 0x613a303a7b7d),
('php_code', 'filter', 'filter_url', 0, 0, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d),
('php_code', 'php', 'php_code', 0, 1, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_html', -10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d),
('plain_text', 'filter', 'filter_htmlcorrector', 10, 0, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_html_escape', 0, 1, 0x613a303a7b7d),
('plain_text', 'filter', 'filter_url', 1, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d);

-- --------------------------------------------------------

--
-- Table structure for table `filter_format`
--

CREATE TABLE `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores text formats: custom groupings of filters, such as...';

--
-- Dumping data for table `filter_format`
--

INSERT INTO `filter_format` (`format`, `name`, `cache`, `status`, `weight`) VALUES
('filtered_html', 'Filtered HTML', 1, 1, 0),
('full_html', 'Full HTML', 1, 1, 1),
('phpcode', 'phpcode', 0, 0, 0),
('php_code', 'PHP code', 0, 1, 11),
('plain_text', 'Plain text', 1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `flexslider_optionset`
--

CREATE TABLE `flexslider_optionset` (
  `name` varchar(255) NOT NULL COMMENT 'The machine-readable option set name.',
  `title` varchar(255) NOT NULL COMMENT 'The human-readable title for this option set.',
  `theme` varchar(255) NOT NULL DEFAULT 'classic' COMMENT 'The flexslider theme.',
  `options` longblob COMMENT 'The options array.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store option sets for flexslider instances.';

--
-- Dumping data for table `flexslider_optionset`
--

INSERT INTO `flexslider_optionset` (`name`, `title`, `theme`, `options`) VALUES
('default', 'Default', 'classic', 0x613a34303a7b733a393a226e616d657370616365223b733a353a22666c65782d223b733a383a2273656c6563746f72223b733a31323a222e736c69646573203e206c69223b733a363a22656173696e67223b733a353a227377696e67223b733a393a22646972656374696f6e223b733a31303a22686f72697a6f6e74616c223b733a373a2272657665727365223b693a303b733a31323a22736d6f6f7468486569676874223b693a303b733a373a2273746172744174223b733a313a2230223b733a31343a22616e696d6174696f6e5370656564223b733a333a22363030223b733a393a22696e697444656c6179223b733a313a2230223b733a363a22757365435353223b693a313b733a353a22746f756368223b693a313b733a353a22766964656f223b693a303b733a383a226b6579626f617264223b693a313b733a31363a226d756c7469706c654b6579626f617264223b693a303b733a31303a226d6f757365776865656c223b693a303b733a31373a22636f6e74726f6c73436f6e7461696e6572223b733a32373a222e666c65782d636f6e74726f6c2d6e61762d636f6e7461696e6572223b733a343a2273796e63223b733a303a22223b733a383a2261734e6176466f72223b733a303a22223b733a393a226974656d5769647468223b733a313a2230223b733a31303a226974656d4d617267696e223b733a313a2230223b733a383a226d696e4974656d73223b733a313a2230223b733a383a226d61784974656d73223b733a313a2230223b733a343a226d6f7665223b733a313a2230223b733a393a22616e696d6174696f6e223b733a353a22736c696465223b733a393a22736c69646573686f77223b693a313b733a31343a22736c69646573686f775370656564223b733a343a2237303030223b733a31323a22646972656374696f6e4e6176223b693a313b733a31303a22636f6e74726f6c4e6176223b733a313a2231223b733a383a227072657654657874223b733a383a2250726576696f7573223b733a383a226e65787454657874223b733a343a224e657874223b733a393a227061757365506c6179223b693a303b733a393a22706175736554657874223b733a353a225061757365223b733a383a22706c617954657874223b733a343a22506c6179223b733a393a2272616e646f6d697a65223b693a303b733a31333a227468756d6243617074696f6e73223b693a303b733a31373a227468756d6243617074696f6e73426f7468223b693a303b733a31333a22616e696d6174696f6e4c6f6f70223b693a313b733a31333a2270617573654f6e416374696f6e223b693a313b733a31323a2270617573654f6e486f766572223b693a303b733a31343a226d616e75616c436f6e74726f6c73223b733a303a22223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE `flood` (
  `fid` int(11) NOT NULL COMMENT 'Unique flood event ID.',
  `event` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flood controls the threshold of events, such as the...';

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A record of which users have read which nodes.';

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`uid`, `nid`, `timestamp`) VALUES
(1, 6, 1534923742);

-- --------------------------------------------------------

--
-- Table structure for table `image_effects`
--

CREATE TABLE `image_effects` (
  `ieid` int(10) UNSIGNED NOT NULL COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.';

--
-- Dumping data for table `image_effects`
--

INSERT INTO `image_effects` (`ieid`, `isid`, `weight`, `name`, `data`) VALUES
(1, 1, 1, 'image_resize', 0x613a323a7b733a353a227769647468223b733a343a2231353030223b733a363a22686569676874223b733a333a22363030223b7d),
(2, 2, 1, 'image_resize', 0x613a323a7b733a353a227769647468223b733a333a22333530223b733a363a22686569676874223b733a333a22323536223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `image_styles`
--

CREATE TABLE `image_styles` (
  `isid` int(10) UNSIGNED NOT NULL COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style machine name.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The style administrative name.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.';

--
-- Dumping data for table `image_styles`
--

INSERT INTO `image_styles` (`isid`, `name`, `label`) VALUES
(1, 'custom_image_size', 'custom image size'),
(2, 'hotel-image', 'hotel-image');

-- --------------------------------------------------------

--
-- Table structure for table `login_destination`
--

CREATE TABLE `login_destination` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique ID.',
  `triggers` text NOT NULL COMMENT 'Triggers on which to perform redirect',
  `roles` text NOT NULL COMMENT 'Roles to perform redirect for',
  `pages_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate from which pages to redirect. (0 = all pages except listed pages, 1 = only listed pages, 2 = Use custom PHP code)',
  `pages` text NOT NULL COMMENT 'Pages from which to redirect',
  `destination_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate the destination type. (0 = static URL, 1 = PHP code)',
  `destination` text NOT NULL COMMENT 'Redirect destination',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The rule’s weight.',
  `enabled` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The rule enabled/disabled status.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Login Destination rules.';

--
-- Dumping data for table `login_destination`
--

INSERT INTO `login_destination` (`id`, `triggers`, `roles`, `pages_type`, `pages`, `destination_type`, `destination`, `weight`, `enabled`) VALUES
(1, 'a:1:{s:5:\"login\";s:5:\"login\";}', 'a:0:{}', 0, '', 0, '<front>', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds definitions for top-level custom menus (for example...';

--
-- Dumping data for table `menu_custom`
--

INSERT INTO `menu_custom` (`menu_name`, `title`, `description`) VALUES
('main-menu', 'Main menu', 'The <em>Main</em> menu is used on many sites to show the major sections of the site, often in a top navigation bar.'),
('management', 'Management', 'The <em>Management</em> menu contains links for administrative tasks.'),
('menu-top-link', 'Top Link', ''),
('navigation', 'Navigation', 'The <em>Navigation</em> menu contains links intended for site visitors. Links are added to the <em>Navigation</em> menu automatically by some modules.'),
('user-menu', 'User menu', 'The <em>User</em> menu contains links related to the user\'s account, as well as the \'Log out\' link.');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` int(10) UNSIGNED NOT NULL COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the individual links within a menu.';

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('management', 1, 0, 'admin', 'admin', 'Administration', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 9, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 2, 0, 'user', 'user', 'User account', 0x613a313a7b733a353a22616c746572223b623a313b7d, 'system', 1, 0, 0, 0, -10, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 3, 0, 'comment/%', 'comment/%', 'Comment permalink', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 4, 0, 'filter/tips', 'filter/tips', 'Compose tips', 0x613a303a7b7d, 'system', 1, 0, 1, 0, 0, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 5, 0, 'node/%', 'node/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 6, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 7, 1, 'admin/appearance', 'admin/appearance', 'Appearance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -6, 2, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 8, 1, 'admin/config', 'admin/config', 'Configuration', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32303a2241646d696e69737465722073657474696e67732e223b7d7d, 'system', 0, 0, 1, 0, 0, 2, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 9, 1, 'admin/content', 'admin/content', 'Content', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33323a2241646d696e697374657220636f6e74656e7420616e6420636f6d6d656e74732e223b7d7d, 'system', 0, 0, 1, 0, -10, 2, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 10, 2, 'user/register', 'user/register', 'Create new account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 11, 1, 'admin/dashboard', 'admin/dashboard', 'Dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a225669657720616e6420637573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', 0, 0, 0, 0, -15, 2, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 12, 1, 'admin/help', 'admin/help', 'Help', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a225265666572656e636520666f722075736167652c20636f6e66696775726174696f6e2c20616e64206d6f64756c65732e223b7d7d, 'system', 0, 0, 0, 0, 9, 2, 0, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 13, 1, 'admin/index', 'admin/index', 'Index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -18, 2, 0, 1, 13, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 14, 2, 'user/login', 'user/login', 'Log in', 0x613a313a7b733a353a22616c746572223b623a313b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 14, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 15, 0, 'user/logout', 'user/logout', 'Log out', 0x613a313a7b733a353a22616c746572223b623a313b7d, 'system', 1, 0, 0, 0, 10, 1, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 16, 1, 'admin/modules', 'admin/modules', 'Modules', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32363a22457874656e6420736974652066756e6374696f6e616c6974792e223b7d7d, 'system', 0, 0, 0, 0, -2, 2, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 17, 0, 'user/%', 'user/%', 'My account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 18, 1, 'admin/people', 'admin/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a224d616e6167652075736572206163636f756e74732c20726f6c65732c20616e64207065726d697373696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -4, 2, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 19, 1, 'admin/reports', 'admin/reports', 'Reports', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a2256696577207265706f7274732c20757064617465732c20616e64206572726f72732e223b7d7d, 'system', 0, 0, 1, 0, 5, 2, 0, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0),
('user-menu', 20, 2, 'user/password', 'user/password', 'Request new password', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 21, 1, 'admin/structure', 'admin/structure', 'Structure', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a2241646d696e697374657220626c6f636b732c20636f6e74656e742074797065732c206d656e75732c206574632e223b7d7d, 'system', 0, 0, 1, 0, -8, 2, 0, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 22, 1, 'admin/tasks', 'admin/tasks', 'Tasks', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 2, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 23, 0, 'comment/reply/%', 'comment/reply/%', 'Add new comment', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 24, 3, 'comment/%/approve', 'comment/%/approve', 'Approve', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 1, 2, 0, 3, 24, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 25, 4, 'filter/tips/%', 'filter/tips/%', 'Compose tips', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 2, 0, 4, 25, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 26, 3, 'comment/%/delete', 'comment/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 2, 0, 3, 26, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 27, 3, 'comment/%/edit', 'comment/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 3, 27, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 28, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 29, 3, 'comment/%/view', 'comment/%/view', 'View comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 3, 29, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 30, 18, 'admin/people/create', 'admin/people/create', 'Add user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 18, 30, 0, 0, 0, 0, 0, 0, 0),
('management', 31, 21, 'admin/structure/block', 'admin/structure/block', 'Blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37393a22436f6e666967757265207768617420626c6f636b20636f6e74656e74206170706561727320696e20796f75722073697465277320736964656261727320616e64206f7468657220726567696f6e732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 31, 0, 0, 0, 0, 0, 0, 0),
('navigation', 32, 17, 'user/%/cancel', 'user/%/cancel', 'Cancel account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 2, 0, 17, 32, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 33, 9, 'admin/content/comment', 'admin/content/comment', 'Comments', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35393a224c69737420616e642065646974207369746520636f6d6d656e747320616e642074686520636f6d6d656e7420617070726f76616c2071756575652e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 9, 33, 0, 0, 0, 0, 0, 0, 0),
('management', 34, 11, 'admin/dashboard/configure', 'admin/dashboard/configure', 'Configure available dashboard blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a22436f6e66696775726520776869636820626c6f636b732063616e2062652073686f776e206f6e207468652064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 34, 0, 0, 0, 0, 0, 0, 0),
('management', 35, 9, 'admin/content/node', 'admin/content/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 9, 35, 0, 0, 0, 0, 0, 0, 0),
('management', 36, 8, 'admin/config/content', 'admin/config/content', 'Content authoring', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a2253657474696e67732072656c6174656420746f20666f726d617474696e6720616e6420617574686f72696e6720636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 36, 0, 0, 0, 0, 0, 0, 0),
('management', 37, 21, 'admin/structure/types', 'admin/structure/types', 'Content types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a39323a224d616e61676520636f6e74656e742074797065732c20696e636c7564696e672064656661756c74207374617475732c2066726f6e7420706167652070726f6d6f74696f6e2c20636f6d6d656e742073657474696e67732c206574632e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 37, 0, 0, 0, 0, 0, 0, 0),
('management', 38, 11, 'admin/dashboard/customize', 'admin/dashboard/customize', 'Customize dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22437573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 38, 0, 0, 0, 0, 0, 0, 0),
('navigation', 39, 5, 'node/%/delete', 'node/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 2, 0, 5, 39, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 40, 8, 'admin/config/development', 'admin/config/development', 'Development', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22446576656c6f706d656e7420746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 40, 0, 0, 0, 0, 0, 0, 0),
('navigation', 41, 17, 'user/%/edit', 'user/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 17, 41, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 42, 5, 'node/%/edit', 'node/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 5, 42, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 43, 19, 'admin/reports/fields', 'admin/reports/fields', 'Field list', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224f76657276696577206f66206669656c6473206f6e20616c6c20656e746974792074797065732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 43, 0, 0, 0, 0, 0, 0, 0),
('management', 44, 16, 'admin/modules/list', 'admin/modules/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 16, 44, 0, 0, 0, 0, 0, 0, 0),
('management', 45, 18, 'admin/people/people', 'admin/people/people', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35303a2246696e6420616e64206d616e6167652070656f706c6520696e746572616374696e67207769746820796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 18, 45, 0, 0, 0, 0, 0, 0, 0),
('management', 46, 7, 'admin/appearance/list', 'admin/appearance/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33313a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65223b7d7d, 'system', -1, 0, 0, 0, -1, 3, 0, 1, 7, 46, 0, 0, 0, 0, 0, 0, 0),
('management', 47, 8, 'admin/config/media', 'admin/config/media', 'Media', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a224d6564696120746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 47, 0, 0, 0, 0, 0, 0, 0),
('management', 48, 21, 'admin/structure/menu', 'admin/structure/menu', 'Menus', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38363a22416464206e6577206d656e757320746f20796f757220736974652c2065646974206578697374696e67206d656e75732c20616e642072656e616d6520616e642072656f7267616e697a65206d656e75206c696e6b732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 48, 0, 0, 0, 0, 0, 0, 0),
('management', 49, 8, 'admin/config/people', 'admin/config/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32343a22436f6e6669677572652075736572206163636f756e74732e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 49, 0, 0, 0, 0, 0, 0, 0),
('management', 50, 18, 'admin/people/permissions', 'admin/people/permissions', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 18, 50, 0, 0, 0, 0, 0, 0, 0),
('management', 51, 19, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log messages', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a2256696577206576656e74732074686174206861766520726563656e746c79206265656e206c6f676765642e223b7d7d, 'system', 0, 0, 0, 0, -1, 3, 0, 1, 19, 51, 0, 0, 0, 0, 0, 0, 0),
('management', 52, 8, 'admin/config/regional', 'admin/config/regional', 'Regional and language', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a22526567696f6e616c2073657474696e67732c206c6f63616c697a6174696f6e20616e64207472616e736c6174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -5, 3, 0, 1, 8, 52, 0, 0, 0, 0, 0, 0, 0),
('navigation', 53, 5, 'node/%/revisions', 'node/%/revisions', 'Revisions', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 2, 2, 0, 5, 53, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 54, 8, 'admin/config/search', 'admin/config/search', 'Search and metadata', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a224c6f63616c2073697465207365617263682c206d6574616461746120616e642053454f2e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 54, 0, 0, 0, 0, 0, 0, 0),
('management', 55, 7, 'admin/appearance/settings', 'admin/appearance/settings', 'Settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a22436f6e6669677572652064656661756c7420616e64207468656d652073706563696669632073657474696e67732e223b7d7d, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 7, 55, 0, 0, 0, 0, 0, 0, 0),
('management', 56, 19, 'admin/reports/status', 'admin/reports/status', 'Status report', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a22476574206120737461747573207265706f72742061626f757420796f757220736974652773206f7065726174696f6e20616e6420616e792064657465637465642070726f626c656d732e223b7d7d, 'system', 0, 0, 0, 0, -60, 3, 0, 1, 19, 56, 0, 0, 0, 0, 0, 0, 0),
('management', 57, 8, 'admin/config/system', 'admin/config/system', 'System', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a2247656e6572616c2073797374656d2072656c6174656420636f6e66696775726174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 57, 0, 0, 0, 0, 0, 0, 0),
('management', 58, 21, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Taxonomy', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a224d616e6167652074616767696e672c2063617465676f72697a6174696f6e2c20616e6420636c617373696669636174696f6e206f6620796f757220636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 58, 0, 0, 0, 0, 0, 0, 0),
('management', 59, 19, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top \'access denied\' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a225669657720276163636573732064656e69656427206572726f7273202834303373292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 59, 0, 0, 0, 0, 0, 0, 0),
('management', 60, 19, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top \'page not found\' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a2256696577202770616765206e6f7420666f756e6427206572726f7273202834303473292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 60, 0, 0, 0, 0, 0, 0, 0),
('management', 61, 16, 'admin/modules/uninstall', 'admin/modules/uninstall', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 16, 61, 0, 0, 0, 0, 0, 0, 0),
('management', 62, 8, 'admin/config/user-interface', 'admin/config/user-interface', 'User interface', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33383a22546f6f6c73207468617420656e68616e636520746865207573657220696e746572666163652e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 62, 0, 0, 0, 0, 0, 0, 0),
('navigation', 63, 5, 'node/%/view', 'node/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 5, 63, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 64, 17, 'user/%/view', 'user/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 17, 64, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 65, 8, 'admin/config/services', 'admin/config/services', 'Web services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a22546f6f6c732072656c6174656420746f207765622073657276696365732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 8, 65, 0, 0, 0, 0, 0, 0, 0),
('management', 66, 8, 'admin/config/workflow', 'admin/config/workflow', 'Workflow', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22436f6e74656e7420776f726b666c6f772c20656469746f7269616c20776f726b666c6f7720746f6f6c732e223b7d7d, 'system', 0, 0, 0, 0, 5, 3, 0, 1, 8, 66, 0, 0, 0, 0, 0, 0, 0),
('management', 67, 12, 'admin/help/block', 'admin/help/block', 'block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 67, 0, 0, 0, 0, 0, 0, 0),
('management', 68, 12, 'admin/help/color', 'admin/help/color', 'color', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 68, 0, 0, 0, 0, 0, 0, 0),
('management', 69, 12, 'admin/help/comment', 'admin/help/comment', 'comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 69, 0, 0, 0, 0, 0, 0, 0),
('management', 70, 12, 'admin/help/contextual', 'admin/help/contextual', 'contextual', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 70, 0, 0, 0, 0, 0, 0, 0),
('management', 71, 12, 'admin/help/dashboard', 'admin/help/dashboard', 'dashboard', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 71, 0, 0, 0, 0, 0, 0, 0),
('management', 72, 12, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 72, 0, 0, 0, 0, 0, 0, 0),
('management', 73, 12, 'admin/help/field', 'admin/help/field', 'field', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 73, 0, 0, 0, 0, 0, 0, 0),
('management', 74, 12, 'admin/help/field_sql_storage', 'admin/help/field_sql_storage', 'field_sql_storage', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 74, 0, 0, 0, 0, 0, 0, 0),
('management', 75, 12, 'admin/help/field_ui', 'admin/help/field_ui', 'field_ui', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 75, 0, 0, 0, 0, 0, 0, 0),
('management', 76, 12, 'admin/help/file', 'admin/help/file', 'file', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 76, 0, 0, 0, 0, 0, 0, 0),
('management', 77, 12, 'admin/help/filter', 'admin/help/filter', 'filter', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 77, 0, 0, 0, 0, 0, 0, 0),
('management', 78, 12, 'admin/help/help', 'admin/help/help', 'help', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 78, 0, 0, 0, 0, 0, 0, 0),
('management', 79, 12, 'admin/help/image', 'admin/help/image', 'image', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 79, 0, 0, 0, 0, 0, 0, 0),
('management', 80, 12, 'admin/help/list', 'admin/help/list', 'list', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 80, 0, 0, 0, 0, 0, 0, 0),
('management', 81, 12, 'admin/help/menu', 'admin/help/menu', 'menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 81, 0, 0, 0, 0, 0, 0, 0),
('management', 82, 12, 'admin/help/node', 'admin/help/node', 'node', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 82, 0, 0, 0, 0, 0, 0, 0),
('management', 83, 12, 'admin/help/options', 'admin/help/options', 'options', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 83, 0, 0, 0, 0, 0, 0, 0),
('management', 84, 12, 'admin/help/system', 'admin/help/system', 'system', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 84, 0, 0, 0, 0, 0, 0, 0),
('management', 85, 12, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 85, 0, 0, 0, 0, 0, 0, 0),
('management', 86, 12, 'admin/help/text', 'admin/help/text', 'text', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 86, 0, 0, 0, 0, 0, 0, 0),
('management', 87, 12, 'admin/help/user', 'admin/help/user', 'user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 87, 0, 0, 0, 0, 0, 0, 0),
('navigation', 88, 28, 'taxonomy/term/%/edit', 'taxonomy/term/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 2, 0, 28, 88, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 89, 28, 'taxonomy/term/%/view', 'taxonomy/term/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 28, 89, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 90, 58, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 58, 90, 0, 0, 0, 0, 0, 0),
('management', 91, 49, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Account settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130393a22436f6e6669677572652064656661756c74206265686176696f72206f662075736572732c20696e636c7564696e6720726567697374726174696f6e20726571756972656d656e74732c20652d6d61696c732c206669656c64732c20616e6420757365722070696374757265732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 49, 91, 0, 0, 0, 0, 0, 0),
('management', 92, 57, 'admin/config/system/actions', 'admin/config/system/actions', 'Actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 57, 92, 0, 0, 0, 0, 0, 0),
('management', 93, 31, 'admin/structure/block/add', 'admin/structure/block/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 31, 93, 0, 0, 0, 0, 0, 0),
('management', 94, 37, 'admin/structure/types/add', 'admin/structure/types/add', 'Add content type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 37, 94, 0, 0, 0, 0, 0, 0),
('management', 95, 48, 'admin/structure/menu/add', 'admin/structure/menu/add', 'Add menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 48, 95, 0, 0, 0, 0, 0, 0),
('management', 96, 58, 'admin/structure/taxonomy/add', 'admin/structure/taxonomy/add', 'Add vocabulary', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 58, 96, 0, 0, 0, 0, 0, 0),
('management', 97, 55, 'admin/appearance/settings/bartik', 'admin/appearance/settings/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 55, 97, 0, 0, 0, 0, 0, 0),
('management', 98, 54, 'admin/config/search/clean-urls', 'admin/config/search/clean-urls', 'Clean URLs', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22456e61626c65206f722064697361626c6520636c65616e2055524c7320666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 0, 0, 5, 4, 0, 1, 8, 54, 98, 0, 0, 0, 0, 0, 0),
('management', 99, 57, 'admin/config/system/cron', 'admin/config/system/cron', 'Cron', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34303a224d616e616765206175746f6d617469632073697465206d61696e74656e616e6365207461736b732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 57, 99, 0, 0, 0, 0, 0, 0),
('management', 100, 52, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Date and time', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 52, 100, 0, 0, 0, 0, 0, 0),
('management', 101, 19, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 101, 0, 0, 0, 0, 0, 0, 0),
('management', 102, 47, 'admin/config/media/file-system', 'admin/config/media/file-system', 'File system', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36383a2254656c6c2044727570616c20776865726520746f2073746f72652075706c6f616465642066696c657320616e6420686f772074686579206172652061636365737365642e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 47, 102, 0, 0, 0, 0, 0, 0),
('management', 103, 55, 'admin/appearance/settings/garland', 'admin/appearance/settings/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 55, 103, 0, 0, 0, 0, 0, 0),
('management', 104, 55, 'admin/appearance/settings/global', 'admin/appearance/settings/global', 'Global settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -1, 4, 0, 1, 7, 55, 104, 0, 0, 0, 0, 0, 0),
('management', 105, 49, 'admin/config/people/ip-blocking', 'admin/config/people/ip-blocking', 'IP address blocking', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224d616e61676520626c6f636b6564204950206164647265737365732e223b7d7d, 'system', 0, 0, 1, 0, 10, 4, 0, 1, 8, 49, 105, 0, 0, 0, 0, 0, 0),
('management', 106, 47, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Image styles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37383a22436f6e666967757265207374796c657320746861742063616e206265207573656420666f7220726573697a696e67206f722061646a757374696e6720696d61676573206f6e20646973706c61792e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 47, 106, 0, 0, 0, 0, 0, 0),
('management', 107, 47, 'admin/config/media/image-toolkit', 'admin/config/media/image-toolkit', 'Image toolkit', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a2243686f6f736520776869636820696d61676520746f6f6c6b697420746f2075736520696620796f75206861766520696e7374616c6c6564206f7074696f6e616c20746f6f6c6b6974732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 47, 107, 0, 0, 0, 0, 0, 0),
('management', 108, 44, 'admin/modules/list/confirm', 'admin/modules/list/confirm', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 16, 44, 108, 0, 0, 0, 0, 0, 0),
('management', 109, 37, 'admin/structure/types/list', 'admin/structure/types/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 37, 109, 0, 0, 0, 0, 0, 0),
('management', 110, 58, 'admin/structure/taxonomy/list', 'admin/structure/taxonomy/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 58, 110, 0, 0, 0, 0, 0, 0),
('management', 111, 48, 'admin/structure/menu/list', 'admin/structure/menu/list', 'List menus', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 48, 111, 0, 0, 0, 0, 0, 0),
('management', 112, 40, 'admin/config/development/logging', 'admin/config/development/logging', 'Logging and errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3135343a2253657474696e677320666f72206c6f6767696e6720616e6420616c65727473206d6f64756c65732e20566172696f7573206d6f64756c65732063616e20726f7574652044727570616c27732073797374656d206576656e747320746f20646966666572656e742064657374696e6174696f6e732c2073756368206173207379736c6f672c2064617461626173652c20656d61696c2c206574632e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 40, 112, 0, 0, 0, 0, 0, 0),
('management', 113, 40, 'admin/config/development/maintenance', 'admin/config/development/maintenance', 'Maintenance mode', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36323a2254616b65207468652073697465206f66666c696e6520666f72206d61696e74656e616e6365206f72206272696e67206974206261636b206f6e6c696e652e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 40, 113, 0, 0, 0, 0, 0, 0),
('management', 114, 40, 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130313a22456e61626c65206f722064697361626c6520706167652063616368696e6720666f7220616e6f6e796d6f757320757365727320616e64207365742043535320616e64204a532062616e647769647468206f7074696d697a6174696f6e206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 40, 114, 0, 0, 0, 0, 0, 0),
('management', 115, 50, 'admin/people/permissions/list', 'admin/people/permissions/list', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, -8, 4, 0, 1, 18, 50, 115, 0, 0, 0, 0, 0, 0),
('management', 116, 33, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 9, 33, 116, 0, 0, 0, 0, 0, 0),
('management', 117, 65, 'admin/config/services/rss-publishing', 'admin/config/services/rss-publishing', 'RSS publishing', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3131343a22436f6e666967757265207468652073697465206465736372697074696f6e2c20746865206e756d626572206f66206974656d7320706572206665656420616e6420776865746865722066656564732073686f756c64206265207469746c65732f746561736572732f66756c6c2d746578742e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 65, 117, 0, 0, 0, 0, 0, 0),
('management', 118, 52, 'admin/config/regional/settings', 'admin/config/regional/settings', 'Regional settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35343a2253657474696e677320666f7220746865207369746527732064656661756c742074696d65207a6f6e6520616e6420636f756e7472792e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 52, 118, 0, 0, 0, 0, 0, 0),
('management', 119, 50, 'admin/people/permissions/roles', 'admin/people/permissions/roles', 'Roles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a224c6973742c20656469742c206f7220616464207573657220726f6c65732e223b7d7d, 'system', -1, 0, 1, 0, -5, 4, 0, 1, 18, 50, 119, 0, 0, 0, 0, 0, 0),
('management', 120, 48, 'admin/structure/menu/settings', 'admin/structure/menu/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 5, 4, 0, 1, 21, 48, 120, 0, 0, 0, 0, 0, 0),
('management', 121, 55, 'admin/appearance/settings/seven', 'admin/appearance/settings/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 55, 121, 0, 0, 0, 0, 0, 0),
('management', 122, 57, 'admin/config/system/site-information', 'admin/config/system/site-information', 'Site information', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130343a224368616e67652073697465206e616d652c20652d6d61696c20616464726573732c20736c6f67616e2c2064656661756c742066726f6e7420706167652c20616e64206e756d626572206f6620706f7374732070657220706167652c206572726f722070616765732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 57, 122, 0, 0, 0, 0, 0, 0),
('management', 123, 55, 'admin/appearance/settings/stark', 'admin/appearance/settings/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 55, 123, 0, 0, 0, 0, 0, 0),
('management', 124, 36, 'admin/config/content/formats', 'admin/config/content/formats', 'Text formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3132373a22436f6e66696775726520686f7720636f6e74656e7420696e7075742062792075736572732069732066696c74657265642c20696e636c7564696e6720616c6c6f7765642048544d4c20746167732e20416c736f20616c6c6f777320656e61626c696e67206f66206d6f64756c652d70726f76696465642066696c746572732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 36, 124, 0, 0, 0, 0, 0, 0),
('management', 125, 33, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Unapproved comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 9, 33, 125, 0, 0, 0, 0, 0, 0),
('management', 126, 61, 'admin/modules/uninstall/confirm', 'admin/modules/uninstall/confirm', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 16, 61, 126, 0, 0, 0, 0, 0, 0),
('navigation', 127, 41, 'user/%/edit/account', 'user/%/edit/account', 'Account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 17, 41, 127, 0, 0, 0, 0, 0, 0, 0),
('management', 128, 124, 'admin/config/content/formats/%', 'admin/config/content/formats/%', '', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 36, 124, 128, 0, 0, 0, 0, 0),
('management', 129, 106, 'admin/config/media/image-styles/add', 'admin/config/media/image-styles/add', 'Add style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a224164642061206e657720696d616765207374796c652e223b7d7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 47, 106, 129, 0, 0, 0, 0, 0),
('management', 130, 90, 'admin/structure/taxonomy/%/add', 'admin/structure/taxonomy/%/add', 'Add term', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 58, 90, 130, 0, 0, 0, 0, 0),
('management', 131, 124, 'admin/config/content/formats/add', 'admin/config/content/formats/add', 'Add text format', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 36, 124, 131, 0, 0, 0, 0, 0),
('management', 132, 31, 'admin/structure/block/list/bartik', 'admin/structure/block/list/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 31, 132, 0, 0, 0, 0, 0, 0),
('management', 133, 92, 'admin/config/system/actions/configure', 'admin/config/system/actions/configure', 'Configure an advanced action', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 57, 92, 133, 0, 0, 0, 0, 0),
('management', 134, 48, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Customize menu', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 21, 48, 134, 0, 0, 0, 0, 0, 0),
('management', 135, 90, 'admin/structure/taxonomy/%/edit', 'admin/structure/taxonomy/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 58, 90, 135, 0, 0, 0, 0, 0),
('management', 136, 37, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit content type', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 21, 37, 136, 0, 0, 0, 0, 0, 0),
('management', 137, 100, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time/formats', 'Formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35313a22436f6e66696775726520646973706c617920666f726d617420737472696e677320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -9, 5, 0, 1, 8, 52, 100, 137, 0, 0, 0, 0, 0),
('management', 138, 31, 'admin/structure/block/list/garland', 'admin/structure/block/list/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 31, 138, 0, 0, 0, 0, 0, 0),
('management', 139, 124, 'admin/config/content/formats/list', 'admin/config/content/formats/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 36, 124, 139, 0, 0, 0, 0, 0),
('management', 140, 90, 'admin/structure/taxonomy/%/list', 'admin/structure/taxonomy/%/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 5, 0, 1, 21, 58, 90, 140, 0, 0, 0, 0, 0),
('management', 141, 106, 'admin/config/media/image-styles/list', 'admin/config/media/image-styles/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34323a224c697374207468652063757272656e7420696d616765207374796c6573206f6e2074686520736974652e223b7d7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 47, 106, 141, 0, 0, 0, 0, 0),
('management', 142, 92, 'admin/config/system/actions/manage', 'admin/config/system/actions/manage', 'Manage actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -2, 5, 0, 1, 8, 57, 92, 142, 0, 0, 0, 0, 0),
('management', 143, 91, 'admin/config/people/accounts/settings', 'admin/config/people/accounts/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 49, 91, 143, 0, 0, 0, 0, 0),
('management', 144, 31, 'admin/structure/block/list/seven', 'admin/structure/block/list/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 31, 144, 0, 0, 0, 0, 0, 0),
('management', 145, 31, 'admin/structure/block/list/stark', 'admin/structure/block/list/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 31, 145, 0, 0, 0, 0, 0, 0),
('management', 146, 100, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time/types', 'Types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -10, 5, 0, 1, 8, 52, 100, 146, 0, 0, 0, 0, 0),
('navigation', 147, 53, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 53, 147, 0, 0, 0, 0, 0, 0, 0),
('navigation', 148, 53, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 53, 148, 0, 0, 0, 0, 0, 0, 0),
('navigation', 149, 53, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 53, 149, 0, 0, 0, 0, 0, 0, 0),
('management', 150, 138, 'admin/structure/block/list/garland/add', 'admin/structure/block/list/garland/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 31, 138, 150, 0, 0, 0, 0, 0),
('management', 151, 144, 'admin/structure/block/list/seven/add', 'admin/structure/block/list/seven/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 31, 144, 151, 0, 0, 0, 0, 0),
('management', 152, 145, 'admin/structure/block/list/stark/add', 'admin/structure/block/list/stark/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 31, 145, 152, 0, 0, 0, 0, 0),
('management', 153, 146, 'admin/config/regional/date-time/types/add', 'admin/config/regional/date-time/types/add', 'Add date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22416464206e6577206461746520747970652e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 52, 100, 146, 153, 0, 0, 0, 0),
('management', 154, 137, 'admin/config/regional/date-time/formats/add', 'admin/config/regional/date-time/formats/add', 'Add format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22416c6c6f7720757365727320746f20616464206164646974696f6e616c206461746520666f726d6174732e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 52, 100, 137, 154, 0, 0, 0, 0),
('management', 155, 134, 'admin/structure/menu/manage/%/add', 'admin/structure/menu/manage/%/add', 'Add link', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 48, 134, 155, 0, 0, 0, 0, 0),
('management', 156, 31, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 31, 156, 0, 0, 0, 0, 0, 0),
('navigation', 157, 32, 'user/%/cancel/confirm/%/%', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 17, 32, 157, 0, 0, 0, 0, 0, 0, 0),
('management', 158, 136, 'admin/structure/types/manage/%/delete', 'admin/structure/types/manage/%/delete', 'Delete', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 21, 37, 136, 158, 0, 0, 0, 0, 0),
('management', 159, 105, 'admin/config/people/ip-blocking/delete/%', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 49, 105, 159, 0, 0, 0, 0, 0),
('management', 160, 92, 'admin/config/system/actions/delete/%', 'admin/config/system/actions/delete/%', 'Delete action', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31373a2244656c65746520616e20616374696f6e2e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 57, 92, 160, 0, 0, 0, 0, 0),
('management', 161, 134, 'admin/structure/menu/manage/%/delete', 'admin/structure/menu/manage/%/delete', 'Delete menu', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 21, 48, 134, 161, 0, 0, 0, 0, 0),
('management', 162, 48, 'admin/structure/menu/item/%/delete', 'admin/structure/menu/item/%/delete', 'Delete menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 162, 0, 0, 0, 0, 0, 0),
('management', 163, 119, 'admin/people/permissions/roles/delete/%', 'admin/people/permissions/roles/delete/%', 'Delete role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 18, 50, 119, 163, 0, 0, 0, 0, 0),
('management', 164, 128, 'admin/config/content/formats/%/disable', 'admin/config/content/formats/%/disable', 'Disable text format', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 36, 124, 128, 164, 0, 0, 0, 0),
('management', 165, 136, 'admin/structure/types/manage/%/edit', 'admin/structure/types/manage/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 37, 136, 165, 0, 0, 0, 0, 0),
('management', 166, 134, 'admin/structure/menu/manage/%/edit', 'admin/structure/menu/manage/%/edit', 'Edit menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 48, 134, 166, 0, 0, 0, 0, 0),
('management', 167, 48, 'admin/structure/menu/item/%/edit', 'admin/structure/menu/item/%/edit', 'Edit menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 167, 0, 0, 0, 0, 0, 0),
('management', 168, 119, 'admin/people/permissions/roles/edit/%', 'admin/people/permissions/roles/edit/%', 'Edit role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 18, 50, 119, 168, 0, 0, 0, 0, 0),
('management', 169, 106, 'admin/config/media/image-styles/edit/%', 'admin/config/media/image-styles/edit/%', 'Edit style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22436f6e66696775726520616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 47, 106, 169, 0, 0, 0, 0, 0),
('management', 170, 134, 'admin/structure/menu/manage/%/list', 'admin/structure/menu/manage/%/list', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 48, 134, 170, 0, 0, 0, 0, 0),
('management', 171, 48, 'admin/structure/menu/item/%/reset', 'admin/structure/menu/item/%/reset', 'Reset menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 171, 0, 0, 0, 0, 0, 0),
('management', 172, 106, 'admin/config/media/image-styles/delete/%', 'admin/config/media/image-styles/delete/%', 'Delete style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a2244656c65746520616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 47, 106, 172, 0, 0, 0, 0, 0),
('management', 173, 106, 'admin/config/media/image-styles/revert/%', 'admin/config/media/image-styles/revert/%', 'Revert style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a2252657665727420616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 47, 106, 173, 0, 0, 0, 0, 0),
('management', 174, 136, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%/comment/display', 'Comment display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 5, 0, 1, 21, 37, 136, 174, 0, 0, 0, 0, 0),
('management', 175, 136, 'admin/structure/types/manage/%/comment/fields', 'admin/structure/types/manage/%/comment/fields', 'Comment fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 3, 5, 0, 1, 21, 37, 136, 175, 0, 0, 0, 0, 0),
('management', 176, 156, 'admin/structure/block/manage/%/%/configure', 'admin/structure/block/manage/%/%/configure', 'Configure block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 31, 156, 176, 0, 0, 0, 0, 0),
('management', 177, 156, 'admin/structure/block/manage/%/%/delete', 'admin/structure/block/manage/%/%/delete', 'Delete block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 31, 156, 177, 0, 0, 0, 0, 0),
('management', 178, 137, 'admin/config/regional/date-time/formats/%/delete', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34373a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 52, 100, 137, 178, 0, 0, 0, 0),
('management', 179, 146, 'admin/config/regional/date-time/types/%/delete', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520747970652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 52, 100, 146, 179, 0, 0, 0, 0),
('management', 180, 137, 'admin/config/regional/date-time/formats/%/edit', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2065646974206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 52, 100, 137, 180, 0, 0, 0, 0),
('management', 181, 169, 'admin/config/media/image-styles/edit/%/add/%', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224164642061206e65772065666665637420746f2061207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 47, 106, 169, 181, 0, 0, 0, 0),
('management', 182, 169, 'admin/config/media/image-styles/edit/%/effects/%', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224564697420616e206578697374696e67206566666563742077697468696e2061207374796c652e223b7d7d, 'system', 0, 0, 1, 0, 0, 6, 0, 1, 8, 47, 106, 169, 182, 0, 0, 0, 0),
('management', 183, 182, 'admin/config/media/image-styles/edit/%/effects/%/delete', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a2244656c65746520616e206578697374696e67206566666563742066726f6d2061207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 47, 106, 169, 182, 183, 0, 0, 0),
('management', 184, 48, 'admin/structure/menu/manage/main-menu', 'admin/structure/menu/manage/%', 'Main menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 184, 0, 0, 0, 0, 0, 0),
('management', 185, 48, 'admin/structure/menu/manage/management', 'admin/structure/menu/manage/%', 'Management', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 185, 0, 0, 0, 0, 0, 0),
('management', 186, 48, 'admin/structure/menu/manage/navigation', 'admin/structure/menu/manage/%', 'Navigation', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 186, 0, 0, 0, 0, 0, 0),
('management', 187, 48, 'admin/structure/menu/manage/user-menu', 'admin/structure/menu/manage/%', 'User menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 187, 0, 0, 0, 0, 0, 0),
('navigation', 188, 0, 'search', 'search', 'Search', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 189, 188, 'search/node', 'search/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 188, 189, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 190, 188, 'search/user', 'search/user', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 188, 190, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 191, 189, 'search/node/%', 'search/node/%', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 188, 189, 191, 0, 0, 0, 0, 0, 0, 0),
('navigation', 192, 17, 'user/%/shortcuts', 'user/%/shortcuts', 'Shortcuts', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 17, 192, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 193, 19, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2256696577206d6f737420706f70756c61722073656172636820706872617365732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 193, 0, 0, 0, 0, 0, 0, 0),
('navigation', 194, 190, 'search/user/%', 'search/user/%', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 188, 190, 194, 0, 0, 0, 0, 0, 0, 0),
('management', 195, 12, 'admin/help/number', 'admin/help/number', 'number', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 195, 0, 0, 0, 0, 0, 0, 0),
('management', 197, 12, 'admin/help/path', 'admin/help/path', 'path', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 197, 0, 0, 0, 0, 0, 0, 0),
('management', 198, 12, 'admin/help/rdf', 'admin/help/rdf', 'rdf', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 198, 0, 0, 0, 0, 0, 0, 0),
('management', 199, 12, 'admin/help/search', 'admin/help/search', 'search', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 199, 0, 0, 0, 0, 0, 0, 0),
('management', 200, 12, 'admin/help/shortcut', 'admin/help/shortcut', 'shortcut', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 200, 0, 0, 0, 0, 0, 0, 0),
('management', 201, 54, 'admin/config/search/settings', 'admin/config/search/settings', 'Search settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a22436f6e6669677572652072656c6576616e63652073657474696e677320666f722073656172636820616e64206f7468657220696e646578696e67206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 54, 201, 0, 0, 0, 0, 0, 0),
('management', 202, 62, 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Shortcuts', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32393a2241646420616e64206d6f646966792073686f727463757420736574732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 62, 202, 0, 0, 0, 0, 0, 0),
('management', 203, 54, 'admin/config/search/path', 'admin/config/search/path', 'URL aliases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a224368616e676520796f7572207369746527732055524c20706174687320627920616c696173696e67207468656d2e223b7d7d, 'system', 0, 0, 1, 0, -5, 4, 0, 1, 8, 54, 203, 0, 0, 0, 0, 0, 0),
('management', 204, 203, 'admin/config/search/path/add', 'admin/config/search/path/add', 'Add alias', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 54, 203, 204, 0, 0, 0, 0, 0),
('management', 205, 202, 'admin/config/user-interface/shortcut/add-set', 'admin/config/user-interface/shortcut/add-set', 'Add shortcut set', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 62, 202, 205, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES
('management', 206, 201, 'admin/config/search/settings/reindex', 'admin/config/search/settings/reindex', 'Clear index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 54, 201, 206, 0, 0, 0, 0, 0),
('management', 207, 202, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 62, 202, 207, 0, 0, 0, 0, 0),
('management', 208, 203, 'admin/config/search/path/list', 'admin/config/search/path/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 54, 203, 208, 0, 0, 0, 0, 0),
('management', 209, 207, 'admin/config/user-interface/shortcut/%/add-link', 'admin/config/user-interface/shortcut/%/add-link', 'Add shortcut', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 62, 202, 207, 209, 0, 0, 0, 0),
('management', 210, 203, 'admin/config/search/path/delete/%', 'admin/config/search/path/delete/%', 'Delete alias', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 54, 203, 210, 0, 0, 0, 0, 0),
('management', 211, 207, 'admin/config/user-interface/shortcut/%/delete', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 62, 202, 207, 211, 0, 0, 0, 0),
('management', 212, 203, 'admin/config/search/path/edit/%', 'admin/config/search/path/edit/%', 'Edit alias', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 54, 203, 212, 0, 0, 0, 0, 0),
('management', 213, 207, 'admin/config/user-interface/shortcut/%/edit', 'admin/config/user-interface/shortcut/%/edit', 'Edit set name', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 6, 0, 1, 8, 62, 202, 207, 213, 0, 0, 0, 0),
('management', 214, 202, 'admin/config/user-interface/shortcut/link/%', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 62, 202, 214, 0, 0, 0, 0, 0),
('management', 215, 207, 'admin/config/user-interface/shortcut/%/links', 'admin/config/user-interface/shortcut/%/links', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 62, 202, 207, 215, 0, 0, 0, 0),
('management', 216, 214, 'admin/config/user-interface/shortcut/link/%/delete', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 62, 202, 214, 216, 0, 0, 0, 0),
('shortcut-set-1', 217, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, -20, 1, 0, 217, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('shortcut-set-1', 218, 0, 'admin/content', 'admin/content', 'Find content', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, -19, 1, 0, 218, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 219, 0, '<front>', '', 'Home', 0x613a303a7b7d, 'menu', 0, 1, 0, 0, -50, 1, 1, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 220, 6, 'node/add/article', 'node/add/article', 'Article', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38393a22557365203c656d3e61727469636c65733c2f656d3e20666f722074696d652d73656e73697469766520636f6e74656e74206c696b65206e6577732c2070726573732072656c6561736573206f7220626c6f6720706f7374732e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 220, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 221, 6, 'node/add/page', 'node/add/page', 'Basic page', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37373a22557365203c656d3e62617369632070616765733c2f656d3e20666f7220796f75722073746174696320636f6e74656e742c207375636820617320616e202741626f75742075732720706167652e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 221, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 261, 19, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38323a22476574206120737461747573207265706f72742061626f757420617661696c61626c65207570646174657320666f7220796f757220696e7374616c6c6564206d6f64756c657320616e64207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -50, 3, 0, 1, 19, 261, 0, 0, 0, 0, 0, 0, 0),
('management', 262, 16, 'admin/modules/install', 'admin/modules/install', 'Install new module', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 16, 262, 0, 0, 0, 0, 0, 0, 0),
('management', 263, 7, 'admin/appearance/install', 'admin/appearance/install', 'Install new theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 7, 263, 0, 0, 0, 0, 0, 0, 0),
('management', 264, 16, 'admin/modules/update', 'admin/modules/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 16, 264, 0, 0, 0, 0, 0, 0, 0),
('management', 265, 7, 'admin/appearance/update', 'admin/appearance/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 7, 265, 0, 0, 0, 0, 0, 0, 0),
('management', 266, 12, 'admin/help/update', 'admin/help/update', 'update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 266, 0, 0, 0, 0, 0, 0, 0),
('management', 267, 261, 'admin/reports/updates/install', 'admin/reports/updates/install', 'Install new module or theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 4, 0, 1, 19, 261, 267, 0, 0, 0, 0, 0, 0),
('management', 268, 261, 'admin/reports/updates/update', 'admin/reports/updates/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 4, 0, 1, 19, 261, 268, 0, 0, 0, 0, 0, 0),
('management', 269, 261, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 19, 261, 269, 0, 0, 0, 0, 0, 0),
('management', 270, 261, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 50, 4, 0, 1, 19, 261, 270, 0, 0, 0, 0, 0, 0),
('management', 309, 8, 'admin/config/administration', 'admin/config/administration', 'Administration', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32313a2241646d696e697374726174696f6e20746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 8, 309, 0, 0, 0, 0, 0, 0, 0),
('management', 310, 12, 'admin/help/admin_menu', 'admin/help/admin_menu', 'admin_menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 310, 0, 0, 0, 0, 0, 0, 0),
('management', 311, 309, 'admin/config/administration/admin_menu', 'admin/config/administration/admin_menu', 'Administration menu', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a2241646a7573742061646d696e697374726174696f6e206d656e752073657474696e67732e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 309, 311, 0, 0, 0, 0, 0, 0),
('management', 312, 90, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 21, 58, 90, 312, 0, 0, 0, 0, 0),
('management', 313, 91, 'admin/config/people/accounts/display', 'admin/config/people/accounts/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 49, 91, 313, 0, 0, 0, 0, 0),
('management', 314, 90, 'admin/structure/taxonomy/%/fields', 'admin/structure/taxonomy/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 21, 58, 90, 314, 0, 0, 0, 0, 0),
('management', 315, 91, 'admin/config/people/accounts/fields', 'admin/config/people/accounts/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 8, 49, 91, 315, 0, 0, 0, 0, 0),
('management', 316, 312, 'admin/structure/taxonomy/%/display/default', 'admin/structure/taxonomy/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 58, 90, 312, 316, 0, 0, 0, 0),
('management', 317, 313, 'admin/config/people/accounts/display/default', 'admin/config/people/accounts/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 49, 91, 313, 317, 0, 0, 0, 0),
('management', 318, 136, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 21, 37, 136, 318, 0, 0, 0, 0, 0),
('management', 319, 136, 'admin/structure/types/manage/%/fields', 'admin/structure/types/manage/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 21, 37, 136, 319, 0, 0, 0, 0, 0),
('management', 320, 312, 'admin/structure/taxonomy/%/display/full', 'admin/structure/taxonomy/%/display/full', 'Taxonomy term page', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 58, 90, 312, 320, 0, 0, 0, 0),
('management', 321, 313, 'admin/config/people/accounts/display/full', 'admin/config/people/accounts/display/full', 'User account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 49, 91, 313, 321, 0, 0, 0, 0),
('management', 322, 314, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 58, 90, 314, 322, 0, 0, 0, 0),
('management', 323, 315, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 49, 91, 315, 323, 0, 0, 0, 0),
('management', 324, 318, 'admin/structure/types/manage/%/display/default', 'admin/structure/types/manage/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 37, 136, 318, 324, 0, 0, 0, 0),
('management', 325, 318, 'admin/structure/types/manage/%/display/full', 'admin/structure/types/manage/%/display/full', 'Full content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 37, 136, 318, 325, 0, 0, 0, 0),
('management', 326, 318, 'admin/structure/types/manage/%/display/rss', 'admin/structure/types/manage/%/display/rss', 'RSS', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 6, 0, 1, 21, 37, 136, 318, 326, 0, 0, 0, 0),
('management', 327, 318, 'admin/structure/types/manage/%/display/search_index', 'admin/structure/types/manage/%/display/search_index', 'Search index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 3, 6, 0, 1, 21, 37, 136, 318, 327, 0, 0, 0, 0),
('management', 328, 318, 'admin/structure/types/manage/%/display/search_result', 'admin/structure/types/manage/%/display/search_result', 'Search result highlighting input', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 6, 0, 1, 21, 37, 136, 318, 328, 0, 0, 0, 0),
('management', 329, 318, 'admin/structure/types/manage/%/display/teaser', 'admin/structure/types/manage/%/display/teaser', 'Teaser', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 21, 37, 136, 318, 329, 0, 0, 0, 0),
('management', 330, 319, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 37, 136, 319, 330, 0, 0, 0, 0),
('management', 331, 322, 'admin/structure/taxonomy/%/fields/%/delete', 'admin/structure/taxonomy/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 58, 90, 314, 322, 331, 0, 0, 0),
('management', 332, 322, 'admin/structure/taxonomy/%/fields/%/edit', 'admin/structure/taxonomy/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 58, 90, 314, 322, 332, 0, 0, 0),
('management', 333, 322, 'admin/structure/taxonomy/%/fields/%/field-settings', 'admin/structure/taxonomy/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 58, 90, 314, 322, 333, 0, 0, 0),
('management', 334, 322, 'admin/structure/taxonomy/%/fields/%/widget-type', 'admin/structure/taxonomy/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 58, 90, 314, 322, 334, 0, 0, 0),
('management', 335, 323, 'admin/config/people/accounts/fields/%/delete', 'admin/config/people/accounts/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 8, 49, 91, 315, 323, 335, 0, 0, 0),
('management', 336, 323, 'admin/config/people/accounts/fields/%/edit', 'admin/config/people/accounts/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 49, 91, 315, 323, 336, 0, 0, 0),
('management', 337, 323, 'admin/config/people/accounts/fields/%/field-settings', 'admin/config/people/accounts/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 49, 91, 315, 323, 337, 0, 0, 0),
('management', 338, 323, 'admin/config/people/accounts/fields/%/widget-type', 'admin/config/people/accounts/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 49, 91, 315, 323, 338, 0, 0, 0),
('management', 339, 174, 'admin/structure/types/manage/%/comment/display/default', 'admin/structure/types/manage/%/comment/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 37, 136, 174, 339, 0, 0, 0, 0),
('management', 340, 174, 'admin/structure/types/manage/%/comment/display/full', 'admin/structure/types/manage/%/comment/display/full', 'Full comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 37, 136, 174, 340, 0, 0, 0, 0),
('management', 341, 175, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 37, 136, 175, 341, 0, 0, 0, 0),
('management', 342, 330, 'admin/structure/types/manage/%/fields/%/delete', 'admin/structure/types/manage/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 37, 136, 319, 330, 342, 0, 0, 0),
('management', 343, 330, 'admin/structure/types/manage/%/fields/%/edit', 'admin/structure/types/manage/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 37, 136, 319, 330, 343, 0, 0, 0),
('management', 344, 330, 'admin/structure/types/manage/%/fields/%/field-settings', 'admin/structure/types/manage/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 37, 136, 319, 330, 344, 0, 0, 0),
('management', 345, 330, 'admin/structure/types/manage/%/fields/%/widget-type', 'admin/structure/types/manage/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 37, 136, 319, 330, 345, 0, 0, 0),
('management', 346, 341, 'admin/structure/types/manage/%/comment/fields/%/delete', 'admin/structure/types/manage/%/comment/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 37, 136, 175, 341, 346, 0, 0, 0),
('management', 347, 341, 'admin/structure/types/manage/%/comment/fields/%/edit', 'admin/structure/types/manage/%/comment/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 37, 136, 175, 341, 347, 0, 0, 0),
('management', 348, 341, 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 37, 136, 175, 341, 348, 0, 0, 0),
('management', 349, 341, 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 37, 136, 175, 341, 349, 0, 0, 0),
('management', 352, 21, 'admin/structure/views', 'admin/structure/views', 'Views', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a224d616e61676520637573746f6d697a6564206c69737473206f6620636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 352, 0, 0, 0, 0, 0, 0, 0),
('management', 353, 19, 'admin/reports/views-plugins', 'admin/reports/views-plugins', 'Views plugins', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33383a224f76657276696577206f6620706c7567696e73207573656420696e20616c6c2076696577732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 353, 0, 0, 0, 0, 0, 0, 0),
('management', 354, 12, 'admin/help/views', 'admin/help/views', 'views', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 354, 0, 0, 0, 0, 0, 0, 0),
('management', 355, 12, 'admin/help/views_ui', 'admin/help/views_ui', 'views_ui', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 355, 0, 0, 0, 0, 0, 0, 0),
('management', 356, 352, 'admin/structure/views/add', 'admin/structure/views/add', 'Add new view', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 352, 356, 0, 0, 0, 0, 0, 0),
('management', 357, 352, 'admin/structure/views/add-template', 'admin/structure/views/add-template', 'Add view from template', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 352, 357, 0, 0, 0, 0, 0, 0),
('management', 358, 352, 'admin/structure/views/import', 'admin/structure/views/import', 'Import', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 352, 358, 0, 0, 0, 0, 0, 0),
('management', 359, 352, 'admin/structure/views/list', 'admin/structure/views/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 352, 359, 0, 0, 0, 0, 0, 0),
('management', 360, 43, 'admin/reports/fields/list', 'admin/reports/fields/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 19, 43, 360, 0, 0, 0, 0, 0, 0),
('management', 361, 352, 'admin/structure/views/settings', 'admin/structure/views/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 352, 361, 0, 0, 0, 0, 0, 0),
('management', 362, 43, 'admin/reports/fields/views-fields', 'admin/reports/fields/views-fields', 'Used in views', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a224f76657276696577206f66206669656c6473207573656420696e20616c6c2076696577732e223b7d7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 19, 43, 362, 0, 0, 0, 0, 0, 0),
('management', 363, 361, 'admin/structure/views/settings/advanced', 'admin/structure/views/settings/advanced', 'Advanced', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 21, 352, 361, 363, 0, 0, 0, 0, 0),
('management', 364, 361, 'admin/structure/views/settings/basic', 'admin/structure/views/settings/basic', 'Basic', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 361, 364, 0, 0, 0, 0, 0),
('management', 365, 352, 'admin/structure/views/view/%', 'admin/structure/views/view/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 352, 365, 0, 0, 0, 0, 0, 0),
('management', 366, 365, 'admin/structure/views/view/%/break-lock', 'admin/structure/views/view/%/break-lock', 'Break lock', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 365, 366, 0, 0, 0, 0, 0),
('management', 367, 365, 'admin/structure/views/view/%/edit', 'admin/structure/views/view/%/edit', 'Edit view', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 352, 365, 367, 0, 0, 0, 0, 0),
('management', 368, 365, 'admin/structure/views/view/%/clone', 'admin/structure/views/view/%/clone', 'Clone', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 365, 368, 0, 0, 0, 0, 0),
('management', 369, 365, 'admin/structure/views/view/%/delete', 'admin/structure/views/view/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 365, 369, 0, 0, 0, 0, 0),
('management', 370, 365, 'admin/structure/views/view/%/export', 'admin/structure/views/view/%/export', 'Export', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 365, 370, 0, 0, 0, 0, 0),
('management', 371, 365, 'admin/structure/views/view/%/revert', 'admin/structure/views/view/%/revert', 'Revert', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 365, 371, 0, 0, 0, 0, 0),
('management', 372, 352, 'admin/structure/views/nojs/preview/%/%', 'admin/structure/views/nojs/preview/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 352, 372, 0, 0, 0, 0, 0, 0),
('management', 373, 365, 'admin/structure/views/view/%/preview/%', 'admin/structure/views/view/%/preview/%', '', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 352, 365, 373, 0, 0, 0, 0, 0),
('management', 374, 352, 'admin/structure/views/ajax/preview/%/%', 'admin/structure/views/ajax/preview/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 352, 374, 0, 0, 0, 0, 0, 0),
('navigation', 375, 6, 'node/add/hotel', 'node/add/hotel', 'Hotel', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 375, 0, 0, 0, 0, 0, 0, 0, 0),
('navigation', 376, 0, 'form', 'form', 'Example Form', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 376, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 377, 21, 'admin/structure/services', 'admin/structure/services', 'Services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31353a224d616e616765205365727669636573223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 21, 377, 0, 0, 0, 0, 0, 0, 0),
('management', 378, 12, 'admin/help/services', 'admin/help/services', 'services', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 378, 0, 0, 0, 0, 0, 0, 0),
('management', 379, 377, 'admin/structure/services/add', 'admin/structure/services/add', 'Add', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 377, 379, 0, 0, 0, 0, 0, 0),
('management', 380, 65, 'admin/config/services/services-security', 'admin/config/services/services-security', 'Services Security update', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33323a225365727669636573206d6f64756c652073656375726974792075706461746573223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 65, 380, 0, 0, 0, 0, 0, 0),
('management', 381, 377, 'admin/structure/services/import', 'admin/structure/services/import', 'Import', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 377, 381, 0, 0, 0, 0, 0, 0),
('management', 382, 377, 'admin/structure/services/list', 'admin/structure/services/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 377, 382, 0, 0, 0, 0, 0, 0),
('management', 383, 382, 'admin/structure/services/list/%/authentication', 'admin/structure/services/list/%/authentication', 'Authentication', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -3, 5, 0, 1, 21, 377, 382, 383, 0, 0, 0, 0, 0),
('management', 384, 382, 'admin/structure/services/list/%/edit', 'admin/structure/services/list/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 377, 382, 384, 0, 0, 0, 0, 0),
('management', 385, 382, 'admin/structure/services/list/%/export', 'admin/structure/services/list/%/export', 'Export', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 377, 382, 385, 0, 0, 0, 0, 0),
('management', 386, 382, 'admin/structure/services/list/%/resources', 'admin/structure/services/list/%/resources', 'Resources', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -2, 5, 0, 1, 21, 377, 382, 386, 0, 0, 0, 0, 0),
('management', 387, 382, 'admin/structure/services/list/%/server', 'admin/structure/services/list/%/server', 'Server', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -4, 5, 0, 1, 21, 377, 382, 387, 0, 0, 0, 0, 0),
('management', 388, 19, 'admin/reports/libraries', 'admin/reports/libraries', 'Libraries', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a22416e206f76657276696577206f66206c696272617269657320696e7374616c6c6564206f6e207468697320736974652e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 19, 388, 0, 0, 0, 0, 0, 0, 0),
('management', 389, 12, 'admin/help/libraries', 'admin/help/libraries', 'libraries', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 389, 0, 0, 0, 0, 0, 0, 0),
('management', 390, 388, 'admin/reports/libraries/%', 'admin/reports/libraries/%', 'Library status report', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a22537461747573206f7665727669657720666f7220612073696e676c65206c696272617279223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 19, 388, 390, 0, 0, 0, 0, 0, 0),
('management', 391, 55, 'admin/appearance/settings/bootstrap', 'admin/appearance/settings/bootstrap', 'Bootstrap', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 55, 391, 0, 0, 0, 0, 0, 0),
('management', 392, 31, 'admin/structure/block/list/bootstrap', 'admin/structure/block/list/bootstrap', 'Bootstrap', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 31, 392, 0, 0, 0, 0, 0, 0),
('management', 394, 132, 'admin/structure/block/list/bartik/add', 'admin/structure/block/list/bartik/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 31, 132, 394, 0, 0, 0, 0, 0),
('main-menu', 398, 0, '<front>', '', 'About Us', 0x613a323a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d7d, 'menu', 0, 1, 1, 1, -49, 1, 1, 398, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 399, 12, 'admin/help/jquery_update', 'admin/help/jquery_update', 'jquery_update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 399, 0, 0, 0, 0, 0, 0, 0),
('management', 400, 40, 'admin/config/development/jquery_update', 'admin/config/development/jquery_update', 'jQuery update', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38333a22436f6e6669677572652073657474696e67732072656c6174656420746f20746865206a517565727920757067726164652c20746865206c696272617279207061746820616e6420636f6d7072657373696f6e2e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 40, 400, 0, 0, 0, 0, 0, 0),
('navigation', 409, 6, 'node/add/banner', 'node/add/banner', 'Banner', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 409, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 410, 12, 'admin/help/views_slideshow', 'admin/help/views_slideshow', 'views_slideshow', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 410, 0, 0, 0, 0, 0, 0, 0),
('management', 411, 12, 'admin/help/views_slideshow_cycle', 'admin/help/views_slideshow_cycle', 'views_slideshow_cycle', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 411, 0, 0, 0, 0, 0, 0, 0),
('management', 414, 12, 'admin/help/login_destination', 'admin/help/login_destination', 'login_destination', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 414, 0, 0, 0, 0, 0, 0, 0),
('management', 415, 49, 'admin/config/people/login-destination', 'admin/config/people/login-destination', 'Login destinations', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36393a22437573746f6d697a65207468652064657374696e6174696f6e2074686174207468652075736572206973207265646972656374656420746f206166746572206c6f67696e2e223b7d7d, 'system', 0, 0, 1, 0, 10, 4, 0, 1, 8, 49, 415, 0, 0, 0, 0, 0, 0),
('management', 416, 415, 'admin/config/people/login-destination/add', 'admin/config/people/login-destination/add', 'Add login destination rule', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 49, 415, 416, 0, 0, 0, 0, 0),
('management', 417, 415, 'admin/config/people/login-destination/list', 'admin/config/people/login-destination/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 49, 415, 417, 0, 0, 0, 0, 0),
('management', 418, 415, 'admin/config/people/login-destination/settings', 'admin/config/people/login-destination/settings', 'Settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a224368616e6765204c6f67696e2044657374696e6174696f6e2073657474696e67732e223b7d7d, 'system', -1, 0, 0, 0, 10, 5, 0, 1, 8, 49, 415, 418, 0, 0, 0, 0, 0),
('management', 419, 415, 'admin/config/people/login-destination/delete/%', 'admin/config/people/login-destination/delete/%', 'Delete login destination rule', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 49, 415, 419, 0, 0, 0, 0, 0),
('management', 420, 415, 'admin/config/people/login-destination/edit/%', 'admin/config/people/login-destination/edit/%', 'Edit login destination rule', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 49, 415, 420, 0, 0, 0, 0, 0),
('management', 421, 48, 'admin/structure/menu/manage/menu-top-link', 'admin/structure/menu/manage/%', 'Top Link', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 48, 421, 0, 0, 0, 0, 0, 0),
('menu-top-link', 422, 0, 'user', 'user', 'Login', 0x613a333a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d733a353a22616c746572223b623a313b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a313a7b693a313b733a313a2231223b7d733a343a2268696465223b613a323a7b693a323b733a313a2232223b693a333b733a313a2233223b7d7d7d, 'menu', 0, 0, 0, 0, 0, 1, 1, 422, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('management', 431, 12, 'admin/help/flexslider', 'admin/help/flexslider', 'flexslider', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 431, 0, 0, 0, 0, 0, 0, 0),
('management', 432, 47, 'admin/config/media/flexslider', 'admin/config/media/flexslider', 'FlexSlider', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a2241646d696e697374657220466c6578536c6964657220707265736574732e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 47, 432, 0, 0, 0, 0, 0, 0),
('management', 433, 432, 'admin/config/media/flexslider/advanced', 'admin/config/media/flexslider/advanced', 'Advanced settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35303a22436f6e6669677572652074686520616476616e63656420666c6578736c69646572206d6f64756c652073657474696e67732e223b7d7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 47, 432, 433, 0, 0, 0, 0, 0),
('management', 434, 432, 'admin/config/media/flexslider/add', 'admin/config/media/flexslider/add', 'Add', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 47, 432, 434, 0, 0, 0, 0, 0),
('management', 435, 432, 'admin/config/media/flexslider/import', 'admin/config/media/flexslider/import', 'Import', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 47, 432, 435, 0, 0, 0, 0, 0),
('management', 436, 432, 'admin/config/media/flexslider/list', 'admin/config/media/flexslider/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 47, 432, 436, 0, 0, 0, 0, 0),
('management', 437, 436, 'admin/config/media/flexslider/list/%/edit', 'admin/config/media/flexslider/list/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 47, 432, 436, 437, 0, 0, 0, 0),
('management', 438, 436, 'admin/config/media/flexslider/list/%/export', 'admin/config/media/flexslider/list/%/export', 'Export', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 47, 432, 436, 438, 0, 0, 0, 0),
('management', 439, 12, 'admin/help/ckeditor', 'admin/help/ckeditor', 'ckeditor', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 439, 0, 0, 0, 0, 0, 0, 0),
('management', 440, 36, 'admin/config/content/ckeditor', 'admin/config/content/ckeditor', 'CKEditor', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33313a22436f6e666967757265207468652072696368207465787420656469746f722e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 36, 440, 0, 0, 0, 0, 0, 0),
('management', 441, 12, 'admin/help/php', 'admin/help/php', 'php', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 441, 0, 0, 0, 0, 0, 0, 0),
('management', 442, 352, 'http://www.google.com', '', 'submenu', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 1, -50, 4, 1, 1, 21, 352, 442, 0, 0, 0, 0, 0, 0),
('management', 446, 12, 'admin/help/pathauto', 'admin/help/pathauto', 'pathauto', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 446, 0, 0, 0, 0, 0, 0, 0),
('management', 447, 12, 'admin/help/token', 'admin/help/token', 'token', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 447, 0, 0, 0, 0, 0, 0, 0),
('management', 448, 203, 'admin/config/search/path/update_bulk', 'admin/config/search/path/update_bulk', 'Bulk generate', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 30, 5, 0, 1, 8, 54, 203, 448, 0, 0, 0, 0, 0),
('management', 449, 203, 'admin/config/search/path/delete_bulk', 'admin/config/search/path/delete_bulk', 'Delete aliases', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 40, 5, 0, 1, 8, 54, 203, 449, 0, 0, 0, 0, 0),
('management', 450, 203, 'admin/config/search/path/patterns', 'admin/config/search/path/patterns', 'Patterns', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 5, 0, 1, 8, 54, 203, 450, 0, 0, 0, 0, 0),
('management', 451, 203, 'admin/config/search/path/settings', 'admin/config/search/path/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 20, 5, 0, 1, 8, 54, 203, 451, 0, 0, 0, 0, 0),
('management', 452, 312, 'admin/structure/taxonomy/%/display/token', 'admin/structure/taxonomy/%/display/token', 'Tokens', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 21, 58, 90, 312, 452, 0, 0, 0, 0),
('management', 453, 313, 'admin/config/people/accounts/display/token', 'admin/config/people/accounts/display/token', 'Tokens', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 8, 49, 91, 313, 453, 0, 0, 0, 0),
('management', 454, 318, 'admin/structure/types/manage/%/display/token', 'admin/structure/types/manage/%/display/token', 'Tokens', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 5, 6, 0, 1, 21, 37, 136, 318, 454, 0, 0, 0, 0),
('management', 455, 174, 'admin/structure/types/manage/%/comment/display/token', 'admin/structure/types/manage/%/comment/display/token', 'Tokens', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 21, 37, 136, 174, 455, 0, 0, 0, 0),
('main-menu', 456, 0, '<front>', '', 'Investigation', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 1, 1, -48, 1, 1, 456, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 457, 0, '<front>', '', 'Enforcement', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 1, 1, -47, 1, 1, 457, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 458, 0, '<front>', '', 'CFDML', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 1, -46, 1, 1, 458, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 459, 0, '<front>', '', 'Recruitment', 0x613a323a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d7d, 'menu', 0, 1, 1, 1, -45, 1, 1, 459, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 460, 0, '<front>', '', 'RTI', 0x613a323a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d7d, 'menu', 0, 1, 1, 1, -44, 1, 1, 460, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 461, 0, '<front>', '', 'General Information', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 1, 1, -43, 1, 1, 461, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 462, 398, 'http://www.google.com', '', 'About SFIO', 0x613a323a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 398, 462, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 463, 456, 'http://www.google.com', '', 'Investigation Procedure', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -50, 2, 1, 456, 463, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 464, 398, 'http://www.google.com', '', 'History of SFIO', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -50, 2, 1, 398, 464, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 465, 398, 'http://www.google.com', '', 'SFIO Locations', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -48, 2, 1, 398, 465, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 466, 398, 'http://www.google.com', '', 'Reach SFIO HQ', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -47, 2, 1, 398, 466, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 467, 398, 'http://www.google.com', '', 'Organization Structure', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -44, 2, 1, 398, 467, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 468, 398, 'http://www.google.com', '', 'Contact SFIO', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -46, 2, 1, 398, 468, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 469, 398, 'http://www.google.com', '', 'Faq\'s', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -45, 2, 1, 398, 469, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 470, 456, 'http://www.google.com', '', 'Cases Investigated', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 456, 470, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 471, 457, 'http://www.google.com', '', 'Prosecution', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -50, 2, 1, 457, 471, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 472, 457, 'http://www.google.com', '', 'Companies Act 2013', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 457, 472, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 473, 457, 'http://www.google.com', '', 'Companies Act 1956', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -48, 2, 1, 457, 473, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 474, 457, 'http://www.google.com', '', 'IT Act', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -47, 2, 1, 457, 474, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 475, 461, 'http://www.google.com', '', 'Gazette Notification', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 461, 475, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 476, 461, 'http://www.google.com', '', 'Statutory Status of SFIO', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -48, 2, 1, 461, 476, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 477, 459, 'http://www.google.com', '', 'Vacancies', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -50, 2, 1, 459, 477, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 478, 459, 'http://www.google.com', '', 'Outsourcing', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 459, 478, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 479, 459, 'http://www.google.com', '', 'Recruitment Rules', 0x613a323a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d7d, 'menu', 0, 1, 0, 0, -48, 2, 1, 459, 479, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 480, 460, 'http://www.google.com', '', 'CPIO', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -50, 2, 1, 460, 480, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 481, 460, 'http://www.google.com', '', 'Appellate Authority', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -49, 2, 1, 460, 481, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 482, 460, 'http://www.google.com', '', 'Proactive Disclosure', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -48, 2, 1, 460, 482, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 483, 460, 'http://www.google.com', '', 'Fee Structure', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -45, 2, 1, 460, 483, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 484, 460, 'http://www.google.com', '', 'RTI Act', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -46, 2, 1, 460, 484, 0, 0, 0, 0, 0, 0, 0, 0),
('main-menu', 485, 460, 'http://www.google.com', '', 'CIC', 0x613a323a7b733a31343a22726f6c65735f666f725f6d656e75223b613a323a7b733a343a2273686f77223b613a303a7b7d733a343a2268696465223b613a303a7b7d7d733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a303a22223b7d7d, 'menu', 0, 1, 0, 0, -47, 2, 1, 460, 485, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_router`
--

CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` int(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.',
  `context` int(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` varchar(255) NOT NULL DEFAULT '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` varchar(255) NOT NULL DEFAULT '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` text NOT NULL COMMENT 'A description of this item.',
  `position` varchar(255) NOT NULL DEFAULT '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` mediumtext COMMENT 'The file to include for this element, usually the page callback function lives in this file.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps paths to various callbacks (access, page and title)';

--
-- Dumping data for table `menu_router`
--

INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `delivery_callback`, `fit`, `number_parts`, `context`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `theme_callback`, `theme_arguments`, `type`, `description`, `position`, `weight`, `include_file`) VALUES
('admin', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 1, 1, 0, '', 'admin', 'Administration', 't', '', '', 'a:0:{}', 6, '', '', 9, 'modules/system/system.admin.inc'),
('admin/appearance', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_themes_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/appearance', 'Appearance', 't', '', '', 'a:0:{}', 6, 'Select and configure your themes.', 'left', -6, 'modules/system/system.admin.inc'),
('admin/appearance/default', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_default', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/appearance/default', 'Set default theme', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/disable', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_disable', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/appearance/disable', 'Disable theme', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/enable', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_enable', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/appearance/enable', 'Enable theme', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a353a227468656d65223b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'Install new theme', 't', '', '', 'a:0:{}', 388, '', '', 25, 'modules/update/update.manager.inc'),
('admin/appearance/list', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_themes_page', 0x613a303a7b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'List', 't', '', '', 'a:0:{}', 140, 'Select and configure your theme', '', -1, 'modules/system/system.admin.inc'),
('admin/appearance/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'Settings', 't', '', '', 'a:0:{}', 132, 'Configure default and theme specific settings.', '', 20, 'modules/system/system.admin.inc'),
('admin/appearance/settings/bartik', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a363a2262617274696b223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Bartik', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/settings/bootstrap', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f626f6f7473747261702e696e666f223b733a343a226e616d65223b733a393a22626f6f747374726170223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a32323a7b733a343a226e616d65223b733a393a22426f6f747374726170223b733a31313a226465736372697074696f6e223b733a3131353a224275696c7420746f2075736520426f6f7473747261702c206120736c65656b2c20696e747569746976652c20616e6420706f77657266756c2066726f6e742d656e64206672616d65776f726b20666f722066617374657220616e64206561736965722077656220646576656c6f706d656e742e223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a353a22352e332e30223b733a32333a2273696d706c79746573745f646570656e64656e63696573223b613a313a7b693a303b733a31333a226a71756572795f757064617465223b7d733a373a22726567696f6e73223b613a31343a7b733a343a226c6f676f223b733a343a224c6f676f223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a363a22686561646572223b733a373a22546f7020426172223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a373a225072696d617279223b733a31343a22736964656261725f7365636f6e64223b733a393a225365636f6e64617279223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a383a2273657474696e6773223b613a36313a7b733a32353a22626f6f7473747261705f666c7569645f636f6e7461696e6572223b733a313a2230223b733a32313a22626f6f7473747261705f627574746f6e5f73697a65223b733a303a22223b733a32353a22626f6f7473747261705f627574746f6e5f636f6c6f72697a65223b733a313a2231223b733a32343a22626f6f7473747261705f627574746f6e5f69636f6e697a65223b733a313a2231223b733a32313a22626f6f7473747261705f696d6167655f7368617065223b733a303a22223b733a32363a22626f6f7473747261705f696d6167655f726573706f6e73697665223b733a313a2231223b733a32343a22626f6f7473747261705f7461626c655f626f726465726564223b733a313a2230223b733a32353a22626f6f7473747261705f7461626c655f636f6e64656e736564223b733a313a2230223b733a32313a22626f6f7473747261705f7461626c655f686f766572223b733a313a2231223b733a32333a22626f6f7473747261705f7461626c655f73747269706564223b733a313a2231223b733a32363a22626f6f7473747261705f7461626c655f726573706f6e73697665223b733a323a222d31223b733a32303a22626f6f7473747261705f62726561646372756d62223b733a313a2231223b733a32353a22626f6f7473747261705f62726561646372756d625f686f6d65223b733a313a2230223b733a32363a22626f6f7473747261705f62726561646372756d625f7469746c65223b733a313a2231223b733a32353a22626f6f7473747261705f6e61766261725f706f736974696f6e223b733a303a22223b733a32343a22626f6f7473747261705f6e61766261725f696e7665727365223b733a313a2230223b733a33303a22626f6f7473747261705f70616765725f66697273745f616e645f6c617374223b733a313a2231223b733a33323a22626f6f7473747261705f726567696f6e5f77656c6c2d6e617669676174696f6e223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d686561646572223b733a303a22223b733a33333a22626f6f7473747261705f726567696f6e5f77656c6c2d686967686c696768746564223b733a303a22223b733a32363a22626f6f7473747261705f726567696f6e5f77656c6c2d68656c70223b733a303a22223b733a32393a22626f6f7473747261705f726567696f6e5f77656c6c2d636f6e74656e74223b733a303a22223b733a33353a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f6669727374223b733a343a2277656c6c223b733a33363a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f7365636f6e64223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d666f6f746572223b733a303a22223b733a32313a22626f6f7473747261705f616e63686f72735f666978223b733a313a2230223b733a33343a22626f6f7473747261705f616e63686f72735f736d6f6f74685f7363726f6c6c696e67223b733a313a2230223b733a33343a22626f6f7473747261705f666f726d735f72657175697265645f6861735f6572726f72223b733a313a2230223b733a33383a22626f6f7473747261705f666f726d735f6861735f6572726f725f76616c75655f746f67676c65223b733a313a2231223b733a33343a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e73223b733a313a2231223b733a34303a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f6c696d6974223b733a333a22323530223b733a34373a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f616c6c6f7765645f74616773223b733a33333a22622c20636f64652c20656d2c20692c206b62642c207370616e2c207374726f6e67223b733a32353a22626f6f7473747261705f706f706f7665725f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f706f706f7665725f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f706f706f7665725f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f706c6163656d656e74223b733a353a227269676874223b733a32363a22626f6f7473747261705f706f706f7665725f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f74726967676572223b613a333a7b733a373a2227686f76657227223b733a313a2230223b733a373a2227666f63757327223b733a313a2230223b733a373a2227636c69636b27223b733a353a22636c69636b223b7d733a33353a22626f6f7473747261705f706f706f7665725f747269676765725f6175746f636c6f7365223b733a313a2231223b733a32333a22626f6f7473747261705f706f706f7665725f7469746c65223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f636f6e74656e74223b733a303a22223b733a32333a22626f6f7473747261705f706f706f7665725f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f636f6e7461696e6572223b733a343a22626f6479223b733a32353a22626f6f7473747261705f746f6f6c7469705f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f746f6f6c7469705f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f746f6f6c7469705f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f706c6163656d656e74223b733a393a226175746f206c656674223b733a32363a22626f6f7473747261705f746f6f6c7469705f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f746f6f6c7469705f74726967676572223b613a333a7b733a373a2227686f76657227223b733a353a22686f766572223b733a373a2227666f63757327223b733a353a22666f637573223b733a373a2227636c69636b27223b733a313a2230223b7d733a32333a22626f6f7473747261705f746f6f6c7469705f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f636f6e7461696e6572223b733a343a22626f6479223b733a32323a22626f6f7473747261705f63646e5f70726f7669646572223b733a383a226a7364656c697672223b733a32343a22626f6f7473747261705f63646e5f637573746f6d5f637373223b733a35383a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e637373223b733a32383a22626f6f7473747261705f63646e5f637573746f6d5f6373735f6d696e223b733a36323a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e6d696e2e637373223b733a32333a22626f6f7473747261705f63646e5f637573746f6d5f6a73223b733a35363a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6a73223b733a32373a22626f6f7473747261705f63646e5f637573746f6d5f6a735f6d696e223b733a36303a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6d696e2e6a73223b733a33303a22626f6f7473747261705f63646e5f6a7364656c6976725f76657273696f6e223b733a353a22332e332e37223b733a32383a22626f6f7473747261705f63646e5f6a7364656c6976725f7468656d65223b733a393a22626f6f747374726170223b733a31313a22746f67676c655f6e616d65223b733a313a2231223b733a31333a22746f67676c655f736561726368223b733a313a2231223b733a32383a226a71756572795f7570646174655f6a71756572795f76657273696f6e223b733a333a22322e31223b7d733a373a226578636c756465223b613a313a7b733a333a22637373223b613a32343a7b693a303b733a32323a226d6973632f766572746963616c2d746162732e637373223b693a313b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b693a323b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b693a333b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b693a343b733a32333a226d6f64756c65732f64626c6f672f64626c6f672e637373223b693a353b733a32313a226d6f64756c65732f66696c652f66696c652e637373223b693a363b733a32353a226d6f64756c65732f66696c7465722f66696c7465722e637373223b693a373b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b693a383b733a32313a226d6f64756c65732f68656c702f68656c702e637373223b693a393b733a32313a226d6f64756c65732f6d656e752f6d656e752e637373223b693a31303b733a32353a226d6f64756c65732f6f70656e69642f6f70656e69642e637373223b693a31313b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b693a31323b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b693a31333b733a33333a226d6f64756c65732f737461746973746963732f737461746973746963732e637373223b693a31343b733a32353a226d6f64756c65732f7379736c6f672f7379736c6f672e637373223b693a31353b733a33303a226d6f64756c65732f73797374656d2f6d61696e74656e616e63652e637373223b693a31363b733a33373a226d6f64756c65732f73797374656d2f73797374656d2e6d61696e74656e616e63652e637373223b693a31373b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e6d656e75732e637373223b693a31383b733a33343a226d6f64756c65732f73797374656d2f73797374656d2e6d657373616765732e637373223b693a31393b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e7468656d652e637373223b693a32303b733a32393a226d6f64756c65732f7461786f6e6f6d792f7461786f6e6f6d792e637373223b693a32313b733a32373a226d6f64756c65732f747261636b65722f747261636b65722e637373223b693a32323b733a32353a226d6f64756c65732f7570646174652f7570646174652e637373223b693a32333b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a31313a22627265616b706f696e7473223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b733a31383a22286d61782d77696474683a20373637707829223b733a31333a2273637265656e2d736d2d6d696e223b733a31383a22286d696e2d77696474683a20373638707829223b733a31333a2273637265656e2d736d2d6d6178223b733a31383a22286d61782d77696474683a20393931707829223b733a31333a2273637265656e2d6d642d6d696e223b733a31383a22286d696e2d77696474683a20393932707829223b733a31333a2273637265656e2d6d642d6d6178223b733a31393a22286d61782d77696474683a2031313939707829223b733a31333a2273637265656e2d6c672d6d696e223b733a31393a22286d696e2d77696474683a2031323030707829223b7d733a31313a226d756c7469706c69657273223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6c672d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d7d733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a393a22626f6f747374726170223b733a393a22646174657374616d70223b733a31303a2231353234303931303839223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f73637265656e73686f742e706e67223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313533343934393133373b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a393a22626f6f747374726170223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Bootstrap', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/settings/garland', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a373a226761726c616e64223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Garland', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/settings/global', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Global settings', 't', '', '', 'a:0:{}', 140, '', '', -1, 'modules/system/system.admin.inc'),
('admin/appearance/settings/seven', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a353a22736576656e223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Seven', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/settings/stark', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a353a22737461726b223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Stark', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc'),
('admin/appearance/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a353a227468656d65223b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'Update', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/update/update.manager.inc'),
('admin/compact', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_compact_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/compact', 'Compact mode', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/config', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_config_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/config', 'Configuration', 't', '', '', 'a:0:{}', 6, 'Administer settings.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/administration', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/administration', 'Administration', 't', '', '', 'a:0:{}', 6, 'Administration tools.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/administration/admin_menu', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2261646d696e5f6d656e755f7468656d655f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/administration/admin_menu', 'Administration menu', 't', '', '', 'a:0:{}', 6, 'Adjust administration menu settings.', '', 0, 'sites/all/modules/admin_menu/admin_menu.inc'),
('admin/config/content', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/content', 'Content authoring', 't', '', '', 'a:0:{}', 6, 'Settings related to formatting and authoring content.', 'left', -15, 'modules/system/system.admin.inc'),
('admin/config/content/ckeditor', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'ckeditor_admin_main', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/content/ckeditor', 'CKEditor', 't', '', '', 'a:0:{}', 6, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/add', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a22636b656469746f725f61646d696e5f70726f66696c655f666f726d223b693a313b733a333a22616464223b7d, '', 31, 5, 0, '', 'admin/config/content/ckeditor/add', 'Add a new CKEditor profile', 't', '', '', 'a:0:{}', 0, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/addg', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33343a22636b656469746f725f61646d696e5f676c6f62616c5f70726f66696c655f666f726d223b693a313b733a333a22616464223b7d, '', 31, 5, 0, '', 'admin/config/content/ckeditor/addg', 'Add the CKEditor Global profile', 't', '', '', 'a:0:{}', 0, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/clone/%', 0x613a313a7b693a353b733a32313a22636b656469746f725f70726f66696c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33333a22636b656469746f725f61646d696e5f70726f66696c655f636c6f6e655f666f726d223b693a313b733a353a22636c6f6e65223b693a323b693a353b7d, '', 62, 6, 0, '', 'admin/config/content/ckeditor/clone/%', 'Clone the CKEditor profile', 't', '', '', 'a:0:{}', 0, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/delete/%', 0x613a313a7b693a353b733a32313a22636b656469746f725f70726f66696c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33343a22636b656469746f725f61646d696e5f70726f66696c655f64656c6574655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/content/ckeditor/delete/%', 'Delete the CKEditor profile', 't', '', '', 'a:0:{}', 0, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/edit/%', 0x613a313a7b693a353b733a32313a22636b656469746f725f70726f66696c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32373a22636b656469746f725f61646d696e5f70726f66696c655f666f726d223b693a313b733a343a2265646974223b693a323b693a353b7d, '', 62, 6, 0, '', 'admin/config/content/ckeditor/edit/%', 'Edit the CKEditor profile', 't', '', '', 'a:0:{}', 0, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/editg', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33343a22636b656469746f725f61646d696e5f676c6f62616c5f70726f66696c655f666f726d223b693a313b733a343a2265646974223b7d, '', 31, 5, 0, '', 'admin/config/content/ckeditor/editg', 'Edit the CKEditor Global profile', 't', '', '', 'a:0:{}', 0, 'Configure the rich text editor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/ckeditor/skinframe', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'ckeditor_skinframe', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/config/content/ckeditor/skinframe', 'Change skin of CKEditor', 't', '', '', 'a:0:{}', 0, 'Configure skin for CKEditor.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('admin/config/content/formats', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d, '', 15, 4, 0, '', 'admin/config/content/formats', 'Text formats', 't', '', '', 'a:0:{}', 6, 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/%', 0x613a313a7b693a343b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'filter_admin_format_page', 0x613a313a7b693a303b693a343b7d, '', 30, 5, 0, '', 'admin/config/content/formats/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/%/disable', 0x613a313a7b693a343b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', '_filter_disable_format_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2266696c7465725f61646d696e5f64697361626c65223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/config/content/formats/%/disable', 'Disable text format', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/add', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'filter_admin_format_page', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/content/formats', 'admin/config/content/formats', 'Add text format', 't', '', '', 'a:0:{}', 388, '', '', 1, 'modules/filter/filter.admin.inc'),
('admin/config/content/formats/list', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d, '', 31, 5, 1, 'admin/config/content/formats', 'admin/config/content/formats', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/filter/filter.admin.inc'),
('admin/config/development', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/development', 'Development', 't', '', '', 'a:0:{}', 6, 'Development tools.', 'right', -10, 'modules/system/system.admin.inc'),
('admin/config/development/jquery_update', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a226a71756572795f7570646174655f73657474696e67735f666f726d223b7d, '', 15, 4, 0, '', 'admin/config/development/jquery_update', 'jQuery update', 't', '', '', 'a:0:{}', 6, 'Configure settings related to the jQuery upgrade, the library path and compression.', '', 0, ''),
('admin/config/development/logging', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32333a2273797374656d5f6c6f6767696e675f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/development/logging', 'Logging and errors', 't', '', '', 'a:0:{}', 6, 'Settings for logging and alerts modules. Various modules can route Drupal\'s system events to different destinations, such as syslog, database, email, etc.', '', -15, 'modules/system/system.admin.inc'),
('admin/config/development/maintenance', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32383a2273797374656d5f736974655f6d61696e74656e616e63655f6d6f6465223b7d, '', 15, 4, 0, '', 'admin/config/development/maintenance', 'Maintenance mode', 't', '', '', 'a:0:{}', 6, 'Take the site offline for maintenance or bring it back online.', '', -10, 'modules/system/system.admin.inc'),
('admin/config/development/performance', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a2273797374656d5f706572666f726d616e63655f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/development/performance', 'Performance', 't', '', '', 'a:0:{}', 6, 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', -20, 'modules/system/system.admin.inc'),
('admin/config/media', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/media', 'Media', 't', '', '', 'a:0:{}', 6, 'Media tools.', 'left', -10, 'modules/system/system.admin.inc'),
('admin/config/media/file-system', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a2273797374656d5f66696c655f73797374656d5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/media/file-system', 'File system', 't', '', '', 'a:0:{}', 6, 'Tell Drupal where to store uploaded files and how they are accessed.', '', -10, 'modules/system/system.admin.inc'),
('admin/config/media/flexslider', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, '', 15, 4, 0, '', 'admin/config/media/flexslider', 'FlexSlider', 't', '', '', 'a:0:{}', 6, 'Administer FlexSlider presets.', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/add', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a333a22616464223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a333a22616464223b7d, '', 31, 5, 1, 'admin/config/media/flexslider', 'admin/config/media/flexslider', 'Add', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/advanced', '', '', 'user_access', 0x613a313a7b693a303b733a32313a2261646d696e697374657220666c6578736c69646572223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a22666c6578736c696465725f666f726d5f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/media/flexslider', 'admin/config/media/flexslider', 'Advanced settings', 't', '', '', 'a:0:{}', 132, 'Configure the advanced flexslider module settings.', '', 2, 'sites/all/modules/flexslider/flexslider.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `delivery_callback`, `fit`, `number_parts`, `context`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `theme_callback`, `theme_arguments`, `type`, `description`, `position`, `weight`, `include_file`) VALUES
('admin/config/media/flexslider/import', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22696d706f7274223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22696d706f7274223b7d, '', 31, 5, 1, 'admin/config/media/flexslider', 'admin/config/media/flexslider', 'Import', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, '', 31, 5, 1, 'admin/config/media/flexslider', 'admin/config/media/flexslider', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/flexslider/list/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/clone', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a353a22636c6f6e65223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a353a22636c6f6e65223b693a323b693a353b7d, '', 125, 7, 0, '', 'admin/config/media/flexslider/list/%/clone', 'Clone', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/delete', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a353b7d, '', 125, 7, 0, '', 'admin/config/media/flexslider/list/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/disable', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a373a2264697361626c65223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a373a2264697361626c65223b693a323b693a353b7d, '', 125, 7, 0, '', 'admin/config/media/flexslider/list/%/disable', 'Disable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/edit', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a353b7d, '', 125, 7, 1, 'admin/config/media/flexslider/list/%', 'admin/config/media/flexslider/list/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/enable', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22656e61626c65223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22656e61626c65223b693a323b693a353b7d, '', 125, 7, 0, '', 'admin/config/media/flexslider/list/%/enable', 'Enable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/export', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a226578706f7274223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a226578706f7274223b693a323b693a353b7d, '', 125, 7, 1, 'admin/config/media/flexslider/list/%', 'admin/config/media/flexslider/list/%', 'Export', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/flexslider/list/%/revert', 0x613a313a7b693a353b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22726576657274223b693a323b693a353b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32373a22666c6578736c696465725f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a353b7d, '', 125, 7, 0, '', 'admin/config/media/flexslider/list/%/revert', 'Revert', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/config/media/image-styles', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'image_style_list', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/media/image-styles', 'Image styles', 't', '', '', 'a:0:{}', 6, 'Configure styles that can be used for resizing or adjusting images on display.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/add', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22696d6167655f7374796c655f6164645f666f726d223b7d, '', 31, 5, 1, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Add style', 't', '', '', 'a:0:{}', 388, 'Add a new image style.', '', 2, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/delete/%', 0x613a313a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b4e3b693a313b733a313a2231223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a22696d6167655f7374796c655f64656c6574655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/image-styles/delete/%', 'Delete style', 't', '', '', 'a:0:{}', 6, 'Delete an image style.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%', 0x613a313a7b693a353b733a31363a22696d6167655f7374796c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31363a22696d6167655f7374796c655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/image-styles/edit/%', 'Edit style', 't', '', '', 'a:0:{}', 6, 'Configure an image style.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%/add/%', 0x613a323a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a313a7b693a303b693a353b7d7d693a373b613a313a7b733a32383a22696d6167655f6566666563745f646566696e6974696f6e5f6c6f6164223b613a313a7b693a303b693a353b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31373a22696d6167655f6566666563745f666f726d223b693a313b693a353b693a323b693a373b7d, '', 250, 8, 0, '', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 't', '', '', 'a:0:{}', 6, 'Add a new effect to a style.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%/effects/%', 0x613a323a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d693a373b613a313a7b733a31373a22696d6167655f6566666563745f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31373a22696d6167655f6566666563745f666f726d223b693a313b693a353b693a323b693a373b7d, '', 250, 8, 0, '', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 't', '', '', 'a:0:{}', 6, 'Edit an existing effect within a style.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/edit/%/effects/%/delete', 0x613a323a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d693a373b613a313a7b733a31373a22696d6167655f6566666563745f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32343a22696d6167655f6566666563745f64656c6574655f666f726d223b693a313b693a353b693a323b693a373b7d, '', 501, 9, 0, '', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 't', '', '', 'a:0:{}', 6, 'Delete an existing effect from a style.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/list', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'image_style_list', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'List', 't', '', '', 'a:0:{}', 140, 'List the current image styles on the site.', '', 1, 'modules/image/image.admin.inc'),
('admin/config/media/image-styles/revert/%', 0x613a313a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b4e3b693a313b733a313a2232223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a22696d6167655f7374796c655f7265766572745f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/image-styles/revert/%', 'Revert style', 't', '', '', 'a:0:{}', 6, 'Revert an image style.', '', 0, 'modules/image/image.admin.inc'),
('admin/config/media/image-toolkit', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2273797374656d5f696d6167655f746f6f6c6b69745f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/media/image-toolkit', 'Image toolkit', 't', '', '', 'a:0:{}', 6, 'Choose which image toolkit to use if you have installed optional toolkits.', '', 20, 'modules/system/system.admin.inc'),
('admin/config/people', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/people', 'People', 't', '', '', 'a:0:{}', 6, 'Configure user accounts.', 'left', -20, 'modules/system/system.admin.inc'),
('admin/config/people/accounts', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/people/accounts', 'Account settings', 't', '', '', 'a:0:{}', 6, 'Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.', '', -10, 'modules/user/user.admin.inc'),
('admin/config/people/accounts/display', '', '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a373a2264656661756c74223b7d, '', 31, 5, 1, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage display', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/display/default', '', '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a373a2264656661756c74223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a373a2264656661756c74223b7d, '', 63, 6, 1, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/display/full', '', '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a343a2266756c6c223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a343a2266756c6c223b7d, '', 63, 6, 1, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'User account', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/display/token', '', '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a353a22746f6b656e223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a353a22746f6b656e223b7d, '', 63, 6, 1, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'Tokens', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields', '', '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b7d, '', 31, 5, 1, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage fields', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/people/accounts/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/delete', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/edit', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/field-settings', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/fields/%/widget-type', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/config/people/accounts/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Settings', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/user/user.admin.inc'),
('admin/config/people/ip-blocking', '', '', 'user_access', 0x613a313a7b693a303b733a31383a22626c6f636b20495020616464726573736573223b7d, 'system_ip_blocking', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/people/ip-blocking', 'IP address blocking', 't', '', '', 'a:0:{}', 6, 'Manage blocked IP addresses.', '', 10, 'modules/system/system.admin.inc'),
('admin/config/people/ip-blocking/delete/%', 0x613a313a7b693a353b733a31353a22626c6f636b65645f69705f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a22626c6f636b20495020616464726573736573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a2273797374656d5f69705f626c6f636b696e675f64656c657465223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/system/system.admin.inc'),
('admin/config/people/login-destination', '', '', 'user_access', 0x613a313a7b693a303b733a33373a2261646d696e6973746572206c6f67696e2064657374696e6174696f6e2073657474696e6773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33313a226c6f67696e5f64657374696e6174696f6e5f6f766572766965775f666f726d223b7d, '', 15, 4, 0, '', 'admin/config/people/login-destination', 'Login destinations', 't', '', '', 'a:0:{}', 6, 'Customize the destination that the user is redirected to after login.', '', 10, 'sites/all/modules/login_destination/login_destination.admin.inc'),
('admin/config/people/login-destination/add', '', '', 'user_access', 0x613a313a7b693a303b733a33373a2261646d696e6973746572206c6f67696e2064657374696e6174696f6e2073657474696e6773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a226c6f67696e5f64657374696e6174696f6e5f656469745f666f726d223b7d, '', 31, 5, 1, 'admin/config/people/login-destination', 'admin/config/people/login-destination', 'Add login destination rule', 't', '', '', 'a:0:{}', 388, '', '', 1, 'sites/all/modules/login_destination/login_destination.admin.inc'),
('admin/config/people/login-destination/delete/%', 0x613a313a7b693a353b733a32323a226c6f67696e5f64657374696e6174696f6e5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a33373a2261646d696e6973746572206c6f67696e2064657374696e6174696f6e2073657474696e6773223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32393a226c6f67696e5f64657374696e6174696f6e5f64656c6574655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/people/login-destination/delete/%', 'Delete login destination rule', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/login_destination/login_destination.admin.inc'),
('admin/config/people/login-destination/edit/%', 0x613a313a7b693a353b733a32323a226c6f67696e5f64657374696e6174696f6e5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a33373a2261646d696e6973746572206c6f67696e2064657374696e6174696f6e2073657474696e6773223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a226c6f67696e5f64657374696e6174696f6e5f656469745f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/people/login-destination/edit/%', 'Edit login destination rule', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/login_destination/login_destination.admin.inc'),
('admin/config/people/login-destination/list', '', '', 'user_access', 0x613a313a7b693a303b733a33373a2261646d696e6973746572206c6f67696e2064657374696e6174696f6e2073657474696e6773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33313a226c6f67696e5f64657374696e6174696f6e5f6f766572766965775f666f726d223b7d, '', 31, 5, 1, 'admin/config/people/login-destination', 'admin/config/people/login-destination', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/login_destination/login_destination.admin.inc'),
('admin/config/people/login-destination/settings', '', '', 'user_access', 0x613a313a7b693a303b733a33373a2261646d696e6973746572206c6f67696e2064657374696e6174696f6e2073657474696e6773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32363a226c6f67696e5f64657374696e6174696f6e5f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/people/login-destination', 'admin/config/people/login-destination', 'Settings', 't', '', '', 'a:0:{}', 132, 'Change Login Destination settings.', '', 10, 'sites/all/modules/login_destination/login_destination.admin.inc'),
('admin/config/regional', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/regional', 'Regional and language', 't', '', '', 'a:0:{}', 6, 'Regional settings, localization and translation.', 'left', -5, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/regional/date-time', 'Date and time', 't', '', '', 'a:0:{}', 6, 'Configure display formats for date and time.', '', -15, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_date_time_formats', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Formats', 't', '', '', 'a:0:{}', 132, 'Configure display format strings for date and time.', '', -9, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/%/delete', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a2273797374656d5f646174655f64656c6574655f666f726d61745f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 't', '', '', 'a:0:{}', 6, 'Allow users to delete a configured date format.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/%/edit', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33343a2273797374656d5f636f6e6669677572655f646174655f666f726d6174735f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 't', '', '', 'a:0:{}', 6, 'Allow users to edit a configured date format.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/add', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33343a2273797374656d5f636f6e6669677572655f646174655f666f726d6174735f666f726d223b7d, '', 63, 6, 1, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time', 'Add format', 't', '', '', 'a:0:{}', 388, 'Allow users to add additional date formats.', '', -10, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/formats/lookup', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_date_time_lookup', 0x613a303a7b7d, '', 63, 6, 0, '', 'admin/config/regional/date-time/formats/lookup', 'Date and time lookup', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/types', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Types', 't', '', '', 'a:0:{}', 140, 'Configure display formats for date and time.', '', -10, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/types/%/delete', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33353a2273797374656d5f64656c6574655f646174655f666f726d61745f747970655f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 't', '', '', 'a:0:{}', 6, 'Allow users to delete a configured date type.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/regional/date-time/types/add', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2273797374656d5f6164645f646174655f666f726d61745f747970655f666f726d223b7d, '', 63, 6, 1, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time', 'Add date type', 't', '', '', 'a:0:{}', 388, 'Add new date type.', '', -10, 'modules/system/system.admin.inc'),
('admin/config/regional/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f726567696f6e616c5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/regional/settings', 'Regional settings', 't', '', '', 'a:0:{}', 6, 'Settings for the site\'s default time zone and country.', '', -20, 'modules/system/system.admin.inc'),
('admin/config/search', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/search', 'Search and metadata', 't', '', '', 'a:0:{}', 6, 'Local site search, metadata and SEO.', 'left', -10, 'modules/system/system.admin.inc'),
('admin/config/search/clean-urls', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f636c65616e5f75726c5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/search/clean-urls', 'Clean URLs', 't', '', '', 'a:0:{}', 6, 'Enable or disable clean URLs for your site.', '', 5, 'modules/system/system.admin.inc'),
('admin/config/search/clean-urls/check', '', '', '1', 0x613a303a7b7d, 'drupal_json_output', 0x613a313a7b693a303b613a313a7b733a363a22737461747573223b623a313b7d7d, '', 31, 5, 0, '', 'admin/config/search/clean-urls/check', 'Clean URL check', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/config/search/path', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_overview', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/search/path', 'URL aliases', 't', '', '', 'a:0:{}', 6, 'Change your site\'s URL paths by aliasing them.', '', -5, 'modules/path/path.admin.inc'),
('admin/config/search/path/add', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_edit', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'Add alias', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/path/path.admin.inc'),
('admin/config/search/path/delete/%', 0x613a313a7b693a353b733a393a22706174685f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a22706174685f61646d696e5f64656c6574655f636f6e6669726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/search/path/delete/%', 'Delete alias', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/path/path.admin.inc'),
('admin/config/search/path/delete_bulk', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a22706174686175746f5f61646d696e5f64656c657465223b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'Delete aliases', 't', '', '', 'a:0:{}', 132, '', '', 40, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/config/search/path/edit/%', 0x613a313a7b693a353b733a393a22706174685f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_edit', 0x613a313a7b693a303b693a353b7d, '', 62, 6, 0, '', 'admin/config/search/path/edit/%', 'Edit alias', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/path/path.admin.inc'),
('admin/config/search/path/list', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_overview', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/path/path.admin.inc'),
('admin/config/search/path/patterns', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220706174686175746f223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22706174686175746f5f7061747465726e735f666f726d223b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'Patterns', 't', '', '', 'a:0:{}', 132, '', '', 10, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/config/search/path/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220706174686175746f223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22706174686175746f5f73657474696e67735f666f726d223b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 20, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/config/search/path/update_bulk', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a22706174686175746f5f62756c6b5f7570646174655f666f726d223b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'Bulk generate', 't', '', '', 'a:0:{}', 132, '', '', 30, 'sites/all/modules/pathauto/pathauto.admin.inc'),
('admin/config/search/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220736561726368223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a227365617263685f61646d696e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/search/settings', 'Search settings', 't', '', '', 'a:0:{}', 6, 'Configure relevance settings for search and other indexing options.', '', -10, 'modules/search/search.admin.inc'),
('admin/config/search/settings/reindex', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220736561726368223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a227365617263685f7265696e6465785f636f6e6669726d223b7d, '', 31, 5, 0, '', 'admin/config/search/settings/reindex', 'Clear index', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/search/search.admin.inc'),
('admin/config/services', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/services', 'Web services', 't', '', '', 'a:0:{}', 6, 'Tools related to web services.', 'right', 0, 'modules/system/system.admin.inc'),
('admin/config/services/rss-publishing', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f7273735f66656564735f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/services/rss-publishing', 'RSS publishing', 't', '', '', 'a:0:{}', 6, 'Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/services/services-security', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32383a2273657276696365735f73656375726974795f61646d696e5f666f726d223b7d, '', 15, 4, 0, '', 'admin/config/services/services-security', 'Services Security update', 't', '', '', 'a:0:{}', 6, 'Services module security updates', '', 0, 'sites/all/modules/services/services.admin.inc'),
('admin/config/system', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/system', 'System', 't', '', '', 'a:0:{}', 6, 'General system related configuration.', 'right', -20, 'modules/system/system.admin.inc'),
('admin/config/system/actions', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_manage', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/system/actions', 'Actions', 't', '', '', 'a:0:{}', 6, 'Manage the actions defined for your site.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/system/actions/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f616374696f6e735f636f6e666967757265223b7d, '', 31, 5, 0, '', 'admin/config/system/actions/configure', 'Configure an advanced action', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/system/system.admin.inc'),
('admin/config/system/actions/delete/%', 0x613a313a7b693a353b733a31323a22616374696f6e735f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a2273797374656d5f616374696f6e735f64656c6574655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/system/actions/delete/%', 'Delete action', 't', '', '', 'a:0:{}', 6, 'Delete an action.', '', 0, 'modules/system/system.admin.inc'),
('admin/config/system/actions/manage', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_manage', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/system/actions', 'admin/config/system/actions', 'Manage actions', 't', '', '', 'a:0:{}', 140, 'Manage the actions defined for your site.', '', -2, 'modules/system/system.admin.inc'),
('admin/config/system/actions/orphan', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_remove_orphans', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/config/system/actions/orphan', 'Remove orphans', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/config/system/cron', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2273797374656d5f63726f6e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/system/cron', 'Cron', 't', '', '', 'a:0:{}', 6, 'Manage automatic site maintenance tasks.', '', 20, 'modules/system/system.admin.inc'),
('admin/config/system/site-information', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2273797374656d5f736974655f696e666f726d6174696f6e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/system/site-information', 'Site information', 't', '', '', 'a:0:{}', 6, 'Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.', '', -20, 'modules/system/system.admin.inc'),
('admin/config/user-interface', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/user-interface', 'User interface', 't', '', '', 'a:0:{}', 6, 'Tools that enhance the user interface.', 'right', -15, 'modules/system/system.admin.inc'),
('admin/config/user-interface/shortcut', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261646d696e69737465722073686f727463757473223b7d, 'shortcut_set_admin', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/user-interface/shortcut', 'Shortcuts', 't', '', '', 'a:0:{}', 6, 'Add and modify shortcut sets.', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32323a2273686f72746375745f7365745f637573746f6d697a65223b693a313b693a343b7d, '', 30, 5, 0, '', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 'shortcut_set_title_callback', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/add-link', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a2273686f72746375745f6c696e6b5f616464223b693a313b693a343b7d, '', 61, 6, 1, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Add shortcut', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/add-link-inline', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'shortcut_link_add_inline', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 0, '', 'admin/config/user-interface/shortcut/%/add-link-inline', 'Add shortcut', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/delete', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_delete_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a2273686f72746375745f7365745f64656c6574655f666f726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/edit', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32323a2273686f72746375745f7365745f656469745f666f726d223b693a313b693a343b7d, '', 61, 6, 1, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit set name', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/%/links', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32323a2273686f72746375745f7365745f637573746f6d697a65223b693a313b693a343b7d, '', 61, 6, 1, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'List links', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/add-set', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261646d696e69737465722073686f727463757473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273686f72746375745f7365745f6164645f666f726d223b7d, '', 31, 5, 1, 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Add shortcut set', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/link/%', 0x613a313a7b693a353b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'shortcut_link_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a2273686f72746375745f6c696e6b5f65646974223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/user-interface/shortcut/link/%/delete', 0x613a313a7b693a353b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'shortcut_link_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2273686f72746375745f6c696e6b5f64656c657465223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('admin/config/workflow', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/workflow', 'Workflow', 't', '', '', 'a:0:{}', 6, 'Content workflow, editorial workflow tools.', 'right', 5, 'modules/system/system.admin.inc'),
('admin/content', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261636365737320636f6e74656e74206f76657276696577223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d, '', 3, 2, 0, '', 'admin/content', 'Content', 't', '', '', 'a:0:{}', 6, 'Administer content and comments.', '', -10, 'modules/node/node.admin.inc'),
('admin/content/comment', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a303a7b7d, '', 7, 3, 1, 'admin/content', 'admin/content', 'Comments', 't', '', '', 'a:0:{}', 134, 'List and edit site comments and the comment approval queue.', '', 0, 'modules/comment/comment.admin.inc'),
('admin/content/comment/approval', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a313a7b693a303b733a383a22617070726f76616c223b7d, '', 15, 4, 1, 'admin/content/comment', 'admin/content', 'Unapproved comments', 'comment_count_unpublished', '', '', 'a:0:{}', 132, '', '', 0, 'modules/comment/comment.admin.inc'),
('admin/content/comment/new', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a303a7b7d, '', 15, 4, 1, 'admin/content/comment', 'admin/content', 'Published comments', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/comment/comment.admin.inc'),
('admin/content/node', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261636365737320636f6e74656e74206f76657276696577223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d, '', 7, 3, 1, 'admin/content', 'admin/content', 'Content', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/node/node.admin.inc'),
('admin/dashboard', '', '', 'user_access', 0x613a313a7b693a303b733a31363a226163636573732064617368626f617264223b7d, 'dashboard_admin', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/dashboard', 'Dashboard', 't', '', '', 'a:0:{}', 6, 'View and customize your dashboard.', '', -15, ''),
('admin/dashboard/block-content/%/%', 0x613a323a7b693a333b4e3b693a343b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_show_block_content', 0x613a323a7b693a303b693a333b693a313b693a343b7d, '', 28, 5, 0, '', 'admin/dashboard/block-content/%/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('admin/dashboard/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_admin_blocks', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/dashboard/configure', 'Configure available dashboard blocks', 't', '', '', 'a:0:{}', 4, 'Configure which blocks can be shown on the dashboard.', '', 0, ''),
('admin/dashboard/customize', '', '', 'user_access', 0x613a313a7b693a303b733a31363a226163636573732064617368626f617264223b7d, 'dashboard_admin', 0x613a313a7b693a303b623a313b7d, '', 7, 3, 0, '', 'admin/dashboard/customize', 'Customize dashboard', 't', '', '', 'a:0:{}', 4, 'Customize your dashboard.', '', 0, ''),
('admin/dashboard/drawer', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_show_disabled', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/dashboard/drawer', '', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('admin/dashboard/update', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_update', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/dashboard/update', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `delivery_callback`, `fit`, `number_parts`, `context`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `theme_callback`, `theme_arguments`, `type`, `description`, `position`, `weight`, `include_file`) VALUES
('admin/help', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_main', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/help', 'Help', 't', '', '', 'a:0:{}', 6, 'Reference for usage, configuration, and modules.', '', 9, 'modules/help/help.admin.inc'),
('admin/help/admin_menu', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/admin_menu', 'admin_menu', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/block', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/block', 'block', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/ckeditor', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/ckeditor', 'ckeditor', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/color', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/color', 'color', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/comment', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/comment', 'comment', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/contextual', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/contextual', 'contextual', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/dashboard', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/dashboard', 'dashboard', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/dblog', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/dblog', 'dblog', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/field', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/field', 'field', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/field_sql_storage', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/field_sql_storage', 'field_sql_storage', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/field_ui', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/field_ui', 'field_ui', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/file', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/file', 'file', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/filter', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/filter', 'filter', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/flexslider', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/flexslider', 'flexslider', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/help', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/help', 'help', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/image', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/image', 'image', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/jquery_update', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/jquery_update', 'jquery_update', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/libraries', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/libraries', 'libraries', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/list', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/list', 'list', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/login_destination', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/login_destination', 'login_destination', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/menu', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/menu', 'menu', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/node', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/node', 'node', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/number', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/number', 'number', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/options', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/options', 'options', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/path', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/path', 'path', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/pathauto', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/pathauto', 'pathauto', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/php', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/php', 'php', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/rdf', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/rdf', 'rdf', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/search', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/search', 'search', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/services', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/services', 'services', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/shortcut', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/shortcut', 'shortcut', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/system', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/system', 'system', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/taxonomy', 'taxonomy', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/text', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/text', 'text', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/token', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/token', 'token', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/update', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/update', 'update', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/user', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/user', 'user', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/views', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/views', 'views', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/views_slideshow', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/views_slideshow', 'views_slideshow', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/views_slideshow_cycle', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/views_slideshow_cycle', 'views_slideshow_cycle', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/help/views_ui', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/views_ui', 'views_ui', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc'),
('admin/index', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_index', 0x613a303a7b7d, '', 3, 2, 1, 'admin', 'admin', 'Index', 't', '', '', 'a:0:{}', 132, '', '', -18, 'modules/system/system.admin.inc'),
('admin/modules', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, '', 3, 2, 0, '', 'admin/modules', 'Modules', 't', '', '', 'a:0:{}', 6, 'Extend site functionality.', '', -2, 'modules/system/system.admin.inc'),
('admin/modules/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a363a226d6f64756c65223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'Install new module', 't', '', '', 'a:0:{}', 388, '', '', 25, 'modules/update/update.manager.inc'),
('admin/modules/list', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/system/system.admin.inc'),
('admin/modules/list/confirm', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, '', 15, 4, 0, '', 'admin/modules/list/confirm', 'List', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/system/system.admin.inc'),
('admin/modules/uninstall', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'Uninstall', 't', '', '', 'a:0:{}', 132, '', '', 20, 'modules/system/system.admin.inc'),
('admin/modules/uninstall/confirm', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d, '', 15, 4, 0, '', 'admin/modules/uninstall/confirm', 'Uninstall', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/system/system.admin.inc'),
('admin/modules/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a363a226d6f64756c65223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'Update', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/update/update.manager.inc'),
('admin/people', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a343a226c697374223b7d, '', 3, 2, 0, '', 'admin/people', 'People', 't', '', '', 'a:0:{}', 6, 'Manage user accounts, roles, and permissions.', 'left', -4, 'modules/user/user.admin.inc'),
('admin/people/create', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a363a22637265617465223b7d, '', 7, 3, 1, 'admin/people', 'admin/people', 'Add user', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/user/user.admin.inc'),
('admin/people/people', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a343a226c697374223b7d, '', 7, 3, 1, 'admin/people', 'admin/people', 'List', 't', '', '', 'a:0:{}', 140, 'Find and manage people interacting with your site.', '', -10, 'modules/user/user.admin.inc'),
('admin/people/permissions', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22757365725f61646d696e5f7065726d697373696f6e73223b7d, '', 7, 3, 1, 'admin/people', 'admin/people', 'Permissions', 't', '', '', 'a:0:{}', 132, 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc'),
('admin/people/permissions/list', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22757365725f61646d696e5f7065726d697373696f6e73223b7d, '', 15, 4, 1, 'admin/people/permissions', 'admin/people', 'Permissions', 't', '', '', 'a:0:{}', 140, 'Determine access to features by selecting permissions for roles.', '', -8, 'modules/user/user.admin.inc'),
('admin/people/permissions/roles', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31363a22757365725f61646d696e5f726f6c6573223b7d, '', 15, 4, 1, 'admin/people/permissions', 'admin/people', 'Roles', 't', '', '', 'a:0:{}', 132, 'List, edit, or add user roles.', '', -5, 'modules/user/user.admin.inc'),
('admin/people/permissions/roles/delete/%', 0x613a313a7b693a353b733a31343a22757365725f726f6c655f6c6f6164223b7d, '', 'user_role_edit_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a22757365725f61646d696e5f726f6c655f64656c6574655f636f6e6669726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/people/permissions/roles/delete/%', 'Delete role', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.admin.inc'),
('admin/people/permissions/roles/edit/%', 0x613a313a7b693a353b733a31343a22757365725f726f6c655f6c6f6164223b7d, '', 'user_role_edit_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31353a22757365725f61646d696e5f726f6c65223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/people/permissions/roles/edit/%', 'Edit role', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.admin.inc'),
('admin/reports', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/reports', 'Reports', 't', '', '', 'a:0:{}', 6, 'View reports, updates, and errors.', 'left', 5, 'modules/system/system.admin.inc'),
('admin/reports/access-denied', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a31333a226163636573732064656e696564223b7d, '', 7, 3, 0, '', 'admin/reports/access-denied', 'Top \'access denied\' errors', 't', '', '', 'a:0:{}', 6, 'View \'access denied\' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/dblog', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_overview', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/dblog', 'Recent log messages', 't', '', '', 'a:0:{}', 6, 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc'),
('admin/reports/event/%', 0x613a313a7b693a333b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_event', 0x613a313a7b693a303b693a333b7d, '', 14, 4, 0, '', 'admin/reports/event/%', 'Details', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/fields', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'field_ui_fields_list', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/fields', 'Field list', 't', '', '', 'a:0:{}', 6, 'Overview of fields on all entity types.', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/reports/fields/list', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'field_ui_fields_list', 0x613a303a7b7d, '', 15, 4, 1, 'admin/reports/fields', 'admin/reports/fields', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc'),
('admin/reports/fields/views-fields', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_field_list', 0x613a303a7b7d, '', 15, 4, 1, 'admin/reports/fields', 'admin/reports/fields', 'Used in views', 't', '', '', 'a:0:{}', 132, 'Overview of fields used in all views.', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/reports/libraries', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a226c69627261726965735f61646d696e5f6f76657276696577223b7d, '', 7, 3, 0, '', 'admin/reports/libraries', 'Libraries', 't', '', '', 'a:0:{}', 6, 'An overview of libraries installed on this site.', '', 0, 'sites/all/modules/libraries/libraries.admin.inc'),
('admin/reports/libraries/%', 0x613a313a7b693a333b733a31373a226c69627261726965735f75695f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33353a226c69627261726965735f61646d696e5f6c6962726172795f7374617475735f666f726d223b693a313b693a333b7d, '', 14, 4, 0, '', 'admin/reports/libraries/%', 'Library status report', 't', '', '', 'a:0:{}', 6, 'Status overview for a single library', '', 0, 'sites/all/modules/libraries/libraries.admin.inc'),
('admin/reports/page-not-found', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a31343a2270616765206e6f7420666f756e64223b7d, '', 7, 3, 0, '', 'admin/reports/page-not-found', 'Top \'page not found\' errors', 't', '', '', 'a:0:{}', 6, 'View \'page not found\' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/search', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a363a22736561726368223b7d, '', 7, 3, 0, '', 'admin/reports/search', 'Top search phrases', 't', '', '', 'a:0:{}', 6, 'View most popular search phrases.', '', 0, 'modules/dblog/dblog.admin.inc'),
('admin/reports/status', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_status', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/status', 'Status report', 't', '', '', 'a:0:{}', 6, 'Get a status report about your site\'s operation and any detected problems.', '', -60, 'modules/system/system.admin.inc'),
('admin/reports/status/php', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_php', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/reports/status/php', 'PHP', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/status/rebuild', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a226e6f64655f636f6e6669677572655f72656275696c645f636f6e6669726d223b7d, '', 15, 4, 0, '', 'admin/reports/status/rebuild', 'Rebuild permissions', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/node/node.admin.inc'),
('admin/reports/status/run-cron', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_run_cron', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('admin/reports/updates', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_status', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/updates', 'Available updates', 't', '', '', 'a:0:{}', 6, 'Get a status report about available updates for your installed modules and themes.', '', -50, 'modules/update/update.report.inc'),
('admin/reports/updates/check', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_manual_status', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/reports/updates/check', 'Manual update check', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/update/update.fetch.inc'),
('admin/reports/updates/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a363a227265706f7274223b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'Install new module or theme', 't', '', '', 'a:0:{}', 388, '', '', 25, 'modules/update/update.manager.inc'),
('admin/reports/updates/list', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_status', 0x613a303a7b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/update/update.report.inc'),
('admin/reports/updates/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31353a227570646174655f73657474696e6773223b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 50, 'modules/update/update.settings.inc'),
('admin/reports/updates/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a363a227265706f7274223b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'Update', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/update/update.manager.inc'),
('admin/reports/views-plugins', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_plugin_list', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/views-plugins', 'Views plugins', 't', '', '', 'a:0:{}', 6, 'Overview of plugins used in all views.', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/structure', 'Structure', 't', '', '', 'a:0:{}', 6, 'Administer blocks, content types, menus, etc.', 'right', -8, 'modules/system/system.admin.inc'),
('admin/structure/block', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'block_admin_display', 0x613a313a7b693a303b733a393a22626f6f747374726170223b7d, '', 7, 3, 0, '', 'admin/structure/block', 'Blocks', 't', '', '', 'a:0:{}', 6, 'Configure what block content appears in your site\'s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 15, 4, 1, 'admin/structure/block', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/demo/bartik', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a363a2262617274696b223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/bartik', 'Bartik', 't', '', '_block_custom_theme', 'a:1:{i:0;s:6:\"bartik\";}', 0, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/demo/bootstrap', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f626f6f7473747261702e696e666f223b733a343a226e616d65223b733a393a22626f6f747374726170223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a32323a7b733a343a226e616d65223b733a393a22426f6f747374726170223b733a31313a226465736372697074696f6e223b733a3131353a224275696c7420746f2075736520426f6f7473747261702c206120736c65656b2c20696e747569746976652c20616e6420706f77657266756c2066726f6e742d656e64206672616d65776f726b20666f722066617374657220616e64206561736965722077656220646576656c6f706d656e742e223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a353a22352e332e30223b733a32333a2273696d706c79746573745f646570656e64656e63696573223b613a313a7b693a303b733a31333a226a71756572795f757064617465223b7d733a373a22726567696f6e73223b613a31343a7b733a343a226c6f676f223b733a343a224c6f676f223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a363a22686561646572223b733a373a22546f7020426172223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a373a225072696d617279223b733a31343a22736964656261725f7365636f6e64223b733a393a225365636f6e64617279223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a383a2273657474696e6773223b613a36313a7b733a32353a22626f6f7473747261705f666c7569645f636f6e7461696e6572223b733a313a2230223b733a32313a22626f6f7473747261705f627574746f6e5f73697a65223b733a303a22223b733a32353a22626f6f7473747261705f627574746f6e5f636f6c6f72697a65223b733a313a2231223b733a32343a22626f6f7473747261705f627574746f6e5f69636f6e697a65223b733a313a2231223b733a32313a22626f6f7473747261705f696d6167655f7368617065223b733a303a22223b733a32363a22626f6f7473747261705f696d6167655f726573706f6e73697665223b733a313a2231223b733a32343a22626f6f7473747261705f7461626c655f626f726465726564223b733a313a2230223b733a32353a22626f6f7473747261705f7461626c655f636f6e64656e736564223b733a313a2230223b733a32313a22626f6f7473747261705f7461626c655f686f766572223b733a313a2231223b733a32333a22626f6f7473747261705f7461626c655f73747269706564223b733a313a2231223b733a32363a22626f6f7473747261705f7461626c655f726573706f6e73697665223b733a323a222d31223b733a32303a22626f6f7473747261705f62726561646372756d62223b733a313a2231223b733a32353a22626f6f7473747261705f62726561646372756d625f686f6d65223b733a313a2230223b733a32363a22626f6f7473747261705f62726561646372756d625f7469746c65223b733a313a2231223b733a32353a22626f6f7473747261705f6e61766261725f706f736974696f6e223b733a303a22223b733a32343a22626f6f7473747261705f6e61766261725f696e7665727365223b733a313a2230223b733a33303a22626f6f7473747261705f70616765725f66697273745f616e645f6c617374223b733a313a2231223b733a33323a22626f6f7473747261705f726567696f6e5f77656c6c2d6e617669676174696f6e223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d686561646572223b733a303a22223b733a33333a22626f6f7473747261705f726567696f6e5f77656c6c2d686967686c696768746564223b733a303a22223b733a32363a22626f6f7473747261705f726567696f6e5f77656c6c2d68656c70223b733a303a22223b733a32393a22626f6f7473747261705f726567696f6e5f77656c6c2d636f6e74656e74223b733a303a22223b733a33353a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f6669727374223b733a343a2277656c6c223b733a33363a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f7365636f6e64223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d666f6f746572223b733a303a22223b733a32313a22626f6f7473747261705f616e63686f72735f666978223b733a313a2230223b733a33343a22626f6f7473747261705f616e63686f72735f736d6f6f74685f7363726f6c6c696e67223b733a313a2230223b733a33343a22626f6f7473747261705f666f726d735f72657175697265645f6861735f6572726f72223b733a313a2230223b733a33383a22626f6f7473747261705f666f726d735f6861735f6572726f725f76616c75655f746f67676c65223b733a313a2231223b733a33343a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e73223b733a313a2231223b733a34303a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f6c696d6974223b733a333a22323530223b733a34373a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f616c6c6f7765645f74616773223b733a33333a22622c20636f64652c20656d2c20692c206b62642c207370616e2c207374726f6e67223b733a32353a22626f6f7473747261705f706f706f7665725f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f706f706f7665725f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f706f706f7665725f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f706c6163656d656e74223b733a353a227269676874223b733a32363a22626f6f7473747261705f706f706f7665725f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f74726967676572223b613a333a7b733a373a2227686f76657227223b733a313a2230223b733a373a2227666f63757327223b733a313a2230223b733a373a2227636c69636b27223b733a353a22636c69636b223b7d733a33353a22626f6f7473747261705f706f706f7665725f747269676765725f6175746f636c6f7365223b733a313a2231223b733a32333a22626f6f7473747261705f706f706f7665725f7469746c65223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f636f6e74656e74223b733a303a22223b733a32333a22626f6f7473747261705f706f706f7665725f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f636f6e7461696e6572223b733a343a22626f6479223b733a32353a22626f6f7473747261705f746f6f6c7469705f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f746f6f6c7469705f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f746f6f6c7469705f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f706c6163656d656e74223b733a393a226175746f206c656674223b733a32363a22626f6f7473747261705f746f6f6c7469705f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f746f6f6c7469705f74726967676572223b613a333a7b733a373a2227686f76657227223b733a353a22686f766572223b733a373a2227666f63757327223b733a353a22666f637573223b733a373a2227636c69636b27223b733a313a2230223b7d733a32333a22626f6f7473747261705f746f6f6c7469705f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f636f6e7461696e6572223b733a343a22626f6479223b733a32323a22626f6f7473747261705f63646e5f70726f7669646572223b733a383a226a7364656c697672223b733a32343a22626f6f7473747261705f63646e5f637573746f6d5f637373223b733a35383a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e637373223b733a32383a22626f6f7473747261705f63646e5f637573746f6d5f6373735f6d696e223b733a36323a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e6d696e2e637373223b733a32333a22626f6f7473747261705f63646e5f637573746f6d5f6a73223b733a35363a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6a73223b733a32373a22626f6f7473747261705f63646e5f637573746f6d5f6a735f6d696e223b733a36303a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6d696e2e6a73223b733a33303a22626f6f7473747261705f63646e5f6a7364656c6976725f76657273696f6e223b733a353a22332e332e37223b733a32383a22626f6f7473747261705f63646e5f6a7364656c6976725f7468656d65223b733a393a22626f6f747374726170223b733a31313a22746f67676c655f6e616d65223b733a313a2231223b733a31333a22746f67676c655f736561726368223b733a313a2231223b733a32383a226a71756572795f7570646174655f6a71756572795f76657273696f6e223b733a333a22322e31223b7d733a373a226578636c756465223b613a313a7b733a333a22637373223b613a32343a7b693a303b733a32323a226d6973632f766572746963616c2d746162732e637373223b693a313b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b693a323b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b693a333b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b693a343b733a32333a226d6f64756c65732f64626c6f672f64626c6f672e637373223b693a353b733a32313a226d6f64756c65732f66696c652f66696c652e637373223b693a363b733a32353a226d6f64756c65732f66696c7465722f66696c7465722e637373223b693a373b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b693a383b733a32313a226d6f64756c65732f68656c702f68656c702e637373223b693a393b733a32313a226d6f64756c65732f6d656e752f6d656e752e637373223b693a31303b733a32353a226d6f64756c65732f6f70656e69642f6f70656e69642e637373223b693a31313b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b693a31323b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b693a31333b733a33333a226d6f64756c65732f737461746973746963732f737461746973746963732e637373223b693a31343b733a32353a226d6f64756c65732f7379736c6f672f7379736c6f672e637373223b693a31353b733a33303a226d6f64756c65732f73797374656d2f6d61696e74656e616e63652e637373223b693a31363b733a33373a226d6f64756c65732f73797374656d2f73797374656d2e6d61696e74656e616e63652e637373223b693a31373b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e6d656e75732e637373223b693a31383b733a33343a226d6f64756c65732f73797374656d2f73797374656d2e6d657373616765732e637373223b693a31393b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e7468656d652e637373223b693a32303b733a32393a226d6f64756c65732f7461786f6e6f6d792f7461786f6e6f6d792e637373223b693a32313b733a32373a226d6f64756c65732f747261636b65722f747261636b65722e637373223b693a32323b733a32353a226d6f64756c65732f7570646174652f7570646174652e637373223b693a32333b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a31313a22627265616b706f696e7473223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b733a31383a22286d61782d77696474683a20373637707829223b733a31333a2273637265656e2d736d2d6d696e223b733a31383a22286d696e2d77696474683a20373638707829223b733a31333a2273637265656e2d736d2d6d6178223b733a31383a22286d61782d77696474683a20393931707829223b733a31333a2273637265656e2d6d642d6d696e223b733a31383a22286d696e2d77696474683a20393932707829223b733a31333a2273637265656e2d6d642d6d6178223b733a31393a22286d61782d77696474683a2031313939707829223b733a31333a2273637265656e2d6c672d6d696e223b733a31393a22286d696e2d77696474683a2031323030707829223b7d733a31313a226d756c7469706c69657273223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6c672d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d7d733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a393a22626f6f747374726170223b733a393a22646174657374616d70223b733a31303a2231353234303931303839223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f73637265656e73686f742e706e67223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313533343934393133373b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a393a22626f6f747374726170223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/bootstrap', 'Bootstrap', 't', '', '_block_custom_theme', 'a:1:{i:0;s:9:\"bootstrap\";}', 0, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `delivery_callback`, `fit`, `number_parts`, `context`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `theme_callback`, `theme_arguments`, `type`, `description`, `position`, `weight`, `include_file`) VALUES
('admin/structure/block/demo/garland', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a373a226761726c616e64223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/garland', 'Garland', 't', '', '_block_custom_theme', 'a:1:{i:0;s:7:\"garland\";}', 0, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/demo/seven', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a353a22736576656e223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/seven', 'Seven', 't', '', '_block_custom_theme', 'a:1:{i:0;s:5:\"seven\";}', 0, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/demo/stark', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a353a22737461726b223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/stark', 'Stark', 't', '', '_block_custom_theme', 'a:1:{i:0;s:5:\"stark\";}', 0, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/bartik', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a363a2262617274696b223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Bartik', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/bartik/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/bartik', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/bootstrap', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f626f6f7473747261702e696e666f223b733a343a226e616d65223b733a393a22626f6f747374726170223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a32323a7b733a343a226e616d65223b733a393a22426f6f747374726170223b733a31313a226465736372697074696f6e223b733a3131353a224275696c7420746f2075736520426f6f7473747261702c206120736c65656b2c20696e747569746976652c20616e6420706f77657266756c2066726f6e742d656e64206672616d65776f726b20666f722066617374657220616e64206561736965722077656220646576656c6f706d656e742e223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a353a22352e332e30223b733a32333a2273696d706c79746573745f646570656e64656e63696573223b613a313a7b693a303b733a31333a226a71756572795f757064617465223b7d733a373a22726567696f6e73223b613a31343a7b733a343a226c6f676f223b733a343a224c6f676f223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a363a22686561646572223b733a373a22546f7020426172223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a373a225072696d617279223b733a31343a22736964656261725f7365636f6e64223b733a393a225365636f6e64617279223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a383a2273657474696e6773223b613a36313a7b733a32353a22626f6f7473747261705f666c7569645f636f6e7461696e6572223b733a313a2230223b733a32313a22626f6f7473747261705f627574746f6e5f73697a65223b733a303a22223b733a32353a22626f6f7473747261705f627574746f6e5f636f6c6f72697a65223b733a313a2231223b733a32343a22626f6f7473747261705f627574746f6e5f69636f6e697a65223b733a313a2231223b733a32313a22626f6f7473747261705f696d6167655f7368617065223b733a303a22223b733a32363a22626f6f7473747261705f696d6167655f726573706f6e73697665223b733a313a2231223b733a32343a22626f6f7473747261705f7461626c655f626f726465726564223b733a313a2230223b733a32353a22626f6f7473747261705f7461626c655f636f6e64656e736564223b733a313a2230223b733a32313a22626f6f7473747261705f7461626c655f686f766572223b733a313a2231223b733a32333a22626f6f7473747261705f7461626c655f73747269706564223b733a313a2231223b733a32363a22626f6f7473747261705f7461626c655f726573706f6e73697665223b733a323a222d31223b733a32303a22626f6f7473747261705f62726561646372756d62223b733a313a2231223b733a32353a22626f6f7473747261705f62726561646372756d625f686f6d65223b733a313a2230223b733a32363a22626f6f7473747261705f62726561646372756d625f7469746c65223b733a313a2231223b733a32353a22626f6f7473747261705f6e61766261725f706f736974696f6e223b733a303a22223b733a32343a22626f6f7473747261705f6e61766261725f696e7665727365223b733a313a2230223b733a33303a22626f6f7473747261705f70616765725f66697273745f616e645f6c617374223b733a313a2231223b733a33323a22626f6f7473747261705f726567696f6e5f77656c6c2d6e617669676174696f6e223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d686561646572223b733a303a22223b733a33333a22626f6f7473747261705f726567696f6e5f77656c6c2d686967686c696768746564223b733a303a22223b733a32363a22626f6f7473747261705f726567696f6e5f77656c6c2d68656c70223b733a303a22223b733a32393a22626f6f7473747261705f726567696f6e5f77656c6c2d636f6e74656e74223b733a303a22223b733a33353a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f6669727374223b733a343a2277656c6c223b733a33363a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f7365636f6e64223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d666f6f746572223b733a303a22223b733a32313a22626f6f7473747261705f616e63686f72735f666978223b733a313a2230223b733a33343a22626f6f7473747261705f616e63686f72735f736d6f6f74685f7363726f6c6c696e67223b733a313a2230223b733a33343a22626f6f7473747261705f666f726d735f72657175697265645f6861735f6572726f72223b733a313a2230223b733a33383a22626f6f7473747261705f666f726d735f6861735f6572726f725f76616c75655f746f67676c65223b733a313a2231223b733a33343a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e73223b733a313a2231223b733a34303a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f6c696d6974223b733a333a22323530223b733a34373a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f616c6c6f7765645f74616773223b733a33333a22622c20636f64652c20656d2c20692c206b62642c207370616e2c207374726f6e67223b733a32353a22626f6f7473747261705f706f706f7665725f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f706f706f7665725f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f706f706f7665725f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f706c6163656d656e74223b733a353a227269676874223b733a32363a22626f6f7473747261705f706f706f7665725f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f74726967676572223b613a333a7b733a373a2227686f76657227223b733a313a2230223b733a373a2227666f63757327223b733a313a2230223b733a373a2227636c69636b27223b733a353a22636c69636b223b7d733a33353a22626f6f7473747261705f706f706f7665725f747269676765725f6175746f636c6f7365223b733a313a2231223b733a32333a22626f6f7473747261705f706f706f7665725f7469746c65223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f636f6e74656e74223b733a303a22223b733a32333a22626f6f7473747261705f706f706f7665725f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f636f6e7461696e6572223b733a343a22626f6479223b733a32353a22626f6f7473747261705f746f6f6c7469705f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f746f6f6c7469705f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f746f6f6c7469705f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f706c6163656d656e74223b733a393a226175746f206c656674223b733a32363a22626f6f7473747261705f746f6f6c7469705f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f746f6f6c7469705f74726967676572223b613a333a7b733a373a2227686f76657227223b733a353a22686f766572223b733a373a2227666f63757327223b733a353a22666f637573223b733a373a2227636c69636b27223b733a313a2230223b7d733a32333a22626f6f7473747261705f746f6f6c7469705f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f636f6e7461696e6572223b733a343a22626f6479223b733a32323a22626f6f7473747261705f63646e5f70726f7669646572223b733a383a226a7364656c697672223b733a32343a22626f6f7473747261705f63646e5f637573746f6d5f637373223b733a35383a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e637373223b733a32383a22626f6f7473747261705f63646e5f637573746f6d5f6373735f6d696e223b733a36323a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e6d696e2e637373223b733a32333a22626f6f7473747261705f63646e5f637573746f6d5f6a73223b733a35363a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6a73223b733a32373a22626f6f7473747261705f63646e5f637573746f6d5f6a735f6d696e223b733a36303a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6d696e2e6a73223b733a33303a22626f6f7473747261705f63646e5f6a7364656c6976725f76657273696f6e223b733a353a22332e332e37223b733a32383a22626f6f7473747261705f63646e5f6a7364656c6976725f7468656d65223b733a393a22626f6f747374726170223b733a31313a22746f67676c655f6e616d65223b733a313a2231223b733a31333a22746f67676c655f736561726368223b733a313a2231223b733a32383a226a71756572795f7570646174655f6a71756572795f76657273696f6e223b733a333a22322e31223b7d733a373a226578636c756465223b613a313a7b733a333a22637373223b613a32343a7b693a303b733a32323a226d6973632f766572746963616c2d746162732e637373223b693a313b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b693a323b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b693a333b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b693a343b733a32333a226d6f64756c65732f64626c6f672f64626c6f672e637373223b693a353b733a32313a226d6f64756c65732f66696c652f66696c652e637373223b693a363b733a32353a226d6f64756c65732f66696c7465722f66696c7465722e637373223b693a373b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b693a383b733a32313a226d6f64756c65732f68656c702f68656c702e637373223b693a393b733a32313a226d6f64756c65732f6d656e752f6d656e752e637373223b693a31303b733a32353a226d6f64756c65732f6f70656e69642f6f70656e69642e637373223b693a31313b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b693a31323b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b693a31333b733a33333a226d6f64756c65732f737461746973746963732f737461746973746963732e637373223b693a31343b733a32353a226d6f64756c65732f7379736c6f672f7379736c6f672e637373223b693a31353b733a33303a226d6f64756c65732f73797374656d2f6d61696e74656e616e63652e637373223b693a31363b733a33373a226d6f64756c65732f73797374656d2f73797374656d2e6d61696e74656e616e63652e637373223b693a31373b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e6d656e75732e637373223b693a31383b733a33343a226d6f64756c65732f73797374656d2f73797374656d2e6d657373616765732e637373223b693a31393b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e7468656d652e637373223b693a32303b733a32393a226d6f64756c65732f7461786f6e6f6d792f7461786f6e6f6d792e637373223b693a32313b733a32373a226d6f64756c65732f747261636b65722f747261636b65722e637373223b693a32323b733a32353a226d6f64756c65732f7570646174652f7570646174652e637373223b693a32333b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a31313a22627265616b706f696e7473223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b733a31383a22286d61782d77696474683a20373637707829223b733a31333a2273637265656e2d736d2d6d696e223b733a31383a22286d696e2d77696474683a20373638707829223b733a31333a2273637265656e2d736d2d6d6178223b733a31383a22286d61782d77696474683a20393931707829223b733a31333a2273637265656e2d6d642d6d696e223b733a31383a22286d696e2d77696474683a20393932707829223b733a31333a2273637265656e2d6d642d6d6178223b733a31393a22286d61782d77696474683a2031313939707829223b733a31333a2273637265656e2d6c672d6d696e223b733a31393a22286d696e2d77696474683a2031323030707829223b7d733a31313a226d756c7469706c69657273223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6c672d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d7d733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a393a22626f6f747374726170223b733a393a22646174657374616d70223b733a31303a2231353234303931303839223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f73637265656e73686f742e706e67223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313533343934393133373b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a393a22626f6f747374726170223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Bootstrap', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/block/block.admin.inc'),
('admin/structure/block/list/garland', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a373a226761726c616e64223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Garland', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/garland/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/garland', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/seven', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31393a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a353a22736576656e223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Seven', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/seven/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/seven', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/stark', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a353a22737461726b223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Stark', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/list/stark/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/stark', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/manage/%/%', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b693a313b693a343b693a323b693a353b7d, '', 60, 6, 0, '', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/manage/%/%/configure', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b693a313b693a343b693a323b693a353b7d, '', 121, 7, 2, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/block/manage/%/%/delete', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32353a22626c6f636b5f637573746f6d5f626c6f636b5f64656c657465223b693a313b693a343b693a323b693a353b7d, '', 121, 7, 0, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Delete block', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc'),
('admin/structure/menu', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_overview_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/structure/menu', 'Menus', 't', '', '', 'a:0:{}', 6, 'Add new menus to your site, edit existing menus, and rename and reorganize menu links.', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `delivery_callback`, `fit`, `number_parts`, `context`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `theme_callback`, `theme_arguments`, `type`, `description`, `position`, `weight`, `include_file`) VALUES
('admin/structure/menu/add', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226d656e755f656469745f6d656e75223b693a313b733a333a22616464223b7d, '', 15, 4, 1, 'admin/structure/menu', 'admin/structure/menu', 'Add menu', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/item/%/delete', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_item_delete_page', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 0, '', 'admin/structure/menu/item/%/delete', 'Delete menu link', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/item/%/edit', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31343a226d656e755f656469745f6974656d223b693a313b733a343a2265646974223b693a323b693a343b693a333b4e3b7d, '', 61, 6, 0, '', 'admin/structure/menu/item/%/edit', 'Edit menu link', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/item/%/reset', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226d656e755f72657365745f6974656d5f636f6e6669726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/structure/menu/item/%/reset', 'Reset menu link', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/list', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_overview_page', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/menu', 'admin/structure/menu', 'List menus', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a226d656e755f6f766572766965775f666f726d223b693a313b693a343b7d, '', 30, 5, 0, '', 'admin/structure/menu/manage/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/add', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31343a226d656e755f656469745f6974656d223b693a313b733a333a22616464223b693a323b4e3b693a333b693a343b7d, '', 61, 6, 1, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Add link', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/delete', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_delete_menu_page', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 0, '', 'admin/structure/menu/manage/%/delete', 'Delete menu', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/edit', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31343a226d656e755f656469745f6d656e75223b693a313b733a343a2265646974223b693a323b693a343b7d, '', 61, 6, 3, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Edit menu', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/manage/%/list', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a226d656e755f6f766572766965775f666f726d223b693a313b693a343b7d, '', 61, 6, 3, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'List links', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/menu/menu.admin.inc'),
('admin/structure/menu/parents', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_parent_options_js', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/structure/menu/parents', 'Parent menu items', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('admin/structure/menu/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a226d656e755f636f6e666967757265223b7d, '', 15, 4, 1, 'admin/structure/menu', 'admin/structure/menu', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 5, 'modules/menu/menu.admin.inc'),
('admin/structure/services', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, '', 7, 3, 0, '', 'admin/structure/services', 'Services', 't', '', '', 'a:0:{}', 6, 'Manage Services', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/add', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a333a22616464223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a333a22616464223b7d, '', 15, 4, 1, 'admin/structure/services', 'admin/structure/services', 'Add', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/import', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22696d706f7274223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22696d706f7274223b7d, '', 15, 4, 1, 'admin/structure/services', 'admin/structure/services', 'Import', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, '', 15, 4, 1, 'admin/structure/services', 'admin/structure/services', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, '', 30, 5, 0, '', 'admin/structure/services/list/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/authentication', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207365727669636573223b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a31343a2261757468656e7469636174696f6e223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Authentication', 't', '', '', 'a:0:{}', 132, '', '', -3, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/clone', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/clone', 'Clone', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/delete', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/disable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/disable', 'Disable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/edit', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/enable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/enable', 'Enable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/export', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Export', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/resources', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207365727669636573223b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a393a227265736f7572636573223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Resources', 't', '', '', 'a:0:{}', 132, '', '', -2, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/revert', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22726576657274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/revert', 'Revert', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/services/list/%/server', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207365727669636573223b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22736572766572223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Server', 't', '', '', 'a:0:{}', 132, '', '', -4, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d, '', 7, 3, 0, '', 'admin/structure/taxonomy', 'Taxonomy', 't', '', '', 'a:0:{}', 6, 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a227461786f6e6f6d795f6f766572766965775f7465726d73223b693a313b693a333b7d, '', 14, 4, 0, '', 'admin/structure/taxonomy/%', '', 'entity_label', 'a:2:{i:0;s:19:\"taxonomy_vocabulary\";i:1;i:3;}', '', 'a:0:{}', 6, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%/add', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a227461786f6e6f6d795f666f726d5f7465726d223b693a313b613a303a7b7d693a323b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Add term', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%/display', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a373a2264656661756c74223b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage display', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/display/default', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a373a2264656661756c74223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a373a2264656661756c74223b7d, '', 59, 6, 1, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/display/full', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a343a2266756c6c223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a343a2266756c6c223b7d, '', 59, 6, 1, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Taxonomy term page', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/display/token', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a353a22746f6b656e223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a353a22746f6b656e223b7d, '', 59, 6, 1, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Tokens', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/edit', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b693a313b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/%/fields', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage fields', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 58, 6, 0, '', 'admin/structure/taxonomy/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/delete', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/edit', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/field-settings', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/fields/%/widget-type', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/taxonomy/%/list', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a227461786f6e6f6d795f6f766572766965775f7465726d73223b693a313b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'List', 't', '', '', 'a:0:{}', 140, '', '', -20, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/add', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b7d, '', 15, 4, 1, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Add vocabulary', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/taxonomy/list', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d, '', 15, 4, 1, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/taxonomy/taxonomy.admin.inc'),
('admin/structure/types', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'node_overview_types', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/structure/types', 'Content types', 't', '', '', 'a:0:{}', 6, 'Manage content types, including default status, front page promotion, comment settings, etc.', '', 0, 'modules/node/content_types.inc'),
('admin/structure/types/add', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a226e6f64655f747970655f666f726d223b7d, '', 15, 4, 1, 'admin/structure/types', 'admin/structure/types', 'Add content type', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/node/content_types.inc'),
('admin/structure/types/list', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'node_overview_types', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/types', 'admin/structure/types', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/node/content_types.inc'),
('admin/structure/types/manage/%', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226e6f64655f747970655f666f726d223b693a313b693a343b7d, '', 30, 5, 0, '', 'admin/structure/types/manage/%', 'Edit content type', 'node_type_page_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/node/content_types.inc'),
('admin/structure/types/manage/%/comment/display', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Comment display', 't', '', '', 'a:0:{}', 132, '', '', 4, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/display/default', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a373a2264656661756c74223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 247, 8, 1, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/display/full', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a343a2266756c6c223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a343a2266756c6c223b7d, '', 247, 8, 1, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Full comment', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/display/token', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a353a22746f6b656e223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a353a22746f6b656e223b7d, '', 247, 8, 1, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Tokens', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/fields', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b7d, '', 123, 7, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Comment fields', 't', '', '', 'a:0:{}', 132, '', '', 3, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/fields/%', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a373b7d, '', 246, 8, 0, '', 'admin/structure/types/manage/%/comment/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:7;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/fields/%/delete', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/fields/%/edit', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/fields/%/field-settings', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/comment/fields/%/widget-type', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/delete', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226e6f64655f747970655f64656c6574655f636f6e6669726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/structure/types/manage/%/delete', 'Delete', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/content_types.inc'),
('admin/structure/types/manage/%/display', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 61, 6, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage display', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/default', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a373a2264656661756c74223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/full', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a343a2266756c6c223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a343a2266756c6c223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Full content', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/rss', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a333a22727373223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a333a22727373223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'RSS', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/search_index', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a31323a227365617263685f696e646578223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a31323a227365617263685f696e646578223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Search index', 't', '', '', 'a:0:{}', 132, '', '', 3, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/search_result', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a31333a227365617263685f726573756c74223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a31333a227365617263685f726573756c74223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Search result highlighting input', 't', '', '', 'a:0:{}', 132, '', '', 4, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/teaser', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a363a22746561736572223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a363a22746561736572223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Teaser', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/display/token', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a363a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a353a22746f6b656e223b693a333b733a32313a226669656c645f75695f61646d696e5f616363657373223b693a343b733a31313a22757365725f616363657373223b693a353b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a353a22746f6b656e223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Tokens', 't', '', '', 'a:0:{}', 132, '', '', 5, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/edit', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226e6f64655f747970655f666f726d223b693a313b693a343b7d, '', 61, 6, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/node/content_types.inc'),
('admin/structure/types/manage/%/fields', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage fields', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a363b7d, '', 122, 7, 0, '', 'admin/structure/types/manage/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/delete', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/edit', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `delivery_callback`, `fit`, `number_parts`, `context`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `theme_callback`, `theme_arguments`, `type`, `description`, `position`, `weight`, `include_file`) VALUES
('admin/structure/types/manage/%/fields/%/field-settings', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/types/manage/%/fields/%/widget-type', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'field_ui_admin_access', 0x613a323a7b693a303b733a31313a22757365725f616363657373223b693a313b613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc'),
('admin/structure/views', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, '', 7, 3, 0, '', 'admin/structure/views', 'Views', 't', '', '', 'a:0:{}', 6, 'Manage customized lists of content.', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/add', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_add_page', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Add new view', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/add-template', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_add_template_page', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Add view from template', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/ajax/%/%', 0x613a323a7b693a343b4e3b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_ajax_form', 0x613a333a7b693a303b623a313b693a313b693a343b693a323b693a353b7d, 'ajax_deliver', 60, 6, 0, '', 'admin/structure/views/ajax/%/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/ajax/preview/%/%', 0x613a323a7b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_preview', 0x613a323a7b693a303b693a353b693a313b693a363b7d, 'ajax_deliver', 124, 7, 0, '', 'admin/structure/views/ajax/preview/%/%', '', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/import', '', '', 'views_import_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2276696577735f75695f696d706f72745f70616765223b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Import', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/list', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/nojs/%/%', 0x613a323a7b693a343b4e3b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_ajax_form', 0x613a333a7b693a303b623a303b693a313b693a343b693a323b693a353b7d, '', 60, 6, 0, '', 'admin/structure/views/nojs/%/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/nojs/preview/%/%', 0x613a323a7b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_preview', 0x613a323a7b693a303b693a353b693a313b693a363b7d, '', 124, 7, 0, '', 'admin/structure/views/nojs/preview/%/%', '', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2276696577735f75695f61646d696e5f73657474696e67735f6261736963223b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/settings/advanced', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2276696577735f75695f61646d696e5f73657474696e67735f616476616e636564223b7d, '', 31, 5, 1, 'admin/structure/views/settings', 'admin/structure/views', 'Advanced', 't', '', '', 'a:0:{}', 132, '', '', 1, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/settings/basic', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2276696577735f75695f61646d696e5f73657474696e67735f6261736963223b7d, '', 31, 5, 1, 'admin/structure/views/settings', 'admin/structure/views', 'Basic', 't', '', '', 'a:0:{}', 140, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/template/%/add', 0x613a313a7b693a343b4e3b7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a31323a226164645f74656d706c617465223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a31323a226164645f74656d706c617465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/template/%/add', 'Add from template', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%', 0x613a313a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_edit_page', 0x613a313a7b693a303b693a343b7d, '', 30, 5, 0, '', 'admin/structure/views/view/%', '', 'views_ui_edit_page_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/view/%/break-lock', 0x613a313a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a2276696577735f75695f627265616b5f6c6f636b5f636f6e6669726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/break-lock', 'Break lock', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/view/%/clone', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/clone', 'Clone', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/delete', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/delete', 'Delete', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/disable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/disable', 'Disable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/edit', 0x613a313a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_edit_page', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 3, 'admin/structure/views/view/%', 'admin/structure/views/view/%', 'Edit view', 't', '', 'ajax_base_page_theme', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/view/%/edit/%/ajax', 0x613a323a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_ajax_get_form', 0x613a333a7b693a303b733a31383a2276696577735f75695f656469745f666f726d223b693a313b693a343b693a323b693a363b7d, 'ajax_deliver', 245, 8, 0, '', 'admin/structure/views/view/%/edit/%/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/view/%/enable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/enable', 'Enable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/export', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/export', 'Export', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/structure/views/view/%/preview/%', 0x613a323a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_build_preview', 0x613a323a7b693a303b693a343b693a313b693a363b7d, '', 122, 7, 3, '', 'admin/structure/views/view/%/preview/%', '', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/view/%/preview/%/ajax', 0x613a323a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_build_preview', 0x613a323a7b693a303b693a343b693a313b693a363b7d, 'ajax_deliver', 245, 8, 0, '', 'admin/structure/views/view/%/preview/%/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/structure/views/view/%/revert', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a22726576657274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/revert', 'Revert', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc'),
('admin/tasks', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 3, 2, 1, 'admin', 'admin', 'Tasks', 't', '', '', 'a:0:{}', 140, '', '', -20, 'modules/system/system.admin.inc'),
('admin/update/ready', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a227570646174655f6d616e616765725f7570646174655f72656164795f666f726d223b7d, '', 7, 3, 0, '', 'admin/update/ready', 'Ready to update', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/update/update.manager.inc'),
('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_autocomplete_tag', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/views/ajax/autocomplete/tag', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc'),
('admin/views/ajax/autocomplete/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'views_ajax_autocomplete_taxonomy', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/views/ajax/autocomplete/taxonomy', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/ajax.inc'),
('admin/views/ajax/autocomplete/user', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261636365737320757365722070726f66696c6573223b7d, 'views_ajax_autocomplete_user', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/views/ajax/autocomplete/user', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/ajax.inc'),
('admin_menu/flush-cache', '', '', 'user_access', 0x613a313a7b693a303b733a31323a22666c75736820636163686573223b7d, 'admin_menu_flush_cache', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin_menu/flush-cache', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/admin_menu/admin_menu.inc'),
('api', '', '', 'services_access_menu', 0x613a303a7b7d, 'services_endpoint_callback', 0x613a313a7b693a303b733a333a22617069223b7d, '', 1, 1, 0, '', 'api', 'Services endpoint', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('batch', '', '', '1', 0x613a303a7b7d, 'system_batch_page', 0x613a303a7b7d, '', 1, 1, 0, '', 'batch', '', 't', '', '_system_batch_theme', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('ckeditor/disable/wysiwyg/%', 0x613a313a7b693a333b4e3b7d, '', '1', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636b656469746f72223b7d, 'ckeditor_disable_wysiwyg', 0x613a313a7b693a303b693a333b7d, '', 14, 4, 0, '', 'ckeditor/disable/wysiwyg/%', 'Disable the WYSIWYG module', 't', '', '', 'a:0:{}', 0, 'Disable WYSIWYG module.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.admin.inc'),
('ckeditor/xss', '', '', '1', 0x613a303a7b7d, 'ckeditor_filter_xss', 0x613a303a7b7d, '', 3, 2, 0, '', 'ckeditor/xss', 'XSS Filter', 't', '', '', 'a:0:{}', 0, 'XSS Filter.', '', 0, 'sites/all/modules/ckeditor/includes/ckeditor.page.inc'),
('comment/%', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261636365737320636f6d6d656e7473223b7d, 'comment_permalink', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'comment/%', 'Comment permalink', 't', '', '', 'a:0:{}', 6, '', '', 0, ''),
('comment/%/approve', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_approve', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 0, '', 'comment/%/approve', 'Approve', 't', '', '', 'a:0:{}', 6, '', '', 1, 'modules/comment/comment.pages.inc'),
('comment/%/delete', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_confirm_delete_page', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'comment/%', 'comment/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/comment/comment.admin.inc'),
('comment/%/edit', 0x613a313a7b693a313b733a31323a22636f6d6d656e745f6c6f6164223b7d, '', 'comment_access', 0x613a323a7b693a303b733a343a2265646974223b693a313b693a313b7d, 'comment_edit_page', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'comment/%', 'comment/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, ''),
('comment/%/view', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261636365737320636f6d6d656e7473223b7d, 'comment_permalink', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'comment/%', 'comment/%', 'View comment', 't', '', '', 'a:0:{}', 140, '', '', -10, ''),
('comment/reply/%', 0x613a313a7b693a323b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a323b7d, 'comment_reply', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'comment/reply/%', 'Add new comment', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/comment/comment.pages.inc'),
('ctools/autocomplete/%', 0x613a313a7b693a323b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_content_autocomplete_entity', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'ctools/autocomplete/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/content.menu.inc'),
('ctools/context/ajax/access/add', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_access_ajax_add', 0x613a303a7b7d, '', 31, 5, 0, '', 'ctools/context/ajax/access/add', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-access-admin.inc'),
('ctools/context/ajax/access/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_access_ajax_edit', 0x613a303a7b7d, '', 31, 5, 0, '', 'ctools/context/ajax/access/configure', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-access-admin.inc'),
('ctools/context/ajax/access/delete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_access_ajax_delete', 0x613a303a7b7d, '', 31, 5, 0, '', 'ctools/context/ajax/access/delete', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-access-admin.inc'),
('ctools/context/ajax/add', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_context_ajax_item_add', 0x613a303a7b7d, '', 15, 4, 0, '', 'ctools/context/ajax/add', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-admin.inc'),
('ctools/context/ajax/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_context_ajax_item_edit', 0x613a303a7b7d, '', 15, 4, 0, '', 'ctools/context/ajax/configure', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-admin.inc'),
('ctools/context/ajax/delete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_context_ajax_item_delete', 0x613a303a7b7d, '', 15, 4, 0, '', 'ctools/context/ajax/delete', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-admin.inc'),
('file/ajax', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'file_ajax_upload', 0x613a303a7b7d, 'ajax_deliver', 3, 2, 0, '', 'file/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, ''),
('file/progress', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'file_ajax_progress', 0x613a303a7b7d, '', 3, 2, 0, '', 'file/progress', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, ''),
('filter/tips', '', '', '1', 0x613a303a7b7d, 'filter_tips_long', 0x613a303a7b7d, '', 3, 2, 0, '', 'filter/tips', 'Compose tips', 't', '', '', 'a:0:{}', 20, '', '', 0, 'modules/filter/filter.pages.inc'),
('filter/tips/%', 0x613a313a7b693a323b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', 'filter_access', 0x613a313a7b693a303b693a323b7d, 'filter_tips_long', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'filter/tips/%', 'Compose tips', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/filter/filter.pages.inc'),
('form', '', '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31373a22666f726d5f6578616d706c655f666f726d223b7d, '', 1, 1, 0, '', 'form', 'Example Form', 't', '', '', 'a:0:{}', 6, '', '', 0, ''),
('js/admin_menu/cache', '', '', 'user_access', 0x613a313a7b693a303b733a32363a226163636573732061646d696e697374726174696f6e206d656e75223b7d, 'admin_menu_js_cache', 0x613a303a7b7d, 'admin_menu_deliver', 7, 3, 0, '', 'js/admin_menu/cache', '', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('node', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'node_page_default', 0x613a303a7b7d, '', 1, 1, 0, '', 'node', '', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('node/%', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a313b7d, 'node_page_view', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', '', 'a:0:{}', 6, '', '', 0, ''),
('node/%/delete', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a363a2264656c657465223b693a313b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31393a226e6f64655f64656c6574655f636f6e6669726d223b693a313b693a313b7d, '', 5, 3, 2, 'node/%', 'node/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/node/node.pages.inc'),
('node/%/edit', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a313b7d, 'node_page_edit', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 3, 'node/%', 'node/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/node/node.pages.inc'),
('node/%/revisions', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', '_node_revision_access', 0x613a313a7b693a303b693a313b7d, 'node_revision_overview', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'node/%', 'node/%', 'Revisions', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/node/node.pages.inc'),
('node/%/revisions/%/delete', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a323a7b693a303b693a313b693a313b733a363a2264656c657465223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226e6f64655f7265766973696f6e5f64656c6574655f636f6e6669726d223b693a313b693a313b7d, '', 21, 5, 0, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc'),
('node/%/revisions/%/revert', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a323a7b693a303b693a313b693a313b733a363a22757064617465223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226e6f64655f7265766973696f6e5f7265766572745f636f6e6669726d223b693a313b693a313b7d, '', 21, 5, 0, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc'),
('node/%/revisions/%/view', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a313a7b693a303b693a313b7d, 'node_show', 0x613a323a7b693a303b693a313b693a313b623a313b7d, '', 21, 5, 0, '', 'node/%/revisions/%/view', 'Revisions', 't', '', '', 'a:0:{}', 6, '', '', 0, ''),
('node/%/view', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a313b7d, 'node_page_view', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'node/%', 'node/%', 'View', 't', '', '', 'a:0:{}', 140, '', '', -10, ''),
('node/add', '', '', '_node_add_access', 0x613a303a7b7d, 'node_add_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'node/add', 'Add content', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc'),
('node/add/article', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a373a2261727469636c65223b7d, 'node_add', 0x613a313a7b693a303b733a373a2261727469636c65223b7d, '', 7, 3, 0, '', 'node/add/article', 'Article', 'check_plain', '', '', 'a:0:{}', 6, 'Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.', '', 0, 'modules/node/node.pages.inc'),
('node/add/banner', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a363a2262616e6e6572223b7d, 'node_add', 0x613a313a7b693a303b733a363a2262616e6e6572223b7d, '', 7, 3, 0, '', 'node/add/banner', 'Banner', 'check_plain', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc'),
('node/add/hotel', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a353a22686f74656c223b7d, 'node_add', 0x613a313a7b693a303b733a353a22686f74656c223b7d, '', 7, 3, 0, '', 'node/add/hotel', 'Hotel', 'check_plain', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc'),
('node/add/page', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a343a2270616765223b7d, 'node_add', 0x613a313a7b693a303b733a343a2270616765223b7d, '', 7, 3, 0, '', 'node/add/page', 'Basic page', 'check_plain', '', '', 'a:0:{}', 6, 'Use <em>basic pages</em> for your static content, such as an \'About us\' page.', '', 0, 'modules/node/node.pages.inc'),
('rss.xml', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'node_feed', 0x613a323a7b693a303b623a303b693a313b613a303a7b7d7d, '', 1, 1, 0, '', 'rss.xml', 'RSS feed', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('search', '', '', 'search_is_active', 0x613a303a7b7d, 'search_view', 0x613a303a7b7d, '', 1, 1, 0, '', 'search', 'Search', 't', '', '', 'a:0:{}', 20, '', '', 0, 'modules/search/search.pages.inc'),
('search/node', '', '', '_search_menu_access', 0x613a313a7b693a303b733a343a226e6f6465223b7d, 'search_view', 0x613a323a7b693a303b733a343a226e6f6465223b693a313b733a303a22223b7d, '', 3, 2, 1, 'search', 'search', 'Content', 't', '', '', 'a:0:{}', 132, '', '', -10, 'modules/search/search.pages.inc'),
('search/node/%', 0x613a313a7b693a323b613a313a7b733a31343a226d656e755f7461696c5f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, 0x613a313a7b693a323b733a31363a226d656e755f7461696c5f746f5f617267223b7d, '_search_menu_access', 0x613a313a7b693a303b733a343a226e6f6465223b7d, 'search_view', 0x613a323a7b693a303b733a343a226e6f6465223b693a313b693a323b7d, '', 6, 3, 1, 'search/node', 'search/node/%', 'Content', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/search/search.pages.inc'),
('search/user', '', '', '_search_menu_access', 0x613a313a7b693a303b733a343a2275736572223b7d, 'search_view', 0x613a323a7b693a303b733a343a2275736572223b693a313b733a303a22223b7d, '', 3, 2, 1, 'search', 'search', 'Users', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/search/search.pages.inc'),
('search/user/%', 0x613a313a7b693a323b613a313a7b733a31343a226d656e755f7461696c5f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, 0x613a313a7b693a323b733a31363a226d656e755f7461696c5f746f5f617267223b7d, '_search_menu_access', 0x613a313a7b693a303b733a343a2275736572223b7d, 'search_view', 0x613a323a7b693a303b733a343a2275736572223b693a313b693a323b7d, '', 6, 3, 1, 'search/node', 'search/node/%', 'Users', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/search/search.pages.inc'),
('services/session/token', '', '', '1', 0x613a303a7b7d, '_services_session_token', 0x613a303a7b7d, '', 7, 3, 0, '', 'services/session/token', '', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('sites/default/files/styles/%', 0x613a313a7b693a343b733a31363a22696d6167655f7374796c655f6c6f6164223b7d, '', '1', 0x613a303a7b7d, 'image_style_deliver', 0x613a313a7b693a303b693a343b7d, '', 30, 5, 0, '', 'sites/default/files/styles/%', 'Generate image style', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('system/ajax', '', '', '1', 0x613a303a7b7d, 'ajax_form_callback', 0x613a303a7b7d, 'ajax_deliver', 3, 2, 0, '', 'system/ajax', 'AHAH callback', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'includes/form.inc'),
('system/files', '', '', '1', 0x613a303a7b7d, 'file_download', 0x613a313a7b693a303b733a373a2270726976617465223b7d, '', 3, 2, 0, '', 'system/files', 'File download', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('system/files/styles/%', 0x613a313a7b693a333b733a31363a22696d6167655f7374796c655f6c6f6164223b7d, '', '1', 0x613a303a7b7d, 'image_style_deliver', 0x613a313a7b693a303b693a333b7d, '', 14, 4, 0, '', 'system/files/styles/%', 'Generate image style', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('system/temporary', '', '', '1', 0x613a303a7b7d, 'file_download', 0x613a313a7b693a303b733a393a2274656d706f72617279223b7d, '', 3, 2, 0, '', 'system/temporary', 'Temporary files', 't', '', '', 'a:0:{}', 0, '', '', 0, ''),
('system/timezone', '', '', '1', 0x613a303a7b7d, 'system_timezone', 0x613a303a7b7d, '', 3, 2, 0, '', 'system/timezone', 'Time zone', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc'),
('taxonomy/autocomplete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_autocomplete', 0x613a303a7b7d, '', 3, 2, 0, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('taxonomy/term/%', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_page', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'taxonomy/term/%', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', '', 'a:0:{}', 6, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('taxonomy/term/%/edit', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'taxonomy_term_edit_access', 0x613a313a7b693a303b693a323b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a227461786f6e6f6d795f666f726d5f7465726d223b693a313b693a323b693a323b4e3b7d, '', 13, 4, 1, 'taxonomy/term/%', 'taxonomy/term/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/taxonomy/taxonomy.admin.inc'),
('taxonomy/term/%/feed', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_feed', 0x613a313a7b693a303b693a323b7d, '', 13, 4, 0, '', 'taxonomy/term/%/feed', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', '', 'a:0:{}', 0, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('taxonomy/term/%/view', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_page', 0x613a313a7b693a303b693a323b7d, '', 13, 4, 1, 'taxonomy/term/%', 'taxonomy/term/%', 'View', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc'),
('token/autocomplete/%', 0x613a313a7b693a323b733a31353a22746f6b656e5f747970655f6c6f6164223b7d, '', '1', 0x613a303a7b7d, 'token_autocomplete_token', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'token/autocomplete/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/token/token.pages.inc'),
('token/flush-cache', '', '', 'user_access', 0x613a313a7b693a303b733a31323a22666c75736820636163686573223b7d, 'token_flush_cache_callback', 0x613a303a7b7d, '', 3, 2, 0, '', 'token/flush-cache', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/token/token.pages.inc'),
('token/tree', '', '', '1', 0x613a303a7b7d, 'token_page_output_tree', 0x613a303a7b7d, '', 3, 2, 0, '', 'token/tree', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/token/token.pages.inc'),
('user', '', '', '1', 0x613a303a7b7d, 'user_page', 0x613a303a7b7d, '', 1, 1, 0, '', 'user', 'User account', 'user_menu_title', '', '', 'a:0:{}', 6, '', '', -10, 'modules/user/user.pages.inc'),
('user/%', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_view_access', 0x613a313a7b693a303b693a313b7d, 'user_view_page', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', '', 'a:0:{}', 6, '', '', 0, ''),
('user/%/cancel', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_cancel_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a22757365725f63616e63656c5f636f6e6669726d5f666f726d223b693a313b693a313b7d, '', 5, 3, 0, '', 'user/%/cancel', 'Cancel account', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.pages.inc'),
('user/%/cancel/confirm/%/%', 0x613a333a7b693a313b733a393a22757365725f6c6f6164223b693a343b4e3b693a353b4e3b7d, '', 'user_cancel_access', 0x613a313a7b693a303b693a313b7d, 'user_cancel_confirm', 0x613a333a7b693a303b693a313b693a313b693a343b693a323b693a353b7d, '', 44, 6, 0, '', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.pages.inc'),
('user/%/edit', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_edit_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a22757365725f70726f66696c655f666f726d223b693a313b693a313b7d, '', 5, 3, 1, 'user/%', 'user/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/user/user.pages.inc'),
('user/%/edit/account', 0x613a313a7b693a313b613a313a7b733a31383a22757365725f63617465676f72795f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, '', 'user_edit_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a22757365725f70726f66696c655f666f726d223b693a313b693a313b7d, '', 11, 4, 1, 'user/%/edit', 'user/%', 'Account', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/user/user.pages.inc'),
('user/%/shortcuts', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'shortcut_set_switch_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31393a2273686f72746375745f7365745f737769746368223b693a313b693a313b7d, '', 5, 3, 1, 'user/%', 'user/%', 'Shortcuts', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/shortcut/shortcut.admin.inc'),
('user/%/view', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_view_access', 0x613a313a7b693a303b693a313b7d, 'user_view_page', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'user/%', 'user/%', 'View', 't', '', '', 'a:0:{}', 140, '', '', -10, ''),
('user/autocomplete', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261636365737320757365722070726f66696c6573223b7d, 'user_autocomplete', 0x613a303a7b7d, '', 3, 2, 0, '', 'user/autocomplete', 'User autocomplete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/user/user.pages.inc'),
('user/login', '', '', 'user_is_anonymous', 0x613a303a7b7d, 'user_page', 0x613a303a7b7d, '', 3, 2, 1, 'user', 'user', 'Log in', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/user/user.pages.inc'),
('user/logout', '', '', 'user_is_logged_in', 0x613a303a7b7d, 'user_logout', 0x613a303a7b7d, '', 3, 2, 0, '', 'user/logout', 'Log out', 't', '', '', 'a:0:{}', 6, '', '', 10, 'modules/user/user.pages.inc'),
('user/password', '', '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a393a22757365725f70617373223b7d, '', 3, 2, 1, 'user', 'user', 'Request new password', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/user/user.pages.inc'),
('user/register', '', '', 'user_register_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a22757365725f72656769737465725f666f726d223b7d, '', 3, 2, 1, 'user', 'user', 'Create new account', 't', '', '', 'a:0:{}', 132, '', '', 0, ''),
('user/reset/%/%/%', 0x613a333a7b693a323b4e3b693a333b4e3b693a343b4e3b7d, '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31353a22757365725f706173735f7265736574223b693a313b693a323b693a323b693a333b693a333b693a343b7d, '', 24, 5, 0, '', 'user/reset/%/%/%', 'Reset password', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/user/user.pages.inc'),
('views/ajax', '', '', '1', 0x613a303a7b7d, 'views_ajax', 0x613a303a7b7d, 'ajax_deliver', 3, 2, 0, '', 'views/ajax', 'Views', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, 'Ajax callback for view loading.', '', 0, 'sites/all/modules/views/includes/ajax.inc');

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE `node` (
  `nid` int(10) UNSIGNED NOT NULL COMMENT 'The primary identifier for a node.',
  `vid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.';

--
-- Dumping data for table `node`
--

INSERT INTO `node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `sticky`, `tnid`, `translate`) VALUES
(1, 1, 'hotel', 'und', 'Miri Marriott Resort & Spa', 1, 1, 1530645570, 1532252013, 1, 0, 0, 0, 0),
(2, 2, 'hotel', 'und', 'Dragon Boat Festival', 1, 1, 1530645603, 1532248246, 1, 0, 0, 0, 0),
(3, 3, 'page', 'und', 'About Us', 1, 1, 1531663092, 1531663092, 1, 0, 0, 0, 0),
(4, 4, 'banner', 'und', 'banner1', 1, 1, 1531666139, 1534930741, 1, 0, 0, 0, 0),
(5, 5, 'banner', 'und', 'banner 2', 1, 1, 1531666180, 1534930763, 1, 0, 0, 0, 0),
(6, 6, 'hotel', 'und', 'Book Early And Be Rewarded', 1, 1, 1532258826, 1532258826, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE `node_access` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies which realm/grant pairs a user must possess in...';

--
-- Dumping data for table `node_access`
--

INSERT INTO `node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES
(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

CREATE TABLE `node_comment_statistics` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains statistics of node and comments posts to show ...';

--
-- Dumping data for table `node_comment_statistics`
--

INSERT INTO `node_comment_statistics` (`nid`, `cid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES
(1, 0, 1530645570, NULL, 1, 0),
(2, 0, 1530645603, NULL, 1, 0),
(3, 0, 1531663092, NULL, 1, 0),
(4, 0, 1531666139, NULL, 1, 0),
(5, 0, 1531666180, NULL, 1, 0),
(6, 0, 1532258826, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_revision`
--

CREATE TABLE `node_revision` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) UNSIGNED NOT NULL COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.';

--
-- Dumping data for table `node_revision`
--

INSERT INTO `node_revision` (`nid`, `vid`, `uid`, `title`, `log`, `timestamp`, `status`, `comment`, `promote`, `sticky`) VALUES
(1, 1, 1, 'Miri Marriott Resort & Spa', '', 1532252013, 1, 1, 0, 0),
(2, 2, 1, 'Dragon Boat Festival', '', 1532248246, 1, 1, 0, 0),
(3, 3, 1, 'About Us', '', 1531663092, 1, 1, 0, 0),
(4, 4, 1, 'banner1', '', 1534930741, 1, 1, 0, 0),
(5, 5, 1, 'banner 2', '', 1534930763, 1, 1, 0, 0),
(6, 6, 1, 'Book Early And Be Rewarded', '', 1532258826, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) UNSIGNED NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';

--
-- Dumping data for table `node_type`
--

INSERT INTO `node_type` (`type`, `name`, `base`, `module`, `description`, `help`, `has_title`, `title_label`, `custom`, `modified`, `locked`, `disabled`, `orig_type`) VALUES
('article', 'Article', 'node_content', 'node', 'Use <em>articles</em> for time-sensitive content like news, press releases or blog posts.', '', 1, 'Title', 1, 1, 0, 0, 'article'),
('banner', 'Banner', 'node_content', 'node', '', '', 1, 'name', 1, 1, 0, 0, 'banner'),
('hotel', 'Hotel', 'node_content', 'node', '', '', 1, 'Hotel Name', 1, 1, 0, 0, 'hotel'),
('page', 'Basic page', 'node_content', 'node', 'Use <em>basic pages</em> for your static content, such as an \'About us\' page.', '', 1, 'Title', 1, 1, 0, 0, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `pathauto_state`
--

CREATE TABLE `pathauto_state` (
  `entity_type` varchar(32) NOT NULL COMMENT 'An entity type.',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'An entity ID.',
  `pathauto` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The automatic alias status of the entity.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The status of each entity alias (whether it was...';

--
-- Dumping data for table `pathauto_state`
--

INSERT INTO `pathauto_state` (`entity_type`, `entity_id`, `pathauto`) VALUES
('node', 1, 1),
('node', 4, 0),
('node', 5, 0),
('node', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.';

-- --------------------------------------------------------

--
-- Table structure for table `rdf_mapping`
--

CREATE TABLE `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';

--
-- Dumping data for table `rdf_mapping`
--

INSERT INTO `rdf_mapping` (`type`, `bundle`, `mapping`) VALUES
('node', 'article', 0x613a31313a7b733a31313a226669656c645f696d616765223b613a323a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a383a226f673a696d616765223b693a313b733a31323a22726466733a736565416c736f223b7d733a343a2274797065223b733a333a2272656c223b7d733a31303a226669656c645f74616773223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31303a2264633a7375626a656374223b7d733a343a2274797065223b733a333a2272656c223b7d733a373a2272646674797065223b613a323a7b693a303b733a393a2273696f633a4974656d223b693a313b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d),
('node', 'page', 0x613a393a7b733a373a2272646674797065223b613a313a7b693a303b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `registry`
--

CREATE TABLE `registry` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function, class, or interface.',
  `type` varchar(9) NOT NULL DEFAULT '' COMMENT 'Either function or class or interface.',
  `filename` varchar(255) NOT NULL COMMENT 'Name of the file.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the module the file belongs to.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is a function, class, or interface name and...';

--
-- Dumping data for table `registry`
--

INSERT INTO `registry` (`name`, `type`, `filename`, `module`, `weight`) VALUES
('AccessDeniedTestCase', 'class', 'modules/system/system.test', 'system', 0),
('AdminMenuCustomizedTestCase', 'class', 'sites/all/modules/admin_menu/tests/admin_menu.test', 'admin_menu', 0),
('AdminMenuDynamicLinksTestCase', 'class', 'sites/all/modules/admin_menu/tests/admin_menu.test', 'admin_menu', 0),
('AdminMenuLinkTypesTestCase', 'class', 'sites/all/modules/admin_menu/tests/admin_menu.test', 'admin_menu', 0),
('AdminMenuPermissionsTestCase', 'class', 'sites/all/modules/admin_menu/tests/admin_menu.test', 'admin_menu', 0),
('AdminMenuWebTestCase', 'class', 'sites/all/modules/admin_menu/tests/admin_menu.test', 'admin_menu', 0),
('AdminMetaTagTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ArchiverInterface', 'interface', 'includes/archiver.inc', '', 0),
('ArchiverTar', 'class', 'modules/system/system.archiver.inc', 'system', 0),
('ArchiverZip', 'class', 'modules/system/system.archiver.inc', 'system', 0),
('Archive_Tar', 'class', 'modules/system/system.tar.inc', 'system', 0),
('BatchMemoryQueue', 'class', 'includes/batch.queue.inc', '', 0),
('BatchQueue', 'class', 'includes/batch.queue.inc', '', 0),
('BlockAdminThemeTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockCacheTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockHashTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockHiddenRegionTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockHTMLIdTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockInvalidRegionTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockTemplateSuggestionsUnitTest', 'class', 'modules/block/block.test', 'block', 0),
('BlockTestCase', 'class', 'modules/block/block.test', 'block', 0),
('BlockViewModuleDeltaAlterWebTest', 'class', 'modules/block/block.test', 'block', 0),
('CkeditorTest', 'class', 'sites/all/modules/ckeditor/tests/ckeditor.test', 'ckeditor', 0),
('ColorTestCase', 'class', 'modules/color/color.test', 'color', 0),
('CommentActionsTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentAnonymous', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentApprovalTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentBlockFunctionalTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentContentRebuild', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentController', 'class', 'modules/comment/comment.module', 'comment', 0),
('CommentFieldsTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentHelperCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentInterfaceTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentNodeAccessTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentNodeChangesTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentPagerTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentPreviewTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentRSSUnitTest', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentThreadingTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('CommentTokenReplaceTestCase', 'class', 'modules/comment/comment.test', 'comment', 0),
('ConfirmFormTest', 'class', 'modules/system/system.test', 'system', 0),
('ContextualDynamicContextTestCase', 'class', 'modules/contextual/contextual.test', 'contextual', 0),
('CronQueueTestCase', 'class', 'modules/system/system.test', 'system', 0),
('CronRunTestCase', 'class', 'modules/system/system.test', 'system', 0),
('CtoolsContextIDTestCase', 'class', 'sites/all/modules/ctools/tests/context.test', 'ctools', 0),
('CtoolsContextKeywordsSubstitutionTestCase', 'class', 'sites/all/modules/ctools/tests/context.test', 'ctools', 0),
('CtoolsContextUnitTestCase', 'class', 'sites/all/modules/ctools/tests/context.test', 'ctools', 0),
('CToolsCssCache', 'class', 'sites/all/modules/ctools/includes/css-cache.inc', 'ctools', 0),
('CtoolsCSSObjectCache', 'class', 'sites/all/modules/ctools/tests/css_cache.test', 'ctools', 0),
('CtoolsCssTestCase', 'class', 'sites/all/modules/ctools/tests/css.test', 'ctools', 0),
('CtoolsMathExpressionStackTestCase', 'class', 'sites/all/modules/ctools/tests/math_expression_stack.test', 'ctools', 0),
('CtoolsMathExpressionTestCase', 'class', 'sites/all/modules/ctools/tests/math_expression.test', 'ctools', 0),
('CtoolsModuleTestCase', 'class', 'sites/all/modules/ctools/tests/ctools.test', 'ctools', 0),
('CtoolsObjectCache', 'class', 'sites/all/modules/ctools/tests/object_cache.test', 'ctools', 0),
('CtoolsPageTokens', 'class', 'sites/all/modules/ctools/tests/page_tokens.test', 'ctools', 0),
('CtoolsPluginsGetInfoTestCase', 'class', 'sites/all/modules/ctools/tests/ctools.plugins.test', 'ctools', 0),
('CtoolsUnitObjectCachePlugins', 'class', 'sites/all/modules/ctools/tests/object_cache_unit.test', 'ctools', 0),
('ctools_context', 'class', 'sites/all/modules/ctools/includes/context.inc', 'ctools', 0),
('ctools_context_optional', 'class', 'sites/all/modules/ctools/includes/context.inc', 'ctools', 0),
('ctools_context_required', 'class', 'sites/all/modules/ctools/includes/context.inc', 'ctools', 0),
('ctools_export_ui', 'class', 'sites/all/modules/ctools/plugins/export_ui/ctools_export_ui.class.php', 'ctools', 0),
('ctools_math_expr', 'class', 'sites/all/modules/ctools/includes/math-expr.inc', 'ctools', 0),
('ctools_math_expr_stack', 'class', 'sites/all/modules/ctools/includes/math-expr.inc', 'ctools', 0),
('ctools_stylizer_image_processor', 'class', 'sites/all/modules/ctools/includes/stylizer.inc', 'ctools', 0),
('DashboardBlocksTestCase', 'class', 'modules/dashboard/dashboard.test', 'dashboard', 0),
('Database', 'class', 'includes/database/database.inc', '', 0),
('DatabaseCondition', 'class', 'includes/database/query.inc', '', 0),
('DatabaseConnection', 'class', 'includes/database/database.inc', '', 0),
('DatabaseConnectionNotDefinedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseConnection_mysql', 'class', 'includes/database/mysql/database.inc', '', 0),
('DatabaseConnection_pgsql', 'class', 'includes/database/pgsql/database.inc', '', 0),
('DatabaseConnection_sqlite', 'class', 'includes/database/sqlite/database.inc', '', 0),
('DatabaseDriverNotSpecifiedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseLog', 'class', 'includes/database/log.inc', '', 0),
('DatabaseSchema', 'class', 'includes/database/schema.inc', '', 0),
('DatabaseSchemaObjectDoesNotExistException', 'class', 'includes/database/schema.inc', '', 0),
('DatabaseSchemaObjectExistsException', 'class', 'includes/database/schema.inc', '', 0),
('DatabaseSchema_mysql', 'class', 'includes/database/mysql/schema.inc', '', 0),
('DatabaseSchema_pgsql', 'class', 'includes/database/pgsql/schema.inc', '', 0),
('DatabaseSchema_sqlite', 'class', 'includes/database/sqlite/schema.inc', '', 0),
('DatabaseStatementBase', 'class', 'includes/database/database.inc', '', 0),
('DatabaseStatementEmpty', 'class', 'includes/database/database.inc', '', 0),
('DatabaseStatementInterface', 'interface', 'includes/database/database.inc', '', 0),
('DatabaseStatementPrefetch', 'class', 'includes/database/prefetch.inc', '', 0),
('DatabaseStatement_sqlite', 'class', 'includes/database/sqlite/database.inc', '', 0),
('DatabaseTaskException', 'class', 'includes/install.inc', '', 0),
('DatabaseTasks', 'class', 'includes/install.inc', '', 0),
('DatabaseTasks_mysql', 'class', 'includes/database/mysql/install.inc', '', 0),
('DatabaseTasks_pgsql', 'class', 'includes/database/pgsql/install.inc', '', 0),
('DatabaseTasks_sqlite', 'class', 'includes/database/sqlite/install.inc', '', 0),
('DatabaseTransaction', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionCommitFailedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionExplicitCommitNotAllowedException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionNameNonUniqueException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionNoActiveException', 'class', 'includes/database/database.inc', '', 0),
('DatabaseTransactionOutOfOrderException', 'class', 'includes/database/database.inc', '', 0),
('DateFormatTestCase', 'class', 'modules/system/system.test', 'system', 0),
('DateTimeFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('DBLogTestCase', 'class', 'modules/dblog/dblog.test', 'dblog', 0),
('DefaultMailSystem', 'class', 'modules/system/system.mail.inc', 'system', 0),
('DeleteQuery', 'class', 'includes/database/query.inc', '', 0),
('DeleteQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('DrupalCacheArray', 'class', 'includes/bootstrap.inc', '', 0),
('DrupalCacheInterface', 'interface', 'includes/cache.inc', '', 0),
('DrupalDatabaseCache', 'class', 'includes/cache.inc', '', 0),
('DrupalDefaultEntityController', 'class', 'includes/entity.inc', '', 0),
('DrupalEntityControllerInterface', 'interface', 'includes/entity.inc', '', 0),
('DrupalFakeCache', 'class', 'includes/cache-install.inc', '', 0),
('DrupalLocalStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalPrivateStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalPublicStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalQueue', 'class', 'modules/system/system.queue.inc', 'system', 0),
('DrupalQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', 0),
('DrupalReliableQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', 0),
('DrupalRequestSanitizer', 'class', 'includes/request-sanitizer.inc', '', 0),
('DrupalSetMessageTest', 'class', 'modules/system/system.test', 'system', 0),
('DrupalStreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', 0),
('DrupalTemporaryStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0),
('DrupalUpdateException', 'class', 'includes/update.inc', '', 0),
('DrupalUpdaterInterface', 'interface', 'includes/updater.inc', '', 0),
('EnableDisableTestCase', 'class', 'modules/system/system.test', 'system', 0),
('Entity', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0),
('EntityAPICommentNodeAccessTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityAPIController', 'class', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0),
('EntityAPIControllerExportable', 'class', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0),
('EntityAPIControllerInterface', 'interface', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0),
('EntityAPIControllerRevisionableInterface', 'interface', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0),
('EntityAPIi18nItegrationTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityAPIRulesIntegrationTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityAPITestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityBundleableUIController', 'class', 'sites/all/modules/entity/includes/entity.ui.inc', 'entity', 0),
('EntityContentUIController', 'class', 'sites/all/modules/entity/includes/entity.ui.inc', 'entity', 0),
('EntityDB', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0),
('EntityDBExtendable', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0),
('EntityDefaultExtraFieldsController', 'class', 'sites/all/modules/entity/entity.info.inc', 'entity', 0),
('EntityDefaultFeaturesController', 'class', 'sites/all/modules/entity/entity.features.inc', 'entity', 0),
('EntityDefaultI18nStringController', 'class', 'sites/all/modules/entity/entity.i18n.inc', 'entity', 0),
('EntityDefaultMetadataController', 'class', 'sites/all/modules/entity/entity.info.inc', 'entity', 0),
('EntityDefaultRulesController', 'class', 'sites/all/modules/entity/entity.rules.inc', 'entity', 0),
('EntityDefaultUIController', 'class', 'sites/all/modules/entity/includes/entity.ui.inc', 'entity', 0),
('EntityDefaultViewsController', 'class', 'sites/all/modules/entity/views/entity.views.inc', 'entity', 0),
('EntityDrupalWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityExtendable', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0),
('EntityExtraFieldsControllerInterface', 'interface', 'sites/all/modules/entity/entity.info.inc', 'entity', 0),
('EntityFieldHandlerHelper', 'class', 'sites/all/modules/entity/views/handlers/entity_views_field_handler_helper.inc', 'entity', 0),
('EntityFieldQuery', 'class', 'includes/entity.inc', '', 0),
('EntityFieldQueryException', 'class', 'includes/entity.inc', '', 0),
('EntityInterface', 'interface', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0),
('EntityListWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityMalformedException', 'class', 'includes/entity.inc', '', 0),
('EntityMetadataArrayObject', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityMetadataIntegrationTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityMetadataNodeAccessTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityMetadataNodeCreateAccessTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityMetadataNodeRevisionAccessTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityMetadataTaxonomyAccessTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityMetadataTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityMetadataWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityMetadataWrapperException', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityMetadataWrapperIterator', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityPropertiesTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('EntityStructureWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityTokenTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('EntityValueWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0),
('EntityWebTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0),
('entity_views_handler_area_entity', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_area_entity.inc', 'entity', 0),
('entity_views_handler_field_boolean', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_boolean.inc', 'entity', 0),
('entity_views_handler_field_date', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_date.inc', 'entity', 0),
('entity_views_handler_field_duration', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_duration.inc', 'entity', 0),
('entity_views_handler_field_entity', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_entity.inc', 'entity', 0),
('entity_views_handler_field_field', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_field.inc', 'entity', 0),
('entity_views_handler_field_numeric', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_numeric.inc', 'entity', 0),
('entity_views_handler_field_options', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_options.inc', 'entity', 0),
('entity_views_handler_field_text', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_text.inc', 'entity', 0),
('entity_views_handler_field_uri', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_uri.inc', 'entity', 0),
('entity_views_handler_relationship', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_relationship.inc', 'entity', 0),
('entity_views_handler_relationship_by_bundle', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc', 'entity', 0),
('entity_views_plugin_row_entity_view', 'class', 'sites/all/modules/entity/views/plugins/entity_views_plugin_row_entity_view.inc', 'entity', 0),
('FieldAttachOtherTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldAttachStorageTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldAttachTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldBulkDeleteTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldDisplayAPITestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldException', 'class', 'modules/field/field.module', 'field', 0),
('FieldFormTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldInfo', 'class', 'modules/field/field.info.class.inc', 'field', 0),
('FieldInfoTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldInstanceCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldsOverlapException', 'class', 'includes/database/database.inc', '', 0),
('FieldSqlStorageTestCase', 'class', 'modules/field/modules/field_sql_storage/field_sql_storage.test', 'field_sql_storage', 0),
('FieldTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldTranslationsTestCase', 'class', 'modules/field/tests/field.test', 'field', 0),
('FieldUIAlterTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUIManageDisplayTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUIManageFieldsTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUITestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0),
('FieldUpdateForbiddenException', 'class', 'modules/field/field.module', 'field', 0),
('FieldValidationException', 'class', 'modules/field/field.attach.inc', 'field', 0),
('FileFieldAnonymousSubmission', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldDisplayTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldPathTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldRevisionTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldValidateTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileFieldWidgetTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileManagedFileElementTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FilePrivateTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileTaxonomyTermTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileTokenReplaceTestCase', 'class', 'modules/file/tests/file.test', 'file', 0),
('FileTransfer', 'class', 'includes/filetransfer/filetransfer.inc', '', 0),
('FileTransferChmodInterface', 'interface', 'includes/filetransfer/filetransfer.inc', '', 0),
('FileTransferException', 'class', 'includes/filetransfer/filetransfer.inc', '', 0),
('FileTransferFTP', 'class', 'includes/filetransfer/ftp.inc', '', 0),
('FileTransferFTPExtension', 'class', 'includes/filetransfer/ftp.inc', '', 0),
('FileTransferLocal', 'class', 'includes/filetransfer/local.inc', '', 0),
('FileTransferSSH', 'class', 'includes/filetransfer/ssh.inc', '', 0),
('FilterAdminTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterCRUDTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterDefaultFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterDOMSerializeTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterFormatAccessTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterHooksTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterNoFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterSecurityTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterSettingsTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FilterUnitTestCase', 'class', 'modules/filter/filter.test', 'filter', 0),
('FlexsliderTestCase', 'class', 'sites/all/modules/flexslider/flexslider.test', 'flexslider', 0),
('flexslider_views_plugin_style_flexslider', 'class', 'sites/all/modules/flexslider/flexslider_views/flexslider_views_plugin_style_flexslider.inc', 'flexslider_views', 0),
('FloodFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('FrontPageTestCase', 'class', 'modules/system/system.test', 'system', 0),
('HelpTestCase', 'class', 'modules/help/help.test', 'help', 0),
('HookRequirementsTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ImageAdminStylesUnitTest', 'class', 'modules/image/image.test', 'image', 0),
('ImageAdminUiTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageDimensionsScaleTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageDimensionsTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageEffectsUnitTest', 'class', 'modules/image/image.test', 'image', 0),
('ImageFieldDefaultImagesTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageFieldDisplayTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageFieldTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageFieldValidateTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageStyleFlushTest', 'class', 'modules/image/image.test', 'image', 0),
('ImageStylesPathAndUrlTestCase', 'class', 'modules/image/image.test', 'image', 0),
('ImageThemeFunctionWebTestCase', 'class', 'modules/image/image.test', 'image', 0),
('InfoFileParserTestCase', 'class', 'modules/system/system.test', 'system', 0),
('InsertQuery', 'class', 'includes/database/query.inc', '', 0),
('InsertQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', 0),
('InsertQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', 0),
('InsertQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('InvalidMergeQueryException', 'class', 'includes/database/database.inc', '', 0),
('IPAddressBlockingTestCase', 'class', 'modules/system/system.test', 'system', 0),
('LibrariesAdminWebTest', 'class', 'sites/all/modules/libraries/tests/LibrariesAdminWebTest.test', 'libraries', 0),
('LibrariesLoadWebTest', 'class', 'sites/all/modules/libraries/tests/LibrariesLoadWebTest.test', 'libraries', 0),
('LibrariesUnitTest', 'class', 'sites/all/modules/libraries/tests/LibrariesUnitTest.test', 'libraries', 0),
('LibrariesWebTestBase', 'class', 'sites/all/modules/libraries/tests/LibrariesWebTestBase.test', 'libraries', 0),
('ListDynamicValuesTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('ListDynamicValuesValidationTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('ListFieldTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('ListFieldUITestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0),
('MailSystemInterface', 'interface', 'includes/mail.inc', '', 0),
('MemoryQueue', 'class', 'modules/system/system.queue.inc', 'system', 0),
('MenuNodeTestCase', 'class', 'modules/menu/menu.test', 'menu', 0),
('MenuTestCase', 'class', 'modules/menu/menu.test', 'menu', 0),
('MergeQuery', 'class', 'includes/database/query.inc', '', 0),
('Mimeparse', 'class', 'sites/all/modules/services/servers/rest_server/lib/mimeparse.php', 'rest_server', 0),
('MockRESTServer', 'class', 'sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'rest_server', 0),
('MockServicesContext', 'class', 'sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'rest_server', 0),
('MockServicesRESTServerFactory', 'class', 'sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'rest_server', 0),
('ModuleDependencyTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ModuleRequiredTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ModuleTestCase', 'class', 'modules/system/system.test', 'system', 0),
('ModuleUpdater', 'class', 'modules/system/system.updater.inc', 'system', 0),
('ModuleVersionTestCase', 'class', 'modules/system/system.test', 'system', 0),
('MultiStepNodeFormBasicOptionsTest', 'class', 'modules/node/node.test', 'node', 0),
('NewDefaultThemeBlocks', 'class', 'modules/block/block.test', 'block', 0),
('NoAuthEndpointTestRunner', 'class', 'sites/all/modules/services/tests/functional/NoAuthEndpointTestRunner.test', 'services', 0),
('NodeAccessBaseTableTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessFieldTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessPagerTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessRebuildTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessRecordsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAccessTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeAdminTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeBlockFunctionalTest', 'class', 'modules/node/node.test', 'node', 0),
('NodeBlockTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeBuildContent', 'class', 'modules/node/node.test', 'node', 0),
('NodeController', 'class', 'modules/node/node.module', 'node', 0),
('NodeCreationTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeEntityFieldQueryAlter', 'class', 'modules/node/node.test', 'node', 0),
('NodeEntityViewModeAlterTest', 'class', 'modules/node/node.test', 'node', 0),
('NodeFeedTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeLoadHooksTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeLoadMultipleTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeMultiByteUtf8Test', 'class', 'modules/node/node.test', 'node', 0),
('NodePageCacheTest', 'class', 'modules/node/node.test', 'node', 0),
('NodePostSettingsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeQueryAlter', 'class', 'modules/node/node.test', 'node', 0),
('NodeRevisionPermissionsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeRevisionsTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeRSSContentTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeSaveTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTitleTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTitleXSSTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTokenReplaceTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTypePersistenceTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeTypeTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NodeWebTestCase', 'class', 'modules/node/node.test', 'node', 0),
('NoFieldsException', 'class', 'includes/database/database.inc', '', 0),
('NoHelpTestCase', 'class', 'modules/help/help.test', 'help', 0),
('NonDefaultBlockAdmin', 'class', 'modules/block/block.test', 'block', 0),
('NumberFieldTestCase', 'class', 'modules/field/modules/number/number.test', 'number', 0),
('OptionsSelectDynamicValuesTestCase', 'class', 'modules/field/modules/options/options.test', 'options', 0),
('OptionsWidgetsTestCase', 'class', 'modules/field/modules/options/options.test', 'options', 0),
('PageEditTestCase', 'class', 'modules/node/node.test', 'node', 0),
('PageNotFoundTestCase', 'class', 'modules/system/system.test', 'system', 0),
('PagePreviewTestCase', 'class', 'modules/node/node.test', 'node', 0),
('PagerDefault', 'class', 'includes/pager.inc', '', 0),
('PageTitleFiltering', 'class', 'modules/system/system.test', 'system', 0),
('PageViewTestCase', 'class', 'modules/node/node.test', 'node', 0),
('PathautoBulkUpdateTestCase', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathautoFunctionalTestCase', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathautoFunctionalTestHelper', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathautoLocaleTestCase', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathautoMigrationHandler', 'class', 'sites/all/modules/pathauto/pathauto.migrate.inc', 'pathauto', 0),
('PathautoTestHelper', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathautoTokenTestCase', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathautoUnitTestCase', 'class', 'sites/all/modules/pathauto/pathauto.test', 'pathauto', 0),
('PathLanguageTestCase', 'class', 'modules/path/path.test', 'path', 0),
('PathLanguageUITestCase', 'class', 'modules/path/path.test', 'path', 0),
('PathMonolingualTestCase', 'class', 'modules/path/path.test', 'path', 0),
('PathTaxonomyTermTestCase', 'class', 'modules/path/path.test', 'path', 0),
('PathTestCase', 'class', 'modules/path/path.test', 'path', 0),
('PHPAccessTestCase', 'class', 'modules/php/php.test', 'php', 0),
('PHPFilterTestCase', 'class', 'modules/php/php.test', 'php', 0),
('PHPTestCase', 'class', 'modules/php/php.test', 'php', 0),
('Query', 'class', 'includes/database/query.inc', '', 0),
('QueryAlterableInterface', 'interface', 'includes/database/query.inc', '', 0),
('QueryConditionInterface', 'interface', 'includes/database/query.inc', '', 0),
('QueryExtendableInterface', 'interface', 'includes/database/select.inc', '', 0),
('QueryPlaceholderInterface', 'interface', 'includes/database/query.inc', '', 0),
('QueueTestCase', 'class', 'modules/system/system.test', 'system', 0),
('RdfCommentAttributesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RdfCrudTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RdfGetRdfNamespacesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RdfMappingDefinitionTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RdfMappingHookTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RdfRdfaMarkupTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RdfTrackerAttributesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0),
('RESTServer', 'class', 'sites/all/modules/services/servers/rest_server/includes/RESTServer.inc', 'rest_server', 0),
('RestWSBasicAuthTestCase', 'class', 'sites/all/modules/restws/restws_basic_auth/restws_basic_auth.test', 'restws_basic_auth', 0),
('RetrieveFileTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SchemaCache', 'class', 'includes/bootstrap.inc', '', 0),
('SearchAdvancedSearchForm', 'class', 'modules/search/search.test', 'search', 0),
('SearchBlockTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchCommentCountToggleTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchCommentTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchConfigSettingsForm', 'class', 'modules/search/search.test', 'search', 0),
('SearchEmbedForm', 'class', 'modules/search/search.test', 'search', 0),
('SearchExactTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchExcerptTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchExpressionInsertExtractTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchKeywordsConditions', 'class', 'modules/search/search.test', 'search', 0),
('SearchLanguageTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchMatchTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchNodeAccessTest', 'class', 'modules/search/search.test', 'search', 0),
('SearchNodeTagTest', 'class', 'modules/search/search.test', 'search', 0),
('SearchNumberMatchingTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchNumbersTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchPageOverride', 'class', 'modules/search/search.test', 'search', 0),
('SearchPageText', 'class', 'modules/search/search.test', 'search', 0),
('SearchQuery', 'class', 'modules/search/search.extender.inc', 'search', 0),
('SearchRankingTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchSetLocaleTest', 'class', 'modules/search/search.test', 'search', 0),
('SearchSimplifyTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SearchTokenizerTestCase', 'class', 'modules/search/search.test', 'search', 0),
('SelectQuery', 'class', 'includes/database/select.inc', '', 0),
('SelectQueryExtender', 'class', 'includes/database/select.inc', '', 0),
('SelectQueryInterface', 'interface', 'includes/database/select.inc', '', 0),
('SelectQuery_pgsql', 'class', 'includes/database/pgsql/select.inc', '', 0),
('SelectQuery_sqlite', 'class', 'includes/database/sqlite/select.inc', '', 0),
('ServicesAliasTests', 'class', 'sites/all/modules/services/tests/functional/ServicesAliasTests.test', 'services', 0),
('ServicesArgumentException', 'class', 'sites/all/modules/services/includes/services.runtime.inc', 'services', 0),
('ServicesArgumentsTestCase', 'class', 'sites/all/modules/services/tests/functional/ServicesArgumentsTests.test', 'services', 0),
('ServicesBencodeFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('ServicesContentTypeNegotiator', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesContentTypeNegotiator.inc', 'rest_server', 0),
('ServicesContentTypeNegotiatorInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesContentTypeNegotiator.inc', 'rest_server', 0),
('ServicesContext', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesContext.inc', 'rest_server', 0),
('ServicesContextInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesContext.inc', 'rest_server', 0),
('ServicesEndpointTests', 'class', 'sites/all/modules/services/tests/functional/ServicesEndpointTests.test', 'services', 0),
('ServicesException', 'class', 'sites/all/modules/services/includes/services.runtime.inc', 'services', 0),
('ServicesFormatterInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('ServicesJSONFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('ServicesJSONPFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('ServicesParserFile', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserJSON', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserMultipart', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserPHP', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserTests', 'class', 'sites/all/modules/services/tests/functional/ServicesParserTests.test', 'services', 0),
('ServicesParserURLEncoded', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserXML', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesParserYAML', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0),
('ServicesPHPFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('ServicesResourceCommentTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceCommentTests.test', 'services', 0),
('ServicesResourceDisabledTest', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceDisabledTests.test', 'services', 0),
('ServicesResourceFileTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceFileTests.test', 'services', 0),
('ServicesResourceNodeTaxonomytests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceNodeTests.test', 'services', 0),
('ServicesResourceNodetests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceNodeTests.test', 'services', 0),
('ServicesResourceSystemTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceSystemTests.test', 'services', 0),
('ServicesResourceTaxonomyTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceTaxonomyTests.test', 'services', 0),
('ServicesResourceUsertests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceUserTests.test', 'services', 0),
('ServicesRESTServerFactory', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesRESTServerFactory.inc', 'rest_server', 0),
('ServicesRESTServerTests', 'class', 'sites/all/modules/services/servers/rest_server/tests/ServicesRESTServerTests.test', 'rest_server', 0),
('ServicesSecurityTests', 'class', 'sites/all/modules/services/tests/functional/ServicesSecurityTests.test', 'services', 0),
('ServicesSpycLibraryTests', 'class', 'sites/all/modules/services/tests/unit/ServicesSpycLibraryTests.test', 'services', 0),
('ServicesUITest', 'class', 'sites/all/modules/services/tests/ui/ServicesUITests.test', 'services', 0),
('ServicesVersionTests', 'class', 'sites/all/modules/services/tests/functional/ServicesVersionTests.test', 'services', 0),
('ServicesWebTestCase', 'class', 'sites/all/modules/services/tests/services.test', 'services', 0),
('ServicesXMLFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('ServicesXMLRPCTestCase', 'class', 'sites/all/modules/services/tests/functional/ServicesXMLRPCTests.test', 'services', 0),
('ServicesYAMLFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0),
('services_ctools_export_ui', 'class', 'sites/all/modules/services/plugins/export_ui/services_ctools_export_ui.class.php', 'services', 0),
('ShortcutLinksTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', 0),
('ShortcutSetsTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', 0),
('ShortcutTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', 0),
('ShutdownFunctionsTest', 'class', 'modules/system/system.test', 'system', 0),
('SiteMaintenanceTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SkipDotsRecursiveDirectoryIterator', 'class', 'includes/filetransfer/filetransfer.inc', '', 0),
('StreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', 0),
('SummaryLengthTestCase', 'class', 'modules/node/node.test', 'node', 0),
('SystemAdminTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemAuthorizeCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemBlockTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemIndexPhpTest', 'class', 'modules/system/system.test', 'system', 0),
('SystemInfoAlterTestCase', 'class', 'modules/system/system.test', 'system', 0),
('SystemMainContentFallback', 'class', 'modules/system/system.test', 'system', 0),
('SystemQueue', 'class', 'modules/system/system.queue.inc', 'system', 0),
('SystemThemeFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('SystemValidTokenTest', 'class', 'modules/system/system.test', 'system', 0),
('TableSort', 'class', 'includes/tablesort.inc', '', 0),
('TaxonomyEFQTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyHooksTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyLegacyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyLoadMultipleTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyQueryAlterTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyRSSTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', 0),
('TaxonomyTermFieldMultipleVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermFieldTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermFunctionTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermIndexTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTermTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyThemeTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyTokenReplaceTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyVocabularyController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', 0),
('TaxonomyVocabularyFunctionalTest', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TaxonomyWebTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0),
('TestingMailSystem', 'class', 'modules/system/system.mail.inc', 'system', 0),
('TextFieldTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0),
('TextSummaryTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0),
('TextTranslationTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0),
('ThemeRegistry', 'class', 'includes/theme.inc', '', 0),
('ThemeUpdater', 'class', 'modules/system/system.updater.inc', 'system', 0),
('TokenArrayTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenBlockTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenCommentTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenCurrentPageTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenDateTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenEntityTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenFileTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenMenuTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenNodeTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenProfileTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenRandomTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenReplaceTestCase', 'class', 'modules/system/system.test', 'system', 0),
('TokenScanTest', 'class', 'modules/system/system.test', 'system', 0),
('TokenTaxonomyTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenTestHelper', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenUnitTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenURLTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TokenUserTestCase', 'class', 'sites/all/modules/token/token.test', 'token', 0),
('TruncateQuery', 'class', 'includes/database/query.inc', '', 0),
('TruncateQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', 0),
('TruncateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('UpdateCoreTestCase', 'class', 'modules/update/update.test', 'update', 0),
('UpdateCoreUnitTestCase', 'class', 'modules/update/update.test', 'update', 0),
('UpdateQuery', 'class', 'includes/database/query.inc', '', 0),
('UpdateQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', 0),
('UpdateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0),
('Updater', 'class', 'includes/updater.inc', '', 0),
('UpdaterException', 'class', 'includes/updater.inc', '', 0),
('UpdaterFileTransferException', 'class', 'includes/updater.inc', '', 0),
('UpdateScriptFunctionalTest', 'class', 'modules/system/system.test', 'system', 0),
('UpdateTestContribCase', 'class', 'modules/update/update.test', 'update', 0),
('UpdateTestHelper', 'class', 'modules/update/update.test', 'update', 0),
('UpdateTestUploadCase', 'class', 'modules/update/update.test', 'update', 0),
('UserAccountLinksUnitTests', 'class', 'modules/user/user.test', 'user', 0),
('UserAdminTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserAuthmapAssignmentTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserAutocompleteTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserBlocksUnitTests', 'class', 'modules/user/user.test', 'user', 0),
('UserCancelTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserController', 'class', 'modules/user/user.module', 'user', 0),
('UserCreateTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserEditedOwnAccountTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserEditRebuildTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserEditTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserLoginTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserPasswordResetTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserPermissionsTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserPictureTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserRegistrationTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserRoleAdminTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserRolesAssignmentTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserSaveTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserSignatureTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserTimeZoneFunctionalTest', 'class', 'modules/user/user.test', 'user', 0),
('UserTokenReplaceTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserUserSearchTestCase', 'class', 'modules/user/user.test', 'user', 0),
('UserValidateCurrentPassCustomForm', 'class', 'modules/user/user.test', 'user', 0),
('UserValidationTestCase', 'class', 'modules/user/user.test', 'user', 0),
('view', 'class', 'sites/all/modules/views/includes/view.inc', 'views', 0),
('ViewsAccessTest', 'class', 'sites/all/modules/views/tests/views_access.test', 'views', 0),
('ViewsAjaxTest', 'class', 'sites/all/modules/views/tests/views_ajax.test', 'views', 0),
('ViewsAnalyzeTest', 'class', 'sites/all/modules/views/tests/views_analyze.test', 'views', 0),
('ViewsArgumentDefaultTest', 'class', 'sites/all/modules/views/tests/views_argument_default.test', 'views', 0),
('ViewsArgumentValidatorTest', 'class', 'sites/all/modules/views/tests/views_argument_validator.test', 'views', 0),
('ViewsBasicTest', 'class', 'sites/all/modules/views/tests/views_basic.test', 'views', 0),
('ViewsCacheTest', 'class', 'sites/all/modules/views/tests/views_cache.test', 'views', 0),
('ViewsExposedFormTest', 'class', 'sites/all/modules/views/tests/views_exposed_form.test', 'views', 0),
('viewsFieldApiDataTest', 'class', 'sites/all/modules/views/tests/field/views_fieldapi.test', 'views', 0),
('ViewsFieldApiTestHelper', 'class', 'sites/all/modules/views/tests/field/views_fieldapi.test', 'views', 0),
('ViewsGlossaryTestCase', 'class', 'sites/all/modules/views/tests/views_glossary.test', 'views', 0),
('ViewsHandlerAreaTextTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_area_text.test', 'views', 0),
('viewsHandlerArgumentCommentUserUidTest', 'class', 'sites/all/modules/views/tests/comment/views_handler_argument_comment_user_uid.test', 'views', 0),
('ViewsHandlerArgumentNullTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_argument_null.test', 'views', 0),
('ViewsHandlerArgumentStringTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_argument_string.test', 'views', 0),
('ViewsHandlerFieldBooleanTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_boolean.test', 'views', 0),
('ViewsHandlerFieldCustomTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_custom.test', 'views', 0),
('ViewsHandlerFieldDateTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_date.test', 'views', 0),
('viewsHandlerFieldFieldTest', 'class', 'sites/all/modules/views/tests/field/views_fieldapi.test', 'views', 0),
('ViewsHandlerFieldMath', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_math.test', 'views', 0),
('ViewsHandlerFieldTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field.test', 'views', 0),
('ViewsHandlerFieldUrlTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_url.test', 'views', 0),
('viewsHandlerFieldUserNameTest', 'class', 'sites/all/modules/views/tests/user/views_handler_field_user_name.test', 'views', 0),
('ViewsHandlerFileExtensionTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_file_extension.test', 'views', 0),
('ViewsHandlerFilterCombineTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_combine.test', 'views', 0),
('viewsHandlerFilterCommentUserUidTest', 'class', 'sites/all/modules/views/tests/comment/views_handler_filter_comment_user_uid.test', 'views', 0),
('ViewsHandlerFilterCounterTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_counter.test', 'views', 0),
('ViewsHandlerFilterDateTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_date.test', 'views', 0),
('ViewsHandlerFilterEqualityTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_equality.test', 'views', 0),
('ViewsHandlerFilterInOperator', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_in_operator.test', 'views', 0),
('ViewsHandlerFilterNumericTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_numeric.test', 'views', 0),
('ViewsHandlerFilterStringTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_string.test', 'views', 0),
('ViewsHandlerRelationshipNodeTermDataTest', 'class', 'sites/all/modules/views/tests/taxonomy/views_handler_relationship_node_term_data.test', 'views', 0),
('ViewsHandlerSortDateTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_sort_date.test', 'views', 0),
('ViewsHandlerSortRandomTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_sort_random.test', 'views', 0),
('ViewsHandlerSortTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_sort.test', 'views', 0),
('ViewsHandlersTest', 'class', 'sites/all/modules/views/tests/views_handlers.test', 'views', 0);
INSERT INTO `registry` (`name`, `type`, `filename`, `module`, `weight`) VALUES
('ViewsHandlerTest', 'class', 'sites/all/modules/views/tests/handlers/views_handlers.test', 'views', 0),
('ViewsHandlerTestFileSize', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_file_size.test', 'views', 0),
('ViewsHandlerTestXss', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_xss.test', 'views', 0),
('ViewsModuleTest', 'class', 'sites/all/modules/views/tests/views_module.test', 'views', 0),
('ViewsNodeRevisionRelationsTestCase', 'class', 'sites/all/modules/views/tests/node/views_node_revision_relations.test', 'views', 0),
('ViewsPagerTest', 'class', 'sites/all/modules/views/tests/views_pager.test', 'views', 0),
('ViewsPluginDisplayTestCase', 'class', 'sites/all/modules/views/tests/plugins/views_plugin_display.test', 'views', 0),
('viewsPluginStyleJumpMenuTest', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_jump_menu.test', 'views', 0),
('ViewsPluginStyleMappingTest', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_mapping.test', 'views', 0),
('ViewsPluginStyleTestBase', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_base.test', 'views', 0),
('ViewsPluginStyleTestCase', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style.test', 'views', 0),
('ViewsPluginStyleUnformattedTestCase', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_unformatted.test', 'views', 0),
('ViewsQueryGroupByTest', 'class', 'sites/all/modules/views/tests/views_groupby.test', 'views', 0),
('viewsSearchQuery', 'class', 'sites/all/modules/views/modules/search/views_handler_filter_search.inc', 'views', 0),
('ViewsSqlTest', 'class', 'sites/all/modules/views/tests/views_query.test', 'views', 0),
('ViewsTestCase', 'class', 'sites/all/modules/views/tests/views_query.test', 'views', 0),
('ViewsTranslatableTest', 'class', 'sites/all/modules/views/tests/views_translatable.test', 'views', 0),
('ViewsUiBaseViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', 0),
('ViewsUiCommentViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_comment_views_wizard.class.php', 'views_ui', 0),
('ViewsUiFileManagedViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_file_managed_views_wizard.class.php', 'views_ui', 0),
('viewsUiGroupbyTestCase', 'class', 'sites/all/modules/views/tests/views_groupby.test', 'views', 0),
('ViewsUiNodeRevisionViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_node_revision_views_wizard.class.php', 'views_ui', 0),
('ViewsUiNodeViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_node_views_wizard.class.php', 'views_ui', 0),
('ViewsUiTaxonomyTermViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_taxonomy_term_views_wizard.class.php', 'views_ui', 0),
('ViewsUiUsersViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_users_views_wizard.class.php', 'views_ui', 0),
('ViewsUIWizardBasicTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardDefaultViewsTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardHelper', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardItemsPerPageTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardJumpMenuTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardMenuTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardOverrideDisplaysTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardSortingTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUIWizardTaggedWithTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0),
('ViewsUpgradeTestCase', 'class', 'sites/all/modules/views/tests/views_upgrade.test', 'views', 0),
('ViewsUserArgumentDefault', 'class', 'sites/all/modules/views/tests/user/views_user_argument_default.test', 'views', 0),
('ViewsUserArgumentValidate', 'class', 'sites/all/modules/views/tests/user/views_user_argument_validate.test', 'views', 0),
('ViewsUserTestCase', 'class', 'sites/all/modules/views/tests/user/views_user.test', 'views', 0),
('ViewsViewTest', 'class', 'sites/all/modules/views/tests/views_view.test', 'views', 0),
('ViewsWizardException', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', 0),
('ViewsWizardInterface', 'interface', 'sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', 0),
('views_db_object', 'class', 'sites/all/modules/views/includes/view.inc', 'views', 0),
('views_display', 'class', 'sites/all/modules/views/includes/view.inc', 'views', 0),
('views_handler', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0),
('views_handler_area', 'class', 'sites/all/modules/views/handlers/views_handler_area.inc', 'views', 0),
('views_handler_area_broken', 'class', 'sites/all/modules/views/handlers/views_handler_area.inc', 'views', 0),
('views_handler_area_messages', 'class', 'sites/all/modules/views/handlers/views_handler_area_messages.inc', 'views', 0),
('views_handler_area_result', 'class', 'sites/all/modules/views/handlers/views_handler_area_result.inc', 'views', 0),
('views_handler_area_text', 'class', 'sites/all/modules/views/handlers/views_handler_area_text.inc', 'views', 0),
('views_handler_area_text_custom', 'class', 'sites/all/modules/views/handlers/views_handler_area_text_custom.inc', 'views', 0),
('views_handler_area_view', 'class', 'sites/all/modules/views/handlers/views_handler_area_view.inc', 'views', 0),
('views_handler_argument', 'class', 'sites/all/modules/views/handlers/views_handler_argument.inc', 'views', 0),
('views_handler_argument_aggregator_category_cid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_category_cid.inc', 'views', 0),
('views_handler_argument_aggregator_fid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_fid.inc', 'views', 0),
('views_handler_argument_aggregator_iid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_iid.inc', 'views', 0),
('views_handler_argument_broken', 'class', 'sites/all/modules/views/handlers/views_handler_argument.inc', 'views', 0),
('views_handler_argument_comment_user_uid', 'class', 'sites/all/modules/views/modules/comment/views_handler_argument_comment_user_uid.inc', 'views', 0),
('views_handler_argument_date', 'class', 'sites/all/modules/views/handlers/views_handler_argument_date.inc', 'views', 0),
('views_handler_argument_field_list', 'class', 'sites/all/modules/views/modules/field/views_handler_argument_field_list.inc', 'views', 0),
('views_handler_argument_field_list_string', 'class', 'sites/all/modules/views/modules/field/views_handler_argument_field_list_string.inc', 'views', 0),
('views_handler_argument_file_fid', 'class', 'sites/all/modules/views/modules/system/views_handler_argument_file_fid.inc', 'views', 0),
('views_handler_argument_formula', 'class', 'sites/all/modules/views/handlers/views_handler_argument_formula.inc', 'views', 0),
('views_handler_argument_group_by_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_argument_group_by_numeric.inc', 'views', 0),
('views_handler_argument_locale_group', 'class', 'sites/all/modules/views/modules/locale/views_handler_argument_locale_group.inc', 'views', 0),
('views_handler_argument_locale_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_argument_locale_language.inc', 'views', 0),
('views_handler_argument_many_to_one', 'class', 'sites/all/modules/views/handlers/views_handler_argument_many_to_one.inc', 'views', 0),
('views_handler_argument_node_created_day', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0),
('views_handler_argument_node_created_fulldate', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0),
('views_handler_argument_node_created_month', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0),
('views_handler_argument_node_created_week', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0),
('views_handler_argument_node_created_year', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0),
('views_handler_argument_node_created_year_month', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0),
('views_handler_argument_node_language', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_language.inc', 'views', 0),
('views_handler_argument_node_nid', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_nid.inc', 'views', 0),
('views_handler_argument_node_tnid', 'class', 'sites/all/modules/views/modules/translation/views_handler_argument_node_tnid.inc', 'views', 0),
('views_handler_argument_node_type', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_type.inc', 'views', 0),
('views_handler_argument_node_uid_revision', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_uid_revision.inc', 'views', 0),
('views_handler_argument_node_vid', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_vid.inc', 'views', 0),
('views_handler_argument_null', 'class', 'sites/all/modules/views/handlers/views_handler_argument_null.inc', 'views', 0),
('views_handler_argument_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_argument_numeric.inc', 'views', 0),
('views_handler_argument_search', 'class', 'sites/all/modules/views/modules/search/views_handler_argument_search.inc', 'views', 0),
('views_handler_argument_string', 'class', 'sites/all/modules/views/handlers/views_handler_argument_string.inc', 'views', 0),
('views_handler_argument_taxonomy', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_taxonomy.inc', 'views', 0),
('views_handler_argument_term_node_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid.inc', 'views', 0),
('views_handler_argument_term_node_tid_depth', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth.inc', 'views', 0),
('views_handler_argument_term_node_tid_depth_join', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_join.inc', 'views', 0),
('views_handler_argument_term_node_tid_depth_modifier', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc', 'views', 0),
('views_handler_argument_tracker_comment_user_uid', 'class', 'sites/all/modules/views/modules/tracker/views_handler_argument_tracker_comment_user_uid.inc', 'views', 0),
('views_handler_argument_users_roles_rid', 'class', 'sites/all/modules/views/modules/user/views_handler_argument_users_roles_rid.inc', 'views', 0),
('views_handler_argument_user_uid', 'class', 'sites/all/modules/views/modules/user/views_handler_argument_user_uid.inc', 'views', 0),
('views_handler_argument_vocabulary_machine_name', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc', 'views', 0),
('views_handler_argument_vocabulary_vid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_vid.inc', 'views', 0),
('views_handler_field', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0),
('views_handler_field_accesslog_path', 'class', 'sites/all/modules/views/modules/statistics/views_handler_field_accesslog_path.inc', 'views', 0),
('views_handler_field_aggregator_category', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_category.inc', 'views', 0),
('views_handler_field_aggregator_title_link', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_title_link.inc', 'views', 0),
('views_handler_field_aggregator_xss', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_xss.inc', 'views', 0),
('views_handler_field_boolean', 'class', 'sites/all/modules/views/handlers/views_handler_field_boolean.inc', 'views', 0),
('views_handler_field_broken', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0),
('views_handler_field_comment', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment.inc', 'views', 0),
('views_handler_field_comment_depth', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_depth.inc', 'views', 0),
('views_handler_field_comment_link', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link.inc', 'views', 0),
('views_handler_field_comment_link_approve', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_approve.inc', 'views', 0),
('views_handler_field_comment_link_delete', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_delete.inc', 'views', 0),
('views_handler_field_comment_link_edit', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_edit.inc', 'views', 0),
('views_handler_field_comment_link_reply', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_reply.inc', 'views', 0),
('views_handler_field_comment_node_link', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_node_link.inc', 'views', 0),
('views_handler_field_comment_username', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_username.inc', 'views', 0),
('views_handler_field_contact_link', 'class', 'sites/all/modules/views/modules/contact/views_handler_field_contact_link.inc', 'views', 0),
('views_handler_field_contextual_links', 'class', 'sites/all/modules/views/handlers/views_handler_field_contextual_links.inc', 'views', 0),
('views_handler_field_counter', 'class', 'sites/all/modules/views/handlers/views_handler_field_counter.inc', 'views', 0),
('views_handler_field_ctools_dropdown', 'class', 'sites/all/modules/views/handlers/views_handler_field_ctools_dropdown.inc', 'views', 0),
('views_handler_field_custom', 'class', 'sites/all/modules/views/handlers/views_handler_field_custom.inc', 'views', 0),
('views_handler_field_date', 'class', 'sites/all/modules/views/handlers/views_handler_field_date.inc', 'views', 0),
('views_handler_field_entity', 'class', 'sites/all/modules/views/handlers/views_handler_field_entity.inc', 'views', 0),
('views_handler_field_field', 'class', 'sites/all/modules/views/modules/field/views_handler_field_field.inc', 'views', 0),
('views_handler_field_file', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file.inc', 'views', 0),
('views_handler_field_file_extension', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_extension.inc', 'views', 0),
('views_handler_field_file_filemime', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_filemime.inc', 'views', 0),
('views_handler_field_file_size', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0),
('views_handler_field_file_status', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_status.inc', 'views', 0),
('views_handler_field_file_uri', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_uri.inc', 'views', 0),
('views_handler_field_filter_format_name', 'class', 'sites/all/modules/views/modules/filter/views_handler_field_filter_format_name.inc', 'views', 0),
('views_handler_field_history_user_timestamp', 'class', 'sites/all/modules/views/modules/node/views_handler_field_history_user_timestamp.inc', 'views', 0),
('views_handler_field_last_comment_timestamp', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_last_comment_timestamp.inc', 'views', 0),
('views_handler_field_links', 'class', 'sites/all/modules/views/handlers/views_handler_field_links.inc', 'views', 0),
('views_handler_field_locale_group', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_locale_group.inc', 'views', 0),
('views_handler_field_locale_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_locale_language.inc', 'views', 0),
('views_handler_field_locale_link_edit', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_locale_link_edit.inc', 'views', 0),
('views_handler_field_machine_name', 'class', 'sites/all/modules/views/handlers/views_handler_field_machine_name.inc', 'views', 0),
('views_handler_field_markup', 'class', 'sites/all/modules/views/handlers/views_handler_field_markup.inc', 'views', 0),
('views_handler_field_math', 'class', 'sites/all/modules/views/handlers/views_handler_field_math.inc', 'views', 0),
('views_handler_field_ncs_last_comment_name', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_ncs_last_comment_name.inc', 'views', 0),
('views_handler_field_ncs_last_updated', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_ncs_last_updated.inc', 'views', 0),
('views_handler_field_node', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node.inc', 'views', 0),
('views_handler_field_node_comment', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_node_comment.inc', 'views', 0),
('views_handler_field_node_counter_timestamp', 'class', 'sites/all/modules/views/modules/statistics/views_handler_field_node_counter_timestamp.inc', 'views', 0),
('views_handler_field_node_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_node_language.inc', 'views', 0),
('views_handler_field_node_link', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_link.inc', 'views', 0),
('views_handler_field_node_link_delete', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_link_delete.inc', 'views', 0),
('views_handler_field_node_link_edit', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_link_edit.inc', 'views', 0),
('views_handler_field_node_link_translate', 'class', 'sites/all/modules/views/modules/translation/views_handler_field_node_link_translate.inc', 'views', 0),
('views_handler_field_node_new_comments', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_node_new_comments.inc', 'views', 0),
('views_handler_field_node_path', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_path.inc', 'views', 0),
('views_handler_field_node_revision', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision.inc', 'views', 0),
('views_handler_field_node_revision_link', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision_link.inc', 'views', 0),
('views_handler_field_node_revision_link_delete', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision_link_delete.inc', 'views', 0),
('views_handler_field_node_revision_link_revert', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision_link_revert.inc', 'views', 0),
('views_handler_field_node_translation_link', 'class', 'sites/all/modules/views/modules/translation/views_handler_field_node_translation_link.inc', 'views', 0),
('views_handler_field_node_type', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_type.inc', 'views', 0),
('views_handler_field_node_version_count', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_version_count.inc', 'views', 0),
('views_handler_field_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_field_numeric.inc', 'views', 0),
('views_handler_field_prerender_list', 'class', 'sites/all/modules/views/handlers/views_handler_field_prerender_list.inc', 'views', 0),
('views_handler_field_profile_date', 'class', 'sites/all/modules/views/modules/profile/views_handler_field_profile_date.inc', 'views', 0),
('views_handler_field_profile_list', 'class', 'sites/all/modules/views/modules/profile/views_handler_field_profile_list.inc', 'views', 0),
('views_handler_field_search_score', 'class', 'sites/all/modules/views/modules/search/views_handler_field_search_score.inc', 'views', 0),
('views_handler_field_serialized', 'class', 'sites/all/modules/views/handlers/views_handler_field_serialized.inc', 'views', 0),
('views_handler_field_statistics_numeric', 'class', 'sites/all/modules/views/modules/statistics/views_handler_field_statistics_numeric.inc', 'views', 0),
('views_handler_field_taxonomy', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_field_taxonomy.inc', 'views', 0),
('views_handler_field_term_link_edit', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_field_term_link_edit.inc', 'views', 0),
('views_handler_field_term_node_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_field_term_node_tid.inc', 'views', 0),
('views_handler_field_time_interval', 'class', 'sites/all/modules/views/handlers/views_handler_field_time_interval.inc', 'views', 0),
('views_handler_field_url', 'class', 'sites/all/modules/views/handlers/views_handler_field_url.inc', 'views', 0),
('views_handler_field_user', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user.inc', 'views', 0),
('views_handler_field_user_language', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_language.inc', 'views', 0),
('views_handler_field_user_link', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_link.inc', 'views', 0),
('views_handler_field_user_link_cancel', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_link_cancel.inc', 'views', 0),
('views_handler_field_user_link_edit', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_link_edit.inc', 'views', 0),
('views_handler_field_user_mail', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_mail.inc', 'views', 0),
('views_handler_field_user_name', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_name.inc', 'views', 0),
('views_handler_field_user_permissions', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_permissions.inc', 'views', 0),
('views_handler_field_user_picture', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_picture.inc', 'views', 0),
('views_handler_field_user_roles', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_roles.inc', 'views', 0),
('views_handler_field_xss', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0),
('views_handler_filter', 'class', 'sites/all/modules/views/handlers/views_handler_filter.inc', 'views', 0),
('views_handler_filter_aggregator_category_cid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_filter_aggregator_category_cid.inc', 'views', 0),
('views_handler_filter_boolean_operator', 'class', 'sites/all/modules/views/handlers/views_handler_filter_boolean_operator.inc', 'views', 0),
('views_handler_filter_boolean_operator_string', 'class', 'sites/all/modules/views/handlers/views_handler_filter_boolean_operator_string.inc', 'views', 0),
('views_handler_filter_broken', 'class', 'sites/all/modules/views/handlers/views_handler_filter.inc', 'views', 0),
('views_handler_filter_combine', 'class', 'sites/all/modules/views/handlers/views_handler_filter_combine.inc', 'views', 0),
('views_handler_filter_comment_user_uid', 'class', 'sites/all/modules/views/modules/comment/views_handler_filter_comment_user_uid.inc', 'views', 0),
('views_handler_filter_date', 'class', 'sites/all/modules/views/handlers/views_handler_filter_date.inc', 'views', 0),
('views_handler_filter_entity_bundle', 'class', 'sites/all/modules/views/handlers/views_handler_filter_entity_bundle.inc', 'views', 0),
('views_handler_filter_equality', 'class', 'sites/all/modules/views/handlers/views_handler_filter_equality.inc', 'views', 0),
('views_handler_filter_fields_compare', 'class', 'sites/all/modules/views/handlers/views_handler_filter_fields_compare.inc', 'views', 0),
('views_handler_filter_field_list', 'class', 'sites/all/modules/views/modules/field/views_handler_filter_field_list.inc', 'views', 0),
('views_handler_filter_field_list_boolean', 'class', 'sites/all/modules/views/modules/field/views_handler_filter_field_list_boolean.inc', 'views', 0),
('views_handler_filter_file_status', 'class', 'sites/all/modules/views/modules/system/views_handler_filter_file_status.inc', 'views', 0),
('views_handler_filter_group_by_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_filter_group_by_numeric.inc', 'views', 0),
('views_handler_filter_history_user_timestamp', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_history_user_timestamp.inc', 'views', 0),
('views_handler_filter_in_operator', 'class', 'sites/all/modules/views/handlers/views_handler_filter_in_operator.inc', 'views', 0),
('views_handler_filter_locale_group', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_locale_group.inc', 'views', 0),
('views_handler_filter_locale_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_locale_language.inc', 'views', 0),
('views_handler_filter_locale_version', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_locale_version.inc', 'views', 0),
('views_handler_filter_many_to_one', 'class', 'sites/all/modules/views/handlers/views_handler_filter_many_to_one.inc', 'views', 0),
('views_handler_filter_ncs_last_updated', 'class', 'sites/all/modules/views/modules/comment/views_handler_filter_ncs_last_updated.inc', 'views', 0),
('views_handler_filter_node_access', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_access.inc', 'views', 0),
('views_handler_filter_node_comment', 'class', 'sites/all/modules/views/modules/comment/views_handler_filter_node_comment.inc', 'views', 0),
('views_handler_filter_node_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_node_language.inc', 'views', 0),
('views_handler_filter_node_status', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_status.inc', 'views', 0),
('views_handler_filter_node_tnid', 'class', 'sites/all/modules/views/modules/translation/views_handler_filter_node_tnid.inc', 'views', 0),
('views_handler_filter_node_tnid_child', 'class', 'sites/all/modules/views/modules/translation/views_handler_filter_node_tnid_child.inc', 'views', 0),
('views_handler_filter_node_type', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_type.inc', 'views', 0),
('views_handler_filter_node_uid_revision', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_uid_revision.inc', 'views', 0),
('views_handler_filter_node_version_count', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_version_count.inc', 'views', 0),
('views_handler_filter_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_filter_numeric.inc', 'views', 0),
('views_handler_filter_profile_selection', 'class', 'sites/all/modules/views/modules/profile/views_handler_filter_profile_selection.inc', 'views', 0),
('views_handler_filter_search', 'class', 'sites/all/modules/views/modules/search/views_handler_filter_search.inc', 'views', 0),
('views_handler_filter_string', 'class', 'sites/all/modules/views/handlers/views_handler_filter_string.inc', 'views', 0),
('views_handler_filter_system_type', 'class', 'sites/all/modules/views/modules/system/views_handler_filter_system_type.inc', 'views', 0),
('views_handler_filter_term_node_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid.inc', 'views', 0),
('views_handler_filter_term_node_tid_depth', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid_depth.inc', 'views', 0),
('views_handler_filter_term_node_tid_depth_join', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid_depth_join.inc', 'views', 0),
('views_handler_filter_tracker_boolean_operator', 'class', 'sites/all/modules/views/modules/tracker/views_handler_filter_tracker_boolean_operator.inc', 'views', 0),
('views_handler_filter_tracker_comment_user_uid', 'class', 'sites/all/modules/views/modules/tracker/views_handler_filter_tracker_comment_user_uid.inc', 'views', 0),
('views_handler_filter_user_current', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_current.inc', 'views', 0),
('views_handler_filter_user_name', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_name.inc', 'views', 0),
('views_handler_filter_user_permissions', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_permissions.inc', 'views', 0),
('views_handler_filter_user_roles', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_roles.inc', 'views', 0),
('views_handler_filter_vocabulary_machine_name', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc', 'views', 0),
('views_handler_filter_vocabulary_vid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_vid.inc', 'views', 0),
('views_handler_relationship', 'class', 'sites/all/modules/views/handlers/views_handler_relationship.inc', 'views', 0),
('views_handler_relationship_broken', 'class', 'sites/all/modules/views/handlers/views_handler_relationship.inc', 'views', 0),
('views_handler_relationship_entity_reverse', 'class', 'sites/all/modules/views/modules/field/views_handler_relationship_entity_reverse.inc', 'views', 0),
('views_handler_relationship_groupwise_max', 'class', 'sites/all/modules/views/handlers/views_handler_relationship_groupwise_max.inc', 'views', 0),
('views_handler_relationship_node_term_data', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_relationship_node_term_data.inc', 'views', 0),
('views_handler_relationship_translation', 'class', 'sites/all/modules/views/modules/translation/views_handler_relationship_translation.inc', 'views', 0),
('views_handler_sort', 'class', 'sites/all/modules/views/handlers/views_handler_sort.inc', 'views', 0),
('views_handler_sort_broken', 'class', 'sites/all/modules/views/handlers/views_handler_sort.inc', 'views', 0),
('views_handler_sort_comment_thread', 'class', 'sites/all/modules/views/modules/comment/views_handler_sort_comment_thread.inc', 'views', 0),
('views_handler_sort_date', 'class', 'sites/all/modules/views/handlers/views_handler_sort_date.inc', 'views', 0),
('views_handler_sort_group_by_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_sort_group_by_numeric.inc', 'views', 0),
('views_handler_sort_menu_hierarchy', 'class', 'sites/all/modules/views/handlers/views_handler_sort_menu_hierarchy.inc', 'views', 0),
('views_handler_sort_ncs_last_comment_name', 'class', 'sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_comment_name.inc', 'views', 0),
('views_handler_sort_ncs_last_updated', 'class', 'sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_updated.inc', 'views', 0),
('views_handler_sort_node_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_sort_node_language.inc', 'views', 0),
('views_handler_sort_node_version_count', 'class', 'sites/all/modules/views/modules/node/views_handler_sort_node_version_count.inc', 'views', 0),
('views_handler_sort_random', 'class', 'sites/all/modules/views/handlers/views_handler_sort_random.inc', 'views', 0),
('views_handler_sort_search_score', 'class', 'sites/all/modules/views/modules/search/views_handler_sort_search_score.inc', 'views', 0),
('views_join', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0),
('views_join_subquery', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0),
('views_many_to_one_helper', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0),
('views_object', 'class', 'sites/all/modules/views/includes/base.inc', 'views', 0),
('views_plugin', 'class', 'sites/all/modules/views/includes/plugins.inc', 'views', 0),
('views_plugin_access', 'class', 'sites/all/modules/views/plugins/views_plugin_access.inc', 'views', 0),
('views_plugin_access_none', 'class', 'sites/all/modules/views/plugins/views_plugin_access_none.inc', 'views', 0),
('views_plugin_access_perm', 'class', 'sites/all/modules/views/plugins/views_plugin_access_perm.inc', 'views', 0),
('views_plugin_access_role', 'class', 'sites/all/modules/views/plugins/views_plugin_access_role.inc', 'views', 0),
('views_plugin_argument_default', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default.inc', 'views', 0),
('views_plugin_argument_default_book_root', 'class', 'sites/all/modules/views/modules/book/views_plugin_argument_default_book_root.inc', 'views', 0),
('views_plugin_argument_default_current_user', 'class', 'sites/all/modules/views/modules/user/views_plugin_argument_default_current_user.inc', 'views', 0),
('views_plugin_argument_default_fixed', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default_fixed.inc', 'views', 0),
('views_plugin_argument_default_node', 'class', 'sites/all/modules/views/modules/node/views_plugin_argument_default_node.inc', 'views', 0),
('views_plugin_argument_default_php', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default_php.inc', 'views', 0),
('views_plugin_argument_default_raw', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default_raw.inc', 'views', 0),
('views_plugin_argument_default_taxonomy_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc', 'views', 0),
('views_plugin_argument_default_user', 'class', 'sites/all/modules/views/modules/user/views_plugin_argument_default_user.inc', 'views', 0),
('views_plugin_argument_validate', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_validate.inc', 'views', 0),
('views_plugin_argument_validate_node', 'class', 'sites/all/modules/views/modules/node/views_plugin_argument_validate_node.inc', 'views', 0),
('views_plugin_argument_validate_numeric', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_validate_numeric.inc', 'views', 0),
('views_plugin_argument_validate_php', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_validate_php.inc', 'views', 0),
('views_plugin_argument_validate_taxonomy_term', 'class', 'sites/all/modules/views/modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc', 'views', 0),
('views_plugin_argument_validate_user', 'class', 'sites/all/modules/views/modules/user/views_plugin_argument_validate_user.inc', 'views', 0),
('views_plugin_cache', 'class', 'sites/all/modules/views/plugins/views_plugin_cache.inc', 'views', 0),
('views_plugin_cache_none', 'class', 'sites/all/modules/views/plugins/views_plugin_cache_none.inc', 'views', 0),
('views_plugin_cache_time', 'class', 'sites/all/modules/views/plugins/views_plugin_cache_time.inc', 'views', 0),
('views_plugin_display', 'class', 'sites/all/modules/views/plugins/views_plugin_display.inc', 'views', 0),
('views_plugin_display_attachment', 'class', 'sites/all/modules/views/plugins/views_plugin_display_attachment.inc', 'views', 0),
('views_plugin_display_block', 'class', 'sites/all/modules/views/plugins/views_plugin_display_block.inc', 'views', 0),
('views_plugin_display_default', 'class', 'sites/all/modules/views/plugins/views_plugin_display_default.inc', 'views', 0),
('views_plugin_display_embed', 'class', 'sites/all/modules/views/plugins/views_plugin_display_embed.inc', 'views', 0),
('views_plugin_display_extender', 'class', 'sites/all/modules/views/plugins/views_plugin_display_extender.inc', 'views', 0),
('views_plugin_display_feed', 'class', 'sites/all/modules/views/plugins/views_plugin_display_feed.inc', 'views', 0),
('views_plugin_display_page', 'class', 'sites/all/modules/views/plugins/views_plugin_display_page.inc', 'views', 0),
('views_plugin_exposed_form', 'class', 'sites/all/modules/views/plugins/views_plugin_exposed_form.inc', 'views', 0),
('views_plugin_exposed_form_basic', 'class', 'sites/all/modules/views/plugins/views_plugin_exposed_form_basic.inc', 'views', 0),
('views_plugin_exposed_form_input_required', 'class', 'sites/all/modules/views/plugins/views_plugin_exposed_form_input_required.inc', 'views', 0),
('views_plugin_localization', 'class', 'sites/all/modules/views/plugins/views_plugin_localization.inc', 'views', 0),
('views_plugin_localization_core', 'class', 'sites/all/modules/views/plugins/views_plugin_localization_core.inc', 'views', 0),
('views_plugin_localization_none', 'class', 'sites/all/modules/views/plugins/views_plugin_localization_none.inc', 'views', 0),
('views_plugin_localization_test', 'class', 'sites/all/modules/views/tests/views_plugin_localization_test.inc', 'views', 0),
('views_plugin_pager', 'class', 'sites/all/modules/views/plugins/views_plugin_pager.inc', 'views', 0),
('views_plugin_pager_full', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_full.inc', 'views', 0),
('views_plugin_pager_mini', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_mini.inc', 'views', 0),
('views_plugin_pager_none', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_none.inc', 'views', 0),
('views_plugin_pager_some', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_some.inc', 'views', 0),
('views_plugin_query', 'class', 'sites/all/modules/views/plugins/views_plugin_query.inc', 'views', 0),
('views_plugin_query_default', 'class', 'sites/all/modules/views/plugins/views_plugin_query_default.inc', 'views', 0),
('views_plugin_row', 'class', 'sites/all/modules/views/plugins/views_plugin_row.inc', 'views', 0),
('views_plugin_row_aggregator_rss', 'class', 'sites/all/modules/views/modules/aggregator/views_plugin_row_aggregator_rss.inc', 'views', 0),
('views_plugin_row_comment_rss', 'class', 'sites/all/modules/views/modules/comment/views_plugin_row_comment_rss.inc', 'views', 0),
('views_plugin_row_comment_view', 'class', 'sites/all/modules/views/modules/comment/views_plugin_row_comment_view.inc', 'views', 0),
('views_plugin_row_fields', 'class', 'sites/all/modules/views/plugins/views_plugin_row_fields.inc', 'views', 0),
('views_plugin_row_node_rss', 'class', 'sites/all/modules/views/modules/node/views_plugin_row_node_rss.inc', 'views', 0),
('views_plugin_row_node_view', 'class', 'sites/all/modules/views/modules/node/views_plugin_row_node_view.inc', 'views', 0),
('views_plugin_row_rss_fields', 'class', 'sites/all/modules/views/plugins/views_plugin_row_rss_fields.inc', 'views', 0),
('views_plugin_row_search_view', 'class', 'sites/all/modules/views/modules/search/views_plugin_row_search_view.inc', 'views', 0),
('views_plugin_row_user_view', 'class', 'sites/all/modules/views/modules/user/views_plugin_row_user_view.inc', 'views', 0),
('views_plugin_style', 'class', 'sites/all/modules/views/plugins/views_plugin_style.inc', 'views', 0),
('views_plugin_style_default', 'class', 'sites/all/modules/views/plugins/views_plugin_style_default.inc', 'views', 0),
('views_plugin_style_grid', 'class', 'sites/all/modules/views/plugins/views_plugin_style_grid.inc', 'views', 0),
('views_plugin_style_jump_menu', 'class', 'sites/all/modules/views/plugins/views_plugin_style_jump_menu.inc', 'views', 0),
('views_plugin_style_list', 'class', 'sites/all/modules/views/plugins/views_plugin_style_list.inc', 'views', 0),
('views_plugin_style_mapping', 'class', 'sites/all/modules/views/plugins/views_plugin_style_mapping.inc', 'views', 0),
('views_plugin_style_rss', 'class', 'sites/all/modules/views/plugins/views_plugin_style_rss.inc', 'views', 0),
('views_plugin_style_summary', 'class', 'sites/all/modules/views/plugins/views_plugin_style_summary.inc', 'views', 0),
('views_plugin_style_summary_jump_menu', 'class', 'sites/all/modules/views/plugins/views_plugin_style_summary_jump_menu.inc', 'views', 0),
('views_plugin_style_summary_unformatted', 'class', 'sites/all/modules/views/plugins/views_plugin_style_summary_unformatted.inc', 'views', 0),
('views_plugin_style_table', 'class', 'sites/all/modules/views/plugins/views_plugin_style_table.inc', 'views', 0),
('views_slideshow_plugin_style_slideshow', 'class', 'sites/all/modules/views_slideshow/views_slideshow_plugin_style_slideshow.inc', 'views_slideshow', 0),
('views_test_area_access', 'class', 'sites/all/modules/views/tests/test_handlers/views_test_area_access.inc', 'views', 0),
('views_test_plugin_access_test_dynamic', 'class', 'sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_dynamic.inc', 'views', 0),
('views_test_plugin_access_test_static', 'class', 'sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_static.inc', 'views', 0),
('views_test_plugin_style_test_mapping', 'class', 'sites/all/modules/views/tests/test_plugins/views_test_plugin_style_test_mapping.inc', 'views', 0),
('views_ui', 'class', 'sites/all/modules/views/plugins/export_ui/views_ui.class.php', 'views_ui', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registry_file`
--

CREATE TABLE `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files parsed to build the registry.';

--
-- Dumping data for table `registry_file`
--

INSERT INTO `registry_file` (`filename`, `hash`) VALUES
('includes/actions.inc', 'f36b066681463c7dfe189e0430cb1a89bf66f7e228cbb53cdfcd93987193f759'),
('includes/ajax.inc', '3d1c0d2efcdab327224122df1156a665f9bbf60873907dde2f189b018d4e9be3'),
('includes/archiver.inc', 'bdbb21b712a62f6b913590b609fd17cd9f3c3b77c0d21f68e71a78427ed2e3e9'),
('includes/authorize.inc', '6d64d8c21aa01eb12fc29918732e4df6b871ed06e5d41373cb95c197ed661d13'),
('includes/batch.inc', '1fe00f9a25481cd43e19fbd6bd37b7ff9dca79f8405ec3e55ffb011be12ec2c3'),
('includes/batch.queue.inc', '554b2e92e1dad0f7fd5a19cb8dff7e109f10fbe2441a5692d076338ec908de0f'),
('includes/bootstrap.inc', '0809017a55ab8e1fb2f9eddda859d7585d510ff810050f765f79bdba114c7e06'),
('includes/cache-install.inc', 'e7ed123c5805703c84ad2cce9c1ca46b3ce8caeeea0d8ef39a3024a4ab95fa0e'),
('includes/cache.inc', '033c9bf2555dba29382b077f78cc00c82fd7f42a959ba31b710adddf6fdf24fe'),
('includes/common.inc', 'd53f0ec66d5a9a2b98698ddda819ee41c6dd26c049b41a7a7aa5c4e377339bdb'),
('includes/database/database.inc', '2ef46543fb9cf61ed9fa9aed4e44dd31630c22604ea6b8e48b57ebd7ad11a111'),
('includes/database/log.inc', '9feb5a17ae2fabcf26a96d2a634ba73da501f7bcfc3599a693d916a6971d00d1'),
('includes/database/mysql/database.inc', '32a577354dba6030043500873f8a2a7359c80c179a213284b026c1a9b0452b70'),
('includes/database/mysql/install.inc', '6ae316941f771732fbbabed7e1d6b4cbb41b1f429dd097d04b3345aa15e461a0'),
('includes/database/mysql/query.inc', '0212a871646c223bf77aa26b945c77a8974855373967b5fb9fdc09f8a1de88a6'),
('includes/database/mysql/schema.inc', '2ef729f8d6466d5cd87ba233152d88590bce629d8366040b2509b4e24258d780'),
('includes/database/pgsql/database.inc', '651bec324e2204aa35a28fdbd876aa8e4f7a9e909e75cc8db811e9c156b0df88'),
('includes/database/pgsql/install.inc', '39587f26a9e054afaab2064d996af910f1b201ef1c6b82938ef130e4ff8c6aab'),
('includes/database/pgsql/query.inc', '0df57377686c921e722a10b49d5e433b131176c8059a4ace4680964206fc14b4'),
('includes/database/pgsql/schema.inc', '1588daadfa53506aa1f5d94572162a45a46dc3ceabdd0e2f224532ded6508403'),
('includes/database/pgsql/select.inc', '1e509bc97c58223750e8ea735145b316827e36f43c07b946003e41f5bca23659'),
('includes/database/prefetch.inc', 'b5b207a66a69ecb52ee4f4459af16a7b5eabedc87254245f37cc33bebb61c0fb'),
('includes/database/query.inc', '982d44a294eea1c9619687c14df2987257e3776fcabeba05f01432e934cf61c6'),
('includes/database/schema.inc', '6ea8e4063eb72d8f6b1a9f8b8908489d9f89b4a158ef37002d21209fb500358c'),
('includes/database/select.inc', '02a2d4345287df62b163ca2524e99b7370c9ec167bc937245328683d4e3e3d56'),
('includes/database/sqlite/database.inc', '62f6669c4610557c4b34ada9f0a0f61d6cb7b377e0a9032d2efca7b5f39b0965'),
('includes/database/sqlite/install.inc', '6620f354aa175a116ba3a0562c980d86cc3b8b481042fc3cc5ed6a4d1a7a6d74'),
('includes/database/sqlite/query.inc', '0eb02ad036ef61c490fb3f189a4cdc8fc1ae0d442737806346fd63aea8f30db3'),
('includes/database/sqlite/schema.inc', '3a7d22ec1f0ee09bfa267309b90e30edbe39e453b3025b30cbe3ae7412a4df2d'),
('includes/database/sqlite/select.inc', '8d1c426dbd337733c206cce9f59a172546c6ed856d8ef3f1c7bef05a16f7bf68'),
('includes/date.inc', '1de2c25e3b67a9919fc6c8061594442b6fb2cdd3a48ddf1591ee3aa98484b737'),
('includes/entity.inc', 'f06b508f93e72ba70f979d8391be57662c018a03a32fac0a6d3baa752740133d'),
('includes/errors.inc', 'd731bbe3a60508e164cfa90b8edc06400c7f15844f9f9bc3935dd87e44c460db'),
('includes/file.inc', 'f112194214d483ce867165922ad7996c64174bd932369f89f8335af026bbb493'),
('includes/file.mimetypes.inc', '33266e837f4ce076378e7e8cef6c5af46446226ca4259f83e13f605856a7f147'),
('includes/filetransfer/filetransfer.inc', 'fdea8ae48345ec91885ac48a9bc53daf87616271472bb7c29b7e3ce219b22034'),
('includes/filetransfer/ftp.inc', '51eb119b8e1221d598ffa6cc46c8a322aa77b49a3d8879f7fb38b7221cf7e06d'),
('includes/filetransfer/local.inc', '7cbfdb46abbdf539640db27e66fb30e5265128f31002bd0dfc3af16ae01a9492'),
('includes/filetransfer/ssh.inc', '92f1232158cb32ab04cbc93ae38ad3af04796e18f66910a9bc5ca8e437f06891'),
('includes/form.inc', 'a0e219d53d641f08d6f1d609e53f06f3f8b1c591d20113d0992557c815b44a72'),
('includes/graph.inc', '8e0e313a8bb33488f371df11fc1b58d7cf80099b886cd1003871e2c896d1b536'),
('includes/image.inc', 'bcdc7e1599c02227502b9d0fe36eeb2b529b130a392bc709eb737647bd361826'),
('includes/install.core.inc', '189653e4bb7d4828bd6e1b61015fabcc7182e23d9dd8858170f98114d99400c8'),
('includes/install.inc', 'fbb23627b06abb070b4531da786c1e06bf1dbd6f923bb2b404f4808c2340b0f9'),
('includes/iso.inc', '0ce4c225edcfa9f037703bc7dd09d4e268a69bcc90e55da0a3f04c502bd2f349'),
('includes/json-encode.inc', '02a822a652d00151f79db9aa9e171c310b69b93a12f549bc2ce00533a8efa14e'),
('includes/language.inc', '4e08f30843a7ccaeea5c041083e9f77d33d57ff002f1ab4f66168e2c683ce128'),
('includes/locale.inc', 'ca50acc0780cbffeca17f99a0997f91b8b9402f0eec1898c3122e1d73664d01d'),
('includes/lock.inc', 'a181c8bd4f88d292a0a73b9f1fbd727e3314f66ec3631f288e6b9a54ba2b70fa'),
('includes/mail.inc', '41d0e657119a05f8d7e85ebf32e74b12a1c3107d717a348158414b113e208b9c'),
('includes/menu.inc', '8e7a8a1a4666a8ca66d1b19cc97be4cf82c3bb0e835e652ee366bec9b74a8c23'),
('includes/module.inc', '8dab73e50e6bcd680a26f55597d2d103ba68a29089f888e2a2c206fc38eaa669'),
('includes/pager.inc', '6f9494b85c07a2cc3be4e54aff2d2757485238c476a7da084d25bde1d88be6d8'),
('includes/password.inc', 'fd9a1c94fe5a0fa7c7049a2435c7280b1d666b2074595010e3c492dd15712775'),
('includes/path.inc', '2dca08d14a46e5ac6a665b7a5dde78045d8de2b35aaa78c6fb811e1125ce4953'),
('includes/registry.inc', 'f47b20859f0fc80bf4bb2849a1282d6c54006957b69da0e5f4691de585ca4cdf'),
('includes/request-sanitizer.inc', '8d43f991b57cbedb2dc99d153f053a24e3ab43849b4816c0353529b918a66441'),
('includes/session.inc', '5851ff6941aba2744dd0c247f077fc02fbbe24e9786e04ea0a3c372d68ca6d16'),
('includes/stream_wrappers.inc', 'b8a5a53f3d3ef26ea868037547f76af8049ce0c55b464810c627310a84f24924'),
('includes/tablesort.inc', '2d88768a544829595dd6cda2a5eb008bedb730f36bba6dfe005d9ddd999d5c0f'),
('includes/theme.inc', '5d8b96db9760367eb86821085a17a144a58cb355e6f547e321321ee34535da7b'),
('includes/theme.maintenance.inc', '39f068b3eee4d10a90d6aa3c86db587b6d25844c2919d418d34d133cfe330f5a'),
('includes/token.inc', '5e7898cd78689e2c291ed3cd8f41c032075656896f1db57e49217aac19ae0428'),
('includes/unicode.entities.inc', '2b858138596d961fbaa4c6e3986e409921df7f76b6ee1b109c4af5970f1e0f54'),
('includes/unicode.inc', 'e18772dafe0f80eb139fcfc582fef1704ba9f730647057d4f4841d6a6e4066ca'),
('includes/update.inc', '25c30f1e61ef9c91a7bdeb37791c2215d9dc2ae07dba124722d783ca31bb01e7'),
('includes/updater.inc', 'd2da0e74ed86e93c209f16069f3d32e1a134ceb6c06a0044f78e841a1b54e380'),
('includes/utility.inc', '3458fd2b55ab004dd0cc529b8e58af12916e8bd36653b072bdd820b26b907ed5'),
('includes/xmlrpc.inc', 'ea24176ec445c440ba0c825fc7b04a31b440288df8ef02081560dc418e34e659'),
('includes/xmlrpcs.inc', '925c4d5bf429ad9650f059a8862a100bd394dce887933f5b3e7e32309a51fd8e'),
('modules/block/block.test', '40d9de00589211770a85c47d38c8ad61c598ec65d9332128a882eb8750e65a16'),
('modules/color/color.test', '610ba154f42b6af5871fb09cdb0bc7badc29b03845c08d86e0e524840dd27568'),
('modules/comment/comment.module', 'db858137ff6ce06d87cb3b8f5275bed90c33a6d9aa7d46e7a74524cc2f052309'),
('modules/comment/comment.test', '332d14e197b4ebe85b1b70a15602981d99d332e2293576c0e44cf18a808c7aac'),
('modules/contextual/contextual.test', '023dafa199bd325ecc55a17b2a3db46ac0a31e23059f701f789f3bc42427ba0b'),
('modules/dashboard/dashboard.test', '125df00fc6deb985dc554aa7807a48e60a68dbbddbad9ec2c4718da724f0e683'),
('modules/dblog/dblog.test', '79ba7991c3f40f9241e9a03ffa43faf945c82658ca9b52ec62bd13bd80f41269'),
('modules/field/field.attach.inc', '2df4687b5ec078c4893dc1fea514f67524fd5293de717b9e05caf977e5ae2327'),
('modules/field/field.info.class.inc', 'cf18178e119d43897d3abd882ba3acc0cf59d1ad747663437c57b1ec4d0a4322'),
('modules/field/field.module', '48b5b83f214a8d19e446f46c5d7a1cd35faa656ccb7b540f9f02462a440cacdd'),
('modules/field/modules/field_sql_storage/field_sql_storage.test', '315eedaf2022afc884c35efd3b7c400eddab6ea30bec91924bc82ab5cd3e79f2'),
('modules/field/modules/list/tests/list.test', 'c1a214d7efd3247dd947d742a8514ec9649da62593608dfdccee6913d48e5709'),
('modules/field/modules/number/number.test', 'fc8f193904f1c5f87dcf51a279975214b34aa1349fe9c38b09c4e6740b059b49'),
('modules/field/modules/options/options.test', '1b30956b6f46840ccb41b99bda08f328172f008f1fb4164c65fe9e4047fffa5f'),
('modules/field/modules/text/text.test', '5c28b9da26417d2ed8a169850989c0b59f2b188a0161eb58e2b87c67994d602d'),
('modules/field/tests/field.test', '5eaad7a933ef8ea05b958056492ce17858cd542111f0fe81dd1a5949ad8f966e'),
('modules/field_ui/field_ui.test', 'f535e5627c969e9083a63aaf72d4ac645e30709d7b87af15c6c3b870481f283a'),
('modules/file/tests/file.test', '09a4233406b2913692c91986ef0509197ffbf4a59d3c9843acf8bdd81ec0832b'),
('modules/filter/filter.test', 'b8aa5e6b832422c6ad5fe963898ec9526c814614f27ecccb67107ce194997d6a'),
('modules/help/help.test', 'bc934de8c71bd9874a05ccb5e8f927f4c227b3b2397d739e8504c8fd6ae5a83c'),
('modules/image/image.test', '6e7a0cbcb58f6210127b0ac7c1d118d488abd0925fe8db10a3405af87f1d9fe1'),
('modules/menu/menu.test', '71efd7117a882fdcdd50971b4a68f7f2895b532e09acf094d747f27a15742c5b'),
('modules/node/node.module', '70f969229d03819dba439546ae7aef30283b93e410af1b45f5a25b90d3cb8edd'),
('modules/node/node.test', '35bf40fde62f3a1de95bab9f037b84f20c2f93a1c579d7d19e4a87afe75dc330'),
('modules/path/path.test', '2004183b2c7c86028bf78c519c6a7afc4397a8267874462b0c2b49b0f8c20322'),
('modules/php/php.test', 'd234f9c1ab18a05834a3cb6dc532fb4c259aa25612551f953ba6e3bb714657b8'),
('modules/rdf/rdf.test', '9849d2b717119aa6b5f1496929e7ac7c9c0a6e98486b66f3876bda0a8c165525'),
('modules/search/search.extender.inc', '013a6a841cc48a6dc991153fb692b8d1546e56b78d9c95e97e0d7e92296d3481'),
('modules/search/search.test', 'e43c21510d510885dfad6484afa931382083b75b7e67286bda56a6aafe265f28'),
('modules/shortcut/shortcut.test', '0d78280d4d0a05aa772218e45911552e39611ca9c258b9dd436307914ac3f254'),
('modules/system/system.archiver.inc', 'faa849f3e646a910ab82fd6c8bbf0a4e6b8c60725d7ba81ec0556bd716616cd1'),
('modules/system/system.mail.inc', 'd31e1769f5defbe5f27dc68f641ab80fb8d3de92f6e895f4c654ec05fc7e5f0f'),
('modules/system/system.queue.inc', 'a77a5913d84368092805ac551ca63737c1d829455504fcccb95baa2932f28009'),
('modules/system/system.tar.inc', 'd0d2f191d79b3227852e7436908386bdd7a25f78c73f3c8bf9ef5903892ae993'),
('modules/system/system.test', '7a94d94c13eb60684678e62f25cec44d46714a1ca4987f62d86d358e8978902a'),
('modules/system/system.updater.inc', '9433fa8d39500b8c59ab05f41c0aac83b2586a43be4aa949821380e36c4d3c48'),
('modules/taxonomy/taxonomy.module', '19992c2e810a7b7a1c228d178b0b6c5f358082d515b8a6e77b0415a430e23997'),
('modules/taxonomy/taxonomy.test', 'ce91ff8a2879d65fdb3477d3f437cad8ef50b8963dadb75ae203854987b2c23a'),
('modules/update/update.test', '994b66b737f16eb98ee18c9e9ecd62e86de2792159e70b36982e95b48f2746a3'),
('modules/user/user.module', 'b773a1b0f7448546393e6f7b2436d0d91b7965889afdf4a863bba4c0bc0dba69'),
('modules/user/user.test', '0b55048c0de2dee5ab1c25a38c01b3bd13f476b43e4172bb0c06cb6188d2edc9'),
('sites/all/modules/admin_menu/tests/admin_menu.test', '185f8244f7a086cda1bd9435ec529e8632598e9b09d1e0d7363b75cf87c04afb'),
('sites/all/modules/ckeditor/tests/ckeditor.test', '0ec6f431d4694e8b3b437f17a7be8ec81bf4dd8090fccd8dcc3fb56ce7064833'),
('sites/all/modules/ctools/includes/context.inc', '2057a0331cf54e23ef39aa84b7c60f486aff749223367a30f3513b05dde35f3d'),
('sites/all/modules/ctools/includes/css-cache.inc', 'db90ff67669d9fa445e91074ac67fb97cdb191a19e68d42744f0fd4158649cfa'),
('sites/all/modules/ctools/includes/math-expr.inc', 'f468453177eaa340d2a9dd03cc857be1080f4422bc0c4467e1f55663aa8aa4ae'),
('sites/all/modules/ctools/includes/stylizer.inc', 'a19b912a79e6d982a6bfbb660c108a047e41283a23e1b12e4b9c22af51771add'),
('sites/all/modules/ctools/plugins/export_ui/ctools_export_ui.class.php', 'ba3c6c2b75bdbd9922a6324d7a946b3916870590477cceea58d824c18a85e78d'),
('sites/all/modules/ctools/tests/context.test', 'bc23a86c5c32a0335c970f1e51ad6d60cc02d006de3d5cb5ee0bbdaa84d5bcd3'),
('sites/all/modules/ctools/tests/css.test', '832c58634157083e988797bf878c5fd6b9640e187802a397763e25771eced028'),
('sites/all/modules/ctools/tests/css_cache.test', '331564b96148bb666b306ead748b8b18a7baf746e96d6564b9685a23ca47a888'),
('sites/all/modules/ctools/tests/ctools.plugins.test', '2dbabab681d5a9e15e093aef5a48732dcdb030680b932c7a0c7260e444751919'),
('sites/all/modules/ctools/tests/ctools.test', '427659c5c3db1e8638539b6dd1a440451e043129172a42f66f3f9bbd15e8db0b'),
('sites/all/modules/ctools/tests/math_expression.test', '8e75cdab9db025add3adf9dd36fa818e6982b23f7bf3a8192deca5d3240360e4'),
('sites/all/modules/ctools/tests/math_expression_stack.test', '203b98c797d7eaa787c6481c1ab9482c0ca45559314f79632d7c5efb51d7d170'),
('sites/all/modules/ctools/tests/object_cache.test', '0af88e1d17b8265ac621799922934dded7c44073c001acf8c1c47d0187cb52fa'),
('sites/all/modules/ctools/tests/object_cache_unit.test', '9fd7871c5f0307247469bcdd488f3086126f5f7978d6a470f8ecb8a6dc4b5a1e'),
('sites/all/modules/ctools/tests/page_tokens.test', '078f82bd0957d8821521388fa270e70e10e9f143c1012ebac60f2dfd4d9ab1a4'),
('sites/all/modules/entity/entity.features.inc', '53f537caf6ad9355fb92b2c6db019959abdf399d80764151dd976b0891f37436'),
('sites/all/modules/entity/entity.i18n.inc', '41e0e62af7e2774f62b162d597bb3244551c280296b692b29d039a2c243d7059'),
('sites/all/modules/entity/entity.info.inc', '8799080b9393c9560e64feae1276fb7d26fef4d92bb0edacc863ee3e7b67bf04'),
('sites/all/modules/entity/entity.rules.inc', '774199059d1b3ebe6d3fe7a49dbb1550df489055a3d066b5de54edda8dd7ba84'),
('sites/all/modules/entity/entity.test', 'aba6490cd2041438d832dc8f63b213e0d171a5a218f6d51a9fe00c51e95069ce'),
('sites/all/modules/entity/entity_token.module', '0c1ad6fb6f8c430e47a81be6d08180883c5a1ee728ce8b5dd0775713b34fb862'),
('sites/all/modules/entity/entity_token.tokens.inc', '084edf8f860f3c9843e23cc2e06a9084dcb644ee6d99c21cdd7bd924138d518f'),
('sites/all/modules/entity/includes/entity.controller.inc', 'b85d1882fae38ee8a0e82bf75952f44f65a58fd95e3bf0c3cb2a1321cf4d308a'),
('sites/all/modules/entity/includes/entity.inc', '02c3c8b1d4b7230f875c4fae8e6ba3bd57431e01f312b32f3ed305a7be734774'),
('sites/all/modules/entity/includes/entity.ui.inc', '49653cbbccc4b4e51f957727aa95803c149fac9565f53ed553e2cd1c1c3580ff'),
('sites/all/modules/entity/includes/entity.wrapper.inc', 'c728444ea73d4d5a7f0ec4cc80c7b749ab3134e1d0b973f8c001936c3dd5b861'),
('sites/all/modules/entity/views/entity.views.inc', '089b8ed3103f62778be3395a99ddfbd84da4235f5ad431392f8984eaa4bf349f'),
('sites/all/modules/entity/views/handlers/entity_views_field_handler_helper.inc', '88e4cbbbeab9bbaa4c928118bdefb158ea99f343f813cf88cce01ed7fbf8bf6a'),
('sites/all/modules/entity/views/handlers/entity_views_handler_area_entity.inc', '39ac643c4365394ac54190c4d130ea5787de423b9dadc14a470687a64cfbc8ab'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_boolean.inc', 'b28b8eee8761ba7a6af35d97ab7aaee28406e6c227271f9769818560626c5791'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_date.inc', 'b0f5be5b399de94934b24e84c8cf6053a043f6b00c60dcffa752daeafdd38778'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_duration.inc', 'ed7bb64cb63b94a20c8cde98cfb053b5ea252804396cf61ac562faf1d850266b'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_entity.inc', '4f255918a22fefebe9c7734f200751457a7ca4d3648e32a98511bb51968d7521'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_field.inc', '893121efbce2a7181e31147bade260c9cc657cbd33b0d254cb28b2650e57566d'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_numeric.inc', 'f14e2b063930e8820af381b4f5e83c7278440e7804ab88cfde865b6c94e7c0f6'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_options.inc', '27ef31b8ee7b9999930380d6a5fdb477772329c4ddbd5c70cc34bcdc7543ce56'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_text.inc', '5fb0a85d35d29944c699ceaf6efed5eda2df757009e44caba8ff2be397568b60'),
('sites/all/modules/entity/views/handlers/entity_views_handler_field_uri.inc', '79ecaa3eb17dfdd0ca077351b75a2c0adf411ebc04720e7cc0e2397674225f24'),
('sites/all/modules/entity/views/handlers/entity_views_handler_relationship.inc', 'b69bc538d1e1e0f91f8485ca54c3b6e2be025caa47619734c467377cf89041b9'),
('sites/all/modules/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc', '65300c793c4591d60ad908dc02cf3148fe4e899fa6ad218e875fd92d411374dc'),
('sites/all/modules/entity/views/plugins/entity_views_plugin_row_entity_view.inc', 'e489ca209c66b76228383864b8267067e7cf3a1e375d9a195339f89932fed71f'),
('sites/all/modules/flexslider/flexslider.test', '7f63bc36abe645446407ca9e185b47c931f6a99acceff22eacbd465ae0184767'),
('sites/all/modules/flexslider/flexslider_views/flexslider_views.module', 'bfb2794b3c8711c84db6f31c60e87314c26b5489903cedb92b9d632812f05496'),
('sites/all/modules/flexslider/flexslider_views/flexslider_views.views.inc', '6bba7b25386477b60098a754e67f26e93cf9256ef9b85d1f1801adb130b82c73'),
('sites/all/modules/flexslider/flexslider_views/flexslider_views_plugin_style_flexslider.inc', 'a4986b2603f1a0752766d4d327e7be9053cc8809bebd0221578778df4f9f5796'),
('sites/all/modules/flexslider/theme/flexslider.theme.inc', '14b0d81c4946e8cce3c3b7e9a626e6e0a3fc76d3b2e1f5a56c03c9d688b88c63'),
('sites/all/modules/jquery_update/jquery_update.install', 'd377a4e1df5c9606b4d603fbf14296f6d4df921bb3e188341a0c602651498388'),
('sites/all/modules/jquery_update/jquery_update.module', '5550809cea16a9f09ebcd6e70fc36a19a2aa3fd6180039d2e2382b86d659a8c3'),
('sites/all/modules/libraries/tests/LibrariesAdminWebTest.test', '933af00ee9ad342999e20c0a82440ab04933b5d7713ffe2e7371a9af15492bf5'),
('sites/all/modules/libraries/tests/LibrariesLoadWebTest.test', '4cfaf88ce29e72f8ecd52b02cc9f7bac2ea60a715530cd9ff4fea929dac161ee'),
('sites/all/modules/libraries/tests/LibrariesUnitTest.test', '08139d770447993484828d0a642b6a771314c74e392074e94c2b7dcebc10b093'),
('sites/all/modules/libraries/tests/LibrariesWebTestBase.test', '056dfdd67ac9d6a84ffbe0f507e165fd6f07a0c82c3c7efbc1874e870e85e83a'),
('sites/all/modules/pathauto/pathauto.migrate.inc', '31084f25620be5620aecf9d60356dba662b6eda426c0c94ba996821110e4b1cc'),
('sites/all/modules/pathauto/pathauto.test', '1297560df48bad9b325d775d3bc64a411c03a0fd630c5e53ff8e46c4550a6977'),
('sites/all/modules/restws/restws_basic_auth/restws_basic_auth.test', '84712737b88383fc11f3ada5f8f3e9d117594965cc9ce20693b4e8562cc1e958'),
('sites/all/modules/services/includes/services.runtime.inc', '3e36c25ce4885510dc81135bda75f7121ba2f6e8cdf556c34c730832991cac6a'),
('sites/all/modules/services/plugins/export_ui/services_ctools_export_ui.class.php', '3c9bb28b6713fb0bdde9d5b76ca7f059dcbdfe6873163f7c59e40ee81300d9ef'),
('sites/all/modules/services/servers/rest_server/includes/RESTServer.inc', 'dc6b9c21e778502b400ae6639424fbdc5cc06a9cdf8ed044a3d7900e4cc35a6f'),
('sites/all/modules/services/servers/rest_server/includes/ServicesContentTypeNegotiator.inc', 'f5bb35e945e2216f16e7f9ddf47457179a5a6c6eadf0b1a1fbffcdde23b876e4'),
('sites/all/modules/services/servers/rest_server/includes/ServicesContext.inc', '6a367e668802b8b4072155e8309fdaee2b46af76be8afd79185369994b605d73'),
('sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', '77a40032f674bcb308e56f7f7db763ecda938c82d71f95e0e3490af614d0ce66'),
('sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', '85f580e39c9583801a6e1463d07c55358cdf59e7c353cb3eec3016bfa1914427'),
('sites/all/modules/services/servers/rest_server/includes/ServicesRESTServerFactory.inc', '9d42172e430c893f17b37e00ea6c23af70cb924fc3c1e6f74066b2df89459ee8'),
('sites/all/modules/services/servers/rest_server/lib/bencode.php', '245078c15cb1494586a4c064cc707b08d02f51fd7b86ba673ac2685295c65c38'),
('sites/all/modules/services/servers/rest_server/lib/mimeparse.php', '865d545cb9b23a241bd1407c218a954d8d681c8d217d24945761ca1b5eaadba7'),
('sites/all/modules/services/servers/rest_server/rest_server.module', '758c67cd01569e2e20b858a6c7708afe1eb90bd981db8fe271525ca33546e3b4'),
('sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'e86d621cd373f7038077a521cce882a543b3948443f11020f36f839bc36d8100'),
('sites/all/modules/services/servers/rest_server/tests/ServicesRESTServerTests.test', '3bbef5971279ef1e52214d8cff146f980a227f5635bd93279cd3c87adf9159df'),
('sites/all/modules/services/tests/functional/NoAuthEndpointTestRunner.test', 'c2563cd96d0345f6678683489e39a596ea4c63809b64c1c0e75110622ec0b6ab'),
('sites/all/modules/services/tests/functional/ServicesAliasTests.test', '888e9239d567775b348d6ae528cc11c5a3e7a9cad1fe95109cdd4824cdeaeba7'),
('sites/all/modules/services/tests/functional/ServicesArgumentsTests.test', '90aad776578d77b2158e8bb949a36eec7fd5bb0316ccb1663d1de939a47a8ff0'),
('sites/all/modules/services/tests/functional/ServicesEndpointTests.test', '7e11aaa489828373a3070976b8afe306beb6e9dcb39794f1eda3ee81077a165a'),
('sites/all/modules/services/tests/functional/ServicesParserTests.test', 'aaccbaeeb28610fb5d8bbb6f29cae5c54382de37561f818fa461a4c97c032338'),
('sites/all/modules/services/tests/functional/ServicesResourceCommentTests.test', 'b01a746620ad146fb8e46ac2bd933f87f76e6273ca355ff7b17149d23a558f62'),
('sites/all/modules/services/tests/functional/ServicesResourceDisabledTests.test', '2624c05b293b7b2c17d81afa1356269d31d51a53ae24e539ba34be905bb1c480'),
('sites/all/modules/services/tests/functional/ServicesResourceFileTests.test', '332ff471ad6011b52068aa4fc5aee98629c7759292ddbd4a92fe452e366df172'),
('sites/all/modules/services/tests/functional/ServicesResourceNodeTests.test', '072cdc125c55991b89aca5ac3b639779e22926c23280754105ce2abf08fd59ab'),
('sites/all/modules/services/tests/functional/ServicesResourceSystemTests.test', '4c7bed23294a4d07ebe5fec153e476e25905f8fd7bae7538b0a0daa27d102dac'),
('sites/all/modules/services/tests/functional/ServicesResourceTaxonomyTests.test', 'fdf005ceeaaa9e9f86c79d4edaf4660434a344bd6c42af54e3bbadcd834ebf20'),
('sites/all/modules/services/tests/functional/ServicesResourceUserTests.test', '8baf6702ad5d38672109831db660a14a3617d2ff478b007e527c5f13767fda4f'),
('sites/all/modules/services/tests/functional/ServicesSecurityTests.test', '661ac86d86337b0cebe812ebd52ae65148d5c9c38c15d3984af67fe3780349a8'),
('sites/all/modules/services/tests/functional/ServicesVersionTests.test', '9931b0e921a7999c1d6bace48d93667919bd82f8bbecdfa5d7d5754909303f6c'),
('sites/all/modules/services/tests/functional/ServicesXMLRPCTests.test', '86c2a78c8be5be82639ebea7951ce025f7ae0e1499afe8f407923dee3a934e24'),
('sites/all/modules/services/tests/services.test', 'c64854d76ceccc6f85c0a115d40db05b8846e47355991ecd89da3faac8919351'),
('sites/all/modules/services/tests/ui/ServicesUITests.test', '6ed160c052ed656c20851c9cb62b9144ff798362afac2546ed0c7fedf945c543'),
('sites/all/modules/services/tests/unit/ServicesSpycLibraryTests.test', 'e9fbeac1f1dfb0a79eb57f4f49818dff4f9ebbd2d07ec7b59e8699d0eaeac601'),
('sites/all/modules/token/token.test', '79c44cc6bb46caa41eaf371df9c77d7ef98bbee7d96c04ca1039375dc6674961'),
('sites/all/modules/views/handlers/views_handler_area.inc', '95d4374c805c057c9855304ded14ce316cdee8aca0744120a74400e2a8173fae'),
('sites/all/modules/views/handlers/views_handler_area_messages.inc', 'de94f83a65b47d55bbb4949fcf93dd4ad628a4a105cea2b47cdc22593f3e5925'),
('sites/all/modules/views/handlers/views_handler_area_result.inc', 'f406d7e4409545ffea2e56c9a10f87f20adef2276c6d6bbc8003885cccc8ca3b'),
('sites/all/modules/views/handlers/views_handler_area_text.inc', '531d0ac3b64206970593762df0abac60524f607253c3af876dd66ba747786dce'),
('sites/all/modules/views/handlers/views_handler_area_text_custom.inc', '35b702060c192b0adf6601ed437d0a02effd3accb71c07d6156013c8be9d5a15'),
('sites/all/modules/views/handlers/views_handler_area_view.inc', 'e604b5716d9ea202ab0b8e51d2bd0a4a8eeab461db0a74bf37745d6cbba25c41'),
('sites/all/modules/views/handlers/views_handler_argument.inc', '1f0498d1878e331f59b9f0cc87b67df330437c736e565a05fe1a14ab65ec3f26'),
('sites/all/modules/views/handlers/views_handler_argument_date.inc', '1b423d5a437bbd8ed97d0bfb69c635d36f15114699a7bc0056568cc87937477d'),
('sites/all/modules/views/handlers/views_handler_argument_formula.inc', '5a29748494a7e1c37606224de0c3cac45566efe057e4748b6676a898ac224a61'),
('sites/all/modules/views/handlers/views_handler_argument_group_by_numeric.inc', 'b8d29f27592448b63f15138510128203d726590daef56cf153a09407c90ec481'),
('sites/all/modules/views/handlers/views_handler_argument_many_to_one.inc', 'b2de259c2d00fe7ed04eb5d45eb5107ce60535dd0275823883cc29b04d1a3974'),
('sites/all/modules/views/handlers/views_handler_argument_null.inc', '26699660fd0915ec078d7eb35a93ef39fd53e3a2a4841c0ac5dbf0bb02207bee'),
('sites/all/modules/views/handlers/views_handler_argument_numeric.inc', 'ae23d847fa0f1e92baec32665a8894e26660999e338bebffb49ee42daac5a063'),
('sites/all/modules/views/handlers/views_handler_argument_string.inc', 'f8fe4daf0a636cc93d520a0d5ff212840d8bdaa704ddc3c59a24667f341ed3a1'),
('sites/all/modules/views/handlers/views_handler_field.inc', '3d059d737e738436a15651f9ac8374f460a71eb569619ba0a8a14a55a3efc87e'),
('sites/all/modules/views/handlers/views_handler_field_boolean.inc', 'dc00b916a223935e05f51d94a2dffbaf430b162517072f7c2122332af41e8fc2'),
('sites/all/modules/views/handlers/views_handler_field_contextual_links.inc', '2f54701c9f71a4a525e724a6787b5e0089a3c38e426d1925bf8344d017d571bf'),
('sites/all/modules/views/handlers/views_handler_field_counter.inc', '865a5ad7df830dae9e167709446e66cebf3e32e91ec05b5c2b887c96d0d6b0d8'),
('sites/all/modules/views/handlers/views_handler_field_ctools_dropdown.inc', 'a78c424ef884ae9878c0b140d532bdf3b116fdc0e8a7cd519848c675d5b1a5a6'),
('sites/all/modules/views/handlers/views_handler_field_custom.inc', 'a3d25fc20401ae0a1af4b7d6e83376a5b7dc18ab0aed17a3c6d81e2314cf19f8'),
('sites/all/modules/views/handlers/views_handler_field_date.inc', '79cb6583981104d70d20393fe62281c749680f375cb67355635ef00688258934'),
('sites/all/modules/views/handlers/views_handler_field_entity.inc', '909ab36aff896ad8fa4306d95a052172ec27e471ab385a035fcadef8d019e0f9'),
('sites/all/modules/views/handlers/views_handler_field_links.inc', '331a7c8e68a9a94a41a0d7e3e2b6a5c8436792cf244b409ffd732f9cbbab3642'),
('sites/all/modules/views/handlers/views_handler_field_machine_name.inc', 'df2fe47cf9c6d2e7de8627c08da809fb60883c38697340966f303c223e22aee4'),
('sites/all/modules/views/handlers/views_handler_field_markup.inc', 'a0c652fdf47f7efe35bbf2371f00e230409fe90ea0038eb101bf0c93ae0718e9'),
('sites/all/modules/views/handlers/views_handler_field_math.inc', '08c9fb88b20ca346ee3dc29773b2341ea294ba85b659dbd8c1cc92a9ddf900e8'),
('sites/all/modules/views/handlers/views_handler_field_numeric.inc', '1e36f9d55b4cfeb268068e5c9bd6f326999c04191485d3db4610e94e6f57fad9'),
('sites/all/modules/views/handlers/views_handler_field_prerender_list.inc', '0fe605bf457886fbca5f041a422fc51c6a1927654dcd06cbfc619496fe57de0e'),
('sites/all/modules/views/handlers/views_handler_field_serialized.inc', 'ad3d82a9f37ae4c71a875526c353839da2ff529351efc7861f8b7c9d4b5a47db'),
('sites/all/modules/views/handlers/views_handler_field_time_interval.inc', '280d569784312d19dabfb7aeb94639442ae37e16cba02659a8251de08a4f1de2'),
('sites/all/modules/views/handlers/views_handler_field_url.inc', '7ca57a8dcc42a3d1e7e7ec5defa64a689cb678073e15153ff6a7cafe54c90249'),
('sites/all/modules/views/handlers/views_handler_filter.inc', '4c8937c5b6399c42bb6659169f5c8563ca415fd7effab1ddeeebf2bb6b9a8011'),
('sites/all/modules/views/handlers/views_handler_filter_boolean_operator.inc', 'f4ca59e4e1f91f219a1b33690a4ad412269946804fe7cacf24f2574b2c6d8599'),
('sites/all/modules/views/handlers/views_handler_filter_boolean_operator_string.inc', '0ddd32cda535112c187de1c062797849ff90d9b312a8659056e76d2d209f694a'),
('sites/all/modules/views/handlers/views_handler_filter_combine.inc', '802f033bba6a9965896b02e3c3e0ea4493e4be282f2c5444ebbeec7e8a478072'),
('sites/all/modules/views/handlers/views_handler_filter_date.inc', 'fb63877ecfa64f2be8557a21dcf34e28b59c4a9c5f561f55738162d2301c4aa1'),
('sites/all/modules/views/handlers/views_handler_filter_entity_bundle.inc', '02db977a67a09f70bdc8e2bbc46a05fff8a6d8bd6423308c95418476e84714a3'),
('sites/all/modules/views/handlers/views_handler_filter_equality.inc', '2100cdd7f5232348adae494c5122ba41ff051eee0a8cc14aeaf6a66202cb7ed1'),
('sites/all/modules/views/handlers/views_handler_filter_fields_compare.inc', 'e116c3796f1bd409b150f5ab896b9bab956d6e71a82e5770ed6fde44605751b2'),
('sites/all/modules/views/handlers/views_handler_filter_group_by_numeric.inc', '9401c4c0fe0d678898e5288ef8152784a12e0743df21dec15457353eb2cdb01d'),
('sites/all/modules/views/handlers/views_handler_filter_in_operator.inc', '8fd7f075468bddde5c4208b1c3a6105f8fea0ac0c214452a37c00fc2f3453a7d'),
('sites/all/modules/views/handlers/views_handler_filter_many_to_one.inc', 'b4a415c2824195d3d7d0e37ada9d69ebec0b9cd833ebcac2439efc20aac15595'),
('sites/all/modules/views/handlers/views_handler_filter_numeric.inc', '8a999227d17674a70381ab8b45fbdc91269a83a45e5f7514607ed8b4a5bf6a9f'),
('sites/all/modules/views/handlers/views_handler_filter_string.inc', '140006335ac5b19b6253b431afde624db70385b9d22390b8c275296ae469cc7b'),
('sites/all/modules/views/handlers/views_handler_relationship.inc', '4fefdb6c9c48b72dcfe86484123b97eb5f5b90b6a440d8026d71f74dccbd1cd6'),
('sites/all/modules/views/handlers/views_handler_relationship_groupwise_max.inc', '47dcfe351159b10153697c17b3a92607edb34a258ba3b44087c947b9cc88e86f'),
('sites/all/modules/views/handlers/views_handler_sort.inc', '06aab8d75f3dce81eb032128b8f755bfff752dcefc2e5d494b137bca161fdefa'),
('sites/all/modules/views/handlers/views_handler_sort_date.inc', 'd7e771abf74585bd09cc8e666747a093f40848b451de8ba67c8158317946f1b2'),
('sites/all/modules/views/handlers/views_handler_sort_group_by_numeric.inc', '4ba1c38c9af32789a951b8f9377e13631ae26bf1dac3371b31a37ead25b32eb8'),
('sites/all/modules/views/handlers/views_handler_sort_menu_hierarchy.inc', 'ccd65ea3b3270366b7175e2cd7cc9167a09c27e1486949e4a05495ff5c7be5c1'),
('sites/all/modules/views/handlers/views_handler_sort_random.inc', '05a00c3bf76c3278ae0ce39a206a6224089faf5ac4a00dd5b8a558f06fab8e46'),
('sites/all/modules/views/includes/base.inc', '5ad8155dbc31cc4460b65747d99b70a64a83f6fefa00231c8d965293a7a183ee'),
('sites/all/modules/views/includes/handlers.inc', '19f44ee61fcdbf5495feb6be676e7ee8cd51ff374c66528a76cc11509f3974ae'),
('sites/all/modules/views/includes/plugins.inc', '11c03b1c69be7e9969ec0665b07ddfe170c9505f8d4e862cb27f1232a2a4240e'),
('sites/all/modules/views/includes/view.inc', '99e60c217d6dc781ec48ae8fc841e636eee31d977936e1980a34eca28734ad2e'),
('sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_category_cid.inc', '97acf41d6694fd4451909c18b118f482db9f39aa4b8c5cfa75d044d410c46012'),
('sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_fid.inc', 'c37def91d635b01db36809141d147d263cc910895e11c05e73d703e86b39fd43'),
('sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_iid.inc', '344f2806344d9c6356f2e19d297522f53bab7a4cebdf23c76d04c85c9e0a0d8e'),
('sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_category.inc', '252b30b832d8c0097d6878f5d56beecfc8cc1fc7cc8b5a4670d8d95a80b4f17d'),
('sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_title_link.inc', '1bb18967b11f2f4de62075d27e483f175b5e3431622c2e5e8292afcd000beadf'),
('sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_xss.inc', '2db2e1f0500e0a252c7367e6a92906870b3247f9d424f999c381368ee2c76597'),
('sites/all/modules/views/modules/aggregator/views_handler_filter_aggregator_category_cid.inc', '7c7c0690c836ac1b75bca3433aca587b79aec3e7d072ce97dc9b33a35780ad4f'),
('sites/all/modules/views/modules/aggregator/views_plugin_row_aggregator_rss.inc', '591e5bb7272e389fe5fc2b563f8887dbc3674811ffbb41333d36a7a9a1859e56'),
('sites/all/modules/views/modules/book/views_plugin_argument_default_book_root.inc', 'bd3bd9496bf519b1688cf39396f3afa495a29c8190a3e173c0740f4d20606a53'),
('sites/all/modules/views/modules/comment/views_handler_argument_comment_user_uid.inc', '5e29f7523010a074bda7c619b24c5d31e0c060cdbe47136b8b16b2f198ed4b4a'),
('sites/all/modules/views/modules/comment/views_handler_field_comment.inc', 'a126d690cc5bf8491cb4bee4cc8237b90e86768bebbbecb8a9409a3c1e00fa9e'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_depth.inc', '1dc353a31d3c71c67d0b3e6854d9e767e421010fbbf6a8b04a14035e5f7c097f'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_link.inc', '1f7382f7cb05c65a7cba44e4cd58022bbc6ce5597b96228d1891d7720510bf0e'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_link_approve.inc', 'f6db8a0b4dd9fffba9d8ecb7b7363ba99d3b2dc7176436a0a6dd7a93195a5789'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_link_delete.inc', '905a4cb1f91a4b40ee1ca1d1ded9958ae18e82286589fec100adb676769b1fe9'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_link_edit.inc', '8139c932cde20f366a3019111c054b1ed00dbc0c40634b91239b400243b7723a'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_link_reply.inc', '8807884efb840407696c909b9d5d07f60bde9d7f385a59eca214178ce5369558'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_node_link.inc', '64746ff2b80a5f8e83b996a325c3d5c8393934c331510b93d5815ea11c1db162'),
('sites/all/modules/views/modules/comment/views_handler_field_comment_username.inc', '1ce3fa61b3933a3e15466760e4c5d4a85407ba4c8753422b766fc04395fa4d02'),
('sites/all/modules/views/modules/comment/views_handler_field_last_comment_timestamp.inc', '30c55ec6d55bf4928b757f2a236aab56d34a8e6955944a1471e9d7b7aed057c0'),
('sites/all/modules/views/modules/comment/views_handler_field_ncs_last_comment_name.inc', '82025f3ad22b63abc57172d358b3f975006109802f4a5ecac93ce3785c505cae'),
('sites/all/modules/views/modules/comment/views_handler_field_ncs_last_updated.inc', 'facfbc5defd843f4dfb60e645f09a784234d87876628c8de98d2dfa6bb98a895'),
('sites/all/modules/views/modules/comment/views_handler_field_node_comment.inc', '0cf9e8fb416dca35c3b9df3125eb3a8585f798c6a8f8d0e1034b1fccb5cec38b'),
('sites/all/modules/views/modules/comment/views_handler_field_node_new_comments.inc', 'e0830d1f70dea473e46ab2b86e380ef741b2907f033777889f812f46989f2ff7'),
('sites/all/modules/views/modules/comment/views_handler_filter_comment_user_uid.inc', 'f526c2c4153b28d7b144054828261ba7b26566169350477cd4fb3f5b5f280719'),
('sites/all/modules/views/modules/comment/views_handler_filter_ncs_last_updated.inc', '9369675dfee24891fe19bddf85a847c275b8127949c55112ae5cb4d422977d24'),
('sites/all/modules/views/modules/comment/views_handler_filter_node_comment.inc', '70706c47bad9180c2426005da6c178ed8d27b75b28cb797ca2a1925a96dcef09'),
('sites/all/modules/views/modules/comment/views_handler_sort_comment_thread.inc', 'a64bc780cba372bd408f08a5ea9289cdf3d40562bdf2f7320657be9a9f6c7882'),
('sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_comment_name.inc', '9f039e8b8a046c058fda620804e3503be7b3e7e3e4119f0b015ccbae0922635b'),
('sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_updated.inc', 'fa8b9c3614ad5838aa40194940d9dc6935175a16e141ac919f40e74a7428c4e3'),
('sites/all/modules/views/modules/comment/views_plugin_row_comment_rss.inc', '96f651234e30a3aff805ae9a524c99813a286bf75b5a9fd8da2d7d4fbec50810'),
('sites/all/modules/views/modules/comment/views_plugin_row_comment_view.inc', '82d7296fa3109ca170f66f6f3b5e1209af98a9519bb5e4a2c42d9fc0e95d7078'),
('sites/all/modules/views/modules/contact/views_handler_field_contact_link.inc', 'ec783b215a06c89c0933107a580c144051118305dd0129ac28a7fea5f95a8fd5'),
('sites/all/modules/views/modules/field/views_handler_argument_field_list.inc', 'eff5152a2c120425a2a75fe7dbcb49ed86e5d48392b0f45b49c2e7abee9fa72b'),
('sites/all/modules/views/modules/field/views_handler_argument_field_list_string.inc', '534af91d92da7a622580ab8b262f9ef76241671a5185f30ba81898806c7b7f15'),
('sites/all/modules/views/modules/field/views_handler_field_field.inc', '94ff7382dba773fc637c777e20b810ae7d4aa4936fb0bc067e6a3824ba929d2d'),
('sites/all/modules/views/modules/field/views_handler_filter_field_list.inc', '3b55cd0a14453c95ebd534507ab842a8505496d0b7e4c7fcd61c186034c7322d'),
('sites/all/modules/views/modules/field/views_handler_filter_field_list_boolean.inc', 'd33035e141ca686b3f18da1e97adaa1ff8e5d1db266340d3030e873a744685e2'),
('sites/all/modules/views/modules/field/views_handler_relationship_entity_reverse.inc', '060035c5430c81671e4541bcf7de833c8a1eb3fa3f3a9db94dd3cebfa4299ef1'),
('sites/all/modules/views/modules/filter/views_handler_field_filter_format_name.inc', 'fc3f074ffb39822182783a8d5cf2b89ffcc097ccbb2ed15818a72a99e3a18468'),
('sites/all/modules/views/modules/locale/views_handler_argument_locale_group.inc', 'c8545411096da40f48eef8ec59391f4729c884079482e3e5b3cdd5578a1f9ad7'),
('sites/all/modules/views/modules/locale/views_handler_argument_locale_language.inc', 'a1b6505bb26e4b3abce543b9097cd0a7b8cddf00bf1e49fbba86febebb0f4486'),
('sites/all/modules/views/modules/locale/views_handler_field_locale_group.inc', '5b62afe18f92ee4a5fb49eb0995e65b4744bbe3b9c24ffe8f6c21f3191c04afc'),
('sites/all/modules/views/modules/locale/views_handler_field_locale_language.inc', '0cc08bd2d42e07f26e7acc92642b36f0ac62bf23ee9ba3fd21e6cab9a80e9f72'),
('sites/all/modules/views/modules/locale/views_handler_field_locale_link_edit.inc', '3883d3f37030d6d8e397e79ccb99ec3cb715ba7a789510f4b79b7515e314e7ae'),
('sites/all/modules/views/modules/locale/views_handler_field_node_language.inc', 'a6ccdb6c1c4df3b4fd31b714f5aa4ac99771ffce63439d6c5de6c0ae2f09a2c1'),
('sites/all/modules/views/modules/locale/views_handler_filter_locale_group.inc', '40fbc041bab64f336f59d1e0593f184b879b2a0c9e2a6050709bdc54cceb2716'),
('sites/all/modules/views/modules/locale/views_handler_filter_locale_language.inc', '3433893d988aad36b918dd6214f5258b701506bc9c0c6a72fd854a036b635e20'),
('sites/all/modules/views/modules/locale/views_handler_filter_locale_version.inc', '9337ea5216784ffc67a0aa45c946e65ad11fc40849189cc70911a81366b78620'),
('sites/all/modules/views/modules/locale/views_handler_filter_node_language.inc', 'd7edea3f35891cc76aa3bb185b9c1404378623ea7fd214c2a1f0d824df12779a'),
('sites/all/modules/views/modules/locale/views_handler_sort_node_language.inc', 'b7b70efcf7de1f4dee4722ac8aa16031f17d62e60b1b5772f9985cadf91e4415'),
('sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', '80ee0e32fd48de1fa9d91645f27f7f26e8700acd3b1120a6d414bb1a794f6d0e'),
('sites/all/modules/views/modules/node/views_handler_argument_node_language.inc', '7ee3ba02bddaa6aeef9961cdf6af7bb386fc2b12529f095b28520bb98af51775'),
('sites/all/modules/views/modules/node/views_handler_argument_node_nid.inc', '11c5b62413ffd1b2c66d4b60a2fe21cf6eb839ae40d4ef81c7a938c5be3e30de'),
('sites/all/modules/views/modules/node/views_handler_argument_node_type.inc', '9e21b4cc4ae861f58c804ea7e2c17fbc5dd2a7938b9abfeb54437b531fc95e6e'),
('sites/all/modules/views/modules/node/views_handler_argument_node_uid_revision.inc', '675c99f8da9748ac507e202f546914bee3ed4065f6ce83a23a2aaafdaefd084e'),
('sites/all/modules/views/modules/node/views_handler_argument_node_vid.inc', '7e5da5594a336c1d0f4cf080ab3fcd690e0de1ee6b5e1830b5fb76a46bced19c'),
('sites/all/modules/views/modules/node/views_handler_field_history_user_timestamp.inc', '7d6d9c8273d317ab908d4873a32086dbd5f78a2b2d07b7ed79975841a2cadea6'),
('sites/all/modules/views/modules/node/views_handler_field_node.inc', '99a0ef52b68e8913eb3563d5c47097c09e46c6493fcb006f383c6f6798edb7fc'),
('sites/all/modules/views/modules/node/views_handler_field_node_link.inc', '26d8309a3a9140682d7d90e4d16ff664a3d7ce662af6ccbf75dc4c493515d7d9'),
('sites/all/modules/views/modules/node/views_handler_field_node_link_delete.inc', '3eeed8c9ffc088ee28b8ffaa5e2b084db24284acc4d1b2e69f90c96cc889016d'),
('sites/all/modules/views/modules/node/views_handler_field_node_link_edit.inc', '28f8c3b7d3d60c31fec3cdf81c84cfbb20f492220457694a0e150c3ddee030c0'),
('sites/all/modules/views/modules/node/views_handler_field_node_path.inc', 'f392fde21e434fd40fc672546ef684780179d91827350ba9c348bb1cc5924727'),
('sites/all/modules/views/modules/node/views_handler_field_node_revision.inc', '3f510d58acaa8f844292b86c388cb1e78eac8c732bb5e7c9e92439c425710240'),
('sites/all/modules/views/modules/node/views_handler_field_node_revision_link.inc', 'ace72f296cf4a4da4b7dd7b303532aebf93b6b1c18a5d30b51b65738475e3889'),
('sites/all/modules/views/modules/node/views_handler_field_node_revision_link_delete.inc', '0a36602f080c4ef2bb5cb7dbddc5533deab7743c2fbf3bd88b9e478432cac7fb'),
('sites/all/modules/views/modules/node/views_handler_field_node_revision_link_revert.inc', '80ddc7f0c001fde9af491bb22d6044b85324fe90bea611fc3822408fd60008fa'),
('sites/all/modules/views/modules/node/views_handler_field_node_type.inc', 'f8f39c6f238f837270d1b2e42e67bf9ab400a37fe24246c8b86dfcfacc1c4fd9'),
('sites/all/modules/views/modules/node/views_handler_field_node_version_count.inc', '1298f7f7ee4b6e6e2957b266fbb7c63e102b9d7e9ccca8d5a86592736bce9493'),
('sites/all/modules/views/modules/node/views_handler_filter_history_user_timestamp.inc', '2970f270e071cad079880e9598d9f7b71d4dd2a2a42a31cd4489029a3cafe158'),
('sites/all/modules/views/modules/node/views_handler_filter_node_access.inc', 'ca625167c8928f1c5b354c27c120ed9b19c1df665dc3b02ed6d96b58194d6243'),
('sites/all/modules/views/modules/node/views_handler_filter_node_status.inc', 'f7099a59d3f237f2870ecb6b0b5e49dd9d785b1085e94baf55687251e7f3231b'),
('sites/all/modules/views/modules/node/views_handler_filter_node_type.inc', '6842082e7b6e131d6e002e627e6b4490b93ca6ffe7fc0b158d31843217c8c929'),
('sites/all/modules/views/modules/node/views_handler_filter_node_uid_revision.inc', '2cfe9ba95e5ea8c240a57cfa1bed58385cbfed0c7f35e3d8c4da6d873b5a61fa'),
('sites/all/modules/views/modules/node/views_handler_filter_node_version_count.inc', 'de61f3547604e5905486cdae5f5e94d1a45bdac4d3c43157193dd6fe0dd6473c'),
('sites/all/modules/views/modules/node/views_handler_sort_node_version_count.inc', 'ce2a392319ebed3dbb2b660f3d6f4c6690b1cd46cf6b1c01802f12158114c4c4'),
('sites/all/modules/views/modules/node/views_plugin_argument_default_node.inc', '7fb79c8f4adb9bcef7c7da4bf4046fe3490e16c244f6ab96fdca97a8567315ff'),
('sites/all/modules/views/modules/node/views_plugin_argument_validate_node.inc', 'f10d3f4081eed5ca32c41b67e9a0e6f35b2f8ba2cd7897230cb5a680b410a6de'),
('sites/all/modules/views/modules/node/views_plugin_row_node_rss.inc', '1e55454684102fad08c947695c370a890a22ea22c3c9aca3207f2299aa3daf7e'),
('sites/all/modules/views/modules/node/views_plugin_row_node_view.inc', 'da4f4c0394cda00feda8a755535cebd71e29575f026c700e9f9f8a19a73525cb'),
('sites/all/modules/views/modules/profile/views_handler_field_profile_date.inc', 'e206509ef8b592e602e005f6e3fa5ba8ef7222bdb5bacd0aaeea898c4001e9b0'),
('sites/all/modules/views/modules/profile/views_handler_field_profile_list.inc', 'da5fa527ab4bb6a1ff44cc2f9cec91cf3b094670f9e6e3884e1fedce714afe6f'),
('sites/all/modules/views/modules/profile/views_handler_filter_profile_selection.inc', '758dea53760a1b655986c33d21345ac396ad41d10ddf39dd16bc7d8c68e72da7'),
('sites/all/modules/views/modules/search/views_handler_argument_search.inc', '9de18defd5d9320b6333dc496627657be1dd8ccb145dfc136a80f1bcee6e1f55'),
('sites/all/modules/views/modules/search/views_handler_field_search_score.inc', '711af637c864b775672d9f6203fc2da0902ed17404181d1117b400012aac366f'),
('sites/all/modules/views/modules/search/views_handler_filter_search.inc', 'aa2ae23905b84b77ee6042f8f26542eedd7422bdd7518255a289db7da0f6400b'),
('sites/all/modules/views/modules/search/views_handler_sort_search_score.inc', '9d23dd6c464d486266749106caec1d10cec2da1cc3ae5f907f39056c46badbdf'),
('sites/all/modules/views/modules/search/views_plugin_row_search_view.inc', 'bc25864154d4df0a58bc1ac1148581c76df36267a1d18f8caee2e3e1233c8286'),
('sites/all/modules/views/modules/statistics/views_handler_field_accesslog_path.inc', '7843e5f4b35f4322d673b5646e840c274f7d747f2c60c4d4e9c47e282e6db37d'),
('sites/all/modules/views/modules/statistics/views_handler_field_node_counter_timestamp.inc', 'a1de51345d268dc0f080104ff9ae4c9ca1f7a2dd45560a59630b2bb03bdc54c9'),
('sites/all/modules/views/modules/statistics/views_handler_field_statistics_numeric.inc', 'b46b6b14e14631941ac2dc9baf0b1290c148f42801f05cb419f84a2091d03e40'),
('sites/all/modules/views/modules/system/views_handler_argument_file_fid.inc', 'e9bf1fdf12f210f0a77774381b670c77ee88e7789971ce732b254f6be5a0e451'),
('sites/all/modules/views/modules/system/views_handler_field_file.inc', '0fff4adb471c0c164a78f507b035a68d41f404ab10535f06f6c11206f39a7681'),
('sites/all/modules/views/modules/system/views_handler_field_file_extension.inc', '768aa56198c7e82327391084f5dd27d7efdb8179ff6b8c941f892fe30469a0da'),
('sites/all/modules/views/modules/system/views_handler_field_file_filemime.inc', 'bdd7f1255f3000f7f2900341d4c4ca378244b96390ef52a30db2962d017b61a4'),
('sites/all/modules/views/modules/system/views_handler_field_file_status.inc', 'bfb0b9d796a4dbf95c4bb7a3deef7724bcda9e0d9067939b74ec787da934f2b0'),
('sites/all/modules/views/modules/system/views_handler_field_file_uri.inc', '350d7dde27ee97cb4279360374eb8633ce7fee115a109346bea85c2c4e3a68c2'),
('sites/all/modules/views/modules/system/views_handler_filter_file_status.inc', '9210a34795f9db36974525e718c91c03c28554da1199932791925d7c4a2f3b11'),
('sites/all/modules/views/modules/system/views_handler_filter_system_type.inc', 'd27513703a75c4d8af79b489266cf4102a36e350c3d90404dab24403ab637205'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_taxonomy.inc', '8962fa76f1e03316932468b0fd805817af94726beb82bf9f4786e0c709264662'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid.inc', 'e50f47ac64a93c2a43b6bd940119dee46b9f25f79f5d25a93fd0df7d707c93ab'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth.inc', '5b2806fbad4a6cc104e733a3a0faf6eb1c19975930c67c4149fb3267976e0b7d'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_join.inc', 'ca667646f99645c00e6dfb7eb52e2f54faf848be41c99af5caf2201dcd56926b'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc', 'd85ebe68290239b25fc240451655b825325854e9707cf742fbd75de81e0f1aa7'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc', '888647527bec3444b2d0a571a77900396d7c5e884bca04a2a3667a61f6377b5e'),
('sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_vid.inc', 'bf4be783ef6899f004f4dbd06c1bf2cd6dbc322678c825eec36bee81d667e81f'),
('sites/all/modules/views/modules/taxonomy/views_handler_field_taxonomy.inc', 'fcafbbf79b79829eff211aa69580aa746b6d21a29416758bd43e25b5433f9a02'),
('sites/all/modules/views/modules/taxonomy/views_handler_field_term_link_edit.inc', '3da63f6feb1fa3312853b54585d761d037dac8841b4c06e01e35463c9098064a'),
('sites/all/modules/views/modules/taxonomy/views_handler_field_term_node_tid.inc', 'd7bb6f685b85de9f9cc87500b3e5a07493832f032d826e20700bbd1baa020a61'),
('sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid.inc', 'e4f0c9ac3292e083976eb16913b0c011939e729dbee479c0f9070656c492de7d'),
('sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid_depth.inc', '0b05ec052dcc03081e20338808dda17beb0bdf869b0cfc1375ca96cfb758c22a'),
('sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid_depth_join.inc', '76d59ca83bdcb40493055829a9132646ed89478d7eb6e468db2d879e66e3794c'),
('sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc', 'f1787b436b914cfe5ca6f2575d4c0595f4f496795711d6e8a116a39986728b0a'),
('sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_vid.inc', '2a4d7dfbb6b795d217e2617595238f552bbea04b80217c933f1ee9978ceb7a0e'),
('sites/all/modules/views/modules/taxonomy/views_handler_relationship_node_term_data.inc', '0bfd4c7882054565fb4ff52cf5697fe8cffca69d24717ebc37e6eacc14fe2312'),
('sites/all/modules/views/modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc', 'fc4c3ace525162fc922de581af0710c7d92dc355e9630040a29a5c3a6ab7f9af'),
('sites/all/modules/views/modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc', '8a9d828e5e4387d831172a5c658fac8ef584d843be6c95e9b4e357af6c8f97de'),
('sites/all/modules/views/modules/tracker/views_handler_argument_tracker_comment_user_uid.inc', '91f5b7e9537942eee7a1798906f772cb9806eebfdc201c54fcdecf027cd71d0f'),
('sites/all/modules/views/modules/tracker/views_handler_filter_tracker_boolean_operator.inc', '5efea908902052d68141017b6f29f17381e7bb8ebb6d88245471926f0a552207'),
('sites/all/modules/views/modules/tracker/views_handler_filter_tracker_comment_user_uid.inc', '05e07f74d1e3978afd4c80a9b4bd72444872b84a44949a512f1d3040ce28421c'),
('sites/all/modules/views/modules/translation/views_handler_argument_node_tnid.inc', 'b0e3c87d3790cfa2e265f3d9700f2b3c2857932aa4b6e003e5d0114fc1b4d499'),
('sites/all/modules/views/modules/translation/views_handler_field_node_link_translate.inc', '27a1ac81b50d4807d9a1eff4c5dc8929e4472f9d363f70f5391a794db73424a2'),
('sites/all/modules/views/modules/translation/views_handler_field_node_translation_link.inc', '641ff25cd317bb803de2ace4bd23e8c5f5af5ba4ac38aab7be2fdc58fbb9e86a'),
('sites/all/modules/views/modules/translation/views_handler_filter_node_tnid.inc', '0942fd793740e3aec032a1abb7132f53788a9cdeaeb3d931cac908ac30b73950'),
('sites/all/modules/views/modules/translation/views_handler_filter_node_tnid_child.inc', '2a7a96d6caa4a99996549be0457bf40fa619731543a636d4573e55c190c64c7a'),
('sites/all/modules/views/modules/translation/views_handler_relationship_translation.inc', '9137c85f5ca309d4ee0d3243c470563a5853f5926b8cbd3e843438d4308c9516'),
('sites/all/modules/views/modules/user/views_handler_argument_users_roles_rid.inc', '72da80e7f3c6980da024d86f37ba3721021cc1ead2cfcc1ab9b27897b7b5077a'),
('sites/all/modules/views/modules/user/views_handler_argument_user_uid.inc', 'a4af1bdc1ec5e40587c22c14e839980050baaa346c9d5934ef3f01794932cdc5'),
('sites/all/modules/views/modules/user/views_handler_field_user.inc', '1a2141524e43d86b52c7828fe6df61dd603ad433743c1139cfc5cc28ccb5ce74');
INSERT INTO `registry_file` (`filename`, `hash`) VALUES
('sites/all/modules/views/modules/user/views_handler_field_user_language.inc', '5a3da9e08ebeebbcb5abc6a9b16e0d380c5bb5c57b608afb540a3ca6dc1b2959'),
('sites/all/modules/views/modules/user/views_handler_field_user_link.inc', '5a0f35d5305a29816658385ecbd804bf43c92d4b3629fbe4bd9b8d0e9574b6ff'),
('sites/all/modules/views/modules/user/views_handler_field_user_link_cancel.inc', 'b865881b15ce86b5a00f2892d3fc62f40131417527211275ff9a3d09d485750b'),
('sites/all/modules/views/modules/user/views_handler_field_user_link_edit.inc', '5d7c1155d9eccbd6b07c7446fe2b6a8848d6a500f508ac3779f16df56816f92b'),
('sites/all/modules/views/modules/user/views_handler_field_user_mail.inc', 'b7355b704f19322afb4876cea27744367e20098d4ed973e480bf2baf1ddd111c'),
('sites/all/modules/views/modules/user/views_handler_field_user_name.inc', '3be11e273d7a0e8d1e1406b94ba651a6f545f9d48d94758495449b68487f4426'),
('sites/all/modules/views/modules/user/views_handler_field_user_permissions.inc', 'ec37373524bf23ae107adda6b825570c550e6654c0f0956409fc58df2c860903'),
('sites/all/modules/views/modules/user/views_handler_field_user_picture.inc', '0103d136a91fb219fd981801301b7df00adf90617900ded08efbf6d7df04959b'),
('sites/all/modules/views/modules/user/views_handler_field_user_roles.inc', 'ab5068c4f01a05c6511f7d4b973a77650d5b5c481d4a73f63b7a9b1ef9c0d138'),
('sites/all/modules/views/modules/user/views_handler_filter_user_current.inc', '7f70b7e3b3c10e75d95f54afc9c2fe2f1af9b7a9eab2308d2961b2588dc05845'),
('sites/all/modules/views/modules/user/views_handler_filter_user_name.inc', '5225e5d89051313e0e49ea833709bb4dc44369afeee970b0cfaf1818ababa22c'),
('sites/all/modules/views/modules/user/views_handler_filter_user_permissions.inc', 'a72e8d02c1075cebfee33e5b046460eef9193b2a7c1d47ff130457e4485b6fe5'),
('sites/all/modules/views/modules/user/views_handler_filter_user_roles.inc', '3bb69fbc4e352ce8e4840ec78bdd0f1f29e8709097ce6b29cc2fedd2c74c023e'),
('sites/all/modules/views/modules/user/views_plugin_argument_default_current_user.inc', '11e729115350deffe46ebfe3a55281fa169a90e38a76c3a9d98f26c87900a22b'),
('sites/all/modules/views/modules/user/views_plugin_argument_default_user.inc', 'fe567f009a8e20f402f104b157fd44c04d6bd886a39b2f3355104f644f905419'),
('sites/all/modules/views/modules/user/views_plugin_argument_validate_user.inc', '40d623b0a678fa7c292da92582f06449d0396341ab161069f0fe8d1086ab95da'),
('sites/all/modules/views/modules/user/views_plugin_row_user_view.inc', '6a6c1bfac677eb9ffd25870cd72939c903f2c92d6d18e3abc6c634ac153e5c2b'),
('sites/all/modules/views/plugins/export_ui/views_ui.class.php', '8cd921da4fc00f0441808c6d521fa9fdfc753976244518a001a6354975eb6fe8'),
('sites/all/modules/views/plugins/views_plugin_access.inc', 'cc16bf7dc4c10eab382e948cfd91902ac1055514b627e3c50932376d3e3f1b91'),
('sites/all/modules/views/plugins/views_plugin_access_none.inc', '8e0a6b706c60abf63ab84d8624567ca12a5b80ad293e4334790065fbe6fa14d4'),
('sites/all/modules/views/plugins/views_plugin_access_perm.inc', '1807a9c91485a5abd3fb2f6590ed4bc185fdabe308db37b169be8abdfc30cab2'),
('sites/all/modules/views/plugins/views_plugin_access_role.inc', '8784836ea87ec6b0974125ed95ed6bbf6fdf91624f496f22c28e9229c695068d'),
('sites/all/modules/views/plugins/views_plugin_argument_default.inc', '43e593760f0e8f031f2e7b861385caa5e39f37de400fe4595925288c78f52f23'),
('sites/all/modules/views/plugins/views_plugin_argument_default_fixed.inc', 'daaa3b59b54cbb11e411e010303f67a51348bb97a4e06997b475f4c41e91c4e0'),
('sites/all/modules/views/plugins/views_plugin_argument_default_php.inc', '7a133b603294bfe498bfdeb50fade0b6e3cf8862270376067d86f69e7dc50eb8'),
('sites/all/modules/views/plugins/views_plugin_argument_default_raw.inc', '4318e0dfa56f167183453cf8cd913f3b7ee539b77a096507905e36db12ded97e'),
('sites/all/modules/views/plugins/views_plugin_argument_validate.inc', '2ada4fdc59b366f33209c0cfc515b06e765b487091760cfa22e94ca1c028c9cb'),
('sites/all/modules/views/plugins/views_plugin_argument_validate_numeric.inc', 'c050d3b5723dbfdca9ad312c7fa198e509c626057b95eed326820ce733dd9730'),
('sites/all/modules/views/plugins/views_plugin_argument_validate_php.inc', '56a09922081a5e368d5796907727e35cbf43b0d634e53f947990c8a42d5b5f3e'),
('sites/all/modules/views/plugins/views_plugin_cache.inc', '870ceb5dd920212f4297849046e696b50dbe35a9ad4ac28b7021a7dd03aa64d9'),
('sites/all/modules/views/plugins/views_plugin_cache_none.inc', 'a0d0ba252e1e2b65350c7ce648b97364726fa8ded5a366bfcce30c62daee4450'),
('sites/all/modules/views/plugins/views_plugin_cache_time.inc', 'fb55f3236b30f00f3ca5228c40115444a0e2f164a4f54e6fe07dee514e183569'),
('sites/all/modules/views/plugins/views_plugin_display.inc', '622d738d83feb6643ade6fff427003a741b47943ac226f2e069f8f221ca3755f'),
('sites/all/modules/views/plugins/views_plugin_display_attachment.inc', '6124e2ec51eadd7500fb878c25d9c5044b4ae9b6323dbbaa40b4806b69dd4cc0'),
('sites/all/modules/views/plugins/views_plugin_display_block.inc', '7ad6a90efa396f68276e93e19a6273c88782d514c1f1cea6ed0b046287e16a10'),
('sites/all/modules/views/plugins/views_plugin_display_default.inc', '91c6554d8f41f848bf30093d44d076051c54e998f6b50bdc2a922bfeeef9c54d'),
('sites/all/modules/views/plugins/views_plugin_display_embed.inc', '5424f2ea9e031faade7a562b8013aea193db5b0bc1be92b97bd7967de0d7bfff'),
('sites/all/modules/views/plugins/views_plugin_display_extender.inc', '75fb9f80e7f153715b911690c7140f251df588e6a541fab5881fbfafc0bbf778'),
('sites/all/modules/views/plugins/views_plugin_display_feed.inc', 'f2fb6152e12da300b9bb8e1b45621dfe921c3ce0e769970ee1532e32a3657c53'),
('sites/all/modules/views/plugins/views_plugin_display_page.inc', 'ece0ae5d5d730ef646178b09bc41a59e091c96a6ac3b3db5bdb9e61d194787bb'),
('sites/all/modules/views/plugins/views_plugin_exposed_form.inc', '0632ce61b4e39f8c0f39866987e4908657020298520fcf7c2712c0135e77d95b'),
('sites/all/modules/views/plugins/views_plugin_exposed_form_basic.inc', 'c736e1862b393e15ecc80deb58663405a1d68c2db07eb620d8e640406876cd17'),
('sites/all/modules/views/plugins/views_plugin_exposed_form_input_required.inc', '98b81e3b78f7242dd30a3754830bdde2fb1dfe8f002ae0daa06976f1bb64fa75'),
('sites/all/modules/views/plugins/views_plugin_localization.inc', 'd7239cc693994dcd069c1f1e7847a7902c5bd29b8d64a93cdf37c602576661fb'),
('sites/all/modules/views/plugins/views_plugin_localization_core.inc', 'f0900c0640e7c779e9b876223ea395f613c8fe8449f6c8eb5d060e2d54a6afcc'),
('sites/all/modules/views/plugins/views_plugin_localization_none.inc', '4930c3a13ddc0df3065f4920a836ffdc933b037e1337764e6687d7311f49dd8a'),
('sites/all/modules/views/plugins/views_plugin_pager.inc', 'd7c32e38f149e9009e175395dff2b00ec429867653c7535301b705a7cc69d9ed'),
('sites/all/modules/views/plugins/views_plugin_pager_full.inc', '1e76a7225c505e9badc896f2db5832b903bbce976f1e7cf30192f7c068dc9660'),
('sites/all/modules/views/plugins/views_plugin_pager_mini.inc', '0a9d101d5a4217fb888c643bfddd7bf7f2f9c0937faa2753a31452a5ee68190b'),
('sites/all/modules/views/plugins/views_plugin_pager_none.inc', '822cab1ada25f4902a0505f13db86886061d2ced655438b33b197d031ccceddd'),
('sites/all/modules/views/plugins/views_plugin_pager_some.inc', 'bc6aa7cbf1bc09374eced33334195c8897e4078336b8306d02d71c7aaaa22c99'),
('sites/all/modules/views/plugins/views_plugin_query.inc', '475a7ff0d4c7c7e27d7971ebd909a87bdb8322c47d6023b68f50f6fe6a1ec059'),
('sites/all/modules/views/plugins/views_plugin_query_default.inc', 'd5f89543721a3cd24f6a18114c630f741d11029d933f1b01d59f349219b747d6'),
('sites/all/modules/views/plugins/views_plugin_row.inc', '3ca81529526b930cfb0dda202757f203649236b90441e3c035bb79cd419ee2a6'),
('sites/all/modules/views/plugins/views_plugin_row_fields.inc', '875fb2868cdbcc5f7af03098cbe55b9bb91ef512e5e52ccde89f7a02a0c5fbe2'),
('sites/all/modules/views/plugins/views_plugin_row_rss_fields.inc', '62f4a0ceef14aec9958ee8b98d352303f10818ddc66031814cc8b9d21752ade9'),
('sites/all/modules/views/plugins/views_plugin_style.inc', '1ac358d216da612e1731d6b1c730d2ee57ccb8cdd31ad768ae97af542325244f'),
('sites/all/modules/views/plugins/views_plugin_style_default.inc', 'bf411e635d2fd9e09eb245b43581a0a7b670359180ccb042d42a5e579bbe9c30'),
('sites/all/modules/views/plugins/views_plugin_style_grid.inc', '35094b7f644b7e0692c9026b6b6b4c4c864c37fcdedef04b359dd2bdba496a47'),
('sites/all/modules/views/plugins/views_plugin_style_jump_menu.inc', '53a438d8a5398877eacdbff97f3b0c418ebc2fa16e69efd5e4a31b0b986e03a3'),
('sites/all/modules/views/plugins/views_plugin_style_list.inc', '407b928d2c74a91903b681088bccce926d2268d0a9a6a34c185a4849dc0d7e31'),
('sites/all/modules/views/plugins/views_plugin_style_mapping.inc', 'a6b430a148dda1b07ecee314b897c1da41ce375566adf50ee23ae1da822fddf3'),
('sites/all/modules/views/plugins/views_plugin_style_rss.inc', 'ac72d530faffee78a1695a0b3893528ceb8451f18be0521c580485904a5ba57b'),
('sites/all/modules/views/plugins/views_plugin_style_summary.inc', '872df59f8f389eaf9b019e82d859dd198d31166e26a9102132e3932c7f1f2916'),
('sites/all/modules/views/plugins/views_plugin_style_summary_jump_menu.inc', '2ec0d225824ee65b6bb61317979e1dabe2be524a66ab19da924c6949dd31af3b'),
('sites/all/modules/views/plugins/views_plugin_style_summary_unformatted.inc', 'c1e6f9dd1d75e29fee271171440d2182e633a1dbbc996cb186f637ff7ad93ed9'),
('sites/all/modules/views/plugins/views_plugin_style_table.inc', '0cbcc5d256a13953fbd3e5966a33d2426d5c3bd8c228ef370daebf2f428e693c'),
('sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'd8325414c8ddde5c955a5cfb053b77478bb4d73cb2f7d75b857b082bc5a1e12d'),
('sites/all/modules/views/plugins/views_wizard/views_ui_comment_views_wizard.class.php', '585a8e885a18d4d2dee260859492eb332d70166abf2d201777ebf0d2083d2ebe'),
('sites/all/modules/views/plugins/views_wizard/views_ui_file_managed_views_wizard.class.php', '5734fb564ba9e2485cfa5d4a49f0c76f65a9be357b78e769ee4af92c4ef9e22a'),
('sites/all/modules/views/plugins/views_wizard/views_ui_node_revision_views_wizard.class.php', '6faf9ef92501a4f1aeaf86bcff9edaeb47bd7526ba50d06b841c9366149e7725'),
('sites/all/modules/views/plugins/views_wizard/views_ui_node_views_wizard.class.php', 'f10e588fcfe2dc37d0df1c520c3cd797b85d6f729335606b1aa11fcb5884e6eb'),
('sites/all/modules/views/plugins/views_wizard/views_ui_taxonomy_term_views_wizard.class.php', '87d72dba2aef587994307cb287b638a409d148911e4b90109798ecacf5a721e7'),
('sites/all/modules/views/plugins/views_wizard/views_ui_users_views_wizard.class.php', 'f9fe2fb1ee87a1871e6ad32bad61b2457313f24da1bd5423977ced12de542919'),
('sites/all/modules/views/tests/comment/views_handler_argument_comment_user_uid.test', 'b8b417ef0e05806a88bd7d5e2f7dcb41339fbf5b66f39311defc9fb65476d561'),
('sites/all/modules/views/tests/comment/views_handler_filter_comment_user_uid.test', '347c6ffd4383706dbde844235aaf31cff44a22e95d2e6d8ef4da34a41b70edd1'),
('sites/all/modules/views/tests/field/views_fieldapi.test', '53e6d57c2d1d6cd0cd92e15ca4077ba532214daf41e9c7c0f940c7c8dbd86a66'),
('sites/all/modules/views/tests/handlers/views_handlers.test', 'f94dd3c4ba0bb1ffbf42704f600b94a808c1202a9ca26e7bdef8e7921c2724e9'),
('sites/all/modules/views/tests/handlers/views_handler_area_text.test', 'af74a74a3357567b844606add76d7ca1271317778dd7bd245a216cf963c738b4'),
('sites/all/modules/views/tests/handlers/views_handler_argument_null.test', '1d174e1f467b905d67217bd755100d78ffeca4aa4ada5c4be40270cd6d30b721'),
('sites/all/modules/views/tests/handlers/views_handler_argument_string.test', '3d0213af0041146abb61dcdc750869ed773d0ac80cfa74ffbadfdd03b1f11c52'),
('sites/all/modules/views/tests/handlers/views_handler_field.test', 'af552bf825ab77486b3d0d156779b7c4806ce5a983c6116ad68b633daf9bb927'),
('sites/all/modules/views/tests/handlers/views_handler_field_boolean.test', 'd334b12a850f36b41fe89ab30a9d758fd3ce434286bd136404344b7b288460ae'),
('sites/all/modules/views/tests/handlers/views_handler_field_counter.test', '75b31942adf06b107f5ffd3c97545fde8cd1040b1d00f682e3c7c1320026e26c'),
('sites/all/modules/views/tests/handlers/views_handler_field_custom.test', '1446bc3d5a6b1180a79edfa46a5268dbf7f089836aa3bc45df00ddaff9dd0ce1'),
('sites/all/modules/views/tests/handlers/views_handler_field_date.test', '02df76a93a42d6131957748b1e69254835f9e44a47dafca1e833914e6b7f88a0'),
('sites/all/modules/views/tests/handlers/views_handler_field_file_extension.test', '606ca091ad7e5709f7653324aaa021484d1f0e07e8639b3f0f7c26d3cfdee53c'),
('sites/all/modules/views/tests/handlers/views_handler_field_file_size.test', '49184db68af398a54e81c8a76261acd861da8fd7846b9d51dcf476d61396bfb9'),
('sites/all/modules/views/tests/handlers/views_handler_field_math.test', '6e39e4f782e6b36151ceafb41a5509f7c661be79b393b24f6f5496d724535887'),
('sites/all/modules/views/tests/handlers/views_handler_field_url.test', 'b41f762a71594b438a2e60a79c8260ba54e6305635725b0747e29f0d3ffe08c9'),
('sites/all/modules/views/tests/handlers/views_handler_field_xss.test', 'f129ee16c03f84673e33990cbb2da5aa88c362f46e9ba1620b2a842ffd1c9cd2'),
('sites/all/modules/views/tests/handlers/views_handler_filter_combine.test', '05842d83a11822afe7d566835f5db9f0f94fdb27ddfc388d38138767bdf36f8b'),
('sites/all/modules/views/tests/handlers/views_handler_filter_date.test', 'ad2ca901c6a4ac3a82fc349a33826f043c6c80f773f40374be2e95acb39491e3'),
('sites/all/modules/views/tests/handlers/views_handler_filter_equality.test', 'c88f21c9cbf1aae83393b26616908f8020c18fe378d76256c7ba192df2ec17af'),
('sites/all/modules/views/tests/handlers/views_handler_filter_in_operator.test', '89420a4071677232e0eb82b184b37b818a82bdb2ff90a8b21293f9ecb21808bf'),
('sites/all/modules/views/tests/handlers/views_handler_filter_numeric.test', '35ac7a34e696b979e86ef7209b6697098d9abe218e30a02cc4fe39fb11f2a852'),
('sites/all/modules/views/tests/handlers/views_handler_filter_string.test', 'b7d090780748faad478e619fd55673d746d4a0cf343d9e40ea96881324c34cbd'),
('sites/all/modules/views/tests/handlers/views_handler_sort.test', 'f4ff79e6bc54e83c4eb2777811f33702b7e9fe7416ef70ae00d100fa54d44fec'),
('sites/all/modules/views/tests/handlers/views_handler_sort_date.test', 'f548584d7c6a71cabd3ce07e04053a38df3f3e1685210ce8114238fd05344c10'),
('sites/all/modules/views/tests/handlers/views_handler_sort_random.test', '4fdba9bf05a26720ffa97e7a37da65ddc9044bd2832f8c89007b82feb062f182'),
('sites/all/modules/views/tests/node/views_node_revision_relations.test', '9467497a6d693615b48c8f57611a850002317bcb091b926d2efbbe56a4e61480'),
('sites/all/modules/views/tests/plugins/views_plugin_display.test', '4a6b136543a60999604c54125fa9d4f5aa61a5dcc71e2133d89325d81bc0fc2d'),
('sites/all/modules/views/tests/styles/views_plugin_style.test', '92d9a02f87f07d091999b961045b1dd654165059d8d1931b5c2ea1d88d0b439f'),
('sites/all/modules/views/tests/styles/views_plugin_style_base.test', '54fb7816d18416d8b0db67e9f55aa2aa50ac204eb9311be14b6700b7d7a95ae7'),
('sites/all/modules/views/tests/styles/views_plugin_style_jump_menu.test', 'b88baa8aebe183943a6e4cf2df314fef13ac41b5844cd5fa4aa91557dd624895'),
('sites/all/modules/views/tests/styles/views_plugin_style_mapping.test', 'a4e68bc8cfbeff4a1d9b8085fd115bfe7a8c4b84c049573fa0409b0dc8c2f053'),
('sites/all/modules/views/tests/styles/views_plugin_style_unformatted.test', '033ca29d41af47cd7bd12d50fea6c956dde247202ebda9df7f637111481bb51d'),
('sites/all/modules/views/tests/taxonomy/views_handler_relationship_node_term_data.test', '6074f5c7ae63225ea0cd26626ace6c017740e226f4d3c234e39869c31308223d'),
('sites/all/modules/views/tests/test_handlers/views_test_area_access.inc', '619e39bc4535976865b96751535d0d5aac4a7a87c1d47cb6d4c4bb9c9fa74716'),
('sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_dynamic.inc', '6a3ce8c256b84734b6b67a893ab24465a5f62d7bdf9ab5d22082a31849346b7d'),
('sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_static.inc', 'e345e42d443cfa73db0ed2be61291117ebd57b86196cdb77c6f440e93443def3'),
('sites/all/modules/views/tests/test_plugins/views_test_plugin_style_test_mapping.inc', '0b2c68626105bd5f6b9074022a37c3d09d3a6bd70b811bb26d5eacad6d74546f'),
('sites/all/modules/views/tests/user/views_handler_field_user_name.test', '69641b6da26d8daee9a2ceb2d0df56668bf09b86db1d4071c275b6e8d0885f9e'),
('sites/all/modules/views/tests/user/views_user.test', 'fbb63b42a0b7051bd4d33cf36841f39d7cc13a63b0554eca431b2a08c19facae'),
('sites/all/modules/views/tests/user/views_user_argument_default.test', '6423f2db7673763991b1fd0c452a7d84413c7dd888ca6c95545fadc531cfaaf4'),
('sites/all/modules/views/tests/user/views_user_argument_validate.test', 'c88c9e5d162958f8924849758486a0d83822ada06088f5cf71bfbe76932d8d84'),
('sites/all/modules/views/tests/views_access.test', 'f8b9d04b43c09a67ec722290a30408c1df8c163cf6e5863b41468bb4e381ee6f'),
('sites/all/modules/views/tests/views_ajax.test', '3d0675fcbf3766a902cce6ecc240eee90abb516055c6e48f4ce996a245aa6990'),
('sites/all/modules/views/tests/views_analyze.test', '5548e36c99bb626209d63e5cddbc31f49ad83865c983d2662c6826b328d24ffb'),
('sites/all/modules/views/tests/views_argument_default.test', '5950937aae4608bba5b86f366ef3a56cc6518bbccfeaeacda79fa13246d220e4'),
('sites/all/modules/views/tests/views_argument_validator.test', '31f8f49946c8aa3b03d6d9a2281bdfb11c54071b28e83fb3e827ca6ff5e38c88'),
('sites/all/modules/views/tests/views_basic.test', '655bd33983f84bbea68a3f24bfab545d2c02f36a478566edf35a98a58ff0c6cf'),
('sites/all/modules/views/tests/views_cache.test', '4e9b8ae1d9e72a9eaee95f5083004316d2199617f7d6c8f4bea40e99d17efcd8'),
('sites/all/modules/views/tests/views_exposed_form.test', '6962c7ed8a38030ec1cfa94485de07ceb1f9393216985bd8bfecac768f6c0950'),
('sites/all/modules/views/tests/views_glossary.test', '118d50177a68a6f88e3727e10f8bcc6f95176282cc42fbd604458eeb932a36e8'),
('sites/all/modules/views/tests/views_groupby.test', 'f26ad6857dc4821a4a0780642bda05fcb69ed506968e521f759bb28be4080143'),
('sites/all/modules/views/tests/views_handlers.test', 'a696e3d6b1748da03a04ac532f403700d07c920b9c405c628a6c94ea6764f501'),
('sites/all/modules/views/tests/views_module.test', '5137e27449639d3e02f1b27206ef3ff96957546333b517318dfe8f58239dc860'),
('sites/all/modules/views/tests/views_pager.test', '6f448c8c13c5177afb35103119d6281958a2d6dbdfb96ae5f4ee77cb3b44adc5'),
('sites/all/modules/views/tests/views_plugin_localization_test.inc', 'baedcf6c7381f9c5d3a5062f7d256f96808d06e04b6e73eff8e791e5f5293f45'),
('sites/all/modules/views/tests/views_query.test', 'f8cb1649e43c8a2b036fec742e86b8eb9c2c4c095a4c4e7a7c3ca13c6ce8e6e6'),
('sites/all/modules/views/tests/views_test.views_default.inc', '26af8e24116f5357aca33b3f581b20014e7032ceee4872d25598e17fb3ab9fc7'),
('sites/all/modules/views/tests/views_translatable.test', '6899c7b09ab72c262480cf78d200ecddfb683e8f2495438a55b35ae0e103a1b3'),
('sites/all/modules/views/tests/views_ui.test', 'f9687a363d7cc2828739583e3eedeb68c99acd505ff4e3036c806a42b93a2688'),
('sites/all/modules/views/tests/views_upgrade.test', 'c48bd74b85809dd78d963e525e38f3b6dd7e12aa249f73bd6a20247a40d6713a'),
('sites/all/modules/views/tests/views_view.test', 'cb4c8b7f14de8836d4c6705161547cbf6383de649642972d61c8dc18048265d5'),
('sites/all/modules/views_slideshow/views_slideshow_plugin_style_slideshow.inc', 'ebece9df829a44c71f7043d3b972f706d9f05d6d0f548b03c3c0eec39c2902d1');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `rid` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user roles.';

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`rid`, `name`, `weight`) VALUES
(3, 'administrator', 2),
(1, 'anonymous user', 0),
(2, 'authenticated user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `rid` int(10) UNSIGNED NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`rid`, `permission`, `module`) VALUES
(1, 'access comments', 'comment'),
(1, 'access content', 'node'),
(1, 'use text format filtered_html', 'filter'),
(2, 'access comments', 'comment'),
(2, 'access content', 'node'),
(2, 'post comments', 'comment'),
(2, 'skip comment approval', 'comment'),
(2, 'use text format filtered_html', 'filter'),
(3, 'access administration menu', 'admin_menu'),
(3, 'access administration pages', 'system'),
(3, 'access all views', 'views'),
(3, 'access comments', 'comment'),
(3, 'access content', 'node'),
(3, 'access content overview', 'node'),
(3, 'access contextual links', 'contextual'),
(3, 'access dashboard', 'dashboard'),
(3, 'access overlay', 'overlay'),
(3, 'access resource comment', 'restws'),
(3, 'access resource file', 'restws'),
(3, 'access resource node', 'restws'),
(3, 'access resource taxonomy_term', 'restws'),
(3, 'access resource taxonomy_vocabulary', 'restws'),
(3, 'access resource user', 'restws'),
(3, 'access site in maintenance mode', 'system'),
(3, 'access site reports', 'system'),
(3, 'access toolbar', 'toolbar'),
(3, 'access user profiles', 'user'),
(3, 'administer actions', 'system'),
(3, 'administer blocks', 'block'),
(3, 'administer ckeditor', 'ckeditor'),
(3, 'administer comments', 'comment'),
(3, 'administer content types', 'node'),
(3, 'administer fields', 'field'),
(3, 'administer filters', 'filter'),
(3, 'administer flexslider', 'flexslider'),
(3, 'administer image styles', 'image'),
(3, 'administer login destination settings', 'login_destination'),
(3, 'administer menu', 'menu'),
(3, 'administer modules', 'system'),
(3, 'administer nodes', 'node'),
(3, 'administer pathauto', 'pathauto'),
(3, 'administer permissions', 'user'),
(3, 'administer roles for menu', 'roles_for_menu'),
(3, 'administer search', 'search'),
(3, 'administer services', 'services'),
(3, 'administer shortcuts', 'shortcut'),
(3, 'administer site configuration', 'system'),
(3, 'administer software updates', 'system'),
(3, 'administer taxonomy', 'taxonomy'),
(3, 'administer themes', 'system'),
(3, 'administer url aliases', 'path'),
(3, 'administer users', 'user'),
(3, 'administer views', 'views'),
(3, 'block IP addresses', 'system'),
(3, 'bypass node access', 'node'),
(3, 'cancel account', 'user'),
(3, 'change own username', 'user'),
(3, 'create article content', 'node'),
(3, 'create page content', 'node'),
(3, 'create url aliases', 'path'),
(3, 'customize ckeditor', 'ckeditor'),
(3, 'customize shortcut links', 'shortcut'),
(3, 'delete any article content', 'node'),
(3, 'delete any page content', 'node'),
(3, 'delete own article content', 'node'),
(3, 'delete own page content', 'node'),
(3, 'delete revisions', 'node'),
(3, 'delete terms in 1', 'taxonomy'),
(3, 'display drupal links', 'admin_menu'),
(3, 'edit any article content', 'node'),
(3, 'edit any page content', 'node'),
(3, 'edit own article content', 'node'),
(3, 'edit own comments', 'comment'),
(3, 'edit own page content', 'node'),
(3, 'edit terms in 1', 'taxonomy'),
(3, 'flush caches', 'admin_menu'),
(3, 'get a system variable', 'services'),
(3, 'get any binary files', 'services'),
(3, 'get own binary files', 'services'),
(3, 'notify of path changes', 'pathauto'),
(3, 'perform unlimited index queries', 'services'),
(3, 'post comments', 'comment'),
(3, 'revert revisions', 'node'),
(3, 'save file information', 'services'),
(3, 'search content', 'search'),
(3, 'select account cancellation method', 'user'),
(3, 'set a system variable', 'services'),
(3, 'skip comment approval', 'comment'),
(3, 'switch shortcut sets', 'shortcut'),
(3, 'use advanced search', 'search'),
(3, 'use ctools import', 'ctools'),
(3, 'use PHP for settings', 'php'),
(3, 'use text format filtered_html', 'filter'),
(3, 'use text format full_html', 'filter'),
(3, 'use text format phpcode', 'filter'),
(3, 'view own unpublished content', 'node'),
(3, 'view revisions', 'node'),
(3, 'view the administration theme', 'system');

-- --------------------------------------------------------

--
-- Table structure for table `search_dataset`
--

CREATE TABLE `search_dataset` (
  `sid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Set to force node reindexing.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items that will be searched.';

--
-- Dumping data for table `search_dataset`
--

INSERT INTO `search_dataset` (`sid`, `type`, `data`, `reindex`) VALUES
(1, 'node', ' miri marriott resort spa india up noida ', 0),
(2, 'node', ' dragon boat festival america us wasington ', 0),
(3, 'node', ' about us ', 0),
(4, 'node', ' banner1 ', 0),
(5, 'node', ' banner 2 ', 0),
(6, 'node', ' book early and be rewarded america up noida ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the search index, associating words, items and...';

--
-- Dumping data for table `search_index`
--

INSERT INTO `search_index` (`word`, `sid`, `type`, `score`) VALUES
('2', 5, 'node', 26),
('about', 3, 'node', 26),
('america', 2, 'node', 11),
('america', 6, 'node', 11),
('and', 6, 'node', 26),
('banner', 5, 'node', 26),
('banner1', 4, 'node', 26),
('boat', 2, 'node', 26),
('book', 6, 'node', 26),
('dragon', 2, 'node', 26),
('early', 6, 'node', 26),
('festival', 2, 'node', 26),
('india', 1, 'node', 11),
('marriott', 1, 'node', 26),
('miri', 1, 'node', 26),
('noida', 1, 'node', 11),
('noida', 6, 'node', 11),
('resort', 1, 'node', 26),
('rewarded', 6, 'node', 26),
('spa', 1, 'node', 26),
('wasington', 2, 'node', 11);

-- --------------------------------------------------------

--
-- Table structure for table `search_node_links`
--

CREATE TABLE `search_node_links` (
  `sid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid that this item links to.',
  `caption` longtext COMMENT 'The text used to link to the node.nid.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items (like nodes) that link to other nodes, used...';

-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores search totals for words.';

--
-- Dumping data for table `search_total`
--

INSERT INTO `search_total` (`word`, `count`) VALUES
('2', 0.0163904),
('about', 0.0163904),
('america', 0.0193052),
('and', 0.0163904),
('banner', 0.0163904),
('banner1', 0.0163904),
('boat', 0.0163904),
('book', 0.0163904),
('dragon', 0.0163904),
('early', 0.0163904),
('festival', 0.0163904),
('india', 0.0377886),
('marriott', 0.0163904),
('miri', 0.0163904),
('noida', 0.0193052),
('resort', 0.0163904),
('rewarded', 0.0163904),
('spa', 0.0163904),
('wasington', 0.0377886);

-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for holding semaphores, locks, flags, etc. that...';

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `value` int(10) UNSIGNED NOT NULL COMMENT 'The value of the sequence.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores IDs.';

--
-- Dumping data for table `sequences`
--

INSERT INTO `sequences` (`value`) VALUES
(12);

-- --------------------------------------------------------

--
-- Table structure for table `services_endpoint`
--

CREATE TABLE `services_endpoint` (
  `eid` int(10) UNSIGNED NOT NULL COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the endpoint.',
  `server` varchar(32) NOT NULL COMMENT 'The name of the server used in this endpoint.',
  `path` varchar(255) NOT NULL COMMENT 'The path to the endpoint for this server.',
  `authentication` longtext NOT NULL COMMENT 'The authentication settings for the endpoint.',
  `server_settings` longblob NOT NULL COMMENT 'The server settings for the endpoint.',
  `resources` longtext NOT NULL COMMENT 'Information about the resources exposed in this endpoint.',
  `debug` int(11) NOT NULL DEFAULT '0' COMMENT 'Set the endpoint in debug mode.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores endpoint information for services';

--
-- Dumping data for table `services_endpoint`
--

INSERT INTO `services_endpoint` (`eid`, `name`, `server`, `path`, `authentication`, `server_settings`, `resources`, `debug`) VALUES
(1, 'api', 'rest_server', 'api', 'a:0:{}', 0x613a323a7b733a31303a22666f726d617474657273223b613a353a7b733a343a226a736f6e223b623a313b733a373a2262656e636f6465223b623a303b733a353a226a736f6e70223b623a303b733a333a22706870223b623a303b733a333a22786d6c223b623a303b7d733a373a2270617273657273223b613a353a7b733a31363a226170706c69636174696f6e2f6a736f6e223b623a313b733a33333a226170706c69636174696f6e2f782d7777772d666f726d2d75726c656e636f646564223b623a303b733a31353a226170706c69636174696f6e2f786d6c223b623a303b733a31393a226d756c7469706172742f666f726d2d64617461223b623a303b733a383a22746578742f786d6c223b623a303b7d7d, 'a:3:{s:6:\"create\";a:1:{s:7:\"actions\";a:1:{s:4:\"data\";a:1:{s:7:\"enabled\";s:1:\"1\";}}}s:4:\"node\";a:3:{s:10:\"operations\";a:5:{s:8:\"retrieve\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:6:\"create\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:6:\"update\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:6:\"delete\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:5:\"index\";a:1:{s:7:\"enabled\";s:1:\"1\";}}s:13:\"relationships\";a:2:{s:5:\"files\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:8:\"comments\";a:1:{s:7:\"enabled\";s:1:\"1\";}}s:16:\"targeted_actions\";a:1:{s:11:\"attach_file\";a:1:{s:7:\"enabled\";s:1:\"1\";}}}s:4:\"user\";a:3:{s:10:\"operations\";a:5:{s:8:\"retrieve\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:6:\"create\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:6:\"update\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:6:\"delete\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:5:\"index\";a:1:{s:7:\"enabled\";s:1:\"1\";}}s:7:\"actions\";a:6:{s:5:\"login\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"settings\";a:1:{s:8:\"services\";a:1:{s:20:\"resource_api_version\";s:3:\"1.0\";}}}s:6:\"logout\";a:2:{s:7:\"enabled\";s:1:\"1\";s:8:\"settings\";a:1:{s:8:\"services\";a:1:{s:20:\"resource_api_version\";s:3:\"1.0\";}}}s:5:\"token\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:20:\"request_new_password\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:15:\"user_pass_reset\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:8:\"register\";a:1:{s:7:\"enabled\";s:1:\"1\";}}s:16:\"targeted_actions\";a:3:{s:6:\"cancel\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:14:\"password_reset\";a:1:{s:7:\"enabled\";s:1:\"1\";}s:20:\"resend_welcome_email\";a:1:{s:7:\"enabled\";s:1:\"1\";}}}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `services_user`
--

CREATE TABLE `services_user` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT 'User id that has been created by Drupal',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently created by services.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the user was most recently updated by services.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users created/updated by services.';

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drupal’s session handlers read and write into the...';

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`uid`, `sid`, `ssid`, `hostname`, `timestamp`, `cache`, `session`) VALUES
(1, 'g2rfk7N-i3lnjVQyGFOS-nU73UryfNj9fdmaXP9jx6E', '', '::1', 1534959443, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set`
--

CREATE TABLE `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';

--
-- Dumping data for table `shortcut_set`
--

INSERT INTO `shortcut_set` (`set_name`, `title`) VALUES
('shortcut-set-1', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set_users`
--

CREATE TABLE `shortcut_set_users` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the item; e.g. node.',
  `type` varchar(12) NOT NULL DEFAULT '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of all modules, themes, and theme engines that are...';

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, -1, 0, 0x613a31343a7b733a343a226e616d65223b733a31303a2241676772656761746f72223b733a31313a226465736372697074696f6e223b733a35373a22416767726567617465732073796e6469636174656420636f6e74656e7420285253532c205244462c20616e642041746f6d206665656473292e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a2261676772656761746f722e74657374223b7d733a393a22636f6e666967757265223b733a34313a2261646d696e2f636f6e6669672f73657276696365732f61676772656761746f722f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31343a2261676772656761746f722e637373223b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/aggregator/tests/aggregator_test.module', 'aggregator_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32333a2241676772656761746f72206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a34363a22537570706f7274206d6f64756c6520666f722061676772656761746f722072656c617465642074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/block/block.module', 'block', 'module', '', 1, 0, 7009, -5, 0x613a31333a7b733a343a226e616d65223b733a353a22426c6f636b223b733a31313a226465736372697074696f6e223b733a3134303a22436f6e74726f6c73207468652076697375616c206275696c64696e6720626c6f636b732061207061676520697320636f6e737472756374656420776974682e20426c6f636b732061726520626f786573206f6620636f6e74656e742072656e646572656420696e746f20616e20617265612c206f7220726567696f6e2c206f6620612077656220706167652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22626c6f636b2e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f626c6f636b223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/block/tests/block_test.module', 'block_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a22426c6f636b2074657374223b733a31313a226465736372697074696f6e223b733a32313a2250726f7669646573207465737420626c6f636b732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/blog/blog.module', 'blog', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a343a22426c6f67223b733a31313a226465736372697074696f6e223b733a32353a22456e61626c6573206d756c74692d7573657220626c6f67732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22626c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/book/book.module', 'book', 'module', '', 0, 0, -1, 0, 0x613a31343a7b733a343a226e616d65223b733a343a22426f6f6b223b733a31313a226465736372697074696f6e223b733a36363a22416c6c6f777320757365727320746f2063726561746520616e64206f7267616e697a652072656c6174656420636f6e74656e7420696e20616e206f75746c696e652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22626f6f6b2e74657374223b7d733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e74656e742f626f6f6b2f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22626f6f6b2e637373223b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/color/color.module', 'color', 'module', '', 1, 0, 7001, 0, 0x613a31323a7b733a343a226e616d65223b733a353a22436f6c6f72223b733a31313a226465736372697074696f6e223b733a37303a22416c6c6f77732061646d696e6973747261746f727320746f206368616e67652074686520636f6c6f7220736368656d65206f6620636f6d70617469626c65207468656d65732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22636f6c6f722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 7009, 0, 0x613a31343a7b733a343a226e616d65223b733a373a22436f6d6d656e74223b733a31313a226465736372697074696f6e223b733a35373a22416c6c6f777320757365727320746f20636f6d6d656e74206f6e20616e642064697363757373207075626c697368656420636f6e74656e742e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a2274657874223b7d733a353a2266696c6573223b613a323a7b693a303b733a31343a22636f6d6d656e742e6d6f64756c65223b693a313b733a31323a22636f6d6d656e742e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31313a22636f6d6d656e742e637373223b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/contact/contact.module', 'contact', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a373a22436f6e74616374223b733a31313a226465736372697074696f6e223b733a36313a22456e61626c65732074686520757365206f6620626f746820706572736f6e616c20616e6420736974652d7769646520636f6e7461637420666f726d732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22636f6e746163742e74657374223b7d733a393a22636f6e666967757265223b733a32333a2261646d696e2f7374727563747572652f636f6e74616374223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/contextual/contextual.module', 'contextual', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a22436f6e7465787475616c206c696e6b73223b733a31313a226465736372697074696f6e223b733a37353a2250726f766964657320636f6e7465787475616c206c696e6b7320746f20706572666f726d20616374696f6e732072656c6174656420746f20656c656d656e7473206f6e206120706167652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a22636f6e7465787475616c2e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/dashboard/dashboard.module', 'dashboard', 'module', '', 1, 0, 0, 0, 0x613a31333a7b733a343a226e616d65223b733a393a2244617368626f617264223b733a31313a226465736372697074696f6e223b733a3133363a2250726f766964657320612064617368626f617264207061676520696e207468652061646d696e69737472617469766520696e7465726661636520666f72206f7267616e697a696e672061646d696e697374726174697665207461736b7320616e6420747261636b696e6720696e666f726d6174696f6e2077697468696e20796f757220736974652e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a353a2266696c6573223b613a313a7b693a303b733a31343a2264617368626f6172642e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a22626c6f636b223b7d733a393a22636f6e666967757265223b733a32353a2261646d696e2f64617368626f6172642f637573746f6d697a65223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 1, 7003, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a224461746162617365206c6f6767696e67223b733a31313a226465736372697074696f6e223b733a34373a224c6f677320616e64207265636f7264732073797374656d206576656e747320746f207468652064617461626173652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a2264626c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/field.module', 'field', 'module', '', 1, 0, 7004, 0, 0x613a31343a7b733a343a226e616d65223b733a353a224669656c64223b733a31313a226465736372697074696f6e223b733a35373a224669656c642041504920746f20616464206669656c647320746f20656e746974696573206c696b65206e6f64657320616e642075736572732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a343a7b693a303b733a31323a226669656c642e6d6f64756c65223b693a313b733a31363a226669656c642e6174746163682e696e63223b693a323b733a32303a226669656c642e696e666f2e636c6173732e696e63223b693a333b733a31363a2274657374732f6669656c642e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31373a226669656c645f73716c5f73746f72616765223b7d733a383a227265717569726564223b623a313b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31353a227468656d652f6669656c642e637373223b733a32393a226d6f64756c65732f6669656c642f7468656d652f6669656c642e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/field_sql_storage/field_sql_storage.module', 'field_sql_storage', 'module', '', 1, 0, 7002, 0, 0x613a31333a7b733a343a226e616d65223b733a31373a224669656c642053514c2073746f72616765223b733a31313a226465736372697074696f6e223b733a33373a2253746f726573206669656c64206461746120696e20616e2053514c2064617461626173652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a32323a226669656c645f73716c5f73746f726167652e74657374223b7d733a383a227265717569726564223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/list/list.module', 'list', 'module', '', 1, 0, 7002, 0, 0x613a31323a7b733a343a226e616d65223b733a343a224c697374223b733a31313a226465736372697074696f6e223b733a36393a22446566696e6573206c697374206669656c642074797065732e205573652077697468204f7074696f6e7320746f206372656174652073656c656374696f6e206c697374732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a353a226669656c64223b693a313b733a373a226f7074696f6e73223b7d733a353a2266696c6573223b613a313a7b693a303b733a31353a2274657374732f6c6973742e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/list/tests/list_test.module', 'list_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a393a224c6973742074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220746865204c697374206d6f64756c652074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/number/number.module', 'number', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a363a224e756d626572223b733a31313a226465736372697074696f6e223b733a32383a22446566696e6573206e756d65726963206669656c642074797065732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31313a226e756d6265722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/options/options.module', 'options', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a373a224f7074696f6e73223b733a31313a226465736372697074696f6e223b733a38323a22446566696e65732073656c656374696f6e2c20636865636b20626f7820616e6420726164696f20627574746f6e207769646765747320666f72207465787420616e64206e756d65726963206669656c64732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31323a226f7074696f6e732e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field/modules/text/text.module', 'text', 'module', '', 1, 0, 7000, 0, 0x613a31343a7b733a343a226e616d65223b733a343a2254657874223b733a31313a226465736372697074696f6e223b733a33323a22446566696e65732073696d706c652074657874206669656c642074797065732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a393a22746578742e74657374223b7d733a383a227265717569726564223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a31313a226578706c616e6174696f6e223b733a38303a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f64727570616c2f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d),
('modules/field/tests/field_test.module', 'field_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31343a224669656c64204150492054657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220746865204669656c64204150492074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a353a2266696c6573223b613a313a7b693a303b733a32313a226669656c645f746573742e656e746974792e696e63223b7d733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/field_ui/field_ui.module', 'field_ui', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a383a224669656c64205549223b733a31313a226465736372697074696f6e223b733a33333a225573657220696e7465726661636520666f7220746865204669656c64204150492e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31333a226669656c645f75692e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/file/file.module', 'file', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a343a2246696c65223b733a31313a226465736372697074696f6e223b733a32363a22446566696e657320612066696c65206669656c6420747970652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31353a2274657374732f66696c652e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/file/tests/file_module_test.module', 'file_module_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a393a2246696c652074657374223b733a31313a226465736372697074696f6e223b733a35333a2250726f766964657320686f6f6b7320666f722074657374696e672046696c65206d6f64756c652066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 7010, 0, 0x613a31343a7b733a343a226e616d65223b733a363a2246696c746572223b733a31313a226465736372697074696f6e223b733a34333a2246696c7465727320636f6e74656e7420696e207072657061726174696f6e20666f7220646973706c61792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a2266696c7465722e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f636f6e74656e742f666f726d617473223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/forum/forum.module', 'forum', 'module', '', 0, 0, -1, 0, 0x613a31343a7b733a343a226e616d65223b733a353a22466f72756d223b733a31313a226465736372697074696f6e223b733a32373a2250726f76696465732064697363757373696f6e20666f72756d732e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227461786f6e6f6d79223b693a313b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22666f72756d2e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f666f72756d223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a393a22666f72756d2e637373223b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a343a2248656c70223b733a31313a226465736372697074696f6e223b733a33353a224d616e616765732074686520646973706c6179206f66206f6e6c696e652068656c702e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a2268656c702e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/image/image.module', 'image', 'module', '', 1, 0, 7005, 0, 0x613a31353a7b733a343a226e616d65223b733a353a22496d616765223b733a31313a226465736372697074696f6e223b733a33343a2250726f766964657320696d616765206d616e6970756c6174696f6e20746f6f6c732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a2266696c65223b7d733a353a2266696c6573223b613a313a7b693a303b733a31303a22696d6167652e74657374223b7d733a393a22636f6e666967757265223b733a33313a2261646d696e2f636f6e6669672f6d656469612f696d6167652d7374796c6573223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a383a227265717569726564223b623a313b733a31313a226578706c616e6174696f6e223b733a38303a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f64727570616c2f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d),
('modules/image/tests/image_module_test.module', 'image_module_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a22496d6167652074657374223b733a31313a226465736372697074696f6e223b733a36393a2250726f766964657320686f6f6b20696d706c656d656e746174696f6e7320666f722074657374696e6720496d616765206d6f64756c652066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32343a22696d6167655f6d6f64756c655f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/locale/locale.module', 'locale', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a363a224c6f63616c65223b733a31313a226465736372697074696f6e223b733a3131393a2241646473206c616e67756167652068616e646c696e672066756e6374696f6e616c69747920616e6420656e61626c657320746865207472616e736c6174696f6e206f6620746865207573657220696e7465726661636520746f206c616e677561676573206f74686572207468616e20456e676c6973682e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a226c6f63616c652e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f636f6e6669672f726567696f6e616c2f6c616e6775616765223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/locale/tests/locale_test.module', 'locale_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a224c6f63616c652054657374223b733a31313a226465736372697074696f6e223b733a34323a22537570706f7274206d6f64756c6520666f7220746865206c6f63616c65206c617965722074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 7003, 0, 0x613a31333a7b733a343a226e616d65223b733a343a224d656e75223b733a31313a226465736372697074696f6e223b733a36303a22416c6c6f77732061646d696e6973747261746f727320746f20637573746f6d697a65207468652073697465206e617669676174696f6e206d656e752e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a226d656e752e74657374223b7d733a393a22636f6e666967757265223b733a32303a2261646d696e2f7374727563747572652f6d656e75223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/node/node.module', 'node', 'module', '', 1, 0, 7016, 0, 0x613a31353a7b733a343a226e616d65223b733a343a224e6f6465223b733a31313a226465736372697074696f6e223b733a36363a22416c6c6f777320636f6e74656e7420746f206265207375626d697474656420746f20746865207369746520616e6420646973706c61796564206f6e2070616765732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31313a226e6f64652e6d6f64756c65223b693a313b733a393a226e6f64652e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f7479706573223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a226e6f64652e637373223b733a32313a226d6f64756c65732f6e6f64652f6e6f64652e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/node/tests/node_access_test.module', 'node_access_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32343a224e6f6465206d6f64756c6520616363657373207465737473223b733a31313a226465736372697074696f6e223b733a34333a22537570706f7274206d6f64756c6520666f72206e6f6465207065726d697373696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/node/tests/node_test.module', 'node_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31373a224e6f6465206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72206e6f64652072656c617465642074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/node/tests/node_test_exception.module', 'node_test_exception', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32373a224e6f6465206d6f64756c6520657863657074696f6e207465737473223b733a31313a226465736372697074696f6e223b733a35303a22537570706f7274206d6f64756c6520666f72206e6f64652072656c6174656420657863657074696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/openid/openid.module', 'openid', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a363a224f70656e4944223b733a31313a226465736372697074696f6e223b733a34383a22416c6c6f777320757365727320746f206c6f6720696e746f20796f75722073697465207573696e67204f70656e49442e223b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a227061636b616765223b733a343a22436f7265223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a226f70656e69642e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/openid/tests/openid_test.module', 'openid_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32313a224f70656e49442064756d6d792070726f7669646572223b733a31313a226465736372697074696f6e223b733a33333a224f70656e49442070726f7669646572207573656420666f722074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a226f70656e6964223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/overlay/overlay.module', 'overlay', 'module', '', 0, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a373a224f7665726c6179223b733a31313a226465736372697074696f6e223b733a35393a22446973706c617973207468652044727570616c2061646d696e697374726174696f6e20696e7465726661636520696e20616e206f7665726c61792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/path/path.module', 'path', 'module', '', 1, 0, 0, 0, 0x613a31333a7b733a343a226e616d65223b733a343a2250617468223b733a31313a226465736372697074696f6e223b733a32383a22416c6c6f777320757365727320746f2072656e616d652055524c732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22706174682e74657374223b7d733a393a22636f6e666967757265223b733a32343a2261646d696e2f636f6e6669672f7365617263682f70617468223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/php/php.module', 'php', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a225048502066696c746572223b733a31313a226465736372697074696f6e223b733a35303a22416c6c6f777320656d6265646465642050485020636f64652f736e69707065747320746f206265206576616c75617465642e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a383a227068702e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/poll/poll.module', 'poll', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a343a22506f6c6c223b733a31313a226465736372697074696f6e223b733a39353a22416c6c6f777320796f7572207369746520746f206361707475726520766f746573206f6e20646966666572656e7420746f7069637320696e2074686520666f726d206f66206d756c7469706c652063686f696365207175657374696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22706f6c6c2e74657374223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22706f6c6c2e637373223b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/profile/profile.module', 'profile', 'module', '', 0, 0, -1, 0, 0x613a31343a7b733a343a226e616d65223b733a373a2250726f66696c65223b733a31313a226465736372697074696f6e223b733a33363a22537570706f72747320636f6e666967757261626c6520757365722070726f66696c65732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a2270726f66696c652e74657374223b7d733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e6669672f70656f706c652f70726f66696c65223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/rdf/rdf.module', 'rdf', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a333a22524446223b733a31313a226465736372697074696f6e223b733a3134383a22456e72696368657320796f757220636f6e74656e742077697468206d6574616461746120746f206c6574206f74686572206170706c69636174696f6e732028652e672e2073656172636820656e67696e65732c2061676772656761746f7273292062657474657220756e6465727374616e64206974732072656c6174696f6e736869707320616e6420617474726962757465732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a383a227264662e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/rdf/tests/rdf_test.module', 'rdf_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31363a22524446206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a33383a22537570706f7274206d6f64756c6520666f7220524446206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a22626c6f67223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/search/search.module', 'search', 'module', '', 1, 0, 7000, 0, 0x613a31343a7b733a343a226e616d65223b733a363a22536561726368223b733a31313a226465736372697074696f6e223b733a33363a22456e61626c657320736974652d77696465206b6579776f726420736561726368696e672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31393a227365617263682e657874656e6465722e696e63223b693a313b733a31313a227365617263682e74657374223b7d733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f7365617263682f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a227365617263682e637373223b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/search/tests/search_embedded_form.module', 'search_embedded_form', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32303a2253656172636820656d62656464656420666f726d223b733a31313a226465736372697074696f6e223b733a35393a22537570706f7274206d6f64756c6520666f7220736561726368206d6f64756c652074657374696e67206f6620656d62656464656420666f726d732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/search/tests/search_extra_type.module', 'search_extra_type', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31363a2254657374207365617263682074797065223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220736561726368206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/search/tests/search_node_tags.module', 'search_node_tags', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32313a225465737420736561726368206e6f64652074616773223b733a31313a226465736372697074696f6e223b733a34343a22537570706f7274206d6f64756c6520666f72204e6f64652073656172636820746167732074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/shortcut/shortcut.module', 'shortcut', 'module', '', 1, 0, 0, 0, 0x613a31333a7b733a343a226e616d65223b733a383a2253686f7274637574223b733a31313a226465736372697074696f6e223b733a36303a22416c6c6f777320757365727320746f206d616e61676520637573746f6d697a61626c65206c69737473206f662073686f7274637574206c696e6b732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31333a2273686f72746375742e74657374223b7d733a393a22636f6e666967757265223b733a33363a2261646d696e2f636f6e6669672f757365722d696e746572666163652f73686f7274637574223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('modules/simpletest/simpletest.module', 'simpletest', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a373a2254657374696e67223b733a31313a226465736372697074696f6e223b733a35333a2250726f76696465732061206672616d65776f726b20666f7220756e697420616e642066756e6374696f6e616c2074657374696e672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a35303a7b693a303b733a31353a2273696d706c65746573742e74657374223b693a313b733a32343a2264727570616c5f7765625f746573745f636173652e706870223b693a323b733a31383a2274657374732f616374696f6e732e74657374223b693a333b733a31353a2274657374732f616a61782e74657374223b693a343b733a31363a2274657374732f62617463682e74657374223b693a353b733a31353a2274657374732f626f6f742e74657374223b693a363b733a32303a2274657374732f626f6f7473747261702e74657374223b693a373b733a31363a2274657374732f63616368652e74657374223b693a383b733a31373a2274657374732f636f6d6d6f6e2e74657374223b693a393b733a32343a2274657374732f64617461626173655f746573742e74657374223b693a31303b733a32323a2274657374732f656e746974795f637275642e74657374223b693a31313b733a33323a2274657374732f656e746974795f637275645f686f6f6b5f746573742e74657374223b693a31323b733a32333a2274657374732f656e746974795f71756572792e74657374223b693a31333b733a31363a2274657374732f6572726f722e74657374223b693a31343b733a31353a2274657374732f66696c652e74657374223b693a31353b733a32333a2274657374732f66696c657472616e736665722e74657374223b693a31363b733a31353a2274657374732f666f726d2e74657374223b693a31373b733a31363a2274657374732f67726170682e74657374223b693a31383b733a31363a2274657374732f696d6167652e74657374223b693a31393b733a31353a2274657374732f6c6f636b2e74657374223b693a32303b733a31353a2274657374732f6d61696c2e74657374223b693a32313b733a31353a2274657374732f6d656e752e74657374223b693a32323b733a31373a2274657374732f6d6f64756c652e74657374223b693a32333b733a31363a2274657374732f70616765722e74657374223b693a32343b733a31393a2274657374732f70617373776f72642e74657374223b693a32353b733a31353a2274657374732f706174682e74657374223b693a32363b733a31393a2274657374732f72656769737472792e74657374223b693a32373b733a31373a2274657374732f736368656d612e74657374223b693a32383b733a31383a2274657374732f73657373696f6e2e74657374223b693a32393b733a32303a2274657374732f7461626c65736f72742e74657374223b693a33303b733a31363a2274657374732f7468656d652e74657374223b693a33313b733a31383a2274657374732f756e69636f64652e74657374223b693a33323b733a31373a2274657374732f7570646174652e74657374223b693a33333b733a31373a2274657374732f786d6c7270632e74657374223b693a33343b733a32363a2274657374732f757067726164652f757067726164652e74657374223b693a33353b733a33343a2274657374732f757067726164652f757067726164652e636f6d6d656e742e74657374223b693a33363b733a33333a2274657374732f757067726164652f757067726164652e66696c7465722e74657374223b693a33373b733a33323a2274657374732f757067726164652f757067726164652e666f72756d2e74657374223b693a33383b733a33333a2274657374732f757067726164652f757067726164652e6c6f63616c652e74657374223b693a33393b733a33313a2274657374732f757067726164652f757067726164652e6d656e752e74657374223b693a34303b733a33313a2274657374732f757067726164652f757067726164652e6e6f64652e74657374223b693a34313b733a33353a2274657374732f757067726164652f757067726164652e7461786f6e6f6d792e74657374223b693a34323b733a33343a2274657374732f757067726164652f757067726164652e747269676765722e74657374223b693a34333b733a33393a2274657374732f757067726164652f757067726164652e7472616e736c617461626c652e74657374223b693a34343b733a33333a2274657374732f757067726164652f757067726164652e75706c6f61642e74657374223b693a34353b733a33313a2274657374732f757067726164652f757067726164652e757365722e74657374223b693a34363b733a33363a2274657374732f757067726164652f7570646174652e61676772656761746f722e74657374223b693a34373b733a33333a2274657374732f757067726164652f7570646174652e747269676765722e74657374223b693a34383b733a33313a2274657374732f757067726164652f7570646174652e6669656c642e74657374223b693a34393b733a33303a2274657374732f757067726164652f7570646174652e757365722e74657374223b7d733a393a22636f6e666967757265223b733a34313a2261646d696e2f636f6e6669672f646576656c6f706d656e742f74657374696e672f73657474696e6773223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/actions_loop_test.module', 'actions_loop_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31373a22416374696f6e73206c6f6f702074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220616374696f6e206c6f6f702074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/ajax_forms_test.module', 'ajax_forms_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32363a22414a415820666f726d2074657374206d6f636b206d6f64756c65223b733a31313a226465736372697074696f6e223b733a32353a225465737420666f7220414a415820666f726d2063616c6c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/ajax_test.module', 'ajax_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a393a22414a41582054657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f7220414a4158206672616d65776f726b2074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/batch_test.module', 'batch_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31343a224261746368204150492074657374223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72204261746368204150492074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/boot_test_1.module', 'boot_test_1', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32313a224561726c7920626f6f747374726170207465737473223b733a31313a226465736372697074696f6e223b733a33393a224120737570706f7274206d6f64756c6520666f7220686f6f6b5f626f6f742074657374696e672e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/boot_test_2.module', 'boot_test_2', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32313a224561726c7920626f6f747374726170207465737473223b733a31313a226465736372697074696f6e223b733a34343a224120737570706f7274206d6f64756c6520666f7220686f6f6b5f626f6f7420686f6f6b2074657374696e672e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/common_test.module', 'common_test', 'module', '', 0, 0, -1, 0, 0x613a31343a7b733a343a226e616d65223b733a31313a22436f6d6d6f6e2054657374223b733a31313a226465736372697074696f6e223b733a33323a22537570706f7274206d6f64756c6520666f7220436f6d6d6f6e2074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a31353a22636f6d6d6f6e5f746573742e637373223b733a34303a226d6f64756c65732f73696d706c65746573742f74657374732f636f6d6d6f6e5f746573742e637373223b7d733a353a227072696e74223b613a313a7b733a32313a22636f6d6d6f6e5f746573742e7072696e742e637373223b733a34363a226d6f64756c65732f73696d706c65746573742f74657374732f636f6d6d6f6e5f746573742e7072696e742e637373223b7d7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/common_test_cron_helper.module', 'common_test_cron_helper', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32333a22436f6d6d6f6e20546573742043726f6e2048656c706572223b733a31313a226465736372697074696f6e223b733a35363a2248656c706572206d6f64756c6520666f722043726f6e52756e54657374436173653a3a7465737443726f6e457863657074696f6e7328292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/database_test.module', 'database_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31333a2244617461626173652054657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72204461746162617365206c617965722074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/drupal_autoload_test/drupal_autoload_test.module', 'drupal_autoload_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32353a2244727570616c20636f64652072656769737472792074657374223b733a31313a226465736372697074696f6e223b733a34353a22537570706f7274206d6f64756c6520666f722074657374696e672074686520636f64652072656769737472792e223b733a353a2266696c6573223b613a323a7b693a303b733a33343a2264727570616c5f6175746f6c6f61645f746573745f696e746572666163652e696e63223b693a313b733a33303a2264727570616c5f6175746f6c6f61645f746573745f636c6173732e696e63223b7d733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/drupal_system_listing_compatible_test/drupal_system_listing_compatible_test.module', 'drupal_system_listing_compatible_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a33373a2244727570616c2073797374656d206c697374696e6720636f6d70617469626c652074657374223b733a31313a226465736372697074696f6e223b733a36323a22537570706f7274206d6f64756c6520666f722074657374696e67207468652064727570616c5f73797374656d5f6c697374696e672066756e6374696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/drupal_system_listing_incompatible_test/drupal_system_listing_incompatible_test.module', 'drupal_system_listing_incompatible_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a33393a2244727570616c2073797374656d206c697374696e6720696e636f6d70617469626c652074657374223b733a31313a226465736372697074696f6e223b733a36323a22537570706f7274206d6f64756c6520666f722074657374696e67207468652064727570616c5f73797374656d5f6c697374696e672066756e6374696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_cache_test.module', 'entity_cache_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31373a22456e746974792063616368652074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f722074657374696e6720656e746974792063616368652e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a32383a22656e746974795f63616368655f746573745f646570656e64656e6379223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_cache_test_dependency.module', 'entity_cache_test_dependency', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32383a22456e74697479206361636865207465737420646570656e64656e6379223b733a31313a226465736372697074696f6e223b733a35313a22537570706f727420646570656e64656e6379206d6f64756c6520666f722074657374696e6720656e746974792063616368652e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_crud_hook_test.module', 'entity_crud_hook_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32323a22456e74697479204352554420486f6f6b732054657374223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72204352554420686f6f6b2074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/entity_query_access_test.module', 'entity_query_access_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32343a22456e74697479207175657279206163636573732074657374223b733a31313a226465736372697074696f6e223b733a34393a22537570706f7274206d6f64756c6520666f7220636865636b696e6720656e7469747920717565727920726573756c74732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/error_test.module', 'error_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a224572726f722074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f72206572726f7220616e6420657863657074696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/file_test.module', 'file_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a393a2246696c652074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f722066696c652068616e646c696e672074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31363a2266696c655f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/filter_test.module', 'filter_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31383a2246696c7465722074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33333a2254657374732066696c74657220686f6f6b7320616e642066756e6374696f6e732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/form_test.module', 'form_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31323a22466f726d4150492054657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f7220466f726d204150492074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/image_test.module', 'image_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a22496d6167652074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220696d61676520746f6f6c6b69742074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/menu_test.module', 'menu_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a22486f6f6b206d656e75207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72206d656e7520686f6f6b2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/module_test.module', 'module_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a224d6f64756c652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f72206d6f64756c652073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/path_test.module', 'path_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a22486f6f6b2070617468207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72207061746820686f6f6b2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/psr_0_test/psr_0_test.module', 'psr_0_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31363a225053522d302054657374206361736573223b733a31313a226465736372697074696f6e223b733a34343a225465737420636c617373657320746f20626520646973636f76657265642062792073696d706c65746573742e223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/psr_4_test/psr_4_test.module', 'psr_4_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31363a225053522d342054657374206361736573223b733a31313a226465736372697074696f6e223b733a34343a225465737420636c617373657320746f20626520646973636f76657265642062792073696d706c65746573742e223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/requirements1_test.module', 'requirements1_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31393a22526571756972656d656e747320312054657374223b733a31313a226465736372697074696f6e223b733a38303a22546573747320746861742061206d6f64756c65206973206e6f7420696e7374616c6c6564207768656e206974206661696c7320686f6f6b5f726571756972656d656e74732827696e7374616c6c27292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/requirements2_test.module', 'requirements2_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31393a22526571756972656d656e747320322054657374223b733a31313a226465736372697074696f6e223b733a39383a22546573747320746861742061206d6f64756c65206973206e6f7420696e7374616c6c6564207768656e20746865206f6e6520697420646570656e6473206f6e206661696c7320686f6f6b5f726571756972656d656e74732827696e7374616c6c292e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31383a22726571756972656d656e7473315f74657374223b693a313b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/session_test.module', 'session_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31323a2253657373696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f722073657373696f6e20646174612074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_dependencies_test.module', 'system_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32323a2253797374656d20646570656e64656e63792074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31393a225f6d697373696e675f646570656e64656e6379223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_core_version_dependencies_test.module', 'system_incompatible_core_version_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a35303a2253797374656d20696e636f6d70617469626c6520636f72652076657273696f6e20646570656e64656e636965732074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a33373a2273797374656d5f696e636f6d70617469626c655f636f72655f76657273696f6e5f74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_core_version_test.module', 'system_incompatible_core_version_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a33373a2253797374656d20696e636f6d70617469626c6520636f72652076657273696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22352e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_module_version_dependencies_test.module', 'system_incompatible_module_version_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a35323a2253797374656d20696e636f6d70617469626c65206d6f64756c652076657273696f6e20646570656e64656e636965732074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a34363a2273797374656d5f696e636f6d70617469626c655f6d6f64756c655f76657273696f6e5f7465737420283e322e3029223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_incompatible_module_version_test.module', 'system_incompatible_module_version_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a33393a2253797374656d20696e636f6d70617469626c65206d6f64756c652076657273696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_project_namespace_test.module', 'system_project_namespace_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32393a2253797374656d2070726f6a656374206e616d6573706163652074657374223b733a31313a226465736372697074696f6e223b733a35383a22537570706f7274206d6f64756c6520666f722074657374696e672070726f6a656374206e616d65737061636520646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31333a2264727570616c3a66696c746572223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/system_test.module', 'system_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a2253797374656d2074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f722073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31383a2273797374656d5f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/taxonomy_test.module', 'taxonomy_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32303a225461786f6e6f6d792074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a34353a222254657374732066756e6374696f6e7320616e6420686f6f6b73206e6f74207573656420696e20636f7265222e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227461786f6e6f6d79223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/theme_test.module', 'theme_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a225468656d652074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72207468656d652073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_script_test.module', 'update_script_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31383a22557064617465207363726970742074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465207363726970742074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_test_1.module', 'update_test_1', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_test_2.module', 'update_test_2', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/update_test_3.module', 'update_test_3', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/url_alter_test.module', 'url_alter_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a2255726c5f616c746572207465737473223b733a31313a226465736372697074696f6e223b733a34353a224120737570706f7274206d6f64756c657320666f722075726c5f616c74657220686f6f6b2074657374696e672e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/simpletest/tests/xmlrpc_test.module', 'xmlrpc_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31323a22584d4c2d5250432054657374223b733a31313a226465736372697074696f6e223b733a37353a22537570706f7274206d6f64756c6520666f7220584d4c2d525043207465737473206163636f7264696e6720746f207468652076616c696461746f72312073706563696669636174696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a2253746174697374696373223b733a31313a226465736372697074696f6e223b733a33373a224c6f677320616363657373207374617469737469637320666f7220796f757220736974652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a22737461746973746963732e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f636f6e6669672f73797374656d2f73746174697374696373223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a363a225379736c6f67223b733a31313a226465736372697074696f6e223b733a34313a224c6f677320616e64207265636f7264732073797374656d206576656e747320746f207379736c6f672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a227379736c6f672e74657374223b7d733a393a22636f6e666967757265223b733a33323a2261646d696e2f636f6e6669672f646576656c6f706d656e742f6c6f6767696e67223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/system/system.module', 'system', 'module', '', 1, 0, 7081, 0, 0x613a31343a7b733a343a226e616d65223b733a363a2253797374656d223b733a31313a226465736372697074696f6e223b733a35343a2248616e646c65732067656e6572616c207369746520636f6e66696775726174696f6e20666f722061646d696e6973747261746f72732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a363a7b693a303b733a31393a2273797374656d2e61726368697665722e696e63223b693a313b733a31353a2273797374656d2e6d61696c2e696e63223b693a323b733a31363a2273797374656d2e71756575652e696e63223b693a333b733a31343a2273797374656d2e7461722e696e63223b693a343b733a31383a2273797374656d2e757064617465722e696e63223b693a353b733a31313a2273797374656d2e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a31393a2261646d696e2f636f6e6669672f73797374656d223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/system/tests/cron_queue_test.module', 'cron_queue_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a2243726f6e2051756575652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f72207468652063726f6e2071756575652072756e6e65722e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/system/tests/system_cron_test.module', 'system_cron_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31363a2253797374656d2043726f6e2054657374223b733a31313a226465736372697074696f6e223b733a34353a22537570706f7274206d6f64756c6520666f722074657374696e67207468652073797374656d5f63726f6e28292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 7011, 0, 0x613a31353a7b733a343a226e616d65223b733a383a225461786f6e6f6d79223b733a31313a226465736372697074696f6e223b733a33383a22456e61626c6573207468652063617465676f72697a6174696f6e206f6620636f6e74656e742e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a226f7074696f6e73223b7d733a353a2266696c6573223b613a323a7b693a303b733a31353a227461786f6e6f6d792e6d6f64756c65223b693a313b733a31333a227461786f6e6f6d792e74657374223b7d733a393a22636f6e666967757265223b733a32343a2261646d696e2f7374727563747572652f7461786f6e6f6d79223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a383a227265717569726564223b623a313b733a31313a226578706c616e6174696f6e223b733a38303a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f64727570616c2f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d),
('modules/toolbar/toolbar.module', 'toolbar', 'module', '', 0, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a373a22546f6f6c626172223b733a31313a226465736372697074696f6e223b733a39393a2250726f7669646573206120746f6f6c62617220746861742073686f77732074686520746f702d6c6576656c2061646d696e697374726174696f6e206d656e75206974656d7320616e64206c696e6b732066726f6d206f74686572206d6f64756c65732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a373a22547261636b6572223b733a31313a226465736372697074696f6e223b733a34353a22456e61626c657320747261636b696e67206f6620726563656e7420636f6e74656e7420666f722075736572732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22747261636b65722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/translation/tests/translation_test.module', 'translation_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32343a22436f6e74656e74205472616e736c6174696f6e2054657374223b733a31313a226465736372697074696f6e223b733a34393a22537570706f7274206d6f64756c6520666f722074686520636f6e74656e74207472616e736c6174696f6e2074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/translation/translation.module', 'translation', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31393a22436f6e74656e74207472616e736c6174696f6e223b733a31313a226465736372697074696f6e223b733a35373a22416c6c6f777320636f6e74656e7420746f206265207472616e736c6174656420696e746f20646966666572656e74206c616e6775616765732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a226c6f63616c65223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31363a227472616e736c6174696f6e2e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/trigger/tests/trigger_test.module', 'trigger_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31323a22547269676765722054657374223b733a31313a226465736372697074696f6e223b733a33333a22537570706f7274206d6f64756c6520666f7220547269676765722074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a373a2254726967676572223b733a31313a226465736372697074696f6e223b733a39303a22456e61626c657320616374696f6e7320746f206265206669726564206f6e206365727461696e2073797374656d206576656e74732c2073756368206173207768656e206e657720636f6e74656e7420697320637265617465642e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22747269676765722e74657374223b7d733a393a22636f6e666967757265223b733a32333a2261646d696e2f7374727563747572652f74726967676572223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/aaa_update_test.module', 'aaa_update_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a22414141205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/bbb_update_test.module', 'bbb_update_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a22424242205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/ccc_update_test.module', 'ccc_update_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31353a22434343205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/tests/update_test.module', 'update_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/update/update.module', 'update', 'module', '', 1, 0, 7001, 0, 0x613a31333a7b733a343a226e616d65223b733a31343a22557064617465206d616e61676572223b733a31313a226465736372697074696f6e223b733a3130343a22436865636b7320666f7220617661696c61626c6520757064617465732c20616e642063616e207365637572656c7920696e7374616c6c206f7220757064617465206d6f64756c657320616e64207468656d65732076696120612077656220696e746572666163652e223b733a373a2276657273696f6e223b733a343a22372e3539223b733a373a227061636b616765223b733a343a22436f7265223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a227570646174652e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f7265706f7274732f757064617465732f73657474696e6773223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('modules/user/tests/user_form_test.module', 'user_form_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32323a2255736572206d6f64756c6520666f726d207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72207573657220666f726d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('modules/user/user.module', 'user', 'module', '', 1, 0, 7019, 0, 0x613a31353a7b733a343a226e616d65223b733a343a2255736572223b733a31313a226465736372697074696f6e223b733a34373a224d616e6167657320746865207573657220726567697374726174696f6e20616e64206c6f67696e2073797374656d2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31313a22757365722e6d6f64756c65223b693a313b733a393a22757365722e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a31393a2261646d696e2f636f6e6669672f70656f706c65223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22757365722e637373223b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('profiles/standard/standard.profile', 'standard', 'module', '', 1, 0, 0, 1000, 0x613a31353a7b733a343a226e616d65223b733a383a225374616e64617264223b733a31313a226465736372697074696f6e223b733a35313a22496e7374616c6c207769746820636f6d6d6f6e6c792075736564206665617475726573207072652d636f6e666967757265642e223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a32313a7b693a303b733a353a22626c6f636b223b693a313b733a353a22636f6c6f72223b693a323b733a373a22636f6d6d656e74223b693a333b733a31303a22636f6e7465787475616c223b693a343b733a393a2264617368626f617264223b693a353b733a343a2268656c70223b693a363b733a353a22696d616765223b693a373b733a343a226c697374223b693a383b733a343a226d656e75223b693a393b733a363a226e756d626572223b693a31303b733a373a226f7074696f6e73223b693a31313b733a343a2270617468223b693a31323b733a383a227461786f6e6f6d79223b693a31333b733a353a2264626c6f67223b693a31343b733a363a22736561726368223b693a31353b733a383a2273686f7274637574223b693a31363b733a373a22746f6f6c626172223b693a31373b733a373a226f7665726c6179223b693a31383b733a383a226669656c645f7569223b693a31393b733a343a2266696c65223b693a32303b733a333a22726466223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a353a226d74696d65223b693a313532343639383438343b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b733a363a2268696464656e223b623a313b733a383a227265717569726564223b623a313b733a31373a22646973747269627574696f6e5f6e616d65223b733a363a2244727570616c223b7d),
('sites/all/modules/admin_menu/admin_devel/admin_devel.module', 'admin_devel', 'module', '', 1, 0, 0, 0, 0x613a31333a7b733a343a226e616d65223b733a33323a2241646d696e697374726174696f6e20446576656c6f706d656e7420746f6f6c73223b733a31313a226465736372697074696f6e223b733a37363a2241646d696e697374726174696f6e20616e6420646562756767696e672066756e6374696f6e616c69747920666f7220646576656c6f7065727320616e642073697465206275696c646572732e223b733a373a227061636b616765223b733a31343a2241646d696e697374726174696f6e223b733a343a22636f7265223b733a333a22372e78223b733a373a2273637269707473223b613a313a7b733a31343a2261646d696e5f646576656c2e6a73223b733a35353a2273697465732f616c6c2f6d6f64756c65732f61646d696e5f6d656e752f61646d696e5f646576656c2f61646d696e5f646576656c2e6a73223b7d733a373a2276657273696f6e223b733a31313a22372e782d332e302d726335223b733a373a2270726f6a656374223b733a31303a2261646d696e5f6d656e75223b733a393a22646174657374616d70223b733a31303a2231343139303239323834223b733a353a226d74696d65223b693a313431393035343438343b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/admin_menu/admin_menu.module', 'admin_menu', 'module', '', 1, 0, 7304, 100, 0x613a31333a7b733a343a226e616d65223b733a31393a2241646d696e697374726174696f6e206d656e75223b733a31313a226465736372697074696f6e223b733a3132333a2250726f766964657320612064726f70646f776e206d656e7520746f206d6f73742061646d696e697374726174697665207461736b7320616e64206f7468657220636f6d6d6f6e2064657374696e6174696f6e732028746f2075736572732077697468207468652070726f706572207065726d697373696f6e73292e223b733a373a227061636b616765223b733a31343a2241646d696e697374726174696f6e223b733a343a22636f7265223b733a333a22372e78223b733a393a22636f6e666967757265223b733a33383a2261646d696e2f636f6e6669672f61646d696e697374726174696f6e2f61646d696e5f6d656e75223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31343a2273797374656d20283e372e313029223b7d733a353a2266696c6573223b613a313a7b693a303b733a32313a2274657374732f61646d696e5f6d656e752e74657374223b7d733a373a2276657273696f6e223b733a31313a22372e782d332e302d726335223b733a373a2270726f6a656374223b733a31303a2261646d696e5f6d656e75223b733a393a22646174657374616d70223b733a31303a2231343139303239323834223b733a353a226d74696d65223b693a313431393035343438343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/admin_menu/admin_menu_toolbar/admin_menu_toolbar.module', 'admin_menu_toolbar', 'module', '', 1, 0, 6300, 101, 0x613a31323a7b733a343a226e616d65223b733a33333a2241646d696e697374726174696f6e206d656e7520546f6f6c626172207374796c65223b733a31313a226465736372697074696f6e223b733a31373a22412062657474657220546f6f6c6261722e223b733a373a227061636b616765223b733a31343a2241646d696e697374726174696f6e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31303a2261646d696e5f6d656e75223b7d733a373a2276657273696f6e223b733a31313a22372e782d332e302d726335223b733a373a2270726f6a656374223b733a31303a2261646d696e5f6d656e75223b733a393a22646174657374616d70223b733a31303a2231343139303239323834223b733a353a226d74696d65223b693a313431393035343438343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ckeditor/ckeditor.module', 'ckeditor', 'module', '', 1, 0, 7005, 0, 0x613a31333a7b733a343a226e616d65223b733a383a22434b456469746f72223b733a31313a226465736372697074696f6e223b733a37363a22456e61626c657320434b456469746f722028575953495759472048544d4c20656469746f722920666f722075736520696e7374656164206f6620706c61696e2074657874206669656c64732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31343a225573657220696e74657266616365223b733a393a22636f6e666967757265223b733a32393a2261646d696e2f636f6e6669672f636f6e74656e742f636b656469746f72223b733a353a2266696c6573223b613a313a7b693a303b733a31393a2274657374732f636b656469746f722e74657374223b7d733a373a2276657273696f6e223b733a383a22372e782d312e3138223b733a373a2270726f6a656374223b733a383a22636b656469746f72223b733a393a22646174657374616d70223b733a31303a2231343938353036323437223b733a353a226d74696d65223b693a313439383533313434383b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/bulk_export/bulk_export.module', 'bulk_export', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a2242756c6b204578706f7274223b733a31313a226465736372697074696f6e223b733a36373a22506572666f726d732062756c6b206578706f7274696e67206f662064617461206f626a65637473206b6e6f776e2061626f7574206279204368616f7320746f6f6c732e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/ctools.module', 'ctools', 'module', '', 1, 0, 7003, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a224368616f7320746f6f6c73223b733a31313a226465736372697074696f6e223b733a34363a2241206c696272617279206f662068656c7066756c20746f6f6c73206279204d65726c696e206f66204368616f732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a353a2266696c6573223b613a31343a7b693a303b733a32303a22696e636c756465732f636f6e746578742e696e63223b693a313b733a32323a22696e636c756465732f6373732d63616368652e696e63223b693a323b733a32323a22696e636c756465732f6d6174682d657870722e696e63223b693a333b733a32313a22696e636c756465732f7374796c697a65722e696e63223b693a343b733a31383a2274657374732f636f6e746578742e74657374223b693a353b733a31343a2274657374732f6373732e74657374223b693a363b733a32303a2274657374732f6373735f63616368652e74657374223b693a373b733a32353a2274657374732f63746f6f6c732e706c7567696e732e74657374223b693a383b733a31373a2274657374732f63746f6f6c732e74657374223b693a393b733a32363a2274657374732f6d6174685f65787072657373696f6e2e74657374223b693a31303b733a33323a2274657374732f6d6174685f65787072657373696f6e5f737461636b2e74657374223b693a31313b733a32333a2274657374732f6f626a6563745f63616368652e74657374223b693a31323b733a32383a2274657374732f6f626a6563745f63616368655f756e69742e74657374223b693a31333b733a32323a2274657374732f706167655f746f6b656e732e74657374223b7d733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/ctools_access_ruleset/ctools_access_ruleset.module', 'ctools_access_ruleset', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22437573746f6d2072756c6573657473223b733a31313a226465736372697074696f6e223b733a38313a2243726561746520637573746f6d2c206578706f727461626c652c207265757361626c65206163636573732072756c657365747320666f72206170706c69636174696f6e73206c696b652050616e656c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/ctools_ajax_sample/ctools_ajax_sample.module', 'ctools_ajax_sample', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33333a224368616f7320546f6f6c73202843546f6f6c732920414a4158204578616d706c65223b733a31313a226465736372697074696f6e223b733a34313a2253686f777320686f7720746f207573652074686520706f776572206f66204368616f7320414a41582e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434363b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/ctools_custom_content/ctools_custom_content.module', 'ctools_custom_content', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a22437573746f6d20636f6e74656e742070616e6573223b733a31313a226465736372697074696f6e223b733a37393a2243726561746520637573746f6d2c206578706f727461626c652c207265757361626c6520636f6e74656e742070616e657320666f72206170706c69636174696f6e73206c696b652050616e656c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/ctools_plugin_example/ctools_plugin_example.module', 'ctools_plugin_example', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33353a224368616f7320546f6f6c73202843546f6f6c732920506c7567696e204578616d706c65223b733a31313a226465736372697074696f6e223b733a37353a2253686f777320686f7720616e2065787465726e616c206d6f64756c652063616e2070726f766964652063746f6f6c7320706c7567696e732028666f722050616e656c732c206574632e292e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a31323a22646570656e64656e63696573223b613a343a7b693a303b733a363a2263746f6f6c73223b693a313b733a363a2270616e656c73223b693a323b733a31323a22706167655f6d616e61676572223b693a333b733a31333a22616476616e6365645f68656c70223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/page_manager/page_manager.module', 'page_manager', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a2250616765206d616e61676572223b733a31313a226465736372697074696f6e223b733a35343a2250726f7669646573206120554920616e642041504920746f206d616e6167652070616765732077697468696e2074686520736974652e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a353a2266696c6573223b613a313a7b693a303b733a32313a2274657374732f686561645f6c696e6b732e74657374223b7d733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434363b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/stylizer/stylizer.module', 'stylizer', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a383a225374796c697a6572223b733a31313a226465736372697074696f6e223b733a35333a2243726561746520637573746f6d207374796c657320666f72206170706c69636174696f6e7320737563682061732050616e656c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a363a2263746f6f6c73223b693a313b733a353a22636f6c6f72223b7d733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/term_depth/term_depth.module', 'term_depth', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a225465726d20446570746820616363657373223b733a31313a226465736372697074696f6e223b733a34383a22436f6e74726f6c732061636365737320746f20636f6e746578742062617365642075706f6e207465726d206465707468223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/tests/ctools_export_test/ctools_export_test.module', 'ctools_export_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31383a2243546f6f6c73206578706f72742074657374223b733a31313a226465736372697074696f6e223b733a32353a2243546f6f6c73206578706f72742074657374206d6f64756c65223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a363a2268696464656e223b623a313b733a353a2266696c6573223b613a313a7b693a303b733a31383a2263746f6f6c735f6578706f72742e74657374223b7d733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/tests/ctools_plugin_test.module', 'ctools_plugin_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32343a224368616f7320746f6f6c7320706c7567696e732074657374223b733a31313a226465736372697074696f6e223b733a34323a2250726f766964657320686f6f6b7320666f722074657374696e672063746f6f6c7320706c7567696e732e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434363b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/ctools/views_content/views_content.module', 'views_content', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31393a22566965777320636f6e74656e742070616e6573223b733a31313a226465736372697074696f6e223b733a3130343a22416c6c6f777320566965777320636f6e74656e7420746f206265207573656420696e2050616e656c732c2044617368626f61726420616e64206f74686572206d6f64756c657320776869636820757365207468652043546f6f6c7320436f6e74656e74204150492e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a363a2263746f6f6c73223b693a313b733a353a227669657773223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a383a22372e782d312e3134223b733a353a2266696c6573223b613a333a7b693a303b733a36313a22706c7567696e732f76696577732f76696577735f636f6e74656e745f706c7567696e5f646973706c61795f63746f6f6c735f636f6e746578742e696e63223b693a313b733a35373a22706c7567696e732f76696577732f76696577735f636f6e74656e745f706c7567696e5f646973706c61795f70616e656c5f70616e652e696e63223b693a323b733a35393a22706c7567696e732f76696577732f76696577735f636f6e74656e745f706c7567696e5f7374796c655f63746f6f6c735f636f6e746578742e696e63223b7d733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231353139343535373838223b733a353a226d74696d65223b693a313532383430313434303b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/custom/custom.module', 'custom', 'module', '', 1, 0, 0, 0, 0x613a31303a7b733a343a226e616d65223b733a31333a22637573746f6d206d6f64756c65223b733a343a22636f7265223b733a333a22372e78223b733a353a226d74696d65223b693a313532393834393438363b733a31323a22646570656e64656e63696573223b613a303a7b7d733a31313a226465736372697074696f6e223b733a303a22223b733a373a227061636b616765223b733a353a224f74686572223b733a373a2276657273696f6e223b4e3b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/custom/webservice/webservice.module', 'webservice', 'module', '', 1, 0, 0, 0, 0x613a31303a7b733a343a226e616d65223b733a31373a22637573746f6d2077656273657276696365223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a363a22637573746f6d223b733a353a226d74696d65223b693a313533313136303432333b733a31323a22646570656e64656e63696573223b613a303a7b7d733a31313a226465736372697074696f6e223b733a303a22223b733a373a2276657273696f6e223b4e3b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/entity/entity.module', 'entity', 'module', '', 1, 0, 7003, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22456e7469747920415049223b733a31313a226465736372697074696f6e223b733a36393a22456e61626c6573206d6f64756c657320746f20776f726b207769746820616e7920656e74697479207479706520616e6420746f2070726f7669646520656e7469746965732e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a32343a7b693a303b733a31393a22656e746974792e66656174757265732e696e63223b693a313b733a31353a22656e746974792e6931386e2e696e63223b693a323b733a31353a22656e746974792e696e666f2e696e63223b693a333b733a31363a22656e746974792e72756c65732e696e63223b693a343b733a31313a22656e746974792e74657374223b693a353b733a31393a22696e636c756465732f656e746974792e696e63223b693a363b733a33303a22696e636c756465732f656e746974792e636f6e74726f6c6c65722e696e63223b693a373b733a32323a22696e636c756465732f656e746974792e75692e696e63223b693a383b733a32373a22696e636c756465732f656e746974792e777261707065722e696e63223b693a393b733a32323a2276696577732f656e746974792e76696577732e696e63223b693a31303b733a35323a2276696577732f68616e646c6572732f656e746974795f76696577735f6669656c645f68616e646c65725f68656c7065722e696e63223b693a31313b733a35313a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f617265615f656e746974792e696e63223b693a31323b733a35333a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f626f6f6c65616e2e696e63223b693a31333b733a35303a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f646174652e696e63223b693a31343b733a35343a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6475726174696f6e2e696e63223b693a31353b733a35323a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f656e746974792e696e63223b693a31363b733a35313a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6669656c642e696e63223b693a31373b733a35333a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6e756d657269632e696e63223b693a31383b733a35333a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6f7074696f6e732e696e63223b693a31393b733a35303a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f746578742e696e63223b693a32303b733a34393a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f7572692e696e63223b693a32313b733a36323a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f72656c6174696f6e736869705f62795f62756e646c652e696e63223b693a32323b733a35323a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f72656c6174696f6e736869702e696e63223b693a32333b733a35333a2276696577732f706c7567696e732f656e746974795f76696577735f706c7567696e5f726f775f656e746974795f766965772e696e63223b7d733a373a2276657273696f6e223b733a373a22372e782d312e39223b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231353138363230353531223b733a353a226d74696d65223b693a313531383634353735323b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/entity/entity_token.module', 'entity_token', 'module', '', 1, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31333a22456e7469747920746f6b656e73223b733a31313a226465736372697074696f6e223b733a39393a2250726f766964657320746f6b656e207265706c6163656d656e747320666f7220616c6c2070726f7065727469657320746861742068617665206e6f20746f6b656e7320616e6420617265206b6e6f776e20746f2074686520656e74697479204150492e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a32333a22656e746974795f746f6b656e2e746f6b656e732e696e63223b693a313b733a31393a22656e746974795f746f6b656e2e6d6f64756c65223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a22656e74697479223b7d733a373a2276657273696f6e223b733a373a22372e782d312e39223b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231353138363230353531223b733a353a226d74696d65223b693a313531383634353735323b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/entity/tests/entity_feature.module', 'entity_feature', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32313a22456e746974792066656174757265206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33313a2250726f766964657320736f6d6520656e74697469657320696e20636f64652e223b733a373a2276657273696f6e223b733a373a22372e782d312e39223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32313a22656e746974795f666561747572652e6d6f64756c65223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31313a22656e746974795f74657374223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231353138363230353531223b733a353a226d74696d65223b693a313531383634353735323b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/entity/tests/entity_test.module', 'entity_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32333a22456e7469747920435255442074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a34363a2250726f766964657320656e746974792074797065732062617365642075706f6e207468652043525544204150492e223b733a373a2276657273696f6e223b733a373a22372e782d312e39223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31383a22656e746974795f746573742e6d6f64756c65223b693a313b733a31393a22656e746974795f746573742e696e7374616c6c223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a22656e74697479223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231353138363230353531223b733a353a226d74696d65223b693a313531383634353735323b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/entity/tests/entity_test_i18n.module', 'entity_test_i18n', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32383a22456e746974792d746573742074797065207472616e736c6174696f6e223b733a31313a226465736372697074696f6e223b733a33373a22416c6c6f7773207472616e736c6174696e6720656e746974792d746573742074797065732e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31313a22656e746974795f74657374223b693a313b733a31313a226931386e5f737472696e67223b7d733a373a227061636b616765223b733a33353a224d756c74696c696e6775616c202d20496e7465726e6174696f6e616c697a6174696f6e223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d312e39223b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231353138363230353531223b733a353a226d74696d65223b693a313531383634353735323b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/flexslider/flexslider.module', 'flexslider', 'module', '', 1, 0, 7203, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a22466c6578536c69646572223b733a31313a226465736372697074696f6e223b733a34363a22496e746567726174652074686520466c6578536c696465722032206c69627261727920776974682044727570616c223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31303a22466c6578536c69646572223b733a31323a22646570656e64656e63696573223b613a333a7b693a303b733a31373a226c696272617269657320283e3d322e7829223b693a313b733a363a2263746f6f6c73223b693a323b733a353a22696d616765223b7d733a353a2266696c6573223b613a323a7b693a303b733a32363a227468656d652f666c6578736c696465722e7468656d652e696e63223b693a313b733a31353a22666c6578736c696465722e74657374223b7d733a393a22636f6e666967757265223b733a32393a2261646d696e2f636f6e6669672f6d656469612f666c6578736c69646572223b733a373a2276657273696f6e223b733a31313a22372e782d322e302d726332223b733a373a2270726f6a656374223b733a31303a22666c6578736c69646572223b733a393a22646174657374616d70223b733a31303a2231343837303238343838223b733a353a226d74696d65223b693a313438373035333638383b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/flexslider/flexslider_example/flexslider_example.module', 'flexslider_example', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31383a22466c6578536c69646572204578616d706c65223b733a31313a226465736372697074696f6e223b733a33353a2253616d706c6520696d706c656d656e746174696f6e206f6620466c6578536c69646572223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31303a22466c6578536c69646572223b733a333a22706870223b733a353a22352e322e34223b733a31323a22646570656e64656e63696573223b613a393a7b693a303b733a373a22636f6e74657874223b693a313b733a383a226665617475726573223b693a323b733a31303a22666c6578736c69646572223b693a333b733a31373a22666c6578736c696465725f6669656c6473223b693a343b733a31363a22666c6578736c696465725f7669657773223b693a353b733a353a22696d616765223b693a363b733a343a226d656e75223b693a373b733a393a227374726f6e6761726d223b693a383b733a353a227669657773223b7d733a383a226665617475726573223b613a393a7b733a373a22636f6e74657874223b613a313a7b693a303b733a32383a22666c6578736c696465725f6578616d706c655f7468756d626e61696c223b7d733a363a2263746f6f6c73223b613a343a7b693a303b733a31373a22636f6e746578743a636f6e746578743a33223b693a313b733a33383a22666c6578736c696465723a666c6578736c696465725f64656661756c745f7072657365743a31223b693a323b733a32313a227374726f6e6761726d3a7374726f6e6761726d3a31223b693a333b733a32333a2276696577733a76696577735f64656661756c743a332e30223b7d733a31323a2266656174757265735f617069223b613a313a7b693a303b733a353a226170693a31223b7d733a353a226669656c64223b613a323a7b693a303b733a35343a226e6f64652d666c6578736c696465725f6578616d706c652d6669656c645f666c6578736c696465725f6578616d706c655f696d616765223b693a313b733a35363a226e6f64652d666c6578736c696465725f6578616d706c652d6669656c645f666c6578736c696465725f6578616d706c655f736c6964657368223b7d733a32303a22666c6578736c696465725f6f7074696f6e736574223b613a363a7b693a303b733a34333a22666c6578736c696465725f6361726f7573656c5f776974685f6d696e5f616e645f6d61785f72616e676573223b693a313b733a33333a22666c6578736c696465725f64656661756c745f62617369635f6361726f7573656c223b693a323b733a34363a22666c6578736c696465725f64656661756c745f736c696465725f7468756d626e61696c5f636f6e74726f6c6e6176223b693a333b733a34343a22666c6578736c696465725f64656661756c745f736c696465725f775f7468756d626e61696c5f736c69646572223b693a343b733a33373a22666c6578736c696465725f64656661756c745f7468756d626e61696c5f63617074696f6e73223b693a353b733a33353a22666c6578736c696465725f64656661756c745f7468756d626e61696c5f736c69646572223b7d733a31313a226d656e755f637573746f6d223b613a313a7b693a303b733a32333a226d656e752d666c6578736c696465722d6578616d706c65223b7d733a343a226e6f6465223b613a313a7b693a303b733a31383a22666c6578736c696465725f6578616d706c65223b7d733a383a227661726961626c65223b613a313a7b693a303b733a34363a226669656c645f62756e646c655f73657474696e67735f6e6f64655f5f666c6578736c696465725f6578616d706c65223b7d733a31303a2276696577735f76696577223b613a313a7b693a303b733a32343a22666c6578736c696465725f76696577735f6578616d706c65223b7d7d733a373a2276657273696f6e223b733a31313a22372e782d322e302d726332223b733a373a2270726f6a656374223b733a31303a22666c6578736c69646572223b733a393a22646174657374616d70223b733a31303a2231343837303238343838223b733a353a226d74696d65223b693a313438373035333638383b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/flexslider/flexslider_fields/flexslider_fields.module', 'flexslider_fields', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a22466c6578536c69646572204669656c6473223b733a31313a226465736372697074696f6e223b733a34343a2241646473206120646973706c6179206d6f646520696e204669656c647320666f7220466c6578536c69646572223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31303a22466c6578536c69646572223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31303a22666c6578736c69646572223b7d733a373a2276657273696f6e223b733a31313a22372e782d322e302d726332223b733a373a2270726f6a656374223b733a31303a22666c6578736c69646572223b733a393a22646174657374616d70223b733a31303a2231343837303238343838223b733a353a226d74696d65223b693a313438373035333638383b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/flexslider/flexslider_views/flexslider_views.module', 'flexslider_views', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a22466c6578536c69646572205669657773205374796c65223b733a31313a226465736372697074696f6e223b733a34303a22416464732061205669657773207374796c6520706c7567696e20666f7220466c6578536c69646572223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31303a22466c6578536c69646572223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a353a227669657773223b693a313b733a31303a22666c6578736c69646572223b7d733a353a2266696c6573223b613a333a7b693a303b733a32333a22666c6578736c696465725f76696577732e6d6f64756c65223b693a313b733a32363a22666c6578736c696465725f76696577732e76696577732e696e63223b693a323b733a34343a22666c6578736c696465725f76696577735f706c7567696e5f7374796c655f666c6578736c696465722e696e63223b7d733a373a2276657273696f6e223b733a31313a22372e782d322e302d726332223b733a373a2270726f6a656374223b733a31303a22666c6578736c69646572223b733a393a22646174657374616d70223b733a31303a2231343837303238343838223b733a353a226d74696d65223b693a313438373035333638383b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/jquery_update/jquery_update.module', 'jquery_update', 'module', '', 1, 0, 7000, 0, 0x613a31333a7b733a343a226e616d65223b733a31333a226a517565727920557064617465223b733a31313a226465736372697074696f6e223b733a35333a22557064617465206a517565727920616e64206a517565727920554920746f2061206d6f726520726563656e742076657273696f6e2e223b733a373a227061636b616765223b733a31343a225573657220696e74657266616365223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a32303a226a71756572795f7570646174652e6d6f64756c65223b693a313b733a32313a226a71756572795f7570646174652e696e7374616c6c223b7d733a393a22636f6e666967757265223b733a33383a2261646d696e2f636f6e6669672f646576656c6f706d656e742f6a71756572795f757064617465223b733a373a2276657273696f6e223b733a373a22372e782d322e37223b733a373a2270726f6a656374223b733a31333a226a71756572795f757064617465223b733a393a22646174657374616d70223b733a31303a2231343435333739383535223b733a353a226d74696d65223b693a313533313636343131323b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/libraries/libraries.module', 'libraries', 'module', '', 1, 0, 7201, 0, 0x613a31323a7b733a343a226e616d65223b733a393a224c6962726172696573223b733a31313a226465736372697074696f6e223b733a36343a22416c6c6f77732076657273696f6e2d646570656e64656e7420616e6420736861726564207573616765206f662065787465726e616c206c69627261726965732e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31353a2273797374656d20283e3d372e313129223b7d733a353a2266696c6573223b613a343a7b693a303b733a33323a2274657374732f4c696272617269657341646d696e576562546573742e74657374223b693a313b733a33313a2274657374732f4c69627261726965734c6f6164576562546573742e74657374223b693a323b733a32383a2274657374732f4c6962726172696573556e6974546573742e74657374223b693a333b733a33313a2274657374732f4c696272617269657357656254657374426173652e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231343633303737343530223b733a353a226d74696d65223b693a313436333130323635303b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('sites/all/modules/libraries/tests/modules/libraries_test_module/libraries_test_module.module', 'libraries_test_module', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32313a224c69627261726965732074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33363a225465737473206c69627261727920646574656374696f6e20616e64206c6f6164696e672e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a393a226c6962726172696573223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231343633303737343530223b733a353a226d74696d65223b693a313436333130323635303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/login_destination/login_destination.module', 'login_destination', 'module', '', 1, 0, 7003, 0, 0x613a31333a7b733a343a226e616d65223b733a31373a224c6f67696e2044657374696e6174696f6e223b733a31313a226465736372697074696f6e223b733a36393a22437573746f6d697a65207468652064657374696e6174696f6e2074686174207468652075736572206973207265646972656374656420746f206166746572206c6f67696e2e223b733a343a22636f7265223b733a333a22372e78223b733a393a22636f6e666967757265223b733a33373a2261646d696e2f636f6e6669672f70656f706c652f6c6f67696e2d64657374696e6174696f6e223b733a373a2276657273696f6e223b733a373a22372e782d312e34223b733a373a2270726f6a656374223b733a31373a226c6f67696e5f64657374696e6174696f6e223b733a393a22646174657374616d70223b733a31303a2231343533343531393430223b733a353a226d74696d65223b693a313533313735383236353b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/pathauto/pathauto.module', 'pathauto', 'module', '', 1, 0, 7006, 1, 0x613a31343a7b733a343a226e616d65223b733a383a22506174686175746f223b733a31313a226465736372697074696f6e223b733a39353a2250726f76696465732061206d656368616e69736d20666f72206d6f64756c657320746f206175746f6d61746963616c6c792067656e657261746520616c696173657320666f722074686520636f6e74656e742074686579206d616e6167652e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22746f6b656e223b7d733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a32303a22706174686175746f2e6d6967726174652e696e63223b693a313b733a31333a22706174686175746f2e74657374223b7d733a393a22636f6e666967757265223b733a33333a2261646d696e2f636f6e6669672f7365617263682f706174682f7061747465726e73223b733a31303a227265636f6d6d656e6473223b613a313a7b693a303b733a383a227265646972656374223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a383a22706174686175746f223b733a393a22646174657374616d70223b733a31303a2231343434323332363535223b733a353a226d74696d65223b693a313533323235313833333b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/restws/restws.module', 'restws', 'module', '', 0, 0, 7002, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a225245535466756c20776562207365727669636573223b733a31313a226465736372697074696f6e223b733a33303a2250726f7669646573205245535466756c207765622073657276696365732e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a333a7b693a303b733a31373a227265737477732e656e746974792e696e63223b693a313b733a31383a227265737477732e666f726d6174732e696e63223b693a323b733a31313a227265737477732e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a22656e74697479223b7d733a373a2276657273696f6e223b733a373a22372e782d322e37223b733a373a2270726f6a656374223b733a363a22726573747773223b733a393a22646174657374616d70223b733a31303a2231343838333833343130223b733a353a226d74696d65223b693a313438383430383631303b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/restws/restws_basic_auth/restws_basic_auth.module', 'restws_basic_auth', 'module', '', 1, 0, 7100, 0, 0x613a31323a7b733a343a226e616d65223b733a32363a2242617369632061757468656e7469636174696f6e206c6f67696e223b733a31313a226465736372697074696f6e223b733a37343a2255736572206c6f67696e2066726f6d204854545020617574686f72697a6174696f6e2068656164657273202870617274206f66205245535466756c20776562207365727669636573292e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32323a227265737477735f62617369635f617574682e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d322e37223b733a373a2270726f6a656374223b733a363a22726573747773223b733a393a22646174657374616d70223b733a31303a2231343838333833343130223b733a353a226d74696d65223b693a313438383430383631303b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/restws/tests/restws_test.module', 'restws_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a33323a225245535466756c207765622073657276696365732074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33363a22537570706f7274206d6f64756c6520666f7220746865205265737457532074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d322e37223b733a373a2270726f6a656374223b733a363a22726573747773223b733a393a22646174657374616d70223b733a31303a2231343838333833343130223b733a353a226d74696d65223b693a313438383430383631303b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/roles_for_menu/roles_for_menu.module', 'roles_for_menu', 'module', '', 1, 0, 7001, 0, 0x613a31343a7b733a343a226e616d65223b733a31343a22526f6c657320666f72206d656e75223b733a31313a226465736372697074696f6e223b733a37363a22416c6c6f77732061646d696e6973747261746f727320746f207370656369667920666f72206561636820726f6c657320746f2073686f772f68696465207370656369666963206d656e75732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a226d656e75223b7d733a393a22636f6e666c69637473223b613a323a7b693a303b733a31333a226d656e755f7065725f726f6c65223b693a313b733a32303a226d656e755f6974656d5f7669736962696c697479223b7d733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31343a2241636365737320636f6e74726f6c223b733a393a22636f6e666967757265223b733a32393a2261646d696e2f7374727563747572652f6d656e752f73657474696e6773223b733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a373a2270726f6a656374223b733a31343a22726f6c65735f666f725f6d656e75223b733a393a22646174657374616d70223b733a31303a2231343234303939393235223b733a353a226d74696d65223b693a313533323235383230303b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/services/auth/services_oauth/services_oauth.module', 'services_oauth', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a224f417574682041757468656e7469636174696f6e223b733a31313a226465736372697074696f6e223b733a35333a2250726f7669646573204f417574682061757468656e7469636174696f6e20666f7220746865207365727669636573206d6f64756c65223b733a373a227061636b616765223b733a32353a225365727669636573202d2061757468656e7469636174696f6e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227365727669636573223b693a313b733a31323a226f617574685f636f6d6d6f6e223b7d733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e32223b733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231343938353734393437223b733a353a226d74696d65223b693a313439383630303134383b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/services/servers/rest_server/rest_server.module', 'rest_server', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225245535420536572766572223b733a31313a226465736372697074696f6e223b733a32343a2250726f766964657320616e2052455354207365727665722e223b733a373a227061636b616765223b733a31383a225365727669636573202d2073657276657273223b733a353a2266696c6573223b613a31313a7b693a303b733a31383a22726573745f7365727665722e6d6f64756c65223b693a313b733a32333a22696e636c756465732f524553545365727665722e696e63223b693a323b733a34323a22696e636c756465732f5365727669636573436f6e74656e74547970654e65676f746961746f722e696e63223b693a333b733a33383a22696e636c756465732f536572766963657352455354536572766572466163746f72792e696e63223b693a343b733a32383a22696e636c756465732f5365727669636573436f6e746578742e696e63223b693a353b733a32373a22696e636c756465732f53657276696365735061727365722e696e63223b693a363b733a33303a22696e636c756465732f5365727669636573466f726d61747465722e696e63223b693a373b733a33343a2274657374732f53657276696365735245535453657276657254657374732e74657374223b693a383b733a33343a2274657374732f726573745f7365727665725f6d6f636b5f636c61737365732e696e63223b693a393b733a31353a226c69622f62656e636f64652e706870223b693a31303b733a31373a226c69622f6d696d6570617273652e706870223b7d733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227365727669636573223b693a313b733a31373a226c696272617269657320283e3d322e7829223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231343938353734393437223b733a353a226d74696d65223b693a313439383630303134383b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/services/servers/xmlrpc_server/xmlrpc_server.module', 'xmlrpc_server', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31333a22584d4c52504320536572766572223b733a31313a226465736372697074696f6e223b733a32353a2250726f7669646573206120584d4c525043207365727665722e223b733a373a227061636b616765223b733a31383a225365727669636573202d2073657276657273223b733a353a2266696c6573223b613a313a7b693a303b733a32303a22786d6c7270635f7365727665722e6d6f64756c65223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227365727669636573223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231343938353734393437223b733a353a226d74696d65223b693a313439383630303134383b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/services/services.module', 'services', 'module', '', 1, 0, 7403, 0, 0x613a31333a7b733a343a226e616d65223b733a383a225365727669636573223b733a31313a226465736372697074696f6e223b733a34313a2250726f7669646520616e2041504920666f72206372656174696e67207765622073657276696365732e223b733a373a227061636b616765223b733a383a225365727669636573223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e78223b733a393a22636f6e666967757265223b733a32343a2261646d696e2f7374727563747572652f7365727669636573223b733a353a2266696c6573223b613a31393a7b693a303b733a32393a22696e636c756465732f73657276696365732e72756e74696d652e696e63223b693a313b733a34363a2274657374732f66756e6374696f6e616c2f4e6f41757468456e64706f696e745465737452756e6e65722e74657374223b693a323b733a34373a2274657374732f66756e6374696f6e616c2f53657276696365735265736f757263654e6f646554657374732e74657374223b693a333b733a34373a2274657374732f66756e6374696f6e616c2f53657276696365735265736f757263655573657254657374732e74657374223b693a343b733a34393a2274657374732f66756e6374696f6e616c2f53657276696365735265736f7572636553797374656d54657374732e74657374223b693a353b733a35303a2274657374732f66756e6374696f6e616c2f53657276696365735265736f75726365436f6d6d656e7454657374732e74657374223b693a363b733a35313a2274657374732f66756e6374696f6e616c2f53657276696365735265736f757263655461786f6e6f6d7954657374732e74657374223b693a373b733a34373a2274657374732f66756e6374696f6e616c2f53657276696365735265736f7572636546696c6554657374732e74657374223b693a383b733a35313a2274657374732f66756e6374696f6e616c2f53657276696365735265736f7572636544697361626c656454657374732e74657374223b693a393b733a34333a2274657374732f66756e6374696f6e616c2f5365727669636573456e64706f696e7454657374732e74657374223b693a31303b733a34313a2274657374732f66756e6374696f6e616c2f536572766963657350617273657254657374732e74657374223b693a31313b733a34303a2274657374732f66756e6374696f6e616c2f5365727669636573416c69617354657374732e74657374223b693a31323b733a34313a2274657374732f66756e6374696f6e616c2f5365727669636573584d4c52504354657374732e74657374223b693a31333b733a34323a2274657374732f66756e6374696f6e616c2f536572766963657356657273696f6e54657374732e74657374223b693a31343b733a34343a2274657374732f66756e6374696f6e616c2f5365727669636573417267756d656e747354657374732e74657374223b693a31353b733a34333a2274657374732f66756e6374696f6e616c2f5365727669636573536563757269747954657374732e74657374223b693a31363b733a34303a2274657374732f756e69742f5365727669636573537079634c69627261727954657374732e74657374223b693a31373b733a32393a2274657374732f75692f5365727669636573554954657374732e74657374223b693a31383b733a31393a2274657374732f73657276696365732e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231343938353734393437223b733a353a226d74696d65223b693a313439383630303134383b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/services/tests/services_test_resource/services_test_resource.module', 'services_test_resource', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a32323a2253657276696365732054657374205265736f75726365223b733a31313a226465736372697074696f6e223b733a35313a2250726f766964652074657374206d6574686f647320746f20636865636b20646966666572656e7420736974756174696f6e732e223b733a373a227061636b616765223b733a383a225365727669636573223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227365727669636573223b7d733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231343938353734393437223b733a353a226d74696d65223b693a313439383630303134383b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/token/tests/token_test.module', 'token_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a22546f6b656e2054657374223b733a31313a226465736372697074696f6e223b733a33393a2254657374696e67206d6f64756c6520666f7220746f6b656e2066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31373a22746f6b656e5f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d312e37223b733a373a2270726f6a656374223b733a353a22746f6b656e223b733a393a22646174657374616d70223b733a31303a2231343835333136303838223b733a353a226d74696d65223b693a313533323235313930323b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/token/token.module', 'token', 'module', '', 1, 0, 7001, 0, 0x613a31323a7b733a343a226e616d65223b733a353a22546f6b656e223b733a31313a226465736372697074696f6e223b733a37333a2250726f76696465732061207573657220696e7465726661636520666f722074686520546f6b656e2041504920616e6420736f6d65206d697373696e6720636f726520746f6b656e732e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22746f6b656e2e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d312e37223b733a373a2270726f6a656374223b733a353a22746f6b656e223b733a393a22646174657374616d70223b733a31303a2231343835333136303838223b733a353a226d74696d65223b693a313533323235313930323b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/views/tests/views_test.module', 'views_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a2256696577732054657374223b733a31313a226465736372697074696f6e223b733a32323a2254657374206d6f64756c6520666f722056696577732e223b733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a227669657773223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a383a22372e782d332e3138223b733a373a2270726f6a656374223b733a353a227669657773223b733a393a22646174657374616d70223b733a31303a2231353033343935313033223b733a353a226d74696d65223b693a313532383430313338383b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('sites/all/modules/views/views.module', 'views', 'module', '', 1, 0, 7302, 10, 0x613a31333a7b733a343a226e616d65223b733a353a225669657773223b733a31313a226465736372697074696f6e223b733a35353a2243726561746520637573746f6d697a6564206c6973747320616e6420717565726965732066726f6d20796f75722064617461626173652e223b733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31333a226373732f76696577732e637373223b733a33373a2273697465732f616c6c2f6d6f64756c65732f76696577732f6373732f76696577732e637373223b7d7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a353a2266696c6573223b613a3331343a7b693a303b733a33313a2268616e646c6572732f76696577735f68616e646c65725f617265612e696e63223b693a313b733a34303a2268616e646c6572732f76696577735f68616e646c65725f617265615f6d657373616765732e696e63223b693a323b733a33383a2268616e646c6572732f76696577735f68616e646c65725f617265615f726573756c742e696e63223b693a333b733a33363a2268616e646c6572732f76696577735f68616e646c65725f617265615f746578742e696e63223b693a343b733a34333a2268616e646c6572732f76696577735f68616e646c65725f617265615f746578745f637573746f6d2e696e63223b693a353b733a33363a2268616e646c6572732f76696577735f68616e646c65725f617265615f766965772e696e63223b693a363b733a33353a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e742e696e63223b693a373b733a34303a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f646174652e696e63223b693a383b733a34333a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f666f726d756c612e696e63223b693a393b733a34373a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6d616e795f746f5f6f6e652e696e63223b693a31303b733a34303a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6e756c6c2e696e63223b693a31313b733a34333a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6e756d657269632e696e63223b693a31323b733a34323a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f737472696e672e696e63223b693a31333b733a35323a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f67726f75705f62795f6e756d657269632e696e63223b693a31343b733a33323a2268616e646c6572732f76696577735f68616e646c65725f6669656c642e696e63223b693a31353b733a34303a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f636f756e7465722e696e63223b693a31363b733a34303a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f626f6f6c65616e2e696e63223b693a31373b733a34393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f636f6e7465787475616c5f6c696e6b732e696e63223b693a31383b733a34383a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f63746f6f6c735f64726f70646f776e2e696e63223b693a31393b733a33393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f637573746f6d2e696e63223b693a32303b733a33373a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f646174652e696e63223b693a32313b733a33393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f656e746974792e696e63223b693a32323b733a33383a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6c696e6b732e696e63223b693a32333b733a33393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6d61726b75702e696e63223b693a32343b733a33373a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6d6174682e696e63223b693a32353b733a34303a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6e756d657269632e696e63223b693a32363b733a34373a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f70726572656e6465725f6c6973742e696e63223b693a32373b733a34363a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f74696d655f696e74657276616c2e696e63223b693a32383b733a34333a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f73657269616c697a65642e696e63223b693a32393b733a34353a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6d616368696e655f6e616d652e696e63223b693a33303b733a33363a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f75726c2e696e63223b693a33313b733a33333a2268616e646c6572732f76696577735f68616e646c65725f66696c7465722e696e63223b693a33323b733a35303a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f626f6f6c65616e5f6f70657261746f722e696e63223b693a33333b733a35373a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f626f6f6c65616e5f6f70657261746f725f737472696e672e696e63223b693a33343b733a34313a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f636f6d62696e652e696e63223b693a33353b733a33383a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f646174652e696e63223b693a33363b733a34323a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f657175616c6974792e696e63223b693a33373b733a34373a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f656e746974795f62756e646c652e696e63223b693a33383b733a35303a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f67726f75705f62795f6e756d657269632e696e63223b693a33393b733a34353a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f696e5f6f70657261746f722e696e63223b693a34303b733a34353a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f6d616e795f746f5f6f6e652e696e63223b693a34313b733a34313a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f6e756d657269632e696e63223b693a34323b733a34303a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f737472696e672e696e63223b693a34333b733a34383a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f6669656c64735f636f6d706172652e696e63223b693a34343b733a33393a2268616e646c6572732f76696577735f68616e646c65725f72656c6174696f6e736869702e696e63223b693a34353b733a35333a2268616e646c6572732f76696577735f68616e646c65725f72656c6174696f6e736869705f67726f7570776973655f6d61782e696e63223b693a34363b733a33313a2268616e646c6572732f76696577735f68616e646c65725f736f72742e696e63223b693a34373b733a33363a2268616e646c6572732f76696577735f68616e646c65725f736f72745f646174652e696e63223b693a34383b733a33393a2268616e646c6572732f76696577735f68616e646c65725f736f72745f666f726d756c612e696e63223b693a34393b733a34383a2268616e646c6572732f76696577735f68616e646c65725f736f72745f67726f75705f62795f6e756d657269632e696e63223b693a35303b733a34363a2268616e646c6572732f76696577735f68616e646c65725f736f72745f6d656e755f6869657261726368792e696e63223b693a35313b733a33383a2268616e646c6572732f76696577735f68616e646c65725f736f72745f72616e646f6d2e696e63223b693a35323b733a31373a22696e636c756465732f626173652e696e63223b693a35333b733a32313a22696e636c756465732f68616e646c6572732e696e63223b693a35343b733a32303a22696e636c756465732f706c7567696e732e696e63223b693a35353b733a31373a22696e636c756465732f766965772e696e63223b693a35363b733a36303a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f617267756d656e745f61676772656761746f725f6669642e696e63223b693a35373b733a36303a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f617267756d656e745f61676772656761746f725f6969642e696e63223b693a35383b733a36393a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f617267756d656e745f61676772656761746f725f63617465676f72795f6369642e696e63223b693a35393b733a36343a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f7469746c655f6c696e6b2e696e63223b693a36303b733a36323a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f63617465676f72792e696e63223b693a36313b733a37303a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f6974656d5f6465736372697074696f6e2e696e63223b693a36323b733a35373a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f7873732e696e63223b693a36333b733a36373a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f66696c7465725f61676772656761746f725f63617465676f72795f6369642e696e63223b693a36343b733a35343a226d6f64756c65732f61676772656761746f722f76696577735f706c7567696e5f726f775f61676772656761746f725f7273732e696e63223b693a36353b733a35363a226d6f64756c65732f626f6f6b2f76696577735f706c7567696e5f617267756d656e745f64656661756c745f626f6f6b5f726f6f742e696e63223b693a36363b733a35393a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f617267756d656e745f636f6d6d656e745f757365725f7569642e696e63223b693a36373b733a34373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e742e696e63223b693a36383b733a35333a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f64657074682e696e63223b693a36393b733a35323a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b2e696e63223b693a37303b733a36303a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f617070726f76652e696e63223b693a37313b733a35393a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f64656c6574652e696e63223b693a37323b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f656469742e696e63223b693a37333b733a35383a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f7265706c792e696e63223b693a37343b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6e6f64655f6c696e6b2e696e63223b693a37353b733a35363a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f757365726e616d652e696e63223b693a37363b733a36313a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e63735f6c6173745f636f6d6d656e745f6e616d652e696e63223b693a37373b733a35363a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e63735f6c6173745f757064617465642e696e63223b693a37383b733a35323a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e6f64655f636f6d6d656e742e696e63223b693a37393b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e6f64655f6e65775f636f6d6d656e74732e696e63223b693a38303b733a36323a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6c6173745f636f6d6d656e745f74696d657374616d702e696e63223b693a38313b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f636f6d6d656e745f757365725f7569642e696e63223b693a38323b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f6e63735f6c6173745f757064617465642e696e63223b693a38333b733a35333a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f6e6f64655f636f6d6d656e742e696e63223b693a38343b733a35333a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f736f72745f636f6d6d656e745f7468726561642e696e63223b693a38353b733a36303a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f736f72745f6e63735f6c6173745f636f6d6d656e745f6e616d652e696e63223b693a38363b733a35353a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f736f72745f6e63735f6c6173745f757064617465642e696e63223b693a38373b733a34383a226d6f64756c65732f636f6d6d656e742f76696577735f706c7567696e5f726f775f636f6d6d656e745f7273732e696e63223b693a38383b733a34393a226d6f64756c65732f636f6d6d656e742f76696577735f706c7567696e5f726f775f636f6d6d656e745f766965772e696e63223b693a38393b733a35323a226d6f64756c65732f636f6e746163742f76696577735f68616e646c65725f6669656c645f636f6e746163745f6c696e6b2e696e63223b693a39303b733a34333a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f6669656c645f6669656c642e696e63223b693a39313b733a35393a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f72656c6174696f6e736869705f656e746974795f726576657273652e696e63223b693a39323b733a35313a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f617267756d656e745f6669656c645f6c6973742e696e63223b693a39333b733a35373a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f66696c7465725f6669656c645f6c6973745f626f6f6c65616e2e696e63223b693a39343b733a35383a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f617267756d656e745f6669656c645f6c6973745f737472696e672e696e63223b693a39353b733a34393a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f66696c7465725f6669656c645f6c6973742e696e63223b693a39363b733a35373a226d6f64756c65732f66696c7465722f76696577735f68616e646c65725f6669656c645f66696c7465725f666f726d61745f6e616d652e696e63223b693a39373b733a35323a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c616e67756167652e696e63223b693a39383b733a35333a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6e6f64655f6c616e67756167652e696e63223b693a39393b733a35343a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f617267756d656e745f6c6f63616c655f67726f75702e696e63223b693a3130303b733a35373a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f617267756d656e745f6c6f63616c655f6c616e67756167652e696e63223b693a3130313b733a35313a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6c6f63616c655f67726f75702e696e63223b693a3130323b733a35343a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6c6f63616c655f6c616e67756167652e696e63223b693a3130333b733a35353a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6c6f63616c655f6c696e6b5f656469742e696e63223b693a3130343b733a35323a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6c6f63616c655f67726f75702e696e63223b693a3130353b733a35353a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6c6f63616c655f6c616e67756167652e696e63223b693a3130363b733a35343a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6c6f63616c655f76657273696f6e2e696e63223b693a3130373b733a35313a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f736f72745f6e6f64655f6c616e67756167652e696e63223b693a3130383b733a35333a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f64617465735f766172696f75732e696e63223b693a3130393b733a35333a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f6c616e67756167652e696e63223b693a3131303b733a34383a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f6e69642e696e63223b693a3131313b733a34393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f747970652e696e63223b693a3131323b733a34383a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f7669642e696e63223b693a3131333b733a35373a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f7569645f7265766973696f6e2e696e63223b693a3131343b733a35393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f686973746f72795f757365725f74696d657374616d702e696e63223b693a3131353b733a34313a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64652e696e63223b693a3131363b733a34363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b2e696e63223b693a3131373b733a35333a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b5f64656c6574652e696e63223b693a3131383b733a35313a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b5f656469742e696e63223b693a3131393b733a35303a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e2e696e63223b693a3132303b733a35353a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e5f6c696e6b2e696e63223b693a3132313b733a36323a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e5f6c696e6b5f64656c6574652e696e63223b693a3132323b733a36323a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e5f6c696e6b5f7265766572742e696e63223b693a3132333b733a34363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f706174682e696e63223b693a3132343b733a34363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f747970652e696e63223b693a3132353b733a35353a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f76657273696f6e5f636f756e742e696e63223b693a3132363b733a36303a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f686973746f72795f757365725f74696d657374616d702e696e63223b693a3132373b733a34393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f6163636573732e696e63223b693a3132383b733a34393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f7374617475732e696e63223b693a3132393b733a34373a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f747970652e696e63223b693a3133303b733a35353a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f7569645f7265766973696f6e2e696e63223b693a3133313b733a35363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f76657273696f6e5f636f756e742e696e63223b693a3133323b733a35343a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f736f72745f6e6f64655f76657273696f6e5f636f756e742e696e63223b693a3133333b733a35313a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f617267756d656e745f64656661756c745f6e6f64652e696e63223b693a3133343b733a35323a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f6e6f64652e696e63223b693a3133353b733a34323a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f726f775f6e6f64655f7273732e696e63223b693a3133363b733a34333a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f726f775f6e6f64655f766965772e696e63223b693a3133373b733a35323a226d6f64756c65732f70726f66696c652f76696577735f68616e646c65725f6669656c645f70726f66696c655f646174652e696e63223b693a3133383b733a35323a226d6f64756c65732f70726f66696c652f76696577735f68616e646c65725f6669656c645f70726f66696c655f6c6973742e696e63223b693a3133393b733a35383a226d6f64756c65732f70726f66696c652f76696577735f68616e646c65725f66696c7465725f70726f66696c655f73656c656374696f6e2e696e63223b693a3134303b733a34383a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f617267756d656e745f7365617263682e696e63223b693a3134313b733a35313a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f6669656c645f7365617263685f73636f72652e696e63223b693a3134323b733a34363a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f66696c7465725f7365617263682e696e63223b693a3134333b733a35303a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f736f72745f7365617263685f73636f72652e696e63223b693a3134343b733a34373a226d6f64756c65732f7365617263682f76696577735f706c7567696e5f726f775f7365617263685f766965772e696e63223b693a3134353b733a35373a226d6f64756c65732f737461746973746963732f76696577735f68616e646c65725f6669656c645f6163636573736c6f675f706174682e696e63223b693a3134363b733a36353a226d6f64756c65732f737461746973746963732f76696577735f68616e646c65725f6669656c645f6e6f64655f636f756e7465725f74696d657374616d702e696e63223b693a3134373b733a36313a226d6f64756c65732f737461746973746963732f76696577735f68616e646c65725f6669656c645f737461746973746963735f6e756d657269632e696e63223b693a3134383b733a35303a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f617267756d656e745f66696c655f6669642e696e63223b693a3134393b733a34333a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c652e696e63223b693a3135303b733a35333a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f657874656e73696f6e2e696e63223b693a3135313b733a35323a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f66696c656d696d652e696e63223b693a3135323b733a34373a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f7572692e696e63223b693a3135333b733a35303a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f7374617475732e696e63223b693a3135343b733a35313a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f66696c7465725f66696c655f7374617475732e696e63223b693a3135353b733a35323a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7461786f6e6f6d792e696e63223b693a3135363b733a35373a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469642e696e63223b693a3135373b733a36333a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469645f64657074682e696e63223b693a3135383b733a36383a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469645f64657074685f6a6f696e2e696e63223b693a3135393b733a37323a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469645f64657074685f6d6f6469666965722e696e63223b693a3136303b733a35383a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f766f636162756c6172795f7669642e696e63223b693a3136313b733a36373a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f766f636162756c6172795f6d616368696e655f6e616d652e696e63223b693a3136323b733a34393a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f6669656c645f7461786f6e6f6d792e696e63223b693a3136333b733a35343a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f6669656c645f7465726d5f6e6f64655f7469642e696e63223b693a3136343b733a35353a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f6669656c645f7465726d5f6c696e6b5f656469742e696e63223b693a3136353b733a35353a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f7465726d5f6e6f64655f7469642e696e63223b693a3136363b733a36313a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f7465726d5f6e6f64655f7469645f64657074682e696e63223b693a3136373b733a36363a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f7465726d5f6e6f64655f7469645f64657074685f6a6f696e2e696e63223b693a3136383b733a35363a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f766f636162756c6172795f7669642e696e63223b693a3136393b733a36353a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f766f636162756c6172795f6d616368696e655f6e616d652e696e63223b693a3137303b733a36323a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f72656c6174696f6e736869705f6e6f64655f7465726d5f646174612e696e63223b693a3137313b733a36353a226d6f64756c65732f7461786f6e6f6d792f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f7461786f6e6f6d795f7465726d2e696e63223b693a3137323b733a36333a226d6f64756c65732f7461786f6e6f6d792f76696577735f706c7567696e5f617267756d656e745f64656661756c745f7461786f6e6f6d795f7469642e696e63223b693a3137333b733a36373a226d6f64756c65732f747261636b65722f76696577735f68616e646c65725f617267756d656e745f747261636b65725f636f6d6d656e745f757365725f7569642e696e63223b693a3137343b733a36353a226d6f64756c65732f747261636b65722f76696577735f68616e646c65725f66696c7465725f747261636b65725f636f6d6d656e745f757365725f7569642e696e63223b693a3137353b733a36353a226d6f64756c65732f747261636b65722f76696577735f68616e646c65725f66696c7465725f747261636b65725f626f6f6c65616e5f6f70657261746f722e696e63223b693a3137363b733a35313a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f66696c7465725f73797374656d5f747970652e696e63223b693a3137373b733a35363a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f617267756d656e745f6e6f64655f746e69642e696e63223b693a3137383b733a36333a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b5f7472616e736c6174652e696e63223b693a3137393b733a36353a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f6669656c645f6e6f64655f7472616e736c6174696f6e5f6c696e6b2e696e63223b693a3138303b733a35343a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f66696c7465725f6e6f64655f746e69642e696e63223b693a3138313b733a36303a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f66696c7465725f6e6f64655f746e69645f6368696c642e696e63223b693a3138323b733a36323a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f72656c6174696f6e736869705f7472616e736c6174696f6e2e696e63223b693a3138333b733a34383a226d6f64756c65732f757365722f76696577735f68616e646c65725f617267756d656e745f757365725f7569642e696e63223b693a3138343b733a35353a226d6f64756c65732f757365722f76696577735f68616e646c65725f617267756d656e745f75736572735f726f6c65735f7269642e696e63223b693a3138353b733a34313a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365722e696e63223b693a3138363b733a35303a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c616e67756167652e696e63223b693a3138373b733a34363a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c696e6b2e696e63223b693a3138383b733a35333a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c696e6b5f63616e63656c2e696e63223b693a3138393b733a35313a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c696e6b5f656469742e696e63223b693a3139303b733a34363a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6d61696c2e696e63223b693a3139313b733a34363a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6e616d652e696e63223b693a3139323b733a35333a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f7065726d697373696f6e732e696e63223b693a3139333b733a34393a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f706963747572652e696e63223b693a3139343b733a34373a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f726f6c65732e696e63223b693a3139353b733a35303a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f63757272656e742e696e63223b693a3139363b733a34373a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f6e616d652e696e63223b693a3139373b733a35343a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f7065726d697373696f6e732e696e63223b693a3139383b733a34383a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f726f6c65732e696e63223b693a3139393b733a35393a226d6f64756c65732f757365722f76696577735f706c7567696e5f617267756d656e745f64656661756c745f63757272656e745f757365722e696e63223b693a3230303b733a35313a226d6f64756c65732f757365722f76696577735f706c7567696e5f617267756d656e745f64656661756c745f757365722e696e63223b693a3230313b733a35323a226d6f64756c65732f757365722f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f757365722e696e63223b693a3230323b733a34333a226d6f64756c65732f757365722f76696577735f706c7567696e5f726f775f757365725f766965772e696e63223b693a3230333b733a33313a22706c7567696e732f76696577735f706c7567696e5f6163636573732e696e63223b693a3230343b733a33363a22706c7567696e732f76696577735f706c7567696e5f6163636573735f6e6f6e652e696e63223b693a3230353b733a33363a22706c7567696e732f76696577735f706c7567696e5f6163636573735f7065726d2e696e63223b693a3230363b733a33363a22706c7567696e732f76696577735f706c7567696e5f6163636573735f726f6c652e696e63223b693a3230373b733a34313a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c742e696e63223b693a3230383b733a34353a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c745f7068702e696e63223b693a3230393b733a34373a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c745f66697865642e696e63223b693a3231303b733a34353a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c745f7261772e696e63223b693a3231313b733a34323a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f76616c69646174652e696e63223b693a3231323b733a35303a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f6e756d657269632e696e63223b693a3231333b733a34363a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f7068702e696e63223b693a3231343b733a33303a22706c7567696e732f76696577735f706c7567696e5f63616368652e696e63223b693a3231353b733a33353a22706c7567696e732f76696577735f706c7567696e5f63616368655f6e6f6e652e696e63223b693a3231363b733a33353a22706c7567696e732f76696577735f706c7567696e5f63616368655f74696d652e696e63223b693a3231373b733a33323a22706c7567696e732f76696577735f706c7567696e5f646973706c61792e696e63223b693a3231383b733a34333a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f6174746163686d656e742e696e63223b693a3231393b733a33383a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f626c6f636b2e696e63223b693a3232303b733a34303a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f64656661756c742e696e63223b693a3232313b733a33383a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f656d6265642e696e63223b693a3232323b733a34313a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f657874656e6465722e696e63223b693a3232333b733a33373a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f666565642e696e63223b693a3232343b733a33373a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f706167652e696e63223b693a3232353b733a34333a22706c7567696e732f76696577735f706c7567696e5f6578706f7365645f666f726d5f62617369632e696e63223b693a3232363b733a33373a22706c7567696e732f76696577735f706c7567696e5f6578706f7365645f666f726d2e696e63223b693a3232373b733a35323a22706c7567696e732f76696577735f706c7567696e5f6578706f7365645f666f726d5f696e7075745f72657175697265642e696e63223b693a3232383b733a34323a22706c7567696e732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e5f636f72652e696e63223b693a3232393b733a33373a22706c7567696e732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e2e696e63223b693a3233303b733a34323a22706c7567696e732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e5f6e6f6e652e696e63223b693a3233313b733a33303a22706c7567696e732f76696577735f706c7567696e5f70616765722e696e63223b693a3233323b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f66756c6c2e696e63223b693a3233333b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f6d696e692e696e63223b693a3233343b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f6e6f6e652e696e63223b693a3233353b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f736f6d652e696e63223b693a3233363b733a33303a22706c7567696e732f76696577735f706c7567696e5f71756572792e696e63223b693a3233373b733a33383a22706c7567696e732f76696577735f706c7567696e5f71756572795f64656661756c742e696e63223b693a3233383b733a32383a22706c7567696e732f76696577735f706c7567696e5f726f772e696e63223b693a3233393b733a33353a22706c7567696e732f76696577735f706c7567696e5f726f775f6669656c64732e696e63223b693a3234303b733a33393a22706c7567696e732f76696577735f706c7567696e5f726f775f7273735f6669656c64732e696e63223b693a3234313b733a33303a22706c7567696e732f76696577735f706c7567696e5f7374796c652e696e63223b693a3234323b733a33383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f64656661756c742e696e63223b693a3234333b733a33353a22706c7567696e732f76696577735f706c7567696e5f7374796c655f677269642e696e63223b693a3234343b733a33353a22706c7567696e732f76696577735f706c7567696e5f7374796c655f6c6973742e696e63223b693a3234353b733a34303a22706c7567696e732f76696577735f706c7567696e5f7374796c655f6a756d705f6d656e752e696e63223b693a3234363b733a33383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f6d617070696e672e696e63223b693a3234373b733a33343a22706c7567696e732f76696577735f706c7567696e5f7374796c655f7273732e696e63223b693a3234383b733a33383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f73756d6d6172792e696e63223b693a3234393b733a34383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f73756d6d6172795f6a756d705f6d656e752e696e63223b693a3235303b733a35303a22706c7567696e732f76696577735f706c7567696e5f7374796c655f73756d6d6172795f756e666f726d61747465642e696e63223b693a3235313b733a33363a22706c7567696e732f76696577735f706c7567696e5f7374796c655f7461626c652e696e63223b693a3235323b733a33343a2274657374732f68616e646c6572732f76696577735f68616e646c6572732e74657374223b693a3235333b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f617265615f746578742e74657374223b693a3235343b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6e756c6c2e74657374223b693a3235353b733a34393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f617267756d656e745f737472696e672e74657374223b693a3235363b733a33393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c642e74657374223b693a3235373b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f626f6f6c65616e2e74657374223b693a3235383b733a34363a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f637573746f6d2e74657374223b693a3235393b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f636f756e7465722e74657374223b693a3236303b733a34343a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f646174652e74657374223b693a3236313b733a35343a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f66696c655f657874656e73696f6e2e74657374223b693a3236323b733a34393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f66696c655f73697a652e74657374223b693a3236333b733a34343a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f6d6174682e74657374223b693a3236343b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f75726c2e74657374223b693a3236353b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f7873732e74657374223b693a3236363b733a34383a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f636f6d62696e652e74657374223b693a3236373b733a34353a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f646174652e74657374223b693a3236383b733a34393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f657175616c6974792e74657374223b693a3236393b733a35323a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f696e5f6f70657261746f722e74657374223b693a3237303b733a34383a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f6e756d657269632e74657374223b693a3237313b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f737472696e672e74657374223b693a3237323b733a34353a2274657374732f68616e646c6572732f76696577735f68616e646c65725f736f72745f72616e646f6d2e74657374223b693a3237333b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f736f72745f646174652e74657374223b693a3237343b733a33383a2274657374732f68616e646c6572732f76696577735f68616e646c65725f736f72742e74657374223b693a3237353b733a34363a2274657374732f746573745f68616e646c6572732f76696577735f746573745f617265615f6163636573732e696e63223b693a3237363b733a36303a2274657374732f746573745f706c7567696e732f76696577735f746573745f706c7567696e5f6163636573735f746573745f64796e616d69632e696e63223b693a3237373b733a35393a2274657374732f746573745f706c7567696e732f76696577735f746573745f706c7567696e5f6163636573735f746573745f7374617469632e696e63223b693a3237383b733a35393a2274657374732f746573745f706c7567696e732f76696577735f746573745f706c7567696e5f7374796c655f746573745f6d617070696e672e696e63223b693a3237393b733a33393a2274657374732f706c7567696e732f76696577735f706c7567696e5f646973706c61792e74657374223b693a3238303b733a34363a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f6a756d705f6d656e752e74657374223b693a3238313b733a33363a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c652e74657374223b693a3238323b733a34313a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f626173652e74657374223b693a3238333b733a34343a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f6d617070696e672e74657374223b693a3238343b733a34383a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f756e666f726d61747465642e74657374223b693a3238353b733a32333a2274657374732f76696577735f6163636573732e74657374223b693a3238363b733a32343a2274657374732f76696577735f616e616c797a652e74657374223b693a3238373b733a32323a2274657374732f76696577735f62617369632e74657374223b693a3238383b733a32313a2274657374732f76696577735f616a61782e74657374223b693a3238393b733a33333a2274657374732f76696577735f617267756d656e745f64656661756c742e74657374223b693a3239303b733a33353a2274657374732f76696577735f617267756d656e745f76616c696461746f722e74657374223b693a3239313b733a32393a2274657374732f76696577735f6578706f7365645f666f726d2e74657374223b693a3239323b733a33313a2274657374732f6669656c642f76696577735f6669656c646170692e74657374223b693a3239333b733a32353a2274657374732f76696577735f676c6f73736172792e74657374223b693a3239343b733a32343a2274657374732f76696577735f67726f757062792e74657374223b693a3239353b733a32353a2274657374732f76696577735f68616e646c6572732e74657374223b693a3239363b733a32333a2274657374732f76696577735f6d6f64756c652e74657374223b693a3239373b733a32323a2274657374732f76696577735f70616765722e74657374223b693a3239383b733a34303a2274657374732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e5f746573742e696e63223b693a3239393b733a32393a2274657374732f76696577735f7472616e736c617461626c652e74657374223b693a3330303b733a32323a2274657374732f76696577735f71756572792e74657374223b693a3330313b733a32343a2274657374732f76696577735f757067726164652e74657374223b693a3330323b733a33343a2274657374732f76696577735f746573742e76696577735f64656661756c742e696e63223b693a3330333b733a35383a2274657374732f636f6d6d656e742f76696577735f68616e646c65725f617267756d656e745f636f6d6d656e745f757365725f7569642e74657374223b693a3330343b733a35363a2274657374732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f636f6d6d656e745f757365725f7569642e74657374223b693a3330353b733a34353a2274657374732f6e6f64652f76696577735f6e6f64655f7265766973696f6e5f72656c6174696f6e732e74657374223b693a3330363b733a36313a2274657374732f7461786f6e6f6d792f76696577735f68616e646c65725f72656c6174696f6e736869705f6e6f64655f7465726d5f646174612e74657374223b693a3330373b733a34353a2274657374732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6e616d652e74657374223b693a3330383b733a34333a2274657374732f757365722f76696577735f757365725f617267756d656e745f64656661756c742e74657374223b693a3330393b733a34343a2274657374732f757365722f76696577735f757365725f617267756d656e745f76616c69646174652e74657374223b693a3331303b733a32363a2274657374732f757365722f76696577735f757365722e74657374223b693a3331313b733a32323a2274657374732f76696577735f63616368652e74657374223b693a3331323b733a32313a2274657374732f76696577735f766965772e74657374223b693a3331333b733a31393a2274657374732f76696577735f75692e74657374223b7d733a373a2276657273696f6e223b733a383a22372e782d332e3138223b733a373a2270726f6a656374223b733a353a227669657773223b733a393a22646174657374616d70223b733a31303a2231353033343935313033223b733a353a226d74696d65223b693a313532383430313338383b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/views/views_ui.module', 'views_ui', 'module', '', 1, 0, 0, 0, 0x613a31343a7b733a343a226e616d65223b733a383a225669657773205549223b733a31313a226465736372697074696f6e223b733a39333a2241646d696e69737472617469766520696e7465726661636520746f2076696577732e20576974686f75742074686973206d6f64756c652c20796f752063616e6e6f7420637265617465206f72206564697420796f75722076696577732e223b733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f7669657773223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a227669657773223b7d733a33343a22232040636f64696e675374616e646172647349676e6f72654c696e650a66696c6573223b613a313a7b693a303b733a31353a2276696577735f75692e6d6f64756c65223b7d733a353a2266696c6573223b613a313a7b693a303b733a35373a22706c7567696e732f76696577735f77697a6172642f76696577735f75695f626173655f76696577735f77697a6172642e636c6173732e706870223b7d733a373a2276657273696f6e223b733a383a22372e782d332e3138223b733a373a2270726f6a656374223b733a353a227669657773223b733a393a22646174657374616d70223b733a31303a2231353033343935313033223b733a353a226d74696d65223b693a313532383430313338383b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/views_slideshow/contrib/views_slideshow_cycle/views_slideshow_cycle.module', 'views_slideshow_cycle', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a22566965777320536c69646573686f773a204379636c65223b733a31313a226465736372697074696f6e223b733a35303a2241646473206120526f746174696e6720736c69646573686f77206d6f646520746f20566965777320536c69646573686f772e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31353a2276696577735f736c69646573686f77223b693a313b733a393a226c6962726172696573223b7d733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d332e39223b733a373a2270726f6a656374223b733a31353a2276696577735f736c69646573686f77223b733a393a22646174657374616d70223b733a31303a2231343936383933313533223b733a353a226d74696d65223b693a313439363931383335343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/views_slideshow/contrib/views_slideshow_simple_pager/views_slideshow_simple_pager.module', 'views_slideshow_simple_pager', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a32383a22566965777320536c69646573686f772053696d706c65205061676572223b733a31313a226465736372697074696f6e223b733a34343a2250726f766964657320612073696d706c6520706167657220666f7220566965777320536c69646573686f772e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31353a2276696577735f736c69646573686f77223b7d733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d332e39223b733a373a2270726f6a656374223b733a31353a2276696577735f736c69646573686f77223b733a393a22646174657374616d70223b733a31303a2231343936383933313533223b733a353a226d74696d65223b693a313439363931383335343b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d),
('sites/all/modules/views_slideshow/views_slideshow.module', 'views_slideshow', 'module', '', 1, 0, 7300, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22566965777320536c69646573686f77223b733a31313a226465736372697074696f6e223b733a3135353a2250726f766964657320612056696577207374796c65207468617420646973706c61797320726f77732061732061206a517565727920736c69646573686f772e20205468697320697320616e2041504920616e6420726571756972657320566965777320536c69646573686f77204379636c65206f7220616e6f74686572206d6f64756c65207468617420737570706f72747320746865204150492e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a227669657773223b7d733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a34323a2276696577735f736c69646573686f775f706c7567696e5f7374796c655f736c69646573686f772e696e63223b7d733a373a2276657273696f6e223b733a373a22372e782d332e39223b733a373a2270726f6a656374223b733a31353a2276696577735f736c69646573686f77223b733a393a22646174657374616d70223b733a31303a2231343936383933313533223b733a353a226d74696d65223b693a313439363931383335343b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` (`filename`, `name`, `type`, `owner`, `status`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES
('sites/all/themes/bootstrap/bootstrap.info', 'bootstrap', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a32323a7b733a343a226e616d65223b733a393a22426f6f747374726170223b733a31313a226465736372697074696f6e223b733a3131353a224275696c7420746f2075736520426f6f7473747261702c206120736c65656b2c20696e747569746976652c20616e6420706f77657266756c2066726f6e742d656e64206672616d65776f726b20666f722066617374657220616e64206561736965722077656220646576656c6f706d656e742e223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a353a22352e332e30223b733a32333a2273696d706c79746573745f646570656e64656e63696573223b613a313a7b693a303b733a31333a226a71756572795f757064617465223b7d733a373a22726567696f6e73223b613a31343a7b733a343a226c6f676f223b733a343a224c6f676f223b733a31303a226e617669676174696f6e223b733a31303a224e617669676174696f6e223b733a363a22686561646572223b733a373a22546f7020426172223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a373a225072696d617279223b733a31343a22736964656261725f7365636f6e64223b733a393a225365636f6e64617279223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a323a7b733a31333a226373732f7374796c652e637373223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e637373223b733a31333a226373732f7374796c652e706870223b733a34303a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f6373732f7374796c652e706870223b7d7d733a383a2273657474696e6773223b613a36313a7b733a32353a22626f6f7473747261705f666c7569645f636f6e7461696e6572223b733a313a2230223b733a32313a22626f6f7473747261705f627574746f6e5f73697a65223b733a303a22223b733a32353a22626f6f7473747261705f627574746f6e5f636f6c6f72697a65223b733a313a2231223b733a32343a22626f6f7473747261705f627574746f6e5f69636f6e697a65223b733a313a2231223b733a32313a22626f6f7473747261705f696d6167655f7368617065223b733a303a22223b733a32363a22626f6f7473747261705f696d6167655f726573706f6e73697665223b733a313a2231223b733a32343a22626f6f7473747261705f7461626c655f626f726465726564223b733a313a2230223b733a32353a22626f6f7473747261705f7461626c655f636f6e64656e736564223b733a313a2230223b733a32313a22626f6f7473747261705f7461626c655f686f766572223b733a313a2231223b733a32333a22626f6f7473747261705f7461626c655f73747269706564223b733a313a2231223b733a32363a22626f6f7473747261705f7461626c655f726573706f6e73697665223b733a323a222d31223b733a32303a22626f6f7473747261705f62726561646372756d62223b733a313a2231223b733a32353a22626f6f7473747261705f62726561646372756d625f686f6d65223b733a313a2230223b733a32363a22626f6f7473747261705f62726561646372756d625f7469746c65223b733a313a2231223b733a32353a22626f6f7473747261705f6e61766261725f706f736974696f6e223b733a303a22223b733a32343a22626f6f7473747261705f6e61766261725f696e7665727365223b733a313a2230223b733a33303a22626f6f7473747261705f70616765725f66697273745f616e645f6c617374223b733a313a2231223b733a33323a22626f6f7473747261705f726567696f6e5f77656c6c2d6e617669676174696f6e223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d686561646572223b733a303a22223b733a33333a22626f6f7473747261705f726567696f6e5f77656c6c2d686967686c696768746564223b733a303a22223b733a32363a22626f6f7473747261705f726567696f6e5f77656c6c2d68656c70223b733a303a22223b733a32393a22626f6f7473747261705f726567696f6e5f77656c6c2d636f6e74656e74223b733a303a22223b733a33353a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f6669727374223b733a343a2277656c6c223b733a33363a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f7365636f6e64223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d666f6f746572223b733a303a22223b733a32313a22626f6f7473747261705f616e63686f72735f666978223b733a313a2230223b733a33343a22626f6f7473747261705f616e63686f72735f736d6f6f74685f7363726f6c6c696e67223b733a313a2230223b733a33343a22626f6f7473747261705f666f726d735f72657175697265645f6861735f6572726f72223b733a313a2230223b733a33383a22626f6f7473747261705f666f726d735f6861735f6572726f725f76616c75655f746f67676c65223b733a313a2231223b733a33343a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e73223b733a313a2231223b733a34303a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f6c696d6974223b733a333a22323530223b733a34373a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f616c6c6f7765645f74616773223b733a33333a22622c20636f64652c20656d2c20692c206b62642c207370616e2c207374726f6e67223b733a32353a22626f6f7473747261705f706f706f7665725f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f706f706f7665725f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f706f706f7665725f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f706c6163656d656e74223b733a353a227269676874223b733a32363a22626f6f7473747261705f706f706f7665725f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f74726967676572223b613a333a7b733a373a2227686f76657227223b733a313a2230223b733a373a2227666f63757327223b733a313a2230223b733a373a2227636c69636b27223b733a353a22636c69636b223b7d733a33353a22626f6f7473747261705f706f706f7665725f747269676765725f6175746f636c6f7365223b733a313a2231223b733a32333a22626f6f7473747261705f706f706f7665725f7469746c65223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f636f6e74656e74223b733a303a22223b733a32333a22626f6f7473747261705f706f706f7665725f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f636f6e7461696e6572223b733a343a22626f6479223b733a32353a22626f6f7473747261705f746f6f6c7469705f656e61626c6564223b733a313a2231223b733a32373a22626f6f7473747261705f746f6f6c7469705f616e696d6174696f6e223b733a313a2231223b733a32323a22626f6f7473747261705f746f6f6c7469705f68746d6c223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f706c6163656d656e74223b733a393a226175746f206c656674223b733a32363a22626f6f7473747261705f746f6f6c7469705f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f746f6f6c7469705f74726967676572223b613a333a7b733a373a2227686f76657227223b733a353a22686f766572223b733a373a2227666f63757327223b733a353a22666f637573223b733a373a2227636c69636b27223b733a313a2230223b7d733a32333a22626f6f7473747261705f746f6f6c7469705f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f636f6e7461696e6572223b733a343a22626f6479223b733a32323a22626f6f7473747261705f63646e5f70726f7669646572223b733a383a226a7364656c697672223b733a32343a22626f6f7473747261705f63646e5f637573746f6d5f637373223b733a35383a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e637373223b733a32383a22626f6f7473747261705f63646e5f637573746f6d5f6373735f6d696e223b733a36323a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e6d696e2e637373223b733a32333a22626f6f7473747261705f63646e5f637573746f6d5f6a73223b733a35363a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6a73223b733a32373a22626f6f7473747261705f63646e5f637573746f6d5f6a735f6d696e223b733a36303a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6d696e2e6a73223b733a33303a22626f6f7473747261705f63646e5f6a7364656c6976725f76657273696f6e223b733a353a22332e332e37223b733a32383a22626f6f7473747261705f63646e5f6a7364656c6976725f7468656d65223b733a393a22626f6f747374726170223b733a31313a22746f67676c655f6e616d65223b733a313a2231223b733a31333a22746f67676c655f736561726368223b733a313a2231223b733a32383a226a71756572795f7570646174655f6a71756572795f76657273696f6e223b733a333a22322e31223b7d733a373a226578636c756465223b613a313a7b733a333a22637373223b613a32343a7b693a303b733a32323a226d6973632f766572746963616c2d746162732e637373223b693a313b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b693a323b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b693a333b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b693a343b733a32333a226d6f64756c65732f64626c6f672f64626c6f672e637373223b693a353b733a32313a226d6f64756c65732f66696c652f66696c652e637373223b693a363b733a32353a226d6f64756c65732f66696c7465722f66696c7465722e637373223b693a373b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b693a383b733a32313a226d6f64756c65732f68656c702f68656c702e637373223b693a393b733a32313a226d6f64756c65732f6d656e752f6d656e752e637373223b693a31303b733a32353a226d6f64756c65732f6f70656e69642f6f70656e69642e637373223b693a31313b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b693a31323b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b693a31333b733a33333a226d6f64756c65732f737461746973746963732f737461746973746963732e637373223b693a31343b733a32353a226d6f64756c65732f7379736c6f672f7379736c6f672e637373223b693a31353b733a33303a226d6f64756c65732f73797374656d2f6d61696e74656e616e63652e637373223b693a31363b733a33373a226d6f64756c65732f73797374656d2f73797374656d2e6d61696e74656e616e63652e637373223b693a31373b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e6d656e75732e637373223b693a31383b733a33343a226d6f64756c65732f73797374656d2f73797374656d2e6d657373616765732e637373223b693a31393b733a33313a226d6f64756c65732f73797374656d2f73797374656d2e7468656d652e637373223b693a32303b733a32393a226d6f64756c65732f7461786f6e6f6d792f7461786f6e6f6d792e637373223b693a32313b733a32373a226d6f64756c65732f747261636b65722f747261636b65722e637373223b693a32323b733a32353a226d6f64756c65732f7570646174652f7570646174652e637373223b693a32333b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a31313a22627265616b706f696e7473223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b733a31383a22286d61782d77696474683a20373637707829223b733a31333a2273637265656e2d736d2d6d696e223b733a31383a22286d696e2d77696474683a20373638707829223b733a31333a2273637265656e2d736d2d6d6178223b733a31383a22286d61782d77696474683a20393931707829223b733a31333a2273637265656e2d6d642d6d696e223b733a31383a22286d696e2d77696474683a20393932707829223b733a31333a2273637265656e2d6d642d6d6178223b733a31393a22286d61782d77696474683a2031313939707829223b733a31333a2273637265656e2d6c672d6d696e223b733a31393a22286d696e2d77696474683a2031323030707829223b7d733a31313a226d756c7469706c69657273223b613a363a7b733a31333a2273637265656e2d78732d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d736d2d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6d642d6d6178223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d733a31333a2273637265656e2d6c672d6d696e223b613a323a7b693a303b733a343a22312e3578223b693a313b733a323a223278223b7d7d733a373a2276657273696f6e223b733a383a22372e782d332e3230223b733a373a2270726f6a656374223b733a393a22626f6f747374726170223b733a393a22646174657374616d70223b733a31303a2231353234303931303839223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a34313a2273697465732f616c6c2f7468656d65732f626f6f7473747261702f73637265656e73686f742e706e67223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313533343934393133373b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d),
('themes/bartik/bartik.info', 'bartik', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31393a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d),
('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, -1, 0, 0x613a31393a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d),
('themes/seven/seven.info', 'seven', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31393a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d),
('themes/stark/stark.info', 'stark', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3539223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231353234363733323834223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a353a226d74696d65223b693a313532343639383438343b733a31353a226f7665726c61795f726567696f6e73223b613a333a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a31313a22706167655f626f74746f6d223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

CREATE TABLE `taxonomy_index` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

--
-- Dumping data for table `taxonomy_index`
--

INSERT INTO `taxonomy_index` (`nid`, `tid`, `sticky`, `created`) VALUES
(2, 2, 0, 1530645603),
(2, 4, 0, 1530645603),
(2, 6, 0, 1530645603),
(1, 1, 0, 1530645570),
(1, 3, 0, 1530645570),
(1, 5, 0, 1530645570),
(6, 2, 0, 1532258826),
(6, 3, 0, 1532258826),
(6, 5, 0, 1532258826);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

CREATE TABLE `taxonomy_term_data` (
  `tid` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores term information.';

--
-- Dumping data for table `taxonomy_term_data`
--

INSERT INTO `taxonomy_term_data` (`tid`, `vid`, `name`, `description`, `format`, `weight`) VALUES
(1, 2, 'India', '', 'filtered_html', 0),
(2, 2, 'America', '', 'filtered_html', 0),
(3, 3, 'UP', '', 'filtered_html', 0),
(4, 3, 'US', '', 'filtered_html', 0),
(5, 4, 'noida', '', 'filtered_html', 0),
(6, 4, 'Wasington', '', 'filtered_html', 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_hierarchy`
--

CREATE TABLE `taxonomy_term_hierarchy` (
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the hierarchical relationship between terms.';

--
-- Dumping data for table `taxonomy_term_hierarchy`
--

INSERT INTO `taxonomy_term_hierarchy` (`tid`, `parent`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_vocabulary`
--

CREATE TABLE `taxonomy_vocabulary` (
  `vid` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.';

--
-- Dumping data for table `taxonomy_vocabulary`
--

INSERT INTO `taxonomy_vocabulary` (`vid`, `name`, `machine_name`, `description`, `hierarchy`, `module`, `weight`) VALUES
(1, 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', 0, 'taxonomy', 0),
(2, 'country', 'country', '', 0, 'taxonomy', 0),
(3, 'state', 'state', '', 0, 'taxonomy', 0),
(4, 'city', 'city', '', 0, 'taxonomy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE `url_alias` (
  `pid` int(10) UNSIGNED NOT NULL COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of URL aliases for Drupal paths; a user may visit...';

--
-- Dumping data for table `url_alias`
--

INSERT INTO `url_alias` (`pid`, `source`, `alias`, `language`) VALUES
(1, 'node/1', 'content/miri-marriott-resort-spa', 'und'),
(2, 'node/6', 'content/book-early-and-be-rewarded', 'und'),
(3, 'user/5', 'users/admin', 'und'),
(4, 'user/12', 'users/kapil', 'und');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) DEFAULT NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user data.';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `pass`, `mail`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES
(0, '', '', '', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, '', NULL),
(1, 'demo', '$S$DP4w359Q6HGiUL4PShjomv08uFYsShnyVuM42wONym0Q8ggZDk0/', 'kapil0324@gmail.com', '', '', NULL, 1529848146, 1534959443, 1534922560, 1, 'America/Los_Angeles', '', 0, 'kapil0324@gmail.com', 0x623a303b),
(5, 'admin', '$S$DjRp/Fd1atvaMUCGqejJVhB6sgXJO2eo9wTJUzCu4zJVJKqjmg.B', 'coolkapil0324@gmail.com', '', '', 'filtered_html', 1532231354, 0, 0, 1, 'America/Los_Angeles', '', 0, 'coolkapil0324@gmail.com', 0x613a363a7b733a353a22626c6f636b223b613a313a7b733a363a2273797374656d223b613a313a7b733a343a226d61696e223b693a303b7d7d733a31363a22636b656469746f725f64656661756c74223b733a313a2274223b733a32303a22636b656469746f725f73686f775f746f67676c65223b733a313a2274223b733a31343a22636b656469746f725f7769647468223b733a343a2231303025223b733a31333a22636b656469746f725f6c616e67223b733a323a22656e223b733a31383a22636b656469746f725f6175746f5f6c616e67223b733a313a2274223b7d),
(12, 'kapil', '$S$Duy3ynZKLow.b.Zuu26GUaVe831TSLKRRJP9MKe9a5QIMja9cslW', 'k@gmail.com', '', '', 'filtered_html', 1532450144, 1532450171, 1532450171, 1, 'America/Los_Angeles', '', 0, 'k@gmail.com', 0x613a353a7b733a31363a22636b656469746f725f64656661756c74223b733a313a2274223b733a32303a22636b656469746f725f73686f775f746f67676c65223b733a313a2274223b733a31343a22636b656469746f725f7769647468223b733a343a2231303025223b733a31333a22636b656469746f725f6c616e67223b733a323a22656e223b733a31383a22636b656469746f725f6175746f5f6c616e67223b733a313a2274223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: role.rid for role.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to roles.';

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`uid`, `rid`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` (`name`, `value`) VALUES
('additional_settings__active_tab_banner', 0x733a393a22656469742d6d656e75223b),
('additional_settings__active_tab_hotel', 0x733a31323a22656469742d636f6d6d656e74223b),
('admin_theme', 0x733a353a22736576656e223b),
('cache_class_cache_ctools_css', 0x733a31343a2243546f6f6c734373734361636865223b),
('clean_url', 0x733a313a2231223b),
('comment_anonymous_banner', 0x693a303b),
('comment_anonymous_hotel', 0x693a303b),
('comment_banner', 0x733a313a2231223b),
('comment_default_mode_banner', 0x693a313b),
('comment_default_mode_hotel', 0x693a313b),
('comment_default_per_page_banner', 0x733a323a223530223b),
('comment_default_per_page_hotel', 0x733a323a223530223b),
('comment_form_location_banner', 0x693a313b),
('comment_form_location_hotel', 0x693a313b),
('comment_hotel', 0x733a313a2231223b),
('comment_page', 0x693a303b),
('comment_preview_banner', 0x733a313a2231223b),
('comment_preview_hotel', 0x733a313a2231223b),
('comment_subject_field_banner', 0x693a313b),
('comment_subject_field_hotel', 0x693a313b),
('cron_key', 0x733a34333a223779625a5954554f61314e70597a2d4862356e656349697a2d5757476c6259682d77483764456c47466941223b),
('cron_last', 0x693a313533343935393235303b),
('css_js_query_string', 0x733a363a22706476616537223b),
('ctools_last_cron', 0x693a313533343932313335333b),
('date_default_timezone', 0x733a31393a22416d65726963612f4c6f735f416e67656c6573223b),
('default_nodes_main', 0x733a323a223130223b),
('drupal_http_request_fails', 0x623a303b),
('drupal_private_key', 0x733a34333a22785f61636f4d79507650784262526d78795a4f476c757847515857716332745879526277623336622d366f223b),
('field_bundle_settings_node__banner', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a303a7b7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a323a222d35223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('field_bundle_settings_node__hotel', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a303a7b7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a323a222d35223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d),
('file_temporary_path', 0x733a31323a22443a5c78616d70705c746d70223b),
('filter_fallback_format', 0x733a31303a22706c61696e5f74657874223b),
('install_profile', 0x733a383a227374616e64617264223b),
('install_task', 0x733a343a22646f6e65223b),
('install_time', 0x693a313532393834383331363b),
('jquery_update_compression_type', 0x733a333a226d696e223b),
('jquery_update_jquery_admin_version', 0x733a333a22312e37223b),
('jquery_update_jquery_cdn', 0x733a363a226a7175657279223b),
('jquery_update_jquery_version', 0x733a343a22312e3130223b),
('menu_default_active_menus', 0x613a353a7b693a303b733a393a226d61696e2d6d656e75223b693a313b733a31303a226d616e6167656d656e74223b693a323b733a31303a226e617669676174696f6e223b693a343b733a393a22757365722d6d656e75223b693a353b733a31333a226d656e752d746f702d6c696e6b223b7d),
('menu_expanded', 0x613a323a7b693a303b733a393a226d61696e2d6d656e75223b693a313b733a31303a226d616e6167656d656e74223b7d),
('menu_masks', 0x613a33353a7b693a303b693a3530313b693a313b693a3439333b693a323b693a3235303b693a333b693a3234373b693a343b693a3234363b693a353b693a3234353b693a363b693a3132353b693a373b693a3132343b693a383b693a3132333b693a393b693a3132323b693a31303b693a3132313b693a31313b693a3131373b693a31323b693a36333b693a31333b693a36323b693a31343b693a36313b693a31353b693a36303b693a31363b693a35393b693a31373b693a35383b693a31383b693a34343b693a31393b693a33313b693a32303b693a33303b693a32313b693a32393b693a32323b693a32383b693a32333b693a32343b693a32343b693a32313b693a32353b693a31353b693a32363b693a31343b693a32373b693a31333b693a32383b693a31313b693a32393b693a373b693a33303b693a363b693a33313b693a353b693a33323b693a333b693a33333b693a323b693a33343b693a313b7d),
('menu_options_banner', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_options_hotel', 0x613a313a7b693a303b733a393a226d61696e2d6d656e75223b7d),
('menu_parent_banner', 0x733a31313a226d61696e2d6d656e753a30223b),
('menu_parent_hotel', 0x733a31313a226d61696e2d6d656e753a30223b),
('node_admin_theme', 0x733a313a2231223b),
('node_cron_last', 0x733a31303a2231353334393330373633223b),
('node_options_banner', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_options_hotel', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_options_page', 0x613a313a7b693a303b733a363a22737461747573223b7d),
('node_preview_banner', 0x733a313a2231223b),
('node_preview_hotel', 0x733a313a2231223b),
('node_submitted_banner', 0x693a303b),
('node_submitted_hotel', 0x693a303b),
('node_submitted_page', 0x623a303b),
('pathauto_blog_pattern', 0x733a31373a22626c6f67732f5b757365723a6e616d655d223b),
('pathauto_forum_pattern', 0x733a32393a225b7465726d3a766f636162756c6172795d2f5b7465726d3a6e616d655d223b),
('pathauto_node_pattern', 0x733a32303a22636f6e74656e742f5b6e6f64653a7469746c655d223b),
('pathauto_punctuation_hyphen', 0x693a313b),
('pathauto_taxonomy_term_pattern', 0x733a32393a225b7465726d3a766f636162756c6172795d2f5b7465726d3a6e616d655d223b),
('pathauto_user_pattern', 0x733a31373a2275736572732f5b757365723a6e616d655d223b),
('path_alias_whitelist', 0x613a323a7b733a343a226e6f6465223b623a313b733a343a2275736572223b623a313b7d),
('save_continue_banner', 0x733a31393a225361766520616e6420616464206669656c6473223b),
('save_continue_hotel', 0x733a31393a225361766520616e6420616464206669656c6473223b),
('services_security_update_1', 0x623a313b),
('site_403', 0x733a303a22223b),
('site_404', 0x733a303a22223b),
('site_default_country', 0x733a303a22223b),
('site_frontpage', 0x733a343a226e6f6465223b),
('site_mail', 0x733a31393a226b6170696c3033323440676d61696c2e636f6d223b),
('site_name', 0x733a343a2264656d6f223b),
('site_slogan', 0x733a303a22223b),
('theme_bootstrap_settings', 0x613a38303a7b733a31313a22746f67676c655f6c6f676f223b693a313b733a31313a22746f67676c655f6e616d65223b693a313b733a31333a22746f67676c655f736c6f67616e223b693a313b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a313b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a313b733a33323a22746f67676c655f636f6d6d656e745f757365725f766572696669636174696f6e223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a313b733a31363a22746f67676c655f6d61696e5f6d656e75223b693a313b733a32313a22746f67676c655f7365636f6e646172795f6d656e75223b693a313b733a31323a2264656661756c745f6c6f676f223b693a303b733a393a226c6f676f5f70617468223b733a33363a227075626c69633a2f2f6f69655f32323935353331334272614f477a38202832292e706e67223b733a31353a2264656661756c745f66617669636f6e223b693a313b733a31323a2266617669636f6e5f70617468223b733a303a22223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b733a32313a22626f6f7473747261705f5f6163746976655f746162223b733a31323a22656469742d67656e6572616c223b733a32353a22626f6f7473747261705f666c7569645f636f6e7461696e6572223b693a303b733a32313a22626f6f7473747261705f627574746f6e5f73697a65223b733a303a22223b733a32353a22626f6f7473747261705f627574746f6e5f636f6c6f72697a65223b693a313b733a32343a22626f6f7473747261705f627574746f6e5f69636f6e697a65223b693a313b733a33343a22626f6f7473747261705f666f726d735f72657175697265645f6861735f6572726f72223b693a303b733a33343a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e73223b693a313b733a34303a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f6c696d6974223b733a333a22323530223b733a34373a22626f6f7473747261705f666f726d735f736d6172745f6465736372697074696f6e735f616c6c6f7765645f74616773223b733a33333a22622c20636f64652c20656d2c20692c206b62642c207370616e2c207374726f6e67223b733a32313a22626f6f7473747261705f696d6167655f7368617065223b733a303a22223b733a32363a22626f6f7473747261705f696d6167655f726573706f6e73697665223b693a313b733a32343a22626f6f7473747261705f7461626c655f626f726465726564223b693a303b733a32353a22626f6f7473747261705f7461626c655f636f6e64656e736564223b693a303b733a32313a22626f6f7473747261705f7461626c655f686f766572223b693a313b733a32333a22626f6f7473747261705f7461626c655f73747269706564223b693a313b733a32363a22626f6f7473747261705f7461626c655f726573706f6e73697665223b733a323a222d31223b733a32303a22626f6f7473747261705f62726561646372756d62223b733a313a2231223b733a32353a22626f6f7473747261705f62726561646372756d625f686f6d65223b693a303b733a32363a22626f6f7473747261705f62726561646372756d625f7469746c65223b693a313b733a32353a22626f6f7473747261705f6e61766261725f706f736974696f6e223b733a303a22223b733a32343a22626f6f7473747261705f6e61766261725f696e7665727365223b693a303b733a33303a22626f6f7473747261705f70616765725f66697273745f616e645f6c617374223b693a313b733a32363a22626f6f7473747261705f726567696f6e5f77656c6c2d6c6f676f223b733a303a22223b733a33323a22626f6f7473747261705f726567696f6e5f77656c6c2d6e617669676174696f6e223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d686561646572223b733a303a22223b733a33333a22626f6f7473747261705f726567696f6e5f77656c6c2d686967686c696768746564223b733a303a22223b733a32363a22626f6f7473747261705f726567696f6e5f77656c6c2d68656c70223b733a303a22223b733a32393a22626f6f7473747261705f726567696f6e5f77656c6c2d636f6e74656e74223b733a303a22223b733a33353a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f6669727374223b733a343a2277656c6c223b733a33363a22626f6f7473747261705f726567696f6e5f77656c6c2d736964656261725f7365636f6e64223b733a303a22223b733a32383a22626f6f7473747261705f726567696f6e5f77656c6c2d666f6f746572223b733a303a22223b733a33303a22626f6f7473747261705f726567696f6e5f77656c6c2d706167655f746f70223b733a303a22223b733a33333a22626f6f7473747261705f726567696f6e5f77656c6c2d706167655f626f74746f6d223b733a303a22223b733a33363a22626f6f7473747261705f726567696f6e5f77656c6c2d64617368626f6172645f6d61696e223b733a303a22223b733a33393a22626f6f7473747261705f726567696f6e5f77656c6c2d64617368626f6172645f73696465626172223b733a303a22223b733a34303a22626f6f7473747261705f726567696f6e5f77656c6c2d64617368626f6172645f696e616374697665223b733a303a22223b733a32313a22626f6f7473747261705f616e63686f72735f666978223b733a313a2230223b733a33343a22626f6f7473747261705f616e63686f72735f736d6f6f74685f7363726f6c6c696e67223b733a313a2230223b733a33383a22626f6f7473747261705f666f726d735f6861735f6572726f725f76616c75655f746f67676c65223b693a313b733a32353a22626f6f7473747261705f706f706f7665725f656e61626c6564223b693a313b733a32373a22626f6f7473747261705f706f706f7665725f616e696d6174696f6e223b693a313b733a32323a22626f6f7473747261705f706f706f7665725f68746d6c223b693a303b733a32373a22626f6f7473747261705f706f706f7665725f706c6163656d656e74223b733a353a227269676874223b733a32363a22626f6f7473747261705f706f706f7665725f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f74726967676572223b613a343a7b733a353a22636c69636b223b733a353a22636c69636b223b733a353a22686f766572223b693a303b733a353a22666f637573223b693a303b733a363a226d616e75616c223b693a303b7d733a33353a22626f6f7473747261705f706f706f7665725f747269676765725f6175746f636c6f7365223b693a313b733a32333a22626f6f7473747261705f706f706f7665725f7469746c65223b733a303a22223b733a32353a22626f6f7473747261705f706f706f7665725f636f6e74656e74223b733a303a22223b733a32333a22626f6f7473747261705f706f706f7665725f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f706f706f7665725f636f6e7461696e6572223b733a343a22626f6479223b733a32353a22626f6f7473747261705f746f6f6c7469705f656e61626c6564223b693a313b733a32373a22626f6f7473747261705f746f6f6c7469705f616e696d6174696f6e223b693a313b733a32323a22626f6f7473747261705f746f6f6c7469705f68746d6c223b693a303b733a32373a22626f6f7473747261705f746f6f6c7469705f706c6163656d656e74223b733a393a226175746f206c656674223b733a32363a22626f6f7473747261705f746f6f6c7469705f73656c6563746f72223b733a303a22223b733a32353a22626f6f7473747261705f746f6f6c7469705f74726967676572223b613a343a7b733a353a22686f766572223b733a353a22686f766572223b733a353a22666f637573223b733a353a22666f637573223b733a353a22636c69636b223b693a303b733a363a226d616e75616c223b693a303b7d733a32333a22626f6f7473747261705f746f6f6c7469705f64656c6179223b733a313a2230223b733a32373a22626f6f7473747261705f746f6f6c7469705f636f6e7461696e6572223b733a343a22626f6479223b733a32393a22626f6f7473747261705f746f67676c655f6a71756572795f6572726f72223b693a303b733a32323a22626f6f7473747261705f63646e5f70726f7669646572223b733a383a226a7364656c697672223b733a32343a22626f6f7473747261705f63646e5f637573746f6d5f637373223b733a35383a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e637373223b733a32383a22626f6f7473747261705f63646e5f637573746f6d5f6373735f6d696e223b733a36323a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6373732f626f6f7473747261702e6d696e2e637373223b733a32333a22626f6f7473747261705f63646e5f637573746f6d5f6a73223b733a35363a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6a73223b733a32373a22626f6f7473747261705f63646e5f637573746f6d5f6a735f6d696e223b733a36303a2268747470733a2f2f63646e2e6a7364656c6976722e6e65742f626f6f7473747261702f332e332e372f6a732f626f6f7473747261702e6d696e2e6a73223b733a33303a22626f6f7473747261705f63646e5f6a7364656c6976725f76657273696f6e223b733a353a22332e332e37223b733a32383a22626f6f7473747261705f63646e5f6a7364656c6976725f7468656d65223b733a393a22626f6f747374726170223b7d),
('theme_default', 0x733a393a22626f6f747374726170223b),
('update_last_check', 0x693a313533343932313337343b),
('update_notify_emails', 0x613a313a7b693a303b733a31393a226b6170696c3033323440676d61696c2e636f6d223b7d),
('user_admin_role', 0x733a313a2233223b),
('user_pictures', 0x733a313a2231223b),
('user_picture_dimensions', 0x733a393a22313032347831303234223b),
('user_picture_file_size', 0x733a333a22383030223b),
('user_picture_style', 0x733a393a227468756d626e61696c223b),
('user_register', 0x693a323b),
('views_defaults', 0x613a313a7b733a31323a2262616e6e65725f696d616765223b623a313b7d);

-- --------------------------------------------------------

--
-- Table structure for table `views_display`
--

CREATE TABLE `views_display` (
  `vid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The view this display is attached to.',
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT 'An identifier for this display; usually generated from the display_plugin, so should be something like page or page_1 or block_2, etc.',
  `display_title` varchar(64) NOT NULL DEFAULT '' COMMENT 'The title of the display, viewable by the administrator.',
  `display_plugin` varchar(64) NOT NULL DEFAULT '' COMMENT 'The type of the display. Usually page, block or embed, but is pluggable so may be other things.',
  `position` int(11) DEFAULT '0' COMMENT 'The order in which this display is loaded.',
  `display_options` longtext COMMENT 'A serialized array of options for this display; it contains options that are generally only pertinent to that display plugin type.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about each display attached to a view.';

--
-- Dumping data for table `views_display`
--

INSERT INTO `views_display` (`vid`, `id`, `display_title`, `display_plugin`, `position`, `display_options`) VALUES
(5, 'block', 'Block', 'block', 2, 'a:2:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}s:5:\"field\";a:1:{s:5:\"title\";a:1:{s:12:\"link_to_node\";i:1;}}}'),
(5, 'default', 'Master', 'default', 1, 'a:11:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}s:6:\"access\";a:2:{s:4:\"type\";s:4:\"perm\";s:4:\"perm\";s:14:\"access content\";}s:5:\"cache\";a:1:{s:4:\"type\";s:4:\"none\";}s:12:\"exposed_form\";a:1:{s:4:\"type\";s:5:\"basic\";}s:5:\"pager\";a:2:{s:4:\"type\";s:4:\"some\";s:7:\"options\";a:1:{s:14:\"items_per_page\";s:1:\"5\";}}s:12:\"style_plugin\";s:9:\"slideshow\";s:10:\"row_plugin\";s:6:\"fields\";s:6:\"fields\";a:2:{s:5:\"title\";a:22:{s:2:\"id\";s:5:\"title\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:5:\"title\";s:12:\"relationship\";s:4:\"none\";s:10:\"group_type\";s:5:\"group\";s:7:\"ui_name\";s:0:\"\";s:5:\"label\";s:0:\"\";s:7:\"exclude\";i:1;s:5:\"alter\";a:26:{s:10:\"alter_text\";i:0;s:4:\"text\";s:0:\"\";s:9:\"make_link\";i:0;s:4:\"path\";s:0:\"\";s:8:\"absolute\";i:0;s:8:\"external\";i:0;s:14:\"replace_spaces\";i:0;s:9:\"path_case\";s:4:\"none\";s:15:\"trim_whitespace\";i:0;s:3:\"alt\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:10:\"link_class\";s:0:\"\";s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:6:\"target\";s:0:\"\";s:5:\"nl2br\";i:0;s:10:\"max_length\";s:0:\"\";s:13:\"word_boundary\";i:0;s:8:\"ellipsis\";i:0;s:9:\"more_link\";i:0;s:14:\"more_link_text\";s:0:\"\";s:14:\"more_link_path\";s:0:\"\";s:10:\"strip_tags\";i:0;s:4:\"trim\";i:0;s:13:\"preserve_tags\";s:0:\"\";s:4:\"html\";i:0;}s:12:\"element_type\";s:0:\"\";s:13:\"element_class\";s:0:\"\";s:18:\"element_label_type\";s:0:\"\";s:19:\"element_label_class\";s:0:\"\";s:19:\"element_label_colon\";b:0;s:20:\"element_wrapper_type\";s:0:\"\";s:21:\"element_wrapper_class\";s:0:\"\";s:23:\"element_default_classes\";i:1;s:5:\"empty\";s:0:\"\";s:10:\"hide_empty\";i:0;s:10:\"empty_zero\";i:0;s:16:\"hide_alter_empty\";i:1;s:12:\"link_to_node\";i:1;}s:11:\"field_image\";a:35:{s:2:\"id\";s:11:\"field_image\";s:5:\"table\";s:22:\"field_data_field_image\";s:5:\"field\";s:11:\"field_image\";s:12:\"relationship\";s:4:\"none\";s:10:\"group_type\";s:5:\"group\";s:7:\"ui_name\";s:0:\"\";s:5:\"label\";s:0:\"\";s:7:\"exclude\";i:0;s:5:\"alter\";a:26:{s:10:\"alter_text\";i:0;s:4:\"text\";s:0:\"\";s:9:\"make_link\";i:0;s:4:\"path\";s:0:\"\";s:8:\"absolute\";i:0;s:8:\"external\";i:0;s:14:\"replace_spaces\";i:0;s:9:\"path_case\";s:4:\"none\";s:15:\"trim_whitespace\";i:0;s:3:\"alt\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:10:\"link_class\";s:0:\"\";s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:6:\"target\";s:0:\"\";s:5:\"nl2br\";i:0;s:10:\"max_length\";s:0:\"\";s:13:\"word_boundary\";i:1;s:8:\"ellipsis\";i:1;s:9:\"more_link\";i:0;s:14:\"more_link_text\";s:0:\"\";s:14:\"more_link_path\";s:0:\"\";s:10:\"strip_tags\";i:0;s:4:\"trim\";i:0;s:13:\"preserve_tags\";s:0:\"\";s:4:\"html\";i:0;}s:12:\"element_type\";s:0:\"\";s:13:\"element_class\";s:0:\"\";s:18:\"element_label_type\";s:0:\"\";s:19:\"element_label_class\";s:0:\"\";s:19:\"element_label_colon\";b:0;s:20:\"element_wrapper_type\";s:0:\"\";s:21:\"element_wrapper_class\";s:0:\"\";s:23:\"element_default_classes\";i:1;s:5:\"empty\";s:0:\"\";s:10:\"hide_empty\";i:0;s:10:\"empty_zero\";i:0;s:16:\"hide_alter_empty\";i:1;s:17:\"click_sort_column\";s:3:\"fid\";s:4:\"type\";s:5:\"image\";s:8:\"settings\";a:2:{s:11:\"image_style\";s:17:\"custom_image_size\";s:10:\"image_link\";s:0:\"\";}s:12:\"group_column\";s:0:\"\";s:13:\"group_columns\";a:0:{}s:10:\"group_rows\";b:1;s:11:\"delta_limit\";s:3:\"all\";s:12:\"delta_offset\";i:0;s:14:\"delta_reversed\";b:0;s:16:\"delta_first_last\";b:0;s:12:\"delta_random\";b:0;s:10:\"multi_type\";s:9:\"separator\";s:9:\"separator\";s:2:\", \";s:17:\"field_api_classes\";i:0;}}s:7:\"filters\";a:2:{s:6:\"status\";a:6:{s:5:\"value\";i:1;s:5:\"table\";s:4:\"node\";s:5:\"field\";s:6:\"status\";s:2:\"id\";s:6:\"status\";s:6:\"expose\";a:1:{s:8:\"operator\";b:0;}s:5:\"group\";i:1;}s:4:\"type\";a:4:{s:2:\"id\";s:4:\"type\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:4:\"type\";s:5:\"value\";a:1:{s:6:\"banner\";s:6:\"banner\";}}}s:5:\"sorts\";a:1:{s:7:\"created\";a:4:{s:2:\"id\";s:7:\"created\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:7:\"created\";s:5:\"order\";s:4:\"DESC\";}}s:5:\"title\";s:0:\"\";}'),
(7, 'block', 'Block', 'block', 2, 'a:1:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}}'),
(7, 'default', 'Master', 'default', 1, 'a:11:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}s:6:\"access\";a:2:{s:4:\"type\";s:4:\"perm\";s:4:\"perm\";s:14:\"access content\";}s:5:\"cache\";a:1:{s:4:\"type\";s:4:\"none\";}s:12:\"exposed_form\";a:1:{s:4:\"type\";s:5:\"basic\";}s:5:\"pager\";a:2:{s:4:\"type\";s:4:\"none\";s:7:\"options\";a:1:{s:14:\"items_per_page\";s:0:\"\";}}s:12:\"style_plugin\";s:10:\"flexslider\";s:10:\"row_plugin\";s:6:\"fields\";s:6:\"fields\";a:1:{s:11:\"field_image\";a:35:{s:2:\"id\";s:11:\"field_image\";s:5:\"table\";s:22:\"field_data_field_image\";s:5:\"field\";s:11:\"field_image\";s:12:\"relationship\";s:4:\"none\";s:10:\"group_type\";s:5:\"group\";s:7:\"ui_name\";s:0:\"\";s:5:\"label\";s:0:\"\";s:7:\"exclude\";i:0;s:5:\"alter\";a:26:{s:10:\"alter_text\";i:0;s:4:\"text\";s:0:\"\";s:9:\"make_link\";i:0;s:4:\"path\";s:0:\"\";s:8:\"absolute\";i:0;s:8:\"external\";i:0;s:14:\"replace_spaces\";i:0;s:9:\"path_case\";s:4:\"none\";s:15:\"trim_whitespace\";i:0;s:3:\"alt\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:10:\"link_class\";s:0:\"\";s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:6:\"target\";s:0:\"\";s:5:\"nl2br\";i:0;s:10:\"max_length\";s:0:\"\";s:13:\"word_boundary\";i:1;s:8:\"ellipsis\";i:1;s:9:\"more_link\";i:0;s:14:\"more_link_text\";s:0:\"\";s:14:\"more_link_path\";s:0:\"\";s:10:\"strip_tags\";i:0;s:4:\"trim\";i:0;s:13:\"preserve_tags\";s:0:\"\";s:4:\"html\";i:0;}s:12:\"element_type\";s:0:\"\";s:13:\"element_class\";s:0:\"\";s:18:\"element_label_type\";s:0:\"\";s:19:\"element_label_class\";s:0:\"\";s:19:\"element_label_colon\";b:0;s:20:\"element_wrapper_type\";s:0:\"\";s:21:\"element_wrapper_class\";s:0:\"\";s:23:\"element_default_classes\";i:1;s:5:\"empty\";s:0:\"\";s:10:\"hide_empty\";i:0;s:10:\"empty_zero\";i:0;s:16:\"hide_alter_empty\";i:1;s:17:\"click_sort_column\";s:3:\"fid\";s:4:\"type\";s:5:\"image\";s:8:\"settings\";a:2:{s:11:\"image_style\";s:17:\"custom_image_size\";s:10:\"image_link\";s:0:\"\";}s:12:\"group_column\";s:0:\"\";s:13:\"group_columns\";a:0:{}s:10:\"group_rows\";b:1;s:11:\"delta_limit\";s:3:\"all\";s:12:\"delta_offset\";i:0;s:14:\"delta_reversed\";b:0;s:16:\"delta_first_last\";b:0;s:12:\"delta_random\";b:0;s:10:\"multi_type\";s:9:\"separator\";s:9:\"separator\";s:2:\", \";s:17:\"field_api_classes\";i:0;}}s:7:\"filters\";a:2:{s:6:\"status\";a:6:{s:5:\"value\";i:1;s:5:\"table\";s:4:\"node\";s:5:\"field\";s:6:\"status\";s:2:\"id\";s:6:\"status\";s:6:\"expose\";a:1:{s:8:\"operator\";b:0;}s:5:\"group\";i:1;}s:4:\"type\";a:13:{s:2:\"id\";s:4:\"type\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:4:\"type\";s:12:\"relationship\";s:4:\"none\";s:10:\"group_type\";s:5:\"group\";s:7:\"ui_name\";s:0:\"\";s:8:\"operator\";s:2:\"in\";s:5:\"value\";a:1:{s:6:\"banner\";s:6:\"banner\";}s:5:\"group\";s:1:\"1\";s:7:\"exposed\";b:0;s:6:\"expose\";a:12:{s:11:\"operator_id\";b:0;s:5:\"label\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"use_operator\";b:0;s:14:\"operator_label\";s:0:\"\";s:8:\"operator\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:8:\"required\";b:0;s:8:\"remember\";b:0;s:8:\"multiple\";b:0;s:14:\"remember_roles\";a:1:{i:2;i:2;}s:6:\"reduce\";b:0;}s:10:\"is_grouped\";b:0;s:10:\"group_info\";a:10:{s:5:\"label\";s:0:\"\";s:11:\"description\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:8:\"optional\";b:1;s:6:\"widget\";s:6:\"select\";s:8:\"multiple\";b:0;s:8:\"remember\";i:0;s:13:\"default_group\";s:3:\"All\";s:22:\"default_group_multiple\";a:0:{}s:11:\"group_items\";a:0:{}}}}s:5:\"sorts\";a:1:{s:7:\"created\";a:4:{s:2:\"id\";s:7:\"created\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:7:\"created\";s:5:\"order\";s:4:\"DESC\";}}s:5:\"title\";s:0:\"\";}'),
(8, 'block', 'Block', 'block', 2, 'a:1:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}}'),
(8, 'default', 'Master', 'default', 1, 'a:11:{s:5:\"query\";a:2:{s:4:\"type\";s:11:\"views_query\";s:7:\"options\";a:0:{}}s:6:\"access\";a:2:{s:4:\"type\";s:4:\"perm\";s:4:\"perm\";s:14:\"access content\";}s:5:\"cache\";a:1:{s:4:\"type\";s:4:\"none\";}s:12:\"exposed_form\";a:1:{s:4:\"type\";s:5:\"basic\";}s:5:\"pager\";a:2:{s:4:\"type\";s:4:\"some\";s:7:\"options\";a:1:{s:14:\"items_per_page\";s:1:\"5\";}}s:12:\"style_plugin\";s:7:\"default\";s:10:\"row_plugin\";s:6:\"fields\";s:6:\"fields\";a:2:{s:5:\"title\";a:8:{s:2:\"id\";s:5:\"title\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:5:\"title\";s:5:\"label\";s:0:\"\";s:5:\"alter\";a:8:{s:10:\"alter_text\";i:0;s:9:\"make_link\";i:0;s:8:\"absolute\";i:0;s:4:\"trim\";i:0;s:13:\"word_boundary\";i:0;s:8:\"ellipsis\";i:0;s:10:\"strip_tags\";i:0;s:4:\"html\";i:0;}s:10:\"hide_empty\";i:0;s:10:\"empty_zero\";i:0;s:12:\"link_to_node\";i:1;}s:11:\"field_image\";a:35:{s:2:\"id\";s:11:\"field_image\";s:5:\"table\";s:22:\"field_data_field_image\";s:5:\"field\";s:11:\"field_image\";s:12:\"relationship\";s:4:\"none\";s:10:\"group_type\";s:5:\"group\";s:7:\"ui_name\";s:0:\"\";s:5:\"label\";s:0:\"\";s:7:\"exclude\";i:0;s:5:\"alter\";a:26:{s:10:\"alter_text\";i:0;s:4:\"text\";s:0:\"\";s:9:\"make_link\";i:0;s:4:\"path\";s:0:\"\";s:8:\"absolute\";i:0;s:8:\"external\";i:0;s:14:\"replace_spaces\";i:0;s:9:\"path_case\";s:4:\"none\";s:15:\"trim_whitespace\";i:0;s:3:\"alt\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:10:\"link_class\";s:0:\"\";s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";s:6:\"target\";s:0:\"\";s:5:\"nl2br\";i:0;s:10:\"max_length\";s:0:\"\";s:13:\"word_boundary\";i:1;s:8:\"ellipsis\";i:1;s:9:\"more_link\";i:0;s:14:\"more_link_text\";s:0:\"\";s:14:\"more_link_path\";s:0:\"\";s:10:\"strip_tags\";i:0;s:4:\"trim\";i:0;s:13:\"preserve_tags\";s:0:\"\";s:4:\"html\";i:0;}s:12:\"element_type\";s:0:\"\";s:13:\"element_class\";s:0:\"\";s:18:\"element_label_type\";s:0:\"\";s:19:\"element_label_class\";s:0:\"\";s:19:\"element_label_colon\";b:0;s:20:\"element_wrapper_type\";s:0:\"\";s:21:\"element_wrapper_class\";s:0:\"\";s:23:\"element_default_classes\";i:1;s:5:\"empty\";s:0:\"\";s:10:\"hide_empty\";i:0;s:10:\"empty_zero\";i:0;s:16:\"hide_alter_empty\";i:1;s:17:\"click_sort_column\";s:3:\"fid\";s:4:\"type\";s:5:\"image\";s:8:\"settings\";a:2:{s:11:\"image_style\";s:11:\"hotel-image\";s:10:\"image_link\";s:7:\"content\";}s:12:\"group_column\";s:0:\"\";s:13:\"group_columns\";a:0:{}s:10:\"group_rows\";b:1;s:11:\"delta_limit\";s:3:\"all\";s:12:\"delta_offset\";i:0;s:14:\"delta_reversed\";b:0;s:16:\"delta_first_last\";b:0;s:12:\"delta_random\";b:0;s:10:\"multi_type\";s:9:\"separator\";s:9:\"separator\";s:2:\", \";s:17:\"field_api_classes\";i:0;}}s:7:\"filters\";a:2:{s:6:\"status\";a:6:{s:5:\"value\";i:1;s:5:\"table\";s:4:\"node\";s:5:\"field\";s:6:\"status\";s:2:\"id\";s:6:\"status\";s:6:\"expose\";a:1:{s:8:\"operator\";b:0;}s:5:\"group\";i:1;}s:4:\"type\";a:13:{s:2:\"id\";s:4:\"type\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:4:\"type\";s:12:\"relationship\";s:4:\"none\";s:10:\"group_type\";s:5:\"group\";s:7:\"ui_name\";s:0:\"\";s:8:\"operator\";s:2:\"in\";s:5:\"value\";a:1:{s:5:\"hotel\";s:5:\"hotel\";}s:5:\"group\";s:1:\"1\";s:7:\"exposed\";b:0;s:6:\"expose\";a:12:{s:11:\"operator_id\";b:0;s:5:\"label\";s:0:\"\";s:11:\"description\";s:0:\"\";s:12:\"use_operator\";b:0;s:14:\"operator_label\";s:0:\"\";s:8:\"operator\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:8:\"required\";b:0;s:8:\"remember\";b:0;s:8:\"multiple\";b:0;s:14:\"remember_roles\";a:1:{i:2;i:2;}s:6:\"reduce\";b:0;}s:10:\"is_grouped\";b:0;s:10:\"group_info\";a:10:{s:5:\"label\";s:0:\"\";s:11:\"description\";s:0:\"\";s:10:\"identifier\";s:0:\"\";s:8:\"optional\";b:1;s:6:\"widget\";s:6:\"select\";s:8:\"multiple\";b:0;s:8:\"remember\";i:0;s:13:\"default_group\";s:3:\"All\";s:22:\"default_group_multiple\";a:0:{}s:11:\"group_items\";a:0:{}}}}s:5:\"sorts\";a:1:{s:7:\"created\";a:4:{s:2:\"id\";s:7:\"created\";s:5:\"table\";s:4:\"node\";s:5:\"field\";s:7:\"created\";s:5:\"order\";s:4:\"DESC\";}}s:5:\"title\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Table structure for table `views_view`
--

CREATE TABLE `views_view` (
  `vid` int(10) UNSIGNED NOT NULL COMMENT 'The view ID of the field, defined by the database.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `description` varchar(255) DEFAULT '' COMMENT 'A description of the view for the admin interface.',
  `tag` varchar(255) DEFAULT '' COMMENT 'A tag used to group/sort views in the admin interface',
  `base_table` varchar(64) NOT NULL DEFAULT '' COMMENT 'What table this view is based on, such as node, user, comment, or term.',
  `human_name` varchar(255) DEFAULT '' COMMENT 'A human readable name used to be displayed in the admin interface',
  `core` int(11) DEFAULT '0' COMMENT 'Stores the drupal core version of the view.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the general data for a view.';

--
-- Dumping data for table `views_view`
--

INSERT INTO `views_view` (`vid`, `name`, `description`, `tag`, `base_table`, `human_name`, `core`) VALUES
(5, 'banner_image', '', 'default', 'node', 'Banner Image', 7),
(7, 'homebanner', '', 'default', 'node', 'homebanner', 7),
(8, 'hotel', '', 'default', 'node', 'Hotel', 7);

-- --------------------------------------------------------

--
-- Table structure for table `watchdog`
--

CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example "user" or "page not found."',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that contains logs of all system events.';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `authmap`
--
ALTER TABLE `authmap`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `authname` (`authname`),
  ADD KEY `uid_module` (`uid`,`module`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `token` (`token`);

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  ADD KEY `list` (`theme`,`status`,`region`,`weight`,`module`);

--
-- Indexes for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `blocked_ip` (`ip`);

--
-- Indexes for table `block_custom`
--
ALTER TABLE `block_custom`
  ADD PRIMARY KEY (`bid`),
  ADD UNIQUE KEY `info` (`info`);

--
-- Indexes for table `block_node_type`
--
ALTER TABLE `block_node_type`
  ADD PRIMARY KEY (`module`,`delta`,`type`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `block_role`
--
ALTER TABLE `block_role`
  ADD PRIMARY KEY (`module`,`delta`,`rid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_admin_menu`
--
ALTER TABLE `cache_admin_menu`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_block`
--
ALTER TABLE `cache_block`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_bootstrap`
--
ALTER TABLE `cache_bootstrap`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_field`
--
ALTER TABLE `cache_field`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_filter`
--
ALTER TABLE `cache_filter`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_form`
--
ALTER TABLE `cache_form`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_image`
--
ALTER TABLE `cache_image`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_libraries`
--
ALTER TABLE `cache_libraries`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_menu`
--
ALTER TABLE `cache_menu`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_page`
--
ALTER TABLE `cache_page`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_path`
--
ALTER TABLE `cache_path`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_token`
--
ALTER TABLE `cache_token`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_update`
--
ALTER TABLE `cache_update`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_views`
--
ALTER TABLE `cache_views`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `cache_views_data`
--
ALTER TABLE `cache_views_data`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `ckeditor_input_format`
--
ALTER TABLE `ckeditor_input_format`
  ADD PRIMARY KEY (`name`,`format`);

--
-- Indexes for table `ckeditor_settings`
--
ALTER TABLE `ckeditor_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `comment_status_pid` (`pid`,`status`),
  ADD KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  ADD KEY `comment_uid` (`uid`),
  ADD KEY `comment_nid_language` (`nid`,`language`),
  ADD KEY `comment_created` (`created`);

--
-- Indexes for table `ctools_css_cache`
--
ALTER TABLE `ctools_css_cache`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `ctools_object_cache`
--
ALTER TABLE `ctools_object_cache`
  ADD PRIMARY KEY (`sid`,`obj`,`name`),
  ADD KEY `updated` (`updated`);

--
-- Indexes for table `date_formats`
--
ALTER TABLE `date_formats`
  ADD PRIMARY KEY (`dfid`),
  ADD UNIQUE KEY `formats` (`format`,`type`);

--
-- Indexes for table `date_format_locale`
--
ALTER TABLE `date_format_locale`
  ADD PRIMARY KEY (`type`,`language`);

--
-- Indexes for table `date_format_type`
--
ALTER TABLE `date_format_type`
  ADD PRIMARY KEY (`type`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `field_config`
--
ALTER TABLE `field_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_name` (`field_name`),
  ADD KEY `active` (`active`),
  ADD KEY `storage_active` (`storage_active`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `module` (`module`),
  ADD KEY `storage_module` (`storage_module`),
  ADD KEY `type` (`type`),
  ADD KEY `storage_type` (`storage_type`);

--
-- Indexes for table `field_config_instance`
--
ALTER TABLE `field_config_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `field_data_body`
--
ALTER TABLE `field_data_body`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `field_data_comment_body`
--
ALTER TABLE `field_data_comment_body`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `comment_body_format` (`comment_body_format`);

--
-- Indexes for table `field_data_field_city`
--
ALTER TABLE `field_data_field_city`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_city_tid` (`field_city_tid`);

--
-- Indexes for table `field_data_field_country`
--
ALTER TABLE `field_data_field_country`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_country_tid` (`field_country_tid`);

--
-- Indexes for table `field_data_field_image`
--
ALTER TABLE `field_data_field_image`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_image_fid` (`field_image_fid`);

--
-- Indexes for table `field_data_field_state`
--
ALTER TABLE `field_data_field_state`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_state_tid` (`field_state_tid`);

--
-- Indexes for table `field_data_field_tags`
--
ALTER TABLE `field_data_field_tags`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_tags_tid` (`field_tags_tid`);

--
-- Indexes for table `field_revision_body`
--
ALTER TABLE `field_revision_body`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `body_format` (`body_format`);

--
-- Indexes for table `field_revision_comment_body`
--
ALTER TABLE `field_revision_comment_body`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `comment_body_format` (`comment_body_format`);

--
-- Indexes for table `field_revision_field_city`
--
ALTER TABLE `field_revision_field_city`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_city_tid` (`field_city_tid`);

--
-- Indexes for table `field_revision_field_country`
--
ALTER TABLE `field_revision_field_country`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_country_tid` (`field_country_tid`);

--
-- Indexes for table `field_revision_field_image`
--
ALTER TABLE `field_revision_field_image`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_image_fid` (`field_image_fid`);

--
-- Indexes for table `field_revision_field_state`
--
ALTER TABLE `field_revision_field_state`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_state_tid` (`field_state_tid`);

--
-- Indexes for table `field_revision_field_tags`
--
ALTER TABLE `field_revision_field_tags`
  ADD PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  ADD KEY `entity_type` (`entity_type`),
  ADD KEY `bundle` (`bundle`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `entity_id` (`entity_id`),
  ADD KEY `revision_id` (`revision_id`),
  ADD KEY `language` (`language`),
  ADD KEY `field_tags_tid` (`field_tags_tid`);

--
-- Indexes for table `file_managed`
--
ALTER TABLE `file_managed`
  ADD PRIMARY KEY (`fid`),
  ADD UNIQUE KEY `uri` (`uri`),
  ADD KEY `uid` (`uid`),
  ADD KEY `status` (`status`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `file_usage`
--
ALTER TABLE `file_usage`
  ADD PRIMARY KEY (`fid`,`type`,`id`,`module`),
  ADD KEY `type_id` (`type`,`id`),
  ADD KEY `fid_count` (`fid`,`count`),
  ADD KEY `fid_module` (`fid`,`module`);

--
-- Indexes for table `filter`
--
ALTER TABLE `filter`
  ADD PRIMARY KEY (`format`,`name`),
  ADD KEY `list` (`weight`,`module`,`name`);

--
-- Indexes for table `filter_format`
--
ALTER TABLE `filter_format`
  ADD PRIMARY KEY (`format`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `status_weight` (`status`,`weight`);

--
-- Indexes for table `flexslider_optionset`
--
ALTER TABLE `flexslider_optionset`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `flood`
--
ALTER TABLE `flood`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `allow` (`event`,`identifier`,`timestamp`),
  ADD KEY `purge` (`expiration`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`uid`,`nid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `image_effects`
--
ALTER TABLE `image_effects`
  ADD PRIMARY KEY (`ieid`),
  ADD KEY `isid` (`isid`),
  ADD KEY `weight` (`weight`);

--
-- Indexes for table `image_styles`
--
ALTER TABLE `image_styles`
  ADD PRIMARY KEY (`isid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `login_destination`
--
ALTER TABLE `login_destination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list` (`weight`);

--
-- Indexes for table `menu_custom`
--
ALTER TABLE `menu_custom`
  ADD PRIMARY KEY (`menu_name`);

--
-- Indexes for table `menu_links`
--
ALTER TABLE `menu_links`
  ADD PRIMARY KEY (`mlid`),
  ADD KEY `path_menu` (`link_path`(128),`menu_name`),
  ADD KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  ADD KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  ADD KEY `router_path` (`router_path`(128));

--
-- Indexes for table `menu_router`
--
ALTER TABLE `menu_router`
  ADD PRIMARY KEY (`path`),
  ADD KEY `fit` (`fit`),
  ADD KEY `tab_parent` (`tab_parent`(64),`weight`,`title`),
  ADD KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`);

--
-- Indexes for table `node`
--
ALTER TABLE `node`
  ADD PRIMARY KEY (`nid`),
  ADD UNIQUE KEY `vid` (`vid`),
  ADD KEY `node_changed` (`changed`),
  ADD KEY `node_created` (`created`),
  ADD KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  ADD KEY `node_status_type` (`status`,`type`,`nid`),
  ADD KEY `node_title_type` (`title`,`type`(4)),
  ADD KEY `node_type` (`type`(4)),
  ADD KEY `uid` (`uid`),
  ADD KEY `tnid` (`tnid`),
  ADD KEY `translate` (`translate`),
  ADD KEY `language` (`language`);

--
-- Indexes for table `node_access`
--
ALTER TABLE `node_access`
  ADD PRIMARY KEY (`nid`,`gid`,`realm`);

--
-- Indexes for table `node_comment_statistics`
--
ALTER TABLE `node_comment_statistics`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `node_comment_timestamp` (`last_comment_timestamp`),
  ADD KEY `comment_count` (`comment_count`),
  ADD KEY `last_comment_uid` (`last_comment_uid`);

--
-- Indexes for table `node_revision`
--
ALTER TABLE `node_revision`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `nid` (`nid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `node_type`
--
ALTER TABLE `node_type`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `pathauto_state`
--
ALTER TABLE `pathauto_state`
  ADD PRIMARY KEY (`entity_type`,`entity_id`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `name_created` (`name`,`created`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `rdf_mapping`
--
ALTER TABLE `rdf_mapping`
  ADD PRIMARY KEY (`type`,`bundle`);

--
-- Indexes for table `registry`
--
ALTER TABLE `registry`
  ADD PRIMARY KEY (`name`,`type`),
  ADD KEY `hook` (`type`,`weight`,`module`);

--
-- Indexes for table `registry_file`
--
ALTER TABLE `registry_file`
  ADD PRIMARY KEY (`filename`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`rid`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `name_weight` (`name`,`weight`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`rid`,`permission`),
  ADD KEY `permission` (`permission`);

--
-- Indexes for table `search_dataset`
--
ALTER TABLE `search_dataset`
  ADD PRIMARY KEY (`sid`,`type`);

--
-- Indexes for table `search_index`
--
ALTER TABLE `search_index`
  ADD PRIMARY KEY (`word`,`sid`,`type`),
  ADD KEY `sid_type` (`sid`,`type`);

--
-- Indexes for table `search_node_links`
--
ALTER TABLE `search_node_links`
  ADD PRIMARY KEY (`sid`,`type`,`nid`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `search_total`
--
ALTER TABLE `search_total`
  ADD PRIMARY KEY (`word`);

--
-- Indexes for table `semaphore`
--
ALTER TABLE `semaphore`
  ADD PRIMARY KEY (`name`),
  ADD KEY `value` (`value`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `services_endpoint`
--
ALTER TABLE `services_endpoint`
  ADD PRIMARY KEY (`eid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `services_user`
--
ALTER TABLE `services_user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`,`ssid`),
  ADD KEY `timestamp` (`timestamp`),
  ADD KEY `uid` (`uid`),
  ADD KEY `ssid` (`ssid`);

--
-- Indexes for table `shortcut_set`
--
ALTER TABLE `shortcut_set`
  ADD PRIMARY KEY (`set_name`);

--
-- Indexes for table `shortcut_set_users`
--
ALTER TABLE `shortcut_set_users`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `set_name` (`set_name`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`filename`),
  ADD KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`),
  ADD KEY `type_name` (`type`,`name`);

--
-- Indexes for table `taxonomy_index`
--
ALTER TABLE `taxonomy_index`
  ADD KEY `term_node` (`tid`,`sticky`,`created`),
  ADD KEY `nid` (`nid`);

--
-- Indexes for table `taxonomy_term_data`
--
ALTER TABLE `taxonomy_term_data`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  ADD KEY `vid_name` (`vid`,`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `taxonomy_term_hierarchy`
--
ALTER TABLE `taxonomy_term_hierarchy`
  ADD PRIMARY KEY (`tid`,`parent`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `taxonomy_vocabulary`
--
ALTER TABLE `taxonomy_vocabulary`
  ADD PRIMARY KEY (`vid`),
  ADD UNIQUE KEY `machine_name` (`machine_name`),
  ADD KEY `list` (`weight`,`name`);

--
-- Indexes for table `url_alias`
--
ALTER TABLE `url_alias`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `alias_language_pid` (`alias`,`language`,`pid`),
  ADD KEY `source_language_pid` (`source`,`language`,`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `access` (`access`),
  ADD KEY `created` (`created`),
  ADD KEY `mail` (`mail`),
  ADD KEY `picture` (`picture`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`uid`,`rid`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `variable`
--
ALTER TABLE `variable`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `views_display`
--
ALTER TABLE `views_display`
  ADD PRIMARY KEY (`vid`,`id`),
  ADD KEY `vid` (`vid`,`position`);

--
-- Indexes for table `views_view`
--
ALTER TABLE `views_view`
  ADD PRIMARY KEY (`vid`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `watchdog`
--
ALTER TABLE `watchdog`
  ADD PRIMARY KEY (`wid`),
  ADD KEY `type` (`type`),
  ADD KEY `uid` (`uid`),
  ADD KEY `severity` (`severity`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authmap`
--
ALTER TABLE `authmap`
  MODIFY `aid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique authmap ID.';

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.', AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `blocked_ips`
--
ALTER TABLE `blocked_ips`
  MODIFY `iid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.';

--
-- AUTO_INCREMENT for table `block_custom`
--
ALTER TABLE `block_custom`
  MODIFY `bid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.';

--
-- AUTO_INCREMENT for table `date_formats`
--
ALTER TABLE `date_formats`
  MODIFY `dfid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.', AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `field_config`
--
ALTER TABLE `field_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `field_config_instance`
--
ALTER TABLE `field_config_instance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `file_managed`
--
ALTER TABLE `file_managed`
  MODIFY `fid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'File ID.', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `flood`
--
ALTER TABLE `flood`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `image_effects`
--
ALTER TABLE `image_effects`
  MODIFY `ieid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `image_styles`
--
ALTER TABLE `image_styles`
  MODIFY `isid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_destination`
--
ALTER TABLE `login_destination`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique ID.', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_links`
--
ALTER TABLE `menu_links`
  MODIFY `mlid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.', AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT for table `node`
--
ALTER TABLE `node`
  MODIFY `nid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `node_revision`
--
ALTER TABLE `node_revision`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.', AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `rid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sequences`
--
ALTER TABLE `sequences`
  MODIFY `value` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.', AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `services_endpoint`
--
ALTER TABLE `services_endpoint`
  MODIFY `eid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `taxonomy_term_data`
--
ALTER TABLE `taxonomy_term_data`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `taxonomy_vocabulary`
--
ALTER TABLE `taxonomy_vocabulary`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `url_alias`
--
ALTER TABLE `url_alias`
  MODIFY `pid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `views_view`
--
ALTER TABLE `views_view`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'The view ID of the field, defined by the database.', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `watchdog`
--
ALTER TABLE `watchdog`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
