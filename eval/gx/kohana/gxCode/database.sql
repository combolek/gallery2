DROP TABLE IF EXISTS `gx_eval_kohana`.`g2_items`;
CREATE TABLE  `gx_eval_kohana`.`g2_items` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(45) NOT NULL,
  `Path` varchar(45) NOT NULL,
  `HasChildren` tinyint(1) NOT NULL default '0',
  `parent_id` int(10) unsigned default NULL,
  `isAlbum` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;