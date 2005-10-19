## mysql
# ExifPropertiesMap
CREATE TABLE DB_TABLE_PREFIXExifPropertiesMap(
 DB_COLUMN_PREFIXproperty varchar(128),
 DB_COLUMN_PREFIXviewMode int(11),
 DB_COLUMN_PREFIXsequence int(11),
 UNIQUE KEY(DB_COLUMN_PREFIXproperty, DB_COLUMN_PREFIXviewMode)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ExifPropertiesMap', 1, 0);

## postgres
# ExifPropertiesMap
CREATE TABLE DB_TABLE_PREFIXExifPropertiesMap(
 DB_COLUMN_PREFIXproperty VARCHAR(128),
 DB_COLUMN_PREFIXviewMode INTEGER,
 DB_COLUMN_PREFIXsequence INTEGER
);

CREATE UNIQUE INDEX DB_TABLE_PREFIXExifPropertiesMap_78674 ON DB_TABLE_PREFIXExifPropertiesMap(DB_COLUMN_PREFIXproperty, DB_COLUMN_PREFIXviewMode);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ExifPropertiesMap', 1, 0);

## oracle
# ExifPropertiesMap
CREATE TABLE DB_TABLE_PREFIXExifPropertiesMap(
 DB_COLUMN_PREFIXproperty VARCHAR2(128),
 DB_COLUMN_PREFIXviewMode INTEGER,
 DB_COLUMN_PREFIXsequence INTEGER
);

ALTER TABLE DB_TABLE_PREFIXExifPropertiesMap
 ADD UNIQUE (DB_COLUMN_PREFIXproperty, DB_COLUMN_PREFIXviewMode)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ExifPropertiesMap', 1, 0);

## db2
# ExifPropertiesMap
CREATE TABLE DB_TABLE_PREFIXExifPropertiesMap(
 DB_COLUMN_PREFIXproperty VARCHAR(128),
 DB_COLUMN_PREFIXviewMode INTEGER,
 DB_COLUMN_PREFIXsequence INTEGER
);

CREATE UNIQUE INDEX DB_TABLE_PREFIXExifP29_78674  
 ON DB_TABLE_PREFIXExifPropertiesMap(DB_COLUMN_PREFIXproperty, DB_COLUMN_PREFIXviewMode);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ExifPropertiesMap', 1, 0);

