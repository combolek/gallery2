## mysql
# A_CustomFieldMap_1_0
ALTER TABLE DB_TABLE_PREFIXCustomFieldMap
  DROP INDEX DB_COLUMN_PREFIXitemId,
  ADD INDEX DB_TABLE_PREFIXCustomFieldMap_75985(DB_COLUMN_PREFIXitemId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='CustomFieldMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# CustomFieldMap
CREATE TABLE DB_TABLE_PREFIXCustomFieldMap(
 DB_COLUMN_PREFIXitemId int(11) NOT NULL,
 DB_COLUMN_PREFIXfield varchar(128) NOT NULL,
 DB_COLUMN_PREFIXvalue varchar(255),
 DB_COLUMN_PREFIXsetId int(11),
 DB_COLUMN_PREFIXsetType int(11),
 INDEX DB_TABLE_PREFIXCustomFieldMap_75985(DB_COLUMN_PREFIXitemId)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('CustomFieldMap', 1, 1);

## postgres
# A_CustomFieldMap_1_0
DROP INDEX DB_TABLE_PREFIXCustomFieldMap_75985;

CREATE INDEX DB_TABLE_PREFIXCustomFieldMap_75985 ON DB_TABLE_PREFIXCustomFieldMap(DB_COLUMN_PREFIXitemId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='CustomFieldMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# CustomFieldMap
CREATE TABLE DB_TABLE_PREFIXCustomFieldMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXfield VARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXvalue VARCHAR(255),
 DB_COLUMN_PREFIXsetId INTEGER,
 DB_COLUMN_PREFIXsetType INTEGER
);

CREATE INDEX DB_TABLE_PREFIXCustomFieldMap_75985 ON DB_TABLE_PREFIXCustomFieldMap(DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('CustomFieldMap', 1, 1);

## oracle
# A_CustomFieldMap_1_0
DROP INDEX DB_TABLE_PREFIXCustomFieldMap_75985;

CREATE INDEX DB_TABLE_PREFIXCustomFieldMap_75985 ON DB_TABLE_PREFIXCustomFieldMap(DB_COLUMN_PREFIXitemId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='CustomFieldMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# CustomFieldMap
CREATE TABLE DB_TABLE_PREFIXCustomFieldMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXfield VARCHAR2(128) NOT NULL,
 DB_COLUMN_PREFIXvalue VARCHAR2(255),
 DB_COLUMN_PREFIXsetId INTEGER,
 DB_COLUMN_PREFIXsetType INTEGER
);

CREATE INDEX DB_TABLE_PREFIXCustomFieldMap_75985
   ON DB_TABLE_PREFIXCustomFieldMap(DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('CustomFieldMap', 1, 1);

