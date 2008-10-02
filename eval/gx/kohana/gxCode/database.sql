DROP TABLE IF EXISTS `gx`.`g2_items`;
CREATE TABLE  `gx`.`g2_items` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(45) NOT NULL,
  `Path` varchar(45) NOT NULL,
  `HasChildren` tinyint(1) NOT NULL default '0',
  `Parent` int(10) unsigned default NULL,
  `isAlbum` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;