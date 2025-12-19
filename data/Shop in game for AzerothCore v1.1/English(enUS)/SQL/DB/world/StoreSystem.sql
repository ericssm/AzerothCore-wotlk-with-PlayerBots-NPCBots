/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 5.7.40-log : Database - store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `store`;

/*Table structure for table `store_categories` */

DROP TABLE IF EXISTS `store_categories`;

CREATE TABLE `store_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(765) DEFAULT NULL,
  `icon` text,
  `requiredRank` int(11) DEFAULT NULL,
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `store_categories` */

insert  into `store_categories`(`id`,`name`,`icon`,`requiredRank`,`flags`,`enabled`) values 
(1,'Destacados','inv_helmet_96',0,2,1),
(2,'Titulos','inv_scroll_11',0,1,1),
(3,'Items','ability_warrior_challange',0,1,1),
(4,'Monturas ','inv_box_petcarrier_01',0,1,1),
(5,'Boosts','spell_holy_surgeoflight',0,1,1),
(6,'Servicio','vas_charactertransfer',0,1,1),
(7,'Buffs','spell_holy_holynova',0,1,1),
(8,'Mascotas','inv_misc_toy_07',0,1,1),
(9,'VIP','inv_misc_note_03',0,1,1);

/*Table structure for table `store_category_service_link` */

DROP TABLE IF EXISTS `store_category_service_link`;

CREATE TABLE `store_category_service_link` (
  `category` int(10) unsigned NOT NULL,
  `service` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category`,`service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `store_category_service_link` */

insert  into `store_category_service_link`(`category`,`service`) values 
(2,16),
(3,5),
(3,12),
(3,18),
(4,8),
(4,13),
(5,1),
(5,14),
(5,17),
(6,2),
(6,3),
(6,4),
(7,15);

/*Table structure for table `store_currencies` */

DROP TABLE IF EXISTS `store_currencies`;

CREATE TABLE `store_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(50) NOT NULL DEFAULT '',
  `data` int(11) NOT NULL DEFAULT '0',
  `tooltip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `store_currencies` */

insert  into `store_currencies`(`id`,`type`,`name`,`icon`,`data`,`tooltip`) values 
(1,1,'Oro','Gold',0,'Esto es oro normal.'),
(2,2,'Item Token','Token',4540,'Esta es una moneda de artículo.');

/*Table structure for table `store_logs` */

DROP TABLE IF EXISTS `store_logs`;

CREATE TABLE `store_logs` (
  `account` int(11) DEFAULT NULL,
  `guid` int(11) DEFAULT NULL,
  `serviceId` int(11) DEFAULT NULL,
  `currencyId` int(11) DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `store_logs` */

insert  into `store_logs`(`account`,`guid`,`serviceId`,`currencyId`,`cost`,`time`) values 
(1,1,12,1,10,'2023-04-07 03:03:06'),
(1,1,12,1,5,'2023-04-07 03:04:23'),
(1,1,13,1,10,'2023-04-07 03:20:42'),
(1,1,8,1,30,'2023-04-07 03:25:36'),
(1,1,12,2,5,'2023-04-07 20:04:22'),
(1,1,12,2,5,'2023-04-07 20:07:47'),
(1,1,12,2,5,'2023-04-07 20:07:50'),
(1,1,12,2,5,'2023-04-07 20:10:04'),
(1,1,12,2,5,'2023-04-07 20:21:48'),
(1,1,12,2,5,'2023-04-07 20:22:01'),
(1,1,12,2,5,'2023-04-07 20:22:38'),
(1,1,12,2,5,'2023-04-07 20:23:45'),
(1,1,12,2,5,'2023-04-07 20:26:19'),
(1,1,13,1,10,'2023-04-08 01:14:35'),
(1,1,1,1,10,'2023-04-08 01:22:52'),
(1,1,1,1,10,'2023-04-08 01:24:07'),
(1,1,1,1,10,'2023-04-08 01:25:51'),
(1,1,4,1,5,'2023-04-08 01:35:36'),
(1,1,16,1,10,'2023-04-08 01:41:41'),
(1,1,16,1,10,'2023-04-08 01:44:49'),
(1,1,5,1,10,'2023-04-08 04:45:17'),
(1,1,1,1,10,'2023-04-08 19:50:20'),
(1,1,1,1,10,'2023-04-08 19:51:13'),
(1,1,12,1,5,'2023-04-08 19:52:20'),
(1,1,12,1,5,'2023-04-08 19:55:03'),
(1,1,12,1,5,'2023-04-08 22:23:33'),
(1,1,12,1,5,'2023-04-08 23:19:16'),
(1,1,1,1,10,'2023-04-09 02:02:07'),
(1,1,1,2,10,'2023-04-09 02:06:11'),
(1,1,5,1,10,'2023-04-09 02:34:41'),
(1,1,15,1,1,'2023-04-09 03:01:37'),
(1,1,18,1,50,'2023-04-09 03:29:32'),
(2,5,15,1,1,'2025-03-20 19:17:27'),
(2,5,2,1,5,'2025-03-20 19:17:42'),
(2,5,13,1,10,'2025-03-20 19:19:35'),
(2,5,8,1,30,'2025-03-20 19:19:39');

/*Table structure for table `store_services` */

DROP TABLE IF EXISTS `store_services`;

CREATE TABLE `store_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned DEFAULT NULL,
  `name` text,
  `tooltipName` text,
  `tooltipType` varchar(765) DEFAULT NULL,
  `tooltipText` text,
  `icon` varchar(765) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `hyperlinkId` int(11) DEFAULT NULL,
  `creatureEntry` int(11) DEFAULT NULL,
  `discountAmount` int(11) DEFAULT NULL,
  `flags` int(11) DEFAULT NULL,
  `reward_1` int(10) unsigned DEFAULT NULL,
  `reward_2` int(10) unsigned DEFAULT NULL,
  `reward_3` int(10) unsigned DEFAULT NULL,
  `reward_4` int(10) unsigned DEFAULT NULL,
  `reward_5` int(10) unsigned DEFAULT NULL,
  `reward_6` int(10) unsigned DEFAULT NULL,
  `reward_7` int(10) unsigned DEFAULT NULL,
  `reward_8` int(10) unsigned DEFAULT NULL,
  `rewardcount_1` int(10) unsigned DEFAULT NULL,
  `rewardcount_2` int(10) unsigned DEFAULT NULL,
  `rewardcount_3` int(10) unsigned DEFAULT NULL,
  `rewardcount_4` int(10) unsigned DEFAULT NULL,
  `rewardcount_5` int(10) unsigned DEFAULT NULL,
  `rewardcount_6` int(10) unsigned DEFAULT NULL,
  `rewardcount_7` int(10) unsigned DEFAULT NULL,
  `rewardcount_8` int(10) unsigned DEFAULT NULL,
  `new` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

