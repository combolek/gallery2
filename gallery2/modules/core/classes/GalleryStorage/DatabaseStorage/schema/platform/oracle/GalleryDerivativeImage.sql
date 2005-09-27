CREATE TABLE DB_TABLE_PREFIXDerivativeImage(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXwidth INTEGER,
 DB_COLUMN_PREFIXheight INTEGER
);

ALTER TABLE DB_TABLE_PREFIXDerivativeImage
 ADD PRIMARY KEY (DB_COLUMN_PREFIXid)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('DerivativeImage', 1, 0);


