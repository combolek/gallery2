CREATE TABLE DB_TABLE_PREFIXDataItem(
 DB_COLUMN_PREFIXid int(11) NOT NULL,
 DB_COLUMN_PREFIXmimeType varchar(128),
 DB_COLUMN_PREFIXsize int(11),
 PRIMARY KEY(DB_COLUMN_PREFIXid)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('DataItem', 1, 0);


