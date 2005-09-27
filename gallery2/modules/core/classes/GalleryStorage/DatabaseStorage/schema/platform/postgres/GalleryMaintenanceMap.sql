CREATE TABLE DB_TABLE_PREFIXMaintenanceMap(
 DB_COLUMN_PREFIXrunId INTEGER NOT NULL,
 DB_COLUMN_PREFIXtaskId VARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXtimestamp INTEGER,
 DB_COLUMN_PREFIXsuccess SMALLINT,
 DB_COLUMN_PREFIXdetails text
);

CREATE INDEX DB_TABLE_PREFIXMaintenanceMap_21687 ON DB_TABLE_PREFIXMaintenanceMap(DB_COLUMN_PREFIXtaskId);

ALTER TABLE DB_TABLE_PREFIXMaintenanceMap ADD PRIMARY KEY (DB_COLUMN_PREFIXrunId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('MaintenanceMap', 1, 0);


