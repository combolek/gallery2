CREATE TABLE DB_TABLE_PREFIXQuotasMap(
 DB_COLUMN_PREFIXuserOrGroupId int(11) NOT NULL,
 DB_COLUMN_PREFIXquotaSize int(11) NOT NULL,
 PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId)
) TYPE=DB_TABLE_TYPE;
INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('QuotasMap', 1, 1);