/*Data for the table `store_services` */
-- Dumping data for table store.store_services: ~13 rows (approximately)
INSERT INTO `store_services` (`id`, `type`, `name`, `tooltipName`, `tooltipType`, `tooltipText`, `icon`, `price`, `currency`, `hyperlinkId`, `creatureEntry`, `discountAmount`, `flags`, `reward_1`, `reward_2`, `reward_3`, `reward_4`, `reward_5`, `reward_6`, `reward_7`, `reward_8`, `rewardcount_1`, `rewardcount_2`, `rewardcount_3`, `rewardcount_4`, `rewardcount_5`, `rewardcount_6`, `rewardcount_7`, `rewardcount_8`, `new`, `enabled`) VALUES
	(1,8,'Aumento de nivel\r\n+10 niveles','Level Boost','','Aumenta el nivel de tus personajes en 10.','achievement_level_10',10,1,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(2,7,'Cambio de Faccion','Faction Change','','Te permite cambiar la facción de tus personajes. Disponible tras reiniciar sesión.','vas_factionchange',5,1,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(3,7,'Cambio de Raza','Race Change','','Te permite cambiar la raza de tus personajes. Disponible tras reiniciar sesión.','vas_racechange',10,1,0,0,5,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(4,7,'Cambio de Nombre','Name Change','','Te permite cambiar el nombre de tu personaje. Disponible después de reiniciar sesión.','vas_namechange',5,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(5,1,'Espada de espuma\r\n(Espada de dos manos)','','item','|cff00FFFFHaga clic para obtener una vista previa!|r','inv_sword_22',10,1,45061,45061,0,1,45061,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1),
	(8,3,'Tigre Espectral Veloz\r\n(Montura)','','spell','|cff00FFFFHaga clic para obtener una vista previa!|r','ability_mount_spectraltiger',30,1,42777,24004,0,0,42777,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
	(12,1,'Camisa Morada Épica\r\n(Camiseta)','','item','|cff00FFFFHaga clic para obtener una vista previa!|r','inv_shirt_purple_01',10,1,45037,45037,5,1,45037,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1),
	(13,4,'Gallina de las praderas\r\n(Mascota)','','spell','|cff00FFFFHaga clic para obtener una vista previa!|r','spell_magic_polymorphchicken',10,1,10686,7392,0,0,10686,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(14,8,'Aumento de nivel\r\n+20 niveles','Level Boost','','Aumenta el nivel de tus personajes en 20.','achievement_level_20',20,1,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(15,5,'Bendición del Poder','Buff','','Te beneficia con Bendición de poder.','spell_holy_fistofjustice',1,1,0,0,0,0,27140,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(16,9,'Título\r\nCampeón de los Naaru','Title','','Te otorga el título de Campeón de los Naaru.','inv_mace_51',10,1,0,0,0,0,53,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
	(17,8,'Aumento de nivel 60','Level Boost','','¡Aumenta el nivel de tus personajes al nivel 60!','achievement_level_60',40,1,0,0,0,1,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(18,1,'Conjunto de esmoquin','Tuxedo Set','','¡Expresa tu estilo con este conjunto completo de esmoquin!\r\n\r\nContiene:\r\n\r\n1 chaqueta de esmoquin\r\n1 camisa de esmoquin\r\n1 pantalón de esmoquin','inv_shirt_black_01',50,1,0,0,0,1,10036,10035,10034,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
