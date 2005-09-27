CREATE TABLE DB_TABLE_PREFIXPermissionSetMap(
 DB_COLUMN_PREFIXmodule VARCHAR2(128) NOT NULL,
 DB_COLUMN_PREFIXpermission VARCHAR2(128) NOT NULL,
 DB_COLUMN_PREFIXdescription VARCHAR2(255),
 DB_COLUMN_PREFIXbits BIT(32) NOT NULL,
 DB_COLUMN_PREFIXflags INTEGER NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXPermissionSetMap
 ADD UNIQUE (DB_COLUMN_PREFIXpermission)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PermissionSetMap', 1, 0);


