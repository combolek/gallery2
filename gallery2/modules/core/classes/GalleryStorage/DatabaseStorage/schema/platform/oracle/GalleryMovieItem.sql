CREATE TABLE DB_TABLE_PREFIXMovieItem(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXwidth INTEGER,
 DB_COLUMN_PREFIXheight INTEGER,
 DB_COLUMN_PREFIXduration INTEGER
);

ALTER TABLE DB_TABLE_PREFIXMovieItem
 ADD PRIMARY KEY (DB_COLUMN_PREFIXid)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('MovieItem', 1, 0);


