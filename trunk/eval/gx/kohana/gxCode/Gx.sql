-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.67-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema gx
--

CREATE DATABASE IF NOT EXISTS gx_eval_kohana;
USE gx_eval_kohana;

--
-- Definition of table `g2_items`
--

DROP TABLE IF EXISTS `g2_items`;
CREATE TABLE `g2_items` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(45) NOT NULL,
  `Path` varchar(45) NOT NULL,
  `HasChildren` tinyint(1) NOT NULL default '0',
  `Parent` int(10) unsigned default NULL,
  `isAlbum` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `g2_items`
--

/*!40000 ALTER TABLE `g2_items` DISABLE KEYS */;
INSERT INTO `g2_items` (`Id`,`Name`,`Path`,`HasChildren`,`Parent`,`isAlbum`) VALUES 
 (1,'Christmas 2007','images',1,NULL,1),
 (2,'A009494','A009494.jpg',0,1,0),
 (3,'A009732','A009732.jpg',0,1,0),
 (4,'A010662','A010662.jpg',0,1,0),
 (5,'A010735','A010735.jpg',0,1,0);
/*!40000 ALTER TABLE `g2_items` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
