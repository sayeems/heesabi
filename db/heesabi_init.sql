-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Mar 10, 2022 at 07:49 AM
-- Server version: 5.7.14
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `strapi_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) NOT NULL,
  `users` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `balance`, `created_at`, `updated_at`, `created_by`, `updated_by`, `owner`, `users`) VALUES
(15, 'yebooo', '1500.00', '2021-07-17 02:22:16', '2021-07-23 11:32:59', NULL, 1, 5, 6),
(16, 'myAccount', '2100.00', '2021-07-17 09:05:43', '2021-07-23 05:37:43', NULL, NULL, 7, NULL),
(17, 'songsar', '3000.00', '2021-07-17 09:27:48', '2021-07-17 09:27:48', NULL, NULL, 6, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
CREATE TABLE IF NOT EXISTS `core_store` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_store`
--

INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(1, 'model_def_strapi::core-store', '{\"uid\":\"strapi::core-store\",\"collectionName\":\"core_store\",\"info\":{\"name\":\"core_store\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}}', 'object', NULL, NULL),
(2, 'model_def_strapi::webhooks', '{\"uid\":\"strapi::webhooks\",\"collectionName\":\"strapi_webhooks\",\"info\":{\"name\":\"Strapi webhooks\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\"},\"url\":{\"type\":\"text\"},\"headers\":{\"type\":\"json\"},\"events\":{\"type\":\"json\"},\"enabled\":{\"type\":\"boolean\"}}}', 'object', NULL, NULL),
(3, 'model_def_strapi::permission', '{\"uid\":\"strapi::permission\",\"collectionName\":\"strapi_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Permission\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"model\":\"role\",\"plugin\":\"admin\"}}}', 'object', NULL, NULL),
(4, 'model_def_strapi::role', '{\"uid\":\"strapi::role\",\"collectionName\":\"strapi_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Role\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"collection\":\"user\",\"via\":\"roles\",\"plugin\":\"admin\",\"attribute\":\"user\",\"column\":\"id\",\"isVirtual\":true},\"permissions\":{\"configurable\":false,\"plugin\":\"admin\",\"collection\":\"permission\",\"via\":\"role\",\"isVirtual\":true}}}', 'object', NULL, NULL),
(5, 'model_def_strapi::user', '{\"uid\":\"strapi::user\",\"collectionName\":\"strapi_administrator\",\"kind\":\"collectionType\",\"info\":{\"name\":\"User\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"collection\":\"role\",\"collectionName\":\"strapi_users_roles\",\"via\":\"users\",\"dominant\":true,\"plugin\":\"admin\",\"configurable\":false,\"private\":true,\"attribute\":\"role\",\"column\":\"id\",\"isVirtual\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}}}', 'object', NULL, NULL),
(6, 'model_def_plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"collectionName\":\"users-permissions_permission\",\"kind\":\"collectionType\",\"info\":{\"name\":\"permission\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(7, 'model_def_plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"collectionName\":\"users-permissions_role\",\"kind\":\"collectionType\",\"info\":{\"name\":\"role\",\"description\":\"\"},\"options\":{\"timestamps\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(8, 'model_def_plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"collectionName\":\"users-permissions_user\",\"kind\":\"collectionType\",\"info\":{\"name\":\"user\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":[\"created_at\",\"updated_at\"]},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"mobile_number\":{\"type\":\"string\"},\"name\":{\"type\":\"string\"},\"photo\":{\"collection\":\"file\",\"via\":\"related\",\"allowedTypes\":[\"images\"],\"plugin\":\"upload\",\"required\":false,\"pluginOptions\":{}},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(9, 'model_def_plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"collectionName\":\"upload_file\",\"kind\":\"collectionType\",\"info\":{\"name\":\"file\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(10, 'model_def_plugins::i18n.locale', '{\"uid\":\"plugins::i18n.locale\",\"collectionName\":\"i18n_locales\",\"kind\":\"collectionType\",\"info\":{\"name\":\"locale\",\"description\":\"\"},\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(11, 'plugin_upload_settings', '{\"sizeOptimization\":true,\"responsiveDimensions\":true}', 'object', 'development', ''),
(12, 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"}}', 'object', '', ''),
(13, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.permission', '{\"uid\":\"plugins::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}', 'object', '', ''),
(14, 'plugin_content_manager_configuration_content_types::strapi::permission', '{\"uid\":\"strapi::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"Subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"Properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"Conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}', 'object', '', ''),
(15, 'plugin_content_manager_configuration_content_types::strapi::role', '{\"uid\":\"strapi::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}', 'object', '', ''),
(16, 'plugin_content_manager_configuration_content_types::strapi::user', '{\"uid\":\"strapi::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"Firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"Lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"RegistrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"RegistrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"IsActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"IsActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"Roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"PreferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreferedLanguage\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"preferedLanguage\",\"size\":6}]]}}', 'object', '', ''),
(17, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.user', '{\"uid\":\"plugins::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"ConfirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ConfirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":true,\"sortable\":true}},\"mobile_number\":{\"edit\":{\"label\":\"Mobile_number\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mobile_number\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"photo\":{\"edit\":{\"label\":\"Photo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Photo\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6}],[{\"name\":\"confirmed\",\"size\":4},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"mobile_number\",\"size\":6},{\"name\":\"name\",\"size\":6}],[{\"name\":\"photo\",\"size\":6}]],\"editRelations\":[\"role\"]}}', 'object', '', ''),
(18, 'plugin_content_manager_configuration_content_types::plugins::users-permissions.role', '{\"uid\":\"plugins::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}', 'object', '', ''),
(19, 'plugin_content_manager_configuration_content_types::plugins::upload.file', '{\"uid\":\"plugins::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"AlternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"AlternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"Caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"Width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"Height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"Formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"PreviewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"PreviewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"Provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider_metadata\",\"searchable\":false,\"sortable\":false}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}', 'object', '', ''),
(20, 'plugin_content_manager_configuration_content_types::plugins::i18n.locale', '{\"uid\":\"plugins::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"Code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Code\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"created_at\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}', 'object', '', ''),
(21, 'plugin_i18n_default_locale', '\"en\"', 'string', '', ''),
(22, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', '', ''),
(23, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":false,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}', 'object', '', ''),
(24, 'core_admin_auth', '{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}', 'object', '', ''),
(25, 'plugin_documentation_config', '{\"restrictedAccess\":false,\"password\":\"$2a$10$6YNEJdg079xlGvux.GsC1uSTUvnrZRmrCGdChdiD1eKVM51JbJkvi\"}', 'object', '', ''),
(26, 'model_def_application::topup-request.topup-request', '{\"uid\":\"application::topup-request.topup-request\",\"collectionName\":\"topup_requests\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Topup Request\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"phone_number\":{\"type\":\"string\",\"required\":true,\"minLength\":11},\"operator\":{\"type\":\"enumeration\",\"enum\":[\"bkash\",\"nagad\",\"upay\",\"rocket\",\"flexiload\"],\"required\":true},\"amount_bdt\":{\"type\":\"integer\",\"required\":true},\"status\":{\"type\":\"enumeration\",\"enum\":[\"pending\",\"success\",\"fail\"],\"default\":\"pending\",\"required\":true},\"author\":{\"private\":true,\"plugin\":\"users-permissions\",\"model\":\"user\",\"via\":\"topup_requests\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(28, 'model_def_application::account.account', '{\"uid\":\"application::account.account\",\"collectionName\":\"accounts\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Account\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false,\"populateCreatorFields\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"balance\":{\"type\":\"decimal\",\"required\":true},\"owner\":{\"type\":\"integer\",\"required\":true},\"users\":{\"plugin\":\"users-permissions\",\"model\":\"user\"},\"lists\":{\"via\":\"account\",\"collection\":\"list\",\"isVirtual\":true},\"debits\":{\"via\":\"account\",\"collection\":\"debit\",\"isVirtual\":true},\"credits\":{\"via\":\"account\",\"collection\":\"credit\",\"isVirtual\":true},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":false},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":false}}}', 'object', NULL, NULL),
(29, 'plugin_content_manager_configuration_content_types::application::account.account', '{\"uid\":\"application::account.account\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"balance\":{\"edit\":{\"label\":\"Balance\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Balance\",\"searchable\":true,\"sortable\":true}},\"owner\":{\"edit\":{\"label\":\"Owner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Owner\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":true,\"sortable\":true}},\"lists\":{\"edit\":{\"label\":\"Lists\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Lists\",\"searchable\":false,\"sortable\":false}},\"debits\":{\"edit\":{\"label\":\"Debits\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"purpose\"},\"list\":{\"label\":\"Debits\",\"searchable\":false,\"sortable\":false}},\"credits\":{\"edit\":{\"label\":\"Credits\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"source\"},\"list\":{\"label\":\"Credits\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"balance\",\"created_at\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"balance\",\"size\":4}],[{\"name\":\"owner\",\"size\":4}]],\"editRelations\":[\"users\",\"lists\",\"debits\",\"credits\"]}}', 'object', '', ''),
(30, 'model_def_application::list.list', '{\"uid\":\"application::list.list\",\"collectionName\":\"lists\",\"kind\":\"collectionType\",\"info\":{\"name\":\"List\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"deadline\":{\"type\":\"date\",\"required\":true},\"complete\":{\"type\":\"boolean\",\"default\":false},\"account\":{\"model\":\"account\",\"via\":\"lists\"},\"items\":{\"via\":\"list\",\"collection\":\"item\",\"isVirtual\":true},\"total\":{\"type\":\"decimal\"},\"author\":{\"type\":\"integer\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(31, 'plugin_content_manager_configuration_content_types::application::list.list', '{\"uid\":\"application::list.list\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"deadline\":{\"edit\":{\"label\":\"Deadline\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Deadline\",\"searchable\":true,\"sortable\":true}},\"complete\":{\"edit\":{\"label\":\"Complete\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Complete\",\"searchable\":true,\"sortable\":true}},\"account\":{\"edit\":{\"label\":\"Account\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Account\",\"searchable\":true,\"sortable\":true}},\"items\":{\"edit\":{\"label\":\"Items\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Items\",\"searchable\":false,\"sortable\":false}},\"total\":{\"edit\":{\"label\":\"Total\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Total\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"Author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Author\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"deadline\",\"complete\",\"account\"],\"edit\":[[{\"name\":\"deadline\",\"size\":4},{\"name\":\"complete\",\"size\":4},{\"name\":\"total\",\"size\":4}],[{\"name\":\"author\",\"size\":4}]],\"editRelations\":[\"account\",\"items\"]}}', 'object', '', ''),
(32, 'model_def_application::itam.itam', '{\"uid\":\"application::itam.itam\",\"collectionName\":\"itams\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Item\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"quantity\":{\"type\":\"decimal\"},\"unit\":{\"type\":\"enumeration\",\"enum\":[\"piece\",\"kg\",\"liter\",\"foot\"],\"default\":\"piece\"},\"price\":{\"type\":\"decimal\"},\"remarks\":{\"type\":\"string\"},\"complete\":{\"type\":\"boolean\",\"default\":false},\"list\":{\"via\":\"itams\",\"model\":\"list\"},\"author\":{\"type\":\"integer\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(34, 'model_def_application::debit.debit', '{\"uid\":\"application::debit.debit\",\"collectionName\":\"debits\",\"kind\":\"collectionType\",\"info\":{\"name\":\"debit\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"purpose\":{\"type\":\"string\",\"required\":true},\"amount\":{\"type\":\"integer\",\"required\":true},\"account\":{\"model\":\"account\",\"via\":\"debits\"},\"remark\":{\"type\":\"string\"},\"author\":{\"type\":\"integer\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(35, 'plugin_content_manager_configuration_content_types::application::debit.debit', '{\"uid\":\"application::debit.debit\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"purpose\",\"defaultSortBy\":\"purpose\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"purpose\":{\"edit\":{\"label\":\"Purpose\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Purpose\",\"searchable\":true,\"sortable\":true}},\"amount\":{\"edit\":{\"label\":\"Amount\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Amount\",\"searchable\":true,\"sortable\":true}},\"account\":{\"edit\":{\"label\":\"Account\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Account\",\"searchable\":true,\"sortable\":true}},\"remark\":{\"edit\":{\"label\":\"Remark\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Remark\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"Author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Author\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"purpose\",\"amount\",\"account\"],\"edit\":[[{\"name\":\"purpose\",\"size\":6},{\"name\":\"amount\",\"size\":4}],[{\"name\":\"remark\",\"size\":6},{\"name\":\"author\",\"size\":4}]],\"editRelations\":[\"account\"]}}', 'object', '', ''),
(36, 'model_def_application::credit.credit', '{\"uid\":\"application::credit.credit\",\"collectionName\":\"credits\",\"kind\":\"collectionType\",\"info\":{\"name\":\"credit\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"source\":{\"type\":\"string\",\"required\":true},\"amount\":{\"required\":true,\"type\":\"decimal\"},\"remarks\":{\"type\":\"string\"},\"account\":{\"model\":\"account\",\"via\":\"credits\"},\"author\":{\"type\":\"integer\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(37, 'plugin_content_manager_configuration_content_types::application::credit.credit', '{\"uid\":\"application::credit.credit\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"source\",\"defaultSortBy\":\"source\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"source\":{\"edit\":{\"label\":\"Source\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Source\",\"searchable\":true,\"sortable\":true}},\"amount\":{\"edit\":{\"label\":\"Amount\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Amount\",\"searchable\":true,\"sortable\":true}},\"remarks\":{\"edit\":{\"label\":\"Remarks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Remarks\",\"searchable\":true,\"sortable\":true}},\"account\":{\"edit\":{\"label\":\"Account\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Account\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"Author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Author\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"source\",\"amount\",\"remarks\"],\"edit\":[[{\"name\":\"source\",\"size\":6},{\"name\":\"amount\",\"size\":4}],[{\"name\":\"remarks\",\"size\":6},{\"name\":\"author\",\"size\":4}]],\"editRelations\":[\"account\"]}}', 'object', '', '');
INSERT INTO `core_store` (`id`, `key`, `value`, `type`, `environment`, `tag`) VALUES
(38, 'model_def_application::item.itam', '{\"uid\":\"application::item.itam\",\"collectionName\":\"itams\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Item\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"quantity\":{\"type\":\"decimal\"},\"unit\":{\"type\":\"enumeration\",\"enum\":[\"piece\",\"kg\",\"liter\",\"foot\"],\"default\":\"piece\"},\"price\":{\"type\":\"decimal\"},\"remarks\":{\"type\":\"string\"},\"complete\":{\"type\":\"boolean\",\"default\":false},\"list\":{\"via\":\"itams\",\"model\":\"list\"},\"author\":{\"type\":\"integer\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(40, 'model_def_application::item.item', '{\"uid\":\"application::item.item\",\"collectionName\":\"items\",\"kind\":\"collectionType\",\"info\":{\"name\":\"Item\",\"description\":\"\"},\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"quantity\":{\"type\":\"decimal\"},\"unit\":{\"type\":\"enumeration\",\"enum\":[\"piece\",\"kg\",\"liter\",\"foot\"],\"default\":\"piece\"},\"price\":{\"type\":\"decimal\"},\"remarks\":{\"type\":\"string\"},\"complete\":{\"type\":\"boolean\",\"default\":false},\"list\":{\"via\":\"items\",\"model\":\"list\"},\"author\":{\"type\":\"integer\"},\"created_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true},\"updated_by\":{\"model\":\"user\",\"plugin\":\"admin\",\"configurable\":false,\"writable\":false,\"visible\":false,\"private\":true}}}', 'object', NULL, NULL),
(41, 'plugin_content_manager_configuration_content_types::application::item.item', '{\"uid\":\"application::item.item\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"quantity\":{\"edit\":{\"label\":\"Quantity\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Quantity\",\"searchable\":true,\"sortable\":true}},\"unit\":{\"edit\":{\"label\":\"Unit\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Unit\",\"searchable\":true,\"sortable\":true}},\"price\":{\"edit\":{\"label\":\"Price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Price\",\"searchable\":true,\"sortable\":true}},\"remarks\":{\"edit\":{\"label\":\"Remarks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Remarks\",\"searchable\":true,\"sortable\":true}},\"complete\":{\"edit\":{\"label\":\"Complete\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Complete\",\"searchable\":true,\"sortable\":true}},\"list\":{\"edit\":{\"label\":\"List\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"List\",\"searchable\":true,\"sortable\":true}},\"author\":{\"edit\":{\"label\":\"Author\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Author\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"quantity\",\"unit\"],\"editRelations\":[\"list\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"quantity\",\"size\":4}],[{\"name\":\"unit\",\"size\":6},{\"name\":\"price\",\"size\":4}],[{\"name\":\"remarks\",\"size\":6},{\"name\":\"complete\",\"size\":4}],[{\"name\":\"author\",\"size\":4}]]}}', 'object', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

DROP TABLE IF EXISTS `credits`;
CREATE TABLE IF NOT EXISTS `credits` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `debits`
--

DROP TABLE IF EXISTS `debits`;
CREATE TABLE IF NOT EXISTS `debits` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `purpose` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `account` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `i18n_locales`
--

DROP TABLE IF EXISTS `i18n_locales`;
CREATE TABLE IF NOT EXISTS `i18n_locales` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `i18n_locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i18n_locales`
--

INSERT INTO `i18n_locales` (`id`, `name`, `code`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'English (en)', 'en', NULL, NULL, '2021-07-05 23:14:06', '2021-07-05 23:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `list` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `quantity`, `unit`, `price`, `remarks`, `complete`, `list`, `created_by`, `updated_by`, `created_at`, `updated_at`, `author`) VALUES
(9, 'chegaratte', NULL, 'piece', '300.00', NULL, 0, 9, NULL, NULL, '2021-07-24 09:19:52', '2021-07-24 09:20:31', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

DROP TABLE IF EXISTS `lists`;
CREATE TABLE IF NOT EXISTS `lists` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `deadline` date NOT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lists`
--

INSERT INTO `lists` (`id`, `deadline`, `complete`, `account`, `created_by`, `updated_by`, `created_at`, `updated_at`, `total`, `author`) VALUES
(9, '2021-07-27', 0, 15, NULL, NULL, '2021-07-24 04:14:48', '2021-07-24 09:28:01', '300.00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_administrator`
--

DROP TABLE IF EXISTS `strapi_administrator`;
CREATE TABLE IF NOT EXISTS `strapi_administrator` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `registrationToken` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `preferedLanguage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_administrator_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strapi_administrator`
--

INSERT INTO `strapi_administrator` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `resetPasswordToken`, `registrationToken`, `isActive`, `blocked`, `preferedLanguage`) VALUES
(1, 'Sayeem', 'Shahria', 'sayeem', 'sayeems@gmail.com', '$2a$10$lvhG8oiT5yQekxV5Ad8VpO/XkAYmHYIUN1NhZMSNAHvIXpXzH2Yn6', '0c42f75fca388c56c737ecc5679344f87596cc9e', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_permission`
--

DROP TABLE IF EXISTS `strapi_permission`;
CREATE TABLE IF NOT EXISTS `strapi_permission` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` longtext,
  `conditions` longtext,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1275 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strapi_permission`
--

INSERT INTO `strapi_permission` (`id`, `action`, `subject`, `properties`, `conditions`, `role`, `created_at`, `updated_at`) VALUES
(1, 'plugins::upload.read', NULL, '{}', '[]', 2, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(2, 'plugins::upload.assets.create', NULL, '{}', '[]', 2, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(3, 'plugins::upload.assets.update', NULL, '{}', '[]', 2, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(4, 'plugins::upload.assets.download', NULL, '{}', '[]', 2, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(5, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 2, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(6, 'plugins::upload.read', NULL, '{}', '[\"admin::is-creator\"]', 3, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(7, 'plugins::upload.assets.create', NULL, '{}', '[]', 3, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(8, 'plugins::upload.assets.update', NULL, '{}', '[\"admin::is-creator\"]', 3, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(9, 'plugins::upload.assets.download', NULL, '{}', '[]', 3, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(10, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 3, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(15, 'plugins::content-type-builder.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(16, 'plugins::email.settings.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(17, 'plugins::upload.assets.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(18, 'plugins::upload.assets.download', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(19, 'plugins::upload.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(20, 'plugins::upload.assets.create', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(21, 'plugins::upload.assets.copy-link', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(22, 'plugins::upload.settings.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(23, 'plugins::content-manager.single-types.configure-view', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(24, 'plugins::content-manager.collection-types.configure-view', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(25, 'plugins::i18n.locale.create', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(26, 'plugins::content-manager.components.configure-layout', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(27, 'plugins::i18n.locale.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(28, 'plugins::i18n.locale.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(29, 'plugins::i18n.locale.delete', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(30, 'plugins::users-permissions.roles.create', NULL, '{}', '[]', 1, '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(31, 'plugins::users-permissions.roles.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(32, 'plugins::users-permissions.roles.delete', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(33, 'plugins::users-permissions.roles.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(34, 'plugins::users-permissions.providers.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(35, 'plugins::users-permissions.email-templates.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(36, 'plugins::users-permissions.advanced-settings.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(37, 'admin::marketplace.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(38, 'plugins::users-permissions.providers.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(39, 'plugins::users-permissions.email-templates.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(40, 'plugins::users-permissions.advanced-settings.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(41, 'admin::marketplace.plugins.install', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(42, 'admin::marketplace.plugins.uninstall', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(43, 'admin::webhooks.create', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(44, 'admin::webhooks.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(45, 'admin::webhooks.delete', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(46, 'admin::users.create', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(47, 'admin::users.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(48, 'admin::users.delete', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(49, 'admin::webhooks.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(50, 'admin::users.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(51, 'admin::roles.create', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(52, 'admin::roles.read', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(53, 'admin::roles.update', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(54, 'admin::roles.delete', NULL, '{}', '[]', 1, '2021-07-05 23:14:11', '2021-07-05 23:14:11'),
(56, 'plugins::documentation.read', NULL, '{}', '[]', 1, '2021-07-06 00:07:14', '2021-07-06 00:07:14'),
(57, 'plugins::documentation.settings.update', NULL, '{}', '[]', 1, '2021-07-06 00:07:14', '2021-07-06 00:07:14'),
(58, 'plugins::documentation.settings.regenerate', NULL, '{}', '[]', 1, '2021-07-06 00:07:14', '2021-07-06 00:07:14'),
(372, 'plugins::content-manager.explorer.create', 'application::account.account', '{\"fields\":[\"name\",\"balance\",\"owner\",\"users\",\"lists\",\"debits\",\"credits\"]}', '[]', 1, '2021-07-17 11:33:52', '2021-07-17 11:33:52'),
(374, 'plugins::content-manager.explorer.read', 'application::account.account', '{\"fields\":[\"name\",\"balance\",\"owner\",\"users\",\"lists\",\"debits\",\"credits\"]}', '[]', 1, '2021-07-17 11:33:52', '2021-07-17 11:33:52'),
(376, 'plugins::content-manager.explorer.update', 'application::account.account', '{\"fields\":[\"name\",\"balance\",\"owner\",\"users\",\"lists\",\"debits\",\"credits\"]}', '[]', 1, '2021-07-17 11:33:52', '2021-07-17 11:33:52'),
(447, 'plugins::content-manager.explorer.create', 'plugins::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"mobile_number\",\"name\",\"photo\"]}', '[]', 1, '2021-07-18 08:17:25', '2021-07-18 08:17:25'),
(448, 'plugins::content-manager.explorer.read', 'plugins::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"mobile_number\",\"name\",\"photo\"]}', '[]', 1, '2021-07-18 08:17:25', '2021-07-18 08:17:25'),
(449, 'plugins::content-manager.explorer.update', 'plugins::users-permissions.user', '{\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"mobile_number\",\"name\",\"photo\"]}', '[]', 1, '2021-07-18 08:17:25', '2021-07-18 08:17:25'),
(492, 'plugins::content-manager.explorer.create', 'application::credit.credit', '{\"fields\":[\"source\",\"amount\",\"remarks\",\"account\",\"author\"]}', '[]', 1, '2021-07-18 08:48:17', '2021-07-18 08:48:17'),
(493, 'plugins::content-manager.explorer.read', 'application::credit.credit', '{\"fields\":[\"source\",\"amount\",\"remarks\",\"account\",\"author\"]}', '[]', 1, '2021-07-18 08:48:17', '2021-07-18 08:48:17'),
(494, 'plugins::content-manager.explorer.update', 'application::credit.credit', '{\"fields\":[\"source\",\"amount\",\"remarks\",\"account\",\"author\"]}', '[]', 1, '2021-07-18 08:48:17', '2021-07-18 08:48:17'),
(501, 'plugins::content-manager.explorer.create', 'application::debit.debit', '{\"fields\":[\"purpose\",\"amount\",\"account\",\"remark\",\"author\"]}', '[]', 1, '2021-07-18 08:48:47', '2021-07-18 08:48:47'),
(502, 'plugins::content-manager.explorer.read', 'application::debit.debit', '{\"fields\":[\"purpose\",\"amount\",\"account\",\"remark\",\"author\"]}', '[]', 1, '2021-07-18 08:48:47', '2021-07-18 08:48:47'),
(503, 'plugins::content-manager.explorer.update', 'application::debit.debit', '{\"fields\":[\"purpose\",\"amount\",\"account\",\"remark\",\"author\"]}', '[]', 1, '2021-07-18 08:48:47', '2021-07-18 08:48:47'),
(927, 'plugins::content-manager.explorer.create', 'application::item.item', '{\"fields\":[\"name\",\"quantity\",\"unit\",\"price\",\"remarks\",\"complete\",\"list\",\"author\"]}', '[]', 1, '2021-07-23 06:33:23', '2021-07-23 06:33:23'),
(928, 'plugins::content-manager.explorer.create', 'application::list.list', '{\"fields\":[\"deadline\",\"complete\",\"account\",\"items\",\"total\",\"author\"]}', '[]', 1, '2021-07-23 06:33:23', '2021-07-23 06:33:23'),
(929, 'plugins::content-manager.explorer.read', 'application::item.item', '{\"fields\":[\"name\",\"quantity\",\"unit\",\"price\",\"remarks\",\"complete\",\"list\",\"author\"]}', '[]', 1, '2021-07-23 06:33:23', '2021-07-23 06:33:23'),
(930, 'plugins::content-manager.explorer.read', 'application::list.list', '{\"fields\":[\"deadline\",\"complete\",\"account\",\"items\",\"total\",\"author\"]}', '[]', 1, '2021-07-23 06:33:23', '2021-07-23 06:33:23'),
(931, 'plugins::content-manager.explorer.update', 'application::item.item', '{\"fields\":[\"name\",\"quantity\",\"unit\",\"price\",\"remarks\",\"complete\",\"list\",\"author\"]}', '[]', 1, '2021-07-23 06:33:23', '2021-07-23 06:33:23'),
(932, 'plugins::content-manager.explorer.update', 'application::list.list', '{\"fields\":[\"deadline\",\"complete\",\"account\",\"items\",\"total\",\"author\"]}', '[]', 1, '2021-07-23 06:33:23', '2021-07-23 06:33:23'),
(1269, 'plugins::content-manager.explorer.delete', 'application::account.account', '{}', '[]', 1, '2021-07-24 09:32:33', '2021-07-24 09:32:33'),
(1270, 'plugins::content-manager.explorer.delete', 'application::credit.credit', '{}', '[]', 1, '2021-07-24 09:32:33', '2021-07-24 09:32:33'),
(1271, 'plugins::content-manager.explorer.delete', 'application::debit.debit', '{}', '[]', 1, '2021-07-24 09:32:33', '2021-07-24 09:32:33'),
(1272, 'plugins::content-manager.explorer.delete', 'application::item.item', '{}', '[]', 1, '2021-07-24 09:32:33', '2021-07-24 09:32:33'),
(1273, 'plugins::content-manager.explorer.delete', 'application::list.list', '{}', '[]', 1, '2021-07-24 09:32:33', '2021-07-24 09:32:33'),
(1274, 'plugins::content-manager.explorer.delete', 'plugins::users-permissions.user', '{}', '[]', 1, '2021-07-24 09:32:33', '2021-07-24 09:32:33');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_role`
--

DROP TABLE IF EXISTS `strapi_role`;
CREATE TABLE IF NOT EXISTS `strapi_role` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_role_name_unique` (`name`),
  UNIQUE KEY `strapi_role_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strapi_role`
--

INSERT INTO `strapi_role` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'strapi-super-admin', 'Super Admins can access and manage all features and settings.', '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(2, 'Editor', 'strapi-editor', 'Editors can manage and publish contents including those of other users.', '2021-07-05 23:14:10', '2021-07-05 23:14:10'),
(3, 'Author', 'strapi-author', 'Authors can manage the content they have created.', '2021-07-05 23:14:10', '2021-07-05 23:14:10');

-- --------------------------------------------------------

--
-- Table structure for table `strapi_users_roles`
--

DROP TABLE IF EXISTS `strapi_users_roles`;
CREATE TABLE IF NOT EXISTS `strapi_users_roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strapi_users_roles`
--

INSERT INTO `strapi_users_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
CREATE TABLE IF NOT EXISTS `strapi_webhooks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` longtext,
  `events` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE IF NOT EXISTS `upload_file` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alternativeText` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext,
  `hash` varchar(255) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` decimal(10,2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `previewUrl` varchar(255) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_metadata` longtext,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload_file`
--

INSERT INTO `upload_file` (`id`, `name`, `alternativeText`, `caption`, `width`, `height`, `formats`, `hash`, `ext`, `mime`, `size`, `url`, `previewUrl`, `provider`, `provider_metadata`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '15723626_10211372318528227_3004886585682695124_o.jpg', '', '', 2048, 1365, '{\"thumbnail\":{\"name\":\"thumbnail_15723626_10211372318528227_3004886585682695124_o.jpg\",\"hash\":\"thumbnail_15723626_10211372318528227_3004886585682695124_o_68e78ce460\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":234,\"height\":156,\"size\":3.83,\"path\":null,\"url\":\"/uploads/thumbnail_15723626_10211372318528227_3004886585682695124_o_68e78ce460.jpg\"},\"large\":{\"name\":\"large_15723626_10211372318528227_3004886585682695124_o.jpg\",\"hash\":\"large_15723626_10211372318528227_3004886585682695124_o_68e78ce460\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":1000,\"height\":667,\"size\":31.42,\"path\":null,\"url\":\"/uploads/large_15723626_10211372318528227_3004886585682695124_o_68e78ce460.jpg\"},\"medium\":{\"name\":\"medium_15723626_10211372318528227_3004886585682695124_o.jpg\",\"hash\":\"medium_15723626_10211372318528227_3004886585682695124_o_68e78ce460\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":750,\"height\":500,\"size\":19.96,\"path\":null,\"url\":\"/uploads/medium_15723626_10211372318528227_3004886585682695124_o_68e78ce460.jpg\"},\"small\":{\"name\":\"small_15723626_10211372318528227_3004886585682695124_o.jpg\",\"hash\":\"small_15723626_10211372318528227_3004886585682695124_o_68e78ce460\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"width\":500,\"height\":333,\"size\":10.63,\"path\":null,\"url\":\"/uploads/small_15723626_10211372318528227_3004886585682695124_o_68e78ce460.jpg\"}}', '15723626_10211372318528227_3004886585682695124_o_68e78ce460', '.jpg', 'image/jpeg', '100.72', '/uploads/15723626_10211372318528227_3004886585682695124_o_68e78ce460.jpg', NULL, 'local', NULL, 1, 1, '2021-07-18 08:19:42', '2021-07-18 08:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
CREATE TABLE IF NOT EXISTS `upload_file_morph` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload_file_morph`
--

INSERT INTO `upload_file_morph` (`id`, `upload_file_id`, `related_id`, `related_type`, `field`, `order`) VALUES
(1, 1, 7, 'users-permissions_user', 'photo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
CREATE TABLE IF NOT EXISTS `users-permissions_permission` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users-permissions_permission`
--

INSERT INTO `users-permissions_permission` (`id`, `type`, `controller`, `action`, `enabled`, `policy`, `role`, `created_by`, `updated_by`) VALUES
(1, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 1, NULL, NULL),
(2, 'content-manager', 'collection-types', 'create', 0, '', 2, NULL, NULL),
(3, 'content-manager', 'collection-types', 'delete', 0, '', 1, NULL, NULL),
(4, 'content-manager', 'collection-types', 'find', 0, '', 1, NULL, NULL),
(5, 'content-manager', 'collection-types', 'delete', 0, '', 2, NULL, NULL),
(6, 'content-manager', 'collection-types', 'bulkdelete', 0, '', 2, NULL, NULL),
(7, 'content-manager', 'collection-types', 'create', 0, '', 1, NULL, NULL),
(8, 'content-manager', 'collection-types', 'findone', 0, '', 1, NULL, NULL),
(9, 'content-manager', 'collection-types', 'findone', 0, '', 2, NULL, NULL),
(10, 'content-manager', 'collection-types', 'find', 0, '', 2, NULL, NULL),
(11, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 2, NULL, NULL),
(12, 'content-manager', 'collection-types', 'publish', 0, '', 1, NULL, NULL),
(13, 'content-manager', 'collection-types', 'previewmanyrelations', 0, '', 1, NULL, NULL),
(14, 'content-manager', 'collection-types', 'publish', 0, '', 2, NULL, NULL),
(15, 'content-manager', 'collection-types', 'unpublish', 0, '', 1, NULL, NULL),
(16, 'content-manager', 'collection-types', 'unpublish', 0, '', 2, NULL, NULL),
(17, 'content-manager', 'collection-types', 'update', 0, '', 1, NULL, NULL),
(18, 'content-manager', 'collection-types', 'update', 0, '', 2, NULL, NULL),
(19, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 1, NULL, NULL),
(20, 'content-manager', 'components', 'findcomponentconfiguration', 0, '', 2, NULL, NULL),
(21, 'content-manager', 'components', 'findcomponents', 0, '', 1, NULL, NULL),
(22, 'content-manager', 'components', 'findcomponents', 0, '', 2, NULL, NULL),
(23, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 1, NULL, NULL),
(24, 'content-manager', 'components', 'updatecomponentconfiguration', 0, '', 2, NULL, NULL),
(25, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 1, NULL, NULL),
(26, 'content-manager', 'content-types', 'findcontenttypeconfiguration', 0, '', 2, NULL, NULL),
(27, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 1, NULL, NULL),
(28, 'content-manager', 'content-types', 'findcontenttypes', 0, '', 2, NULL, NULL),
(29, 'content-manager', 'content-types', 'findcontenttypessettings', 0, '', 1, NULL, NULL),
(30, 'content-manager', 'content-types', 'findcontenttypessettings', 0, '', 2, NULL, NULL),
(31, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 1, NULL, NULL),
(32, 'content-manager', 'content-types', 'updatecontenttypeconfiguration', 0, '', 2, NULL, NULL),
(33, 'content-manager', 'relations', 'find', 0, '', 1, NULL, NULL),
(34, 'content-manager', 'relations', 'find', 0, '', 2, NULL, NULL),
(35, 'content-manager', 'single-types', 'createorupdate', 0, '', 2, NULL, NULL),
(36, 'content-manager', 'single-types', 'delete', 0, '', 1, NULL, NULL),
(37, 'content-manager', 'single-types', 'delete', 0, '', 2, NULL, NULL),
(38, 'content-manager', 'single-types', 'find', 0, '', 1, NULL, NULL),
(39, 'content-manager', 'single-types', 'createorupdate', 0, '', 1, NULL, NULL),
(40, 'content-manager', 'single-types', 'find', 0, '', 2, NULL, NULL),
(41, 'content-manager', 'single-types', 'publish', 0, '', 1, NULL, NULL),
(42, 'content-manager', 'single-types', 'unpublish', 0, '', 1, NULL, NULL),
(43, 'content-manager', 'single-types', 'unpublish', 0, '', 2, NULL, NULL),
(44, 'content-manager', 'single-types', 'publish', 0, '', 2, NULL, NULL),
(45, 'content-manager', 'uid', 'generateuid', 0, '', 1, NULL, NULL),
(46, 'content-manager', 'uid', 'generateuid', 0, '', 2, NULL, NULL),
(47, 'content-type-builder', 'builder', 'getreservednames', 0, '', 1, NULL, NULL),
(48, 'content-manager', 'uid', 'checkuidavailability', 0, '', 1, NULL, NULL),
(49, 'content-manager', 'uid', 'checkuidavailability', 0, '', 2, NULL, NULL),
(50, 'content-type-builder', 'builder', 'getreservednames', 0, '', 2, NULL, NULL),
(51, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 1, NULL, NULL),
(52, 'content-type-builder', 'componentcategories', 'deletecategory', 0, '', 2, NULL, NULL),
(53, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 1, NULL, NULL),
(54, 'content-type-builder', 'componentcategories', 'editcategory', 0, '', 2, NULL, NULL),
(55, 'content-type-builder', 'components', 'createcomponent', 0, '', 1, NULL, NULL),
(56, 'content-type-builder', 'components', 'createcomponent', 0, '', 2, NULL, NULL),
(57, 'content-type-builder', 'components', 'deletecomponent', 0, '', 1, NULL, NULL),
(58, 'content-type-builder', 'components', 'deletecomponent', 0, '', 2, NULL, NULL),
(59, 'content-type-builder', 'components', 'getcomponent', 0, '', 1, NULL, NULL),
(60, 'content-type-builder', 'components', 'getcomponent', 0, '', 2, NULL, NULL),
(61, 'content-type-builder', 'components', 'getcomponents', 0, '', 2, NULL, NULL),
(62, 'content-type-builder', 'components', 'updatecomponent', 0, '', 1, NULL, NULL),
(63, 'content-type-builder', 'components', 'updatecomponent', 0, '', 2, NULL, NULL),
(64, 'content-type-builder', 'components', 'getcomponents', 0, '', 1, NULL, NULL),
(65, 'content-type-builder', 'connections', 'getconnections', 0, '', 1, NULL, NULL),
(66, 'content-type-builder', 'connections', 'getconnections', 0, '', 2, NULL, NULL),
(67, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 1, NULL, NULL),
(68, 'content-type-builder', 'contenttypes', 'createcontenttype', 0, '', 2, NULL, NULL),
(69, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 1, NULL, NULL),
(70, 'content-type-builder', 'contenttypes', 'deletecontenttype', 0, '', 2, NULL, NULL),
(71, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 1, NULL, NULL),
(72, 'content-type-builder', 'contenttypes', 'getcontenttype', 0, '', 2, NULL, NULL),
(73, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 1, NULL, NULL),
(74, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 1, NULL, NULL),
(75, 'content-type-builder', 'contenttypes', 'updatecontenttype', 0, '', 2, NULL, NULL),
(76, 'email', 'email', 'getsettings', 0, '', 1, NULL, NULL),
(77, 'email', 'email', 'getsettings', 0, '', 2, NULL, NULL),
(78, 'email', 'email', 'send', 0, '', 1, NULL, NULL),
(79, 'content-type-builder', 'contenttypes', 'getcontenttypes', 0, '', 2, NULL, NULL),
(80, 'email', 'email', 'send', 0, '', 2, NULL, NULL),
(81, 'i18n', 'content-types', 'getnonlocalizedattributes', 0, '', 1, NULL, NULL),
(82, 'email', 'email', 'test', 0, '', 1, NULL, NULL),
(83, 'email', 'email', 'test', 0, '', 2, NULL, NULL),
(84, 'i18n', 'content-types', 'getnonlocalizedattributes', 0, '', 2, NULL, NULL),
(85, 'i18n', 'iso-locales', 'listisolocales', 0, '', 1, NULL, NULL),
(86, 'i18n', 'iso-locales', 'listisolocales', 0, '', 2, NULL, NULL),
(87, 'i18n', 'locales', 'createlocale', 0, '', 1, NULL, NULL),
(88, 'i18n', 'locales', 'createlocale', 0, '', 2, NULL, NULL),
(89, 'i18n', 'locales', 'deletelocale', 0, '', 1, NULL, NULL),
(90, 'i18n', 'locales', 'deletelocale', 0, '', 2, NULL, NULL),
(91, 'i18n', 'locales', 'listlocales', 0, '', 2, NULL, NULL),
(92, 'i18n', 'locales', 'listlocales', 0, '', 1, NULL, NULL),
(93, 'i18n', 'locales', 'updatelocale', 0, '', 1, NULL, NULL),
(94, 'i18n', 'locales', 'updatelocale', 0, '', 2, NULL, NULL),
(95, 'upload', 'upload', 'count', 0, '', 1, NULL, NULL),
(96, 'upload', 'upload', 'count', 0, '', 2, NULL, NULL),
(97, 'upload', 'upload', 'destroy', 0, '', 1, NULL, NULL),
(98, 'upload', 'upload', 'destroy', 0, '', 2, NULL, NULL),
(99, 'upload', 'upload', 'find', 0, '', 1, NULL, NULL),
(100, 'upload', 'upload', 'find', 0, '', 2, NULL, NULL),
(101, 'upload', 'upload', 'findone', 0, '', 1, NULL, NULL),
(102, 'upload', 'upload', 'findone', 0, '', 2, NULL, NULL),
(103, 'upload', 'upload', 'search', 0, '', 1, NULL, NULL),
(104, 'upload', 'upload', 'getsettings', 0, '', 1, NULL, NULL),
(105, 'upload', 'upload', 'getsettings', 0, '', 2, NULL, NULL),
(106, 'upload', 'upload', 'search', 0, '', 2, NULL, NULL),
(107, 'upload', 'upload', 'updatesettings', 0, '', 1, NULL, NULL),
(108, 'upload', 'upload', 'updatesettings', 0, '', 2, NULL, NULL),
(109, 'upload', 'upload', 'upload', 0, '', 1, NULL, NULL),
(110, 'upload', 'upload', 'upload', 0, '', 2, NULL, NULL),
(111, 'users-permissions', 'auth', 'callback', 0, '', 1, NULL, NULL),
(112, 'users-permissions', 'auth', 'callback', 1, '', 2, NULL, NULL),
(113, 'users-permissions', 'auth', 'connect', 1, '', 1, NULL, NULL),
(114, 'users-permissions', 'auth', 'connect', 1, '', 2, NULL, NULL),
(115, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 1, NULL, NULL),
(116, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 2, NULL, NULL),
(117, 'users-permissions', 'auth', 'forgotpassword', 0, '', 1, NULL, NULL),
(118, 'users-permissions', 'auth', 'forgotpassword', 1, '', 2, NULL, NULL),
(119, 'users-permissions', 'auth', 'register', 0, '', 1, NULL, NULL),
(120, 'users-permissions', 'auth', 'register', 1, '', 2, NULL, NULL),
(121, 'users-permissions', 'auth', 'resetpassword', 0, '', 1, NULL, NULL),
(122, 'users-permissions', 'auth', 'resetpassword', 1, '', 2, NULL, NULL),
(123, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 1, NULL, NULL),
(124, 'users-permissions', 'auth', 'sendemailconfirmation', 0, '', 2, NULL, NULL),
(125, 'users-permissions', 'user', 'count', 1, '', 1, NULL, NULL),
(126, 'users-permissions', 'user', 'count', 0, '', 2, NULL, NULL),
(127, 'users-permissions', 'user', 'create', 0, '', 1, NULL, NULL),
(128, 'users-permissions', 'user', 'create', 0, '', 2, NULL, NULL),
(129, 'users-permissions', 'user', 'destroy', 0, '', 1, NULL, NULL),
(130, 'users-permissions', 'user', 'destroy', 0, '', 2, NULL, NULL),
(131, 'users-permissions', 'user', 'destroyall', 0, '', 1, NULL, NULL),
(132, 'users-permissions', 'user', 'destroyall', 0, '', 2, NULL, NULL),
(133, 'users-permissions', 'user', 'find', 0, '', 2, NULL, NULL),
(134, 'users-permissions', 'user', 'findone', 1, '', 1, NULL, NULL),
(135, 'users-permissions', 'user', 'me', 1, '', 1, NULL, NULL),
(136, 'users-permissions', 'user', 'find', 1, '', 1, NULL, NULL),
(137, 'users-permissions', 'user', 'findone', 0, '', 2, NULL, NULL),
(138, 'users-permissions', 'user', 'me', 1, '', 2, NULL, NULL),
(139, 'users-permissions', 'user', 'update', 0, '', 1, NULL, NULL),
(140, 'users-permissions', 'user', 'update', 0, '', 2, NULL, NULL),
(141, 'users-permissions', 'userspermissions', 'createrole', 0, '', 1, NULL, NULL),
(142, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2, NULL, NULL),
(143, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 1, NULL, NULL),
(144, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2, NULL, NULL),
(145, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 1, NULL, NULL),
(146, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2, NULL, NULL),
(147, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 1, NULL, NULL),
(148, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2, NULL, NULL),
(149, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 1, NULL, NULL),
(150, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2, NULL, NULL),
(151, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 1, NULL, NULL),
(152, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2, NULL, NULL),
(153, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 1, NULL, NULL),
(154, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2, NULL, NULL),
(155, 'users-permissions', 'userspermissions', 'getrole', 0, '', 1, NULL, NULL),
(156, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2, NULL, NULL),
(157, 'users-permissions', 'userspermissions', 'getroles', 0, '', 1, NULL, NULL),
(158, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2, NULL, NULL),
(159, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 1, NULL, NULL),
(160, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2, NULL, NULL),
(161, 'users-permissions', 'userspermissions', 'index', 0, '', 1, NULL, NULL),
(162, 'users-permissions', 'userspermissions', 'index', 0, '', 2, NULL, NULL),
(163, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 1, NULL, NULL),
(164, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 1, NULL, NULL),
(165, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2, NULL, NULL),
(166, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 1, NULL, NULL),
(167, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2, NULL, NULL),
(168, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2, NULL, NULL),
(169, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 1, NULL, NULL),
(170, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2, NULL, NULL),
(171, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 1, NULL, NULL),
(172, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2, NULL, NULL),
(173, 'documentation', 'documentation', 'deletedoc', 0, '', 1, NULL, NULL),
(174, 'documentation', 'documentation', 'deletedoc', 0, '', 2, NULL, NULL),
(175, 'documentation', 'documentation', 'getinfos', 0, '', 1, NULL, NULL),
(176, 'documentation', 'documentation', 'getinfos', 0, '', 2, NULL, NULL),
(177, 'documentation', 'documentation', 'index', 0, '', 1, NULL, NULL),
(178, 'documentation', 'documentation', 'index', 0, '', 2, NULL, NULL),
(179, 'documentation', 'documentation', 'login', 0, '', 1, NULL, NULL),
(180, 'documentation', 'documentation', 'login', 0, '', 2, NULL, NULL),
(181, 'documentation', 'documentation', 'loginview', 0, '', 1, NULL, NULL),
(182, 'documentation', 'documentation', 'loginview', 0, '', 2, NULL, NULL),
(183, 'documentation', 'documentation', 'regeneratedoc', 0, '', 2, NULL, NULL),
(184, 'documentation', 'documentation', 'updatesettings', 0, '', 1, NULL, NULL),
(185, 'documentation', 'documentation', 'updatesettings', 0, '', 2, NULL, NULL),
(186, 'documentation', 'documentation', 'regeneratedoc', 0, '', 1, NULL, NULL),
(496, 'application', 'account', 'count', 1, '', 1, NULL, NULL),
(497, 'application', 'account', 'count', 0, '', 2, NULL, NULL),
(501, 'application', 'account', 'create', 1, '', 1, NULL, NULL),
(504, 'application', 'account', 'create', 0, '', 2, NULL, NULL),
(506, 'application', 'account', 'delete', 1, '', 1, NULL, NULL),
(507, 'application', 'account', 'delete', 0, '', 2, NULL, NULL),
(511, 'application', 'account', 'find', 1, '', 1, NULL, NULL),
(512, 'application', 'account', 'find', 0, '', 2, NULL, NULL),
(516, 'application', 'account', 'findone', 1, '', 1, NULL, NULL),
(517, 'application', 'account', 'findone', 0, '', 2, NULL, NULL),
(521, 'application', 'account', 'update', 1, '', 1, NULL, NULL),
(522, 'application', 'account', 'update', 0, '', 2, NULL, NULL),
(526, 'users-permissions', 'user', 'updateme', 1, '', 1, NULL, NULL),
(527, 'users-permissions', 'user', 'updateme', 0, '', 2, NULL, NULL),
(528, 'application', 'list', 'count', 1, '', 1, NULL, NULL),
(529, 'application', 'list', 'count', 0, '', 2, NULL, NULL),
(530, 'application', 'list', 'create', 1, '', 1, NULL, NULL),
(531, 'application', 'list', 'create', 0, '', 2, NULL, NULL),
(532, 'application', 'list', 'delete', 1, '', 1, NULL, NULL),
(533, 'application', 'list', 'delete', 0, '', 2, NULL, NULL),
(534, 'application', 'list', 'find', 1, '', 1, NULL, NULL),
(535, 'application', 'list', 'find', 0, '', 2, NULL, NULL),
(536, 'application', 'list', 'findone', 1, '', 1, NULL, NULL),
(537, 'application', 'list', 'findone', 0, '', 2, NULL, NULL),
(538, 'application', 'list', 'update', 1, '', 1, NULL, NULL),
(539, 'application', 'list', 'update', 0, '', 2, NULL, NULL),
(552, 'application', 'debit', 'count', 1, '', 1, NULL, NULL),
(553, 'application', 'debit', 'count', 0, '', 2, NULL, NULL),
(554, 'application', 'debit', 'create', 1, '', 1, NULL, NULL),
(555, 'application', 'debit', 'create', 0, '', 2, NULL, NULL),
(556, 'application', 'debit', 'delete', 1, '', 1, NULL, NULL),
(557, 'application', 'debit', 'delete', 0, '', 2, NULL, NULL),
(558, 'application', 'debit', 'find', 1, '', 1, NULL, NULL),
(559, 'application', 'debit', 'find', 0, '', 2, NULL, NULL),
(560, 'application', 'debit', 'findone', 1, '', 1, NULL, NULL),
(561, 'application', 'debit', 'findone', 0, '', 2, NULL, NULL),
(562, 'application', 'debit', 'update', 1, '', 1, NULL, NULL),
(563, 'application', 'debit', 'update', 0, '', 2, NULL, NULL),
(564, 'application', 'credit', 'count', 1, '', 1, NULL, NULL),
(565, 'application', 'credit', 'count', 0, '', 2, NULL, NULL),
(566, 'application', 'credit', 'create', 1, '', 1, NULL, NULL),
(567, 'application', 'credit', 'create', 0, '', 2, NULL, NULL),
(568, 'application', 'credit', 'delete', 1, '', 1, NULL, NULL),
(569, 'application', 'credit', 'delete', 0, '', 2, NULL, NULL),
(570, 'application', 'credit', 'find', 1, '', 1, NULL, NULL),
(571, 'application', 'credit', 'find', 0, '', 2, NULL, NULL),
(572, 'application', 'credit', 'findone', 1, '', 1, NULL, NULL),
(573, 'application', 'credit', 'findone', 0, '', 2, NULL, NULL),
(574, 'application', 'credit', 'update', 1, '', 1, NULL, NULL),
(575, 'application', 'credit', 'update', 0, '', 2, NULL, NULL),
(576, 'application', 'account', 'countown', 1, '', 1, NULL, NULL),
(577, 'application', 'account', 'countown', 0, '', 2, NULL, NULL),
(578, 'application', 'item', 'count', 1, '', 1, NULL, NULL),
(579, 'application', 'item', 'count', 0, '', 2, NULL, NULL),
(580, 'application', 'item', 'create', 1, '', 1, NULL, NULL),
(581, 'application', 'item', 'create', 0, '', 2, NULL, NULL),
(582, 'application', 'item', 'delete', 1, '', 1, NULL, NULL),
(583, 'application', 'item', 'delete', 0, '', 2, NULL, NULL),
(584, 'application', 'item', 'find', 1, '', 1, NULL, NULL),
(585, 'application', 'item', 'find', 0, '', 2, NULL, NULL),
(586, 'application', 'item', 'findone', 1, '', 1, NULL, NULL),
(587, 'application', 'item', 'findone', 0, '', 2, NULL, NULL),
(588, 'application', 'item', 'update', 1, '', 1, NULL, NULL),
(589, 'application', 'item', 'update', 0, '', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
CREATE TABLE IF NOT EXISTS `users-permissions_role` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_role_type_unique` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users-permissions_role`
--

INSERT INTO `users-permissions_role` (`id`, `name`, `description`, `type`, `created_by`, `updated_by`) VALUES
(1, 'Authenticated', 'Roles for the authenticated user', 'authenticated', NULL, NULL),
(2, 'Public', 'Default role given to unauthenticated user.', 'public', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
CREATE TABLE IF NOT EXISTS `users-permissions_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmationToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mobile_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users-permissions_user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users-permissions_user`
--

INSERT INTO `users-permissions_user` (`id`, `username`, `email`, `provider`, `password`, `resetPasswordToken`, `confirmationToken`, `confirmed`, `blocked`, `role`, `created_by`, `updated_by`, `created_at`, `updated_at`, `mobile_number`, `name`) VALUES
(5, 'sayeem', 'say33m@gmail.com', 'local', '$2a$10$BYAojOWpkT/YgvI7H6SHmeoaQ3YRjt2dhiNoVA9ARvR9ChTyVgNUe', NULL, NULL, 1, 0, 1, 1, 1, '2021-07-17 01:13:57', '2021-07-17 08:12:31', '01670939430', NULL),
(6, 'tasu', 'santa.tashrifa@gmail.com', 'local', '$2a$10$qtYEUz2ontJQaJ4rmdDr5u1NfluDGvrlPrSZAPs1/NFExhjbcEk3K', NULL, NULL, 1, 0, 1, 1, 1, '2021-07-17 05:01:05', '2021-07-17 08:21:02', '01670939430', NULL),
(7, 'roomoni', 'roomoni@gmail.com', 'local', '$2a$10$DFuzZAjQM.CXnKD0f74V1uyzvL1b01YmkJ8/g.RbKiZrDhnUe4hnm', NULL, NULL, 1, 0, 1, 1, 1, '2021-07-17 08:59:07', '2021-07-18 08:19:52', '01670939430', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
