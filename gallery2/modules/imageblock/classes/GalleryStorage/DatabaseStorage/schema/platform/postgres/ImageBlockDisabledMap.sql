CREATE TABLE DB_TABLE_PREFIXImageBlockDisabledMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXImageBlockDisabledMap ADD PRIMARY KEY (DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ImageBlockDisabledMap', 1, 0);


