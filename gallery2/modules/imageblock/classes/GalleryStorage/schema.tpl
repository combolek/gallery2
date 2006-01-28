## mysql
# A_ImageBlockCacheMap_1.0
ALTER TABLE DB_TABLE_PREFIXImageBlockCacheMap
  DROP INDEX DB_COLUMN_PREFIXuserId,
  ADD INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ImageBlockCacheMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ImageBlockCacheMap
CREATE TABLE DB_TABLE_PREFIXImageBlockCacheMap(
 DB_COLUMN_PREFIXuserId int(11) NOT NULL,
 DB_COLUMN_PREFIXitemType int(11) NOT NULL,
 DB_COLUMN_PREFIXitemTimestamp int(11) NOT NULL,
 DB_COLUMN_PREFIXitemId int(11) NOT NULL,
 INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockCacheMap', 1, 1);

# ImageBlockDisabledMap
CREATE TABLE DB_TABLE_PREFIXImageBlockDisabledMap(
 DB_COLUMN_PREFIXitemId int(11) NOT NULL,
 PRIMARY KEY(DB_COLUMN_PREFIXitemId)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockDisabledMap', 1, 0);

## postgres
# A_ImageBlockCacheMap_1.0
DROP INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627;

CREATE INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627 ON DB_TABLE_PREFIXImageBlockCacheMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ImageBlockCacheMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ImageBlockCacheMap
CREATE TABLE DB_TABLE_PREFIXImageBlockCacheMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemType INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemTimestamp INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627 ON DB_TABLE_PREFIXImageBlockCacheMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockCacheMap', 1, 1);

# ImageBlockDisabledMap
CREATE TABLE DB_TABLE_PREFIXImageBlockDisabledMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXImageBlockDisabledMap ADD PRIMARY KEY (DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockDisabledMap', 1, 0);

## oracle
# A_ImageBlockCacheMap_1.0
  DROP INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627;

CREATE INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627 ON DB_TABLE_PREFIXImageBlockCacheMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ImageBlockCacheMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ImageBlockCacheMap
CREATE TABLE DB_TABLE_PREFIXImageBlockCacheMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemType INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemTimestamp INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627
   ON DB_TABLE_PREFIXImageBlockCacheMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockCacheMap', 1, 1);

# ImageBlockDisabledMap
CREATE TABLE DB_TABLE_PREFIXImageBlockDisabledMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXImageBlockDisabledMap
 ADD PRIMARY KEY (DB_COLUMN_PREFIXitemId)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockDisabledMap', 1, 0);

## db2
# A_ImageBlockCacheMap_1.0
DROP INDEX DB_TABLE_PREFIXImage6d_1627;

CREATE INDEX DB_TABLE_PREFIXImage6d_1627 ON DB_TABLE_PREFIXImageBlockCacheMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ImageBlockCacheMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ImageBlockCacheMap
CREATE TABLE DB_TABLE_PREFIXImageBlockCacheMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemType INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemTimestamp INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXImage05_1627
   ON DB_TABLE_PREFIXImageBlockCacheMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemType);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockCacheMap', 1, 1);

# ImageBlockDisabledMap
CREATE TABLE DB_TABLE_PREFIXImageBlockDisabledMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXImageBlockDisabledMap ADD PRIMARY KEY (DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockDisabledMap', 1, 0);

