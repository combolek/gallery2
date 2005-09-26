CREATE TABLE DB_TABLE_PREFIXG1MigrateMap(
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXg1album VARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXg1item VARCHAR(128)
);
ALTER TABLE DB_TABLE_PREFIXG1MigrateMap ADD PRIMARY KEY (DB_COLUMN_PREFIXitemId);
INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('G1MigrateMap', 1, 0);

