-- MySQL dump 10.11
--
-- Host: localhost    Database: i18n_test_development
-- ------------------------------------------------------
-- Server version	5.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `i18n_db_locales`
--

DROP TABLE IF EXISTS `i18n_db_locales`;
CREATE TABLE `i18n_db_locales` (
  `id` int(11) NOT NULL auto_increment,
  `iso` varchar(255) default NULL,
  `short` varchar(255) default NULL,
  `main` int(11) default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_i18n_db_locales_on_iso` (`iso`),
  KEY `index_i18n_db_locales_on_short` (`short`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i18n_db_locales`
--

LOCK TABLES `i18n_db_locales` WRITE;
/*!40000 ALTER TABLE `i18n_db_locales` DISABLE KEYS */;
INSERT INTO `i18n_db_locales` VALUES (1,'en-US','en',1,'2009-02-06 21:37:12'),(2,'fr-FR','fr',0,'2009-02-06 21:38:05');
/*!40000 ALTER TABLE `i18n_db_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_db_translations`
--

DROP TABLE IF EXISTS `i18n_db_translations`;
CREATE TABLE `i18n_db_translations` (
  `id` int(11) NOT NULL auto_increment,
  `tr_key` varchar(255) default NULL,
  `locale_id` int(11) default NULL,
  `text` text,
  `namespace` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_i18n_db_translations_on_tr_key_and_locale_id` (`tr_key`,`locale_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1608 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `i18n_db_translations`
--

LOCK TABLES `i18n_db_translations` WRITE;
/*!40000 ALTER TABLE `i18n_db_translations` DISABLE KEYS */;
INSERT INTO `i18n_db_translations` VALUES (1,'hello',1,'Hi there!',NULL,NULL,'2009-02-06 21:05:30'),(2,'foo',1,'Hello from 2 namespaces deep!','bar.qux',NULL,'2009-02-06 21:28:46'),(588,'full_graph',1,'Full Graph','app.history.tab_links',NULL,NULL),(589,'compare_resorts_years',1,'Compare Resorts/Years','app.history.tab_links',NULL,NULL),(590,'hindcasts',1,'Hindcasts','app.history.tab_links',NULL,NULL),(591,'reports',1,'Reports','app.history.tab_links',NULL,NULL),(592,'n_years_graph',1,'{{n}} Years Graph','app.history.tab_links',NULL,NULL),(822,'choose_day',1,'Choose day','app.hindcasts.dates',NULL,NULL),(823,'periods_a_through_b',1,'periods {{a}} through {{b}}','app.hindcasts.show',NULL,NULL),(824,'prev',1,'Prev','app.hindcasts.show',NULL,NULL),(825,'weather_hindcast',1,'Weather Hindcast','app.hindcasts.show',NULL,NULL),(826,'altitude',1,'altitude','app.hindcasts.show',NULL,NULL),(827,'title',1,'{{resort_name}} Hindcast for {{alt}} {{heightunits}}','app.hindcasts.show',NULL,'2009-02-06 21:05:52'),(828,'select_dates_to_view_weather_archives',1,'Select dates to view weather archives','app.hindcasts.show',NULL,NULL),(829,'meta_keywords',1,'{{resort_name}}, hindcast, historical, archive','app.hindcasts.show',NULL,NULL),(830,'meta_descr',1,'{{resort_name}} Hindcast for {{alt}} {{heightunits}}','app.hindcasts.show',NULL,'2009-02-06 21:05:56'),(831,'next',1,'Next','app.hindcasts.show',NULL,NULL),(832,'for',1,'for','app.hindcasts.show',NULL,NULL),(928,'forecast_location',1,'Forecast locations','app.countries.index',NULL,NULL),(929,'country',1,'Country','app.countries.index',NULL,NULL),(930,'forecasts_by_countries',1,'Mountain/snow forecasts by countries','app.countries.index',NULL,NULL),(1019,'are_you_sure',1,'Are you sure?','app.favourites.index',NULL,NULL),(1020,'delete',1,'Delete','app.favourites.index',NULL,NULL),(1021,'title',1,'Title','app.favourites.index',NULL,NULL),(1022,'favourite_pages',1,'Favourite pages','app.favourites.index',NULL,NULL),(1023,'url',1,'URL','app.favourites.index',NULL,NULL),(1140,'full_graph',2,'Graphe complet','app.history.tab_links',NULL,NULL),(1141,'compare_resorts_years',2,'Comparer les stations/ans','app.history.tab_links',NULL,NULL),(1142,'hindcasts',2,'Hindcasts','app.history.tab_links',NULL,NULL),(1143,'reports',2,'Rapports','app.history.tab_links',NULL,NULL),(1144,'n_years_graph',2,'Graphe de {{n}} asdfasdfsdf','app.history.tab_links',NULL,NULL),(1374,'choose_day',2,'Choisir une journée','app.hindcasts.dates',NULL,NULL),(1375,'periods_a_through_b',2,'Périods {{a}} à {{b}} adfasdf sdfadfasdf','app.hindcasts.show',NULL,NULL),(1376,'prev',2,'Précédent','app.hindcasts.show',NULL,NULL),(1377,'weather_hindcast',2,'Weather Hindcast','app.hindcasts.show',NULL,NULL),(1378,'altitude',2,'Altitude','app.hindcasts.show',NULL,NULL),(1379,'title',2,'{{resort_name}} Hindcast for {{alt}} {{heightunits}} (c) Snow-Forecast.com','app.hindcasts.show',NULL,NULL),(1380,'select_dates_to_view_weather_archives',2,'Select dates to view weather archives','app.hindcasts.show',NULL,NULL),(1381,'meta_keywords',2,'{{resort_name}}, hindcast, historical, archive','app.hindcasts.show',NULL,NULL),(1382,'meta_descr',2,'{{resort_name}} Hindcast for {{alt}} {{heightunits}} (c) Snow-Forecast.com','app.hindcasts.show',NULL,NULL),(1383,'next',2,'Suivant','app.hindcasts.show',NULL,NULL),(1384,'for',2,'pour','app.hindcasts.show',NULL,'2009-02-06 21:11:06'),(1479,'forecast_location',2,'Emplacement des prévisions','app.countries.index',NULL,'2009-02-06 21:10:24'),(1480,'country',2,'Pays','app.countries.index',NULL,'2009-02-06 21:10:36'),(1481,'forecasts_by_countries',2,'Bulletin neige/montagne par pays','app.countries.index',NULL,NULL),(1565,'are_you_sure',2,'Etes-vous sûr?','app.favourites.index',NULL,NULL),(1566,'delete',2,'Supprimer','app.favourites.index',NULL,NULL),(1567,'title',2,'Titre','app.favourites.index',NULL,NULL),(1568,'favourite_pages',2,'Pages favourites','app.favourites.index',NULL,NULL),(1569,'url',2,'URL','app.favourites.index',NULL,'2009-02-06 21:10:44'),(1589,'hello',2,'Salut!',NULL,NULL,'2009-02-06 21:10:13'),(1599,'forecasts_by_countries_nonex',2,NULL,'app.countries.index',NULL,NULL),(1600,'forecasts_by_countries_nonex',1,NULL,'app.countries.index',NULL,NULL),(1601,'foo',2,NULL,'bar.qux','2009-02-06 21:27:01','2009-02-06 21:27:01'),(1602,'randomstr',2,NULL,'bar.qux','2009-02-06 21:27:01','2009-02-06 21:27:01'),(1603,'randomstr',1,NULL,'bar.qux','2009-02-06 21:27:01','2009-02-06 21:27:01'),(1604,'terms',2,NULL,'app.layout','2009-02-06 21:27:01','2009-02-06 21:27:01'),(1605,'terms',1,'Terms and Conditions','app.layout','2009-02-06 21:27:01','2009-02-06 21:28:12'),(1606,'book_holiday',2,'RESERVEZ VOTRE SÉJOUR DE SPORTS D\'HIVER','app.pages.index','2009-02-06 21:27:01','2009-02-06 21:37:54'),(1607,'book_holiday',1,'BOOK YOUR SKI HOLIDAY','app.pages.index','2009-02-06 21:27:01','2009-02-06 21:37:01');
/*!40000 ALTER TABLE `i18n_db_translations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2009-02-06 21:44:54
