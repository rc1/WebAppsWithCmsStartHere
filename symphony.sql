-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 16, 2015 at 05:25 PM
-- Server version: 5.5.32-cll-lve
-- PHP Version: 5.5.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theworkers_net_rc`
--

-- --------------------------------------------------------

--
-- Table structure for table `sym_authors`
--

CREATE TABLE IF NOT EXISTS `sym_authors` (
  `id` int(11) unsigned NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_authors`
--

INSERT INTO `sym_authors` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `last_seen`, `user_type`, `primary`, `default_area`, `auth_token_active`, `language`) VALUES
(1, 'admin', 'PBKDF2v1|10000|a14e2c7d1bfcabf92f1f|DEyNX+4XrMIQh2WXXUlB0VhOR8dty+byz8IAN6+8DV3MKRju+5YDtQ==', 'Joe', 'Blogs', 'joe@example.com', '2015-10-16 19:22:36', 'developer', 'yes', '7', 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_cache`
--

CREATE TABLE IF NOT EXISTS `sym_cache` (
  `id` int(11) unsigned NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries`
--

CREATE TABLE IF NOT EXISTS `sym_entries` (
  `id` int(11) unsigned NOT NULL,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries`
--

INSERT INTO `sym_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES
(23, 7, 1, '2015-10-16 19:17:29', '2015-10-16 17:17:29', '2015-10-16 19:21:44', '2015-10-16 17:21:44'),
(24, 8, 1, '2015-10-16 19:21:40', '2015-10-16 17:21:40', '2015-10-16 19:21:40', '2015-10-16 17:21:40'),
(22, 10, 1, '2015-10-16 19:17:16', '2015-10-16 17:17:16', '2015-10-16 19:17:16', '2015-10-16 17:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_23`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_23` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_23`
--

INSERT INTO `sym_entries_data_23` (`id`, `entry_id`, `handle`, `value`) VALUES
(14, 23, 'example-page', 'Example Page');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_24`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_24` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_24`
--

INSERT INTO `sym_entries_data_24` (`id`, `entry_id`, `handle`, `value`) VALUES
(36, 24, 'example-image', 'Example Image');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_25`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_25` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_25`
--

INSERT INTO `sym_entries_data_25` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES
(36, 24, 'example-image.jpg', 1612, 'image/jpeg', 'a:3:{s:8:"creation";s:25:"2015-10-16T19:21:40+02:00";s:5:"width";i:300;s:6:"height";i:300;}');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_26`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_26` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_26`
--

INSERT INTO `sym_entries_data_26` (`id`, `entry_id`, `relation_id`) VALUES
(22, 23, 24);

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_27`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_27` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_27`
--

INSERT INTO `sym_entries_data_27` (`id`, `entry_id`, `value`) VALUES
(14, 23, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_28`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_28` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_28`
--

INSERT INTO `sym_entries_data_28` (`id`, `entry_id`, `handle`, `value`, `value_formatted`) VALUES
(36, 24, 'example-image', '<img src=''/image/preview/uploads/example-image.jpg '' /><br/><em>Example Image</em>', '&lt;img src=''/image/preview/uploads/example-image.jpg '' /&gt;&lt;br/&gt;&lt;em&gt;Example Image&lt;/em&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_30`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_30` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sym_entries_data_30`
--

INSERT INTO `sym_entries_data_30` (`id`, `entry_id`, `value`) VALUES
(13, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sym_entries_data_35`
--

CREATE TABLE IF NOT EXISTS `sym_entries_data_35` (
  `id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_entries_data_35`
--

INSERT INTO `sym_entries_data_35` (`id`, `entry_id`, `value`, `value_formatted`) VALUES
(1, 22, 'Hello world', '<p>Hello world</p>\n');

-- --------------------------------------------------------

--
-- Table structure for table `sym_extensions`
--

CREATE TABLE IF NOT EXISTS `sym_extensions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_extensions`
--

INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES
(1, 'export_ensemble', 'enabled', '2.1.2'),
(2, 'maintenance_mode', 'enabled', '1.8.3'),
(3, 'profiledevkit', 'enabled', '1.5.2'),
(4, 'markdown', 'enabled', '1.21'),
(5, 'xssfilter', 'enabled', '1.4.1'),
(6, 'debugdevkit', 'enabled', '1.3.3'),
(7, 'jit_image_manipulation', 'enabled', '1.42'),
(8, 'selectbox_link_field', 'enabled', '1.33'),
(9, 'association_field', 'enabled', '1.0.1'),
(10, 'association_output', 'enabled', '1.2.0'),
(11, 'association_ui_editor', 'enabled', '1.1.0'),
(12, 'association_ui_selector', 'enabled', '1.2.1'),
(13, 'image_preview', 'enabled', '2.3.2'),
(14, 'order_entries', 'enabled', '2.3.1'),
(15, 'reflectionfield', 'enabled', '1.4.1'),
(16, 'limit_section_entries', 'enabled', '1.1.1'),
(18, 'html_panel', 'enabled', '1.4.1');

-- --------------------------------------------------------

--
-- Table structure for table `sym_extensions_delegates`
--

CREATE TABLE IF NOT EXISTS `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_extensions_delegates`
--

INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES
(35, 1, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(43, 2, '/blueprints/pages/', 'AppendPageContent', '__appendType'),
(42, 2, '/backend/', 'AppendPageAlert', '__appendAlert'),
(41, 2, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode'),
(40, 2, '/system/preferences/', 'Save', '__SavePreferences'),
(39, 2, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(51, 3, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation'),
(50, 3, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve'),
(31, 5, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter'),
(30, 5, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter'),
(29, 5, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter'),
(28, 5, '/blueprints/events/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation'),
(34, 6, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation'),
(33, 6, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve'),
(37, 7, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences'),
(20, 9, '/backend/', 'InitaliseAdminPageHead', 'appendAssets'),
(21, 10, '/frontend/', 'DataSourcePreExecute', 'setOutputParameters'),
(22, 10, '/frontend/', 'DataSourcePostExecute', 'appendAssociatedEntries'),
(23, 10, '/backend/', 'AdminPagePreGenerate', 'buildEditor'),
(24, 10, '/blueprints/datasources/', 'DatasourcePreCreate', 'saveDataSource'),
(25, 10, '/blueprints/datasources/', 'DatasourcePreEdit', 'saveDataSource'),
(26, 11, '/backend/', 'InitaliseAdminPageHead', 'appendAssets'),
(27, 12, '/backend/', 'InitaliseAdminPageHead', 'appendAssets'),
(32, 5, '/frontend/', 'FrontendParamsResolve', 'frontendParamsResolve'),
(36, 13, '/backend/', 'InitaliseAdminPageHead', 'appendJS'),
(38, 7, '/system/preferences/', 'Save', '__SavePreferences'),
(44, 2, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode'),
(45, 2, '/frontend/', 'FrontendParamsResolve', '__addParam'),
(46, 14, '/backend/', 'InitaliseAdminPageHead', 'prepareIndex'),
(47, 14, '/backend/', 'AdminPagePreGenerate', 'adjustTable'),
(48, 14, '/backend/', 'AdminPagePostGenerate', 'resetPagination'),
(49, 14, '/frontend/', 'DataSourcePreExecute', 'saveFilterContext'),
(52, 15, '/publish/new/', 'EntryPostCreate', 'compileBackendFields'),
(53, 15, '/publish/edit/', 'EntryPostEdit', 'compileBackendFields'),
(54, 15, '/xmlimporter/importers/run/', 'XMLImporterEntryPostCreate', 'compileBackendFields'),
(55, 15, '/xmlimporter/importers/run/', 'XMLImporterEntryPostEdit', 'compileBackendFields'),
(56, 15, '/frontend/', 'EventPostSaveFilter', 'compileFrontendFields'),
(57, 16, '/backend/', 'InitaliseAdminPageHead', 'dInitaliseAdminPageHead'),
(58, 16, '/backend/', 'AppendPageAlert', 'dAppendPageAlert'),
(59, 16, '/backend/', 'AdminPagePreGenerate', 'dAdminPagePreGenerate'),
(60, 16, '/blueprints/sections/', 'AddSectionElements', 'dAddSectionElements'),
(61, 16, '/blueprints/sections/', 'SectionPreCreate', 'dSaveSectionSettings'),
(62, 16, '/blueprints/sections/', 'SectionPreEdit', 'dSaveSectionSettings');

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields`
--

CREATE TABLE IF NOT EXISTS `sym_fields` (
  `id` int(11) unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields`
--

INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES
(23, 'Title', 'title', 'input', 7, 'no', 0, 'main', 'yes'),
(24, 'Name', 'name', 'input', 8, 'no', 0, 'main', 'yes'),
(25, 'Image File', 'image-file', 'upload', 8, 'yes', 1, 'main', 'yes'),
(26, 'Images', 'images', 'association', 7, 'no', 1, 'main', 'no'),
(27, 'Published', 'published', 'checkbox', 7, 'no', 2, 'sidebar', 'yes'),
(28, 'Association View', 'association-view', 'reflection', 8, 'no', 2, 'main', 'no'),
(35, 'Text', 'text', 'textarea', 10, 'yes', 0, 'main', 'no'),
(30, 'Order', 'order', 'order_entries', 7, 'no', 3, 'sidebar', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_association`
--

CREATE TABLE IF NOT EXISTS `sym_fields_association` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields_association`
--

INSERT INTO `sym_fields_association` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES
(8, 26, 'yes', 'no', '28', 50);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_author`
--

CREATE TABLE IF NOT EXISTS `sym_fields_author` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_checkbox`
--

CREATE TABLE IF NOT EXISTS `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields_checkbox`
--

INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES
(12, 27, 'on', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_date`
--

CREATE TABLE IF NOT EXISTS `sym_fields_date` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_html_panel`
--

CREATE TABLE IF NOT EXISTS `sym_fields_html_panel` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `url_expression` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_image_preview_settings`
--

CREATE TABLE IF NOT EXISTS `sym_fields_image_preview_settings` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `field-handles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table-width` int(11) unsigned DEFAULT NULL,
  `table-height` int(11) unsigned DEFAULT NULL,
  `table-resize` int(11) unsigned DEFAULT NULL,
  `table-position` int(11) unsigned DEFAULT NULL,
  `table-absolute` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `entry-width` int(11) unsigned DEFAULT NULL,
  `entry-height` int(11) unsigned DEFAULT NULL,
  `entry-resize` int(11) unsigned DEFAULT NULL,
  `entry-position` int(11) unsigned DEFAULT NULL,
  `entry-absolute` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_input`
--

CREATE TABLE IF NOT EXISTS `sym_fields_input` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields_input`
--

INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES
(53, 23, NULL),
(59, 24, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_order_entries`
--

CREATE TABLE IF NOT EXISTS `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  `disable_pagination` enum('yes','no') DEFAULT 'no',
  `filtered_fields` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sym_fields_order_entries`
--

INSERT INTO `sym_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`, `disable_pagination`, `filtered_fields`) VALUES
(4, 30, 'yes', 'yes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_reflection`
--

CREATE TABLE IF NOT EXISTS `sym_fields_reflection` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `xsltfile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `override` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `hide` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `fetch_associated_counts` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no'
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields_reflection`
--

INSERT INTO `sym_fields_reflection` (`id`, `field_id`, `xsltfile`, `expression`, `formatter`, `override`, `hide`, `fetch_associated_counts`) VALUES
(25, 28, NULL, '<img src=''/image/preview/uploads/{entry/image-file/filename} '' /><br/><em>{entry/name}<em>', 'none', NULL, 'yes', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_select`
--

CREATE TABLE IF NOT EXISTS `sym_fields_select` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_selectbox_link`
--

CREATE TABLE IF NOT EXISTS `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_taglist`
--

CREATE TABLE IF NOT EXISTS `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_textarea`
--

CREATE TABLE IF NOT EXISTS `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields_textarea`
--

INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES
(10, 35, 'markdown_extra', 15);

-- --------------------------------------------------------

--
-- Table structure for table `sym_fields_upload`
--

CREATE TABLE IF NOT EXISTS `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_fields_upload`
--

INSERT INTO `sym_fields_upload` (`id`, `field_id`, `destination`, `validator`) VALUES
(27, 25, '/workspace/uploads', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- --------------------------------------------------------

--
-- Table structure for table `sym_forgotpass`
--

CREATE TABLE IF NOT EXISTS `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sym_pages`
--

CREATE TABLE IF NOT EXISTS `sym_pages` (
  `id` int(11) unsigned NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_pages`
--

INSERT INTO `sym_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES
(77, NULL, 'Redirect', 'redirect', NULL, NULL, NULL, NULL, 1),
(78, NULL, 'All', 'all', NULL, NULL, 'pages,about', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sym_pages_types`
--

CREATE TABLE IF NOT EXISTS `sym_pages_types` (
  `id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=685 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_pages_types`
--

INSERT INTO `sym_pages_types` (`id`, `page_id`, `type`) VALUES
(683, 77, 'index'),
(684, 78, 'XML');

-- --------------------------------------------------------

--
-- Table structure for table `sym_sections`
--

CREATE TABLE IF NOT EXISTS `sym_sections` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `max_entries` int(11) NOT NULL DEFAULT '0',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_sections`
--

INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES
(7, 'Pages', 'pages', 1, 'no', 0, 'no', 'Content'),
(8, 'Images', 'images', 2, 'no', 0, 'no', 'Content'),
(10, 'About', 'about', 3, 'no', 1, 'no', 'Content');

-- --------------------------------------------------------

--
-- Table structure for table `sym_sections_association`
--

CREATE TABLE IF NOT EXISTS `sym_sections_association` (
  `id` int(11) unsigned NOT NULL,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `interface` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_sections_association`
--

INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES
(13, 8, 28, 7, 26, 'yes', 'aui-selector-sortable', 'aui-editor-new');

-- --------------------------------------------------------

--
-- Table structure for table `sym_sessions`
--

CREATE TABLE IF NOT EXISTS `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sym_sessions`
--

INSERT INTO `sym_sessions` (`session`, `session_expires`, `session_data`) VALUES
('2b514d24885d040af580d1fca44e8568', 1444921466, 'sym-|a:3:{s:10:"xsrf-token";s:27:"zZzFJoOpItAboFRKP8B3eNPLgCw";s:8:"username";s:5:"admin";s:4:"pass";s:92:"PBKDF2v1|10000|20a8f0c6e51d7e444c3b|rZnQ23ms2fbm7/mLtHZ95zEoAGitzag4RmenjSpWxtATH2hNrJOEfA==";}'),
('9e1adcce91524bb1559e6a78b74a1752', 1445012347, 'sym-|a:3:{s:10:"xsrf-token";s:27:"hncGHbCl3x4cSO2pLNj7Ngvm838";s:8:"username";s:12:"luisa.lambri";s:4:"pass";s:92:"PBKDF2v1|10000|ec4efa7cfcf61508fcba|wGM8YDX8MHWgyjVkpTtSnx4Q5yzZL90ld6E9UVMaGFz/v0wy3j9F/A==";}'),
('fda010130d7a5f6a2d8685ea41c000fd', 1445011158, 'sym-|a:3:{s:10:"xsrf-token";s:27:"02GbEeDBOFyagzrUh/g/oHu0jYQ";s:8:"username";s:5:"admin";s:4:"pass";s:92:"PBKDF2v1|10000|20a8f0c6e51d7e444c3b|rZnQ23ms2fbm7/mLtHZ95zEoAGitzag4RmenjSpWxtATH2hNrJOEfA==";}'),
('2902fbb6b65262160b8eb8e1fc955d7e', 1445013761, 'sym-|a:3:{s:10:"xsrf-token";s:27:"UsqFozR2k+ma3EnjBIbPV4rWIo8";s:8:"username";s:5:"admin";s:4:"pass";s:92:"PBKDF2v1|10000|27a746310f19149c2aeb|SxmWJ2hGCrMWFeIK3X3vJZK32eqKUlvBYaXLoGhj+WrOrJW45LwXog==";}'),
('36ebc1c510239c846af8fa0d1fb39e0b', 1445016156, 'sym-|a:3:{s:10:"xsrf-token";s:27:"vU8AoOSz5r0nLRexTSsdSo3H1kg";s:8:"username";s:5:"admin";s:4:"pass";s:92:"PBKDF2v1|10000|a14e2c7d1bfcabf92f1f|DEyNX+4XrMIQh2WXXUlB0VhOR8dty+byz8IAN6+8DV3MKRju+5YDtQ==";}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sym_authors`
--
ALTER TABLE `sym_authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sym_cache`
--
ALTER TABLE `sym_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`),
  ADD KEY `expiry` (`expiry`);

--
-- Indexes for table `sym_entries`
--
ALTER TABLE `sym_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `creation_date` (`creation_date`),
  ADD KEY `creation_date_gmt` (`creation_date_gmt`),
  ADD KEY `modification_date` (`modification_date`),
  ADD KEY `modification_date_gmt` (`modification_date_gmt`);

--
-- Indexes for table `sym_entries_data_23`
--
ALTER TABLE `sym_entries_data_23`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`),
  ADD KEY `handle` (`handle`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `sym_entries_data_24`
--
ALTER TABLE `sym_entries_data_24`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`),
  ADD KEY `handle` (`handle`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `sym_entries_data_25`
--
ALTER TABLE `sym_entries_data_25`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`),
  ADD KEY `file` (`file`),
  ADD KEY `mimetype` (`mimetype`);

--
-- Indexes for table `sym_entries_data_26`
--
ALTER TABLE `sym_entries_data_26`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `relation_id` (`relation_id`);

--
-- Indexes for table `sym_entries_data_27`
--
ALTER TABLE `sym_entries_data_27`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `sym_entries_data_28`
--
ALTER TABLE `sym_entries_data_28`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD FULLTEXT KEY `value` (`value`);
ALTER TABLE `sym_entries_data_28`
  ADD FULLTEXT KEY `value_formatted` (`value_formatted`);

--
-- Indexes for table `sym_entries_data_30`
--
ALTER TABLE `sym_entries_data_30`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`entry_id`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `sym_entries_data_35`
--
ALTER TABLE `sym_entries_data_35`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`),
  ADD FULLTEXT KEY `value` (`value`);

--
-- Indexes for table `sym_extensions`
--
ALTER TABLE `sym_extensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sym_extensions_delegates`
--
ALTER TABLE `sym_extensions_delegates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extension_id` (`extension_id`),
  ADD KEY `page` (`page`),
  ADD KEY `delegate` (`delegate`);

--
-- Indexes for table `sym_fields`
--
ALTER TABLE `sym_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index` (`element_name`,`type`,`parent_section`);

--
-- Indexes for table `sym_fields_association`
--
ALTER TABLE `sym_fields_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_author`
--
ALTER TABLE `sym_fields_author`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_checkbox`
--
ALTER TABLE `sym_fields_checkbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_date`
--
ALTER TABLE `sym_fields_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_html_panel`
--
ALTER TABLE `sym_fields_html_panel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_image_preview_settings`
--
ALTER TABLE `sym_fields_image_preview_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_input`
--
ALTER TABLE `sym_fields_input`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_order_entries`
--
ALTER TABLE `sym_fields_order_entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_reflection`
--
ALTER TABLE `sym_fields_reflection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_select`
--
ALTER TABLE `sym_fields_select`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_selectbox_link`
--
ALTER TABLE `sym_fields_selectbox_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_taglist`
--
ALTER TABLE `sym_fields_taglist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `pre_populate_source` (`pre_populate_source`);

--
-- Indexes for table `sym_fields_textarea`
--
ALTER TABLE `sym_fields_textarea`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_fields_upload`
--
ALTER TABLE `sym_fields_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `sym_forgotpass`
--
ALTER TABLE `sym_forgotpass`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `sym_pages`
--
ALTER TABLE `sym_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indexes for table `sym_pages_types`
--
ALTER TABLE `sym_pages_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`,`type`);

--
-- Indexes for table `sym_sections`
--
ALTER TABLE `sym_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `handle` (`handle`);

--
-- Indexes for table `sym_sections_association`
--
ALTER TABLE `sym_sections_association`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`);

--
-- Indexes for table `sym_sessions`
--
ALTER TABLE `sym_sessions`
  ADD PRIMARY KEY (`session`),
  ADD KEY `session_expires` (`session_expires`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sym_authors`
--
ALTER TABLE `sym_authors`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sym_cache`
--
ALTER TABLE `sym_cache`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sym_entries`
--
ALTER TABLE `sym_entries`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `sym_entries_data_23`
--
ALTER TABLE `sym_entries_data_23`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sym_entries_data_24`
--
ALTER TABLE `sym_entries_data_24`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sym_entries_data_25`
--
ALTER TABLE `sym_entries_data_25`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sym_entries_data_26`
--
ALTER TABLE `sym_entries_data_26`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sym_entries_data_27`
--
ALTER TABLE `sym_entries_data_27`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sym_entries_data_28`
--
ALTER TABLE `sym_entries_data_28`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sym_entries_data_30`
--
ALTER TABLE `sym_entries_data_30`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sym_entries_data_35`
--
ALTER TABLE `sym_entries_data_35`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sym_extensions`
--
ALTER TABLE `sym_extensions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sym_extensions_delegates`
--
ALTER TABLE `sym_extensions_delegates`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `sym_fields`
--
ALTER TABLE `sym_fields`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `sym_fields_association`
--
ALTER TABLE `sym_fields_association`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sym_fields_author`
--
ALTER TABLE `sym_fields_author`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sym_fields_checkbox`
--
ALTER TABLE `sym_fields_checkbox`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sym_fields_date`
--
ALTER TABLE `sym_fields_date`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sym_fields_html_panel`
--
ALTER TABLE `sym_fields_html_panel`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sym_fields_image_preview_settings`
--
ALTER TABLE `sym_fields_image_preview_settings`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sym_fields_input`
--
ALTER TABLE `sym_fields_input`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `sym_fields_order_entries`
--
ALTER TABLE `sym_fields_order_entries`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sym_fields_reflection`
--
ALTER TABLE `sym_fields_reflection`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `sym_fields_select`
--
ALTER TABLE `sym_fields_select`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sym_fields_selectbox_link`
--
ALTER TABLE `sym_fields_selectbox_link`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sym_fields_taglist`
--
ALTER TABLE `sym_fields_taglist`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sym_fields_textarea`
--
ALTER TABLE `sym_fields_textarea`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sym_fields_upload`
--
ALTER TABLE `sym_fields_upload`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `sym_pages`
--
ALTER TABLE `sym_pages`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `sym_pages_types`
--
ALTER TABLE `sym_pages_types`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=685;
--
-- AUTO_INCREMENT for table `sym_sections`
--
ALTER TABLE `sym_sections`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sym_sections_association`
--
ALTER TABLE `sym_sections_association`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
