## mysql
# A_QuotasMap_1.0
ALTER TABLE DB_TABLE_PREFIXQuotasMap
  DROP INDEX DB_TABLE_PREFIXQuotasMap_48775,
  MODIFY COLUMN DB_COLUMN_PREFIXuserOrGroupId int(11) NOT NULL,
  ADD PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='QuotasMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# QuotasMap
CREATE TABLE DB_TABLE_PREFIXQuotasMap(
 DB_COLUMN_PREFIXuserOrGroupId int(11) NOT NULL,
 DB_COLUMN_PREFIXquotaSize int(11) NOT NULL,
 PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId)
) TYPE=DB_TABLE_TYPE
/*!40100 DEFAULT CHARACTER SET utf8 */;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('QuotasMap', 1, 1);

## postgres
# A_QuotasMap_1.0
DROP INDEX DB_TABLE_PREFIXQuotasMap_48775;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD COLUMN DB_COLUMN_PREFIXuserOrGroupIdTemp INTEGER;

UPDATE DB_TABLE_PREFIXQuotasMap SET DB_COLUMN_PREFIXuserOrGroupIdTemp = CAST(DB_COLUMN_PREFIXuserOrGroupId AS INTEGER);

ALTER TABLE DB_TABLE_PREFIXQuotasMap DROP DB_COLUMN_PREFIXuserOrGroupId;

ALTER TABLE DB_TABLE_PREFIXQuotasMap RENAME DB_COLUMN_PREFIXuserOrGroupIdTemp to DB_COLUMN_PREFIXuserOrGroupId;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ALTER DB_COLUMN_PREFIXuserOrGroupId SET NOT NULL;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='QuotasMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# QuotasMap
CREATE TABLE DB_TABLE_PREFIXQuotasMap(
 DB_COLUMN_PREFIXuserOrGroupId INTEGER NOT NULL,
 DB_COLUMN_PREFIXquotaSize INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD PRIMARY KEY (DB_COLUMN_PREFIXuserOrGroupId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('QuotasMap', 1, 1);

## oracle
# A_QuotasMap_1.0
  DROP INDEX DB_TABLE_PREFIXQuotasMap_48775;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD (DB_COLUMN_PREFIXuserOrGroupIdTemp INTEGER);

UPDATE DB_TABLE_PREFIXQuotasMap SET DB_COLUMN_PREFIXuserOrGroupIdTemp = DB_COLUMN_PREFIXuserOrGroupId;

ALTER TABLE DB_TABLE_PREFIXQuotasMap DROP (DB_COLUMN_PREFIXuserOrGroupId);

ALTER TABLE DB_TABLE_PREFIXQuotasMap RENAME COLUMN DB_COLUMN_PREFIXuserOrGroupIdTemp TO DB_COLUMN_PREFIXuserOrGroupId;

ALTER TABLE DB_TABLE_PREFIXQuotasMap MODIFY (DB_COLUMN_PREFIXuserOrGroupId NOT NULL);

ALTER TABLE DB_TABLE_PREFIXQuotasMap
  ADD PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='QuotasMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# QuotasMap
CREATE TABLE DB_TABLE_PREFIXQuotasMap(
 DB_COLUMN_PREFIXuserOrGroupId INTEGER NOT NULL,
 DB_COLUMN_PREFIXquotaSize INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXQuotasMap
 ADD PRIMARY KEY (DB_COLUMN_PREFIXuserOrGroupId)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('QuotasMap', 1, 1);

## db2
# A_QuotasMap_1.0
DROP INDEX DB_TABLE_PREFIXQuota8c_48775;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD COLUMN DB_COLUMN_PREFIXuserOrGroupIdTemp INTEGER;

UPDATE DB_TABLE_PREFIXQuotasMap SET DB_COLUMN_PREFIXuserOrGroupIdTemp = CAST(DB_COLUMN_PREFIXuserOrGroupId AS INTEGER);

ALTER TABLE DB_TABLE_PREFIXQuotasMap DROP DB_COLUMN_PREFIXuserOrGroupId;

ALTER TABLE DB_TABLE_PREFIXQuotasMap RENAME DB_COLUMN_PREFIXuserOrGroupIdTemp to DB_COLUMN_PREFIXuserOrGroupId;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ALTER DB_COLUMN_PREFIXuserOrGroupId SET NOT NULL;

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='QuotasMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# QuotasMap
CREATE TABLE DB_TABLE_PREFIXQuotasMap(
 DB_COLUMN_PREFIXuserOrGroupId INTEGER NOT NULL,
 DB_COLUMN_PREFIXquotaSize INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXQuotasMap ADD PRIMARY KEY (DB_COLUMN_PREFIXuserOrGroupId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('QuotasMap', 1, 1);

