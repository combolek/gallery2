## mysql
# A_ThumbnailImage_1.0
UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ThumbnailImage' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ThumbnailImage
CREATE TABLE DB_TABLE_PREFIXThumbnailImage(
 DB_COLUMN_PREFIXid int(11) NOT NULL,
 DB_COLUMN_PREFIXfileName varchar(128) NOT NULL,
 DB_COLUMN_PREFIXmimeType varchar(128),
 DB_COLUMN_PREFIXsize int(11),
 DB_COLUMN_PREFIXwidth int(11),
 DB_COLUMN_PREFIXheight int(11),
 DB_COLUMN_PREFIXitemMimeTypes varchar(128),
 PRIMARY KEY(DB_COLUMN_PREFIXid),
 UNIQUE KEY(DB_COLUMN_PREFIXfileName)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ThumbnailImage', 1, 1);

## postgres
# A_ThumbnailImage_1.0
UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ThumbnailImage' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ThumbnailImage
CREATE TABLE DB_TABLE_PREFIXThumbnailImage(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXfileName VARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXmimeType VARCHAR(128),
 DB_COLUMN_PREFIXsize INTEGER,
 DB_COLUMN_PREFIXwidth INTEGER,
 DB_COLUMN_PREFIXheight INTEGER,
 DB_COLUMN_PREFIXitemMimeTypes VARCHAR(128)
);

ALTER TABLE DB_TABLE_PREFIXThumbnailImage ADD PRIMARY KEY (DB_COLUMN_PREFIXid);

CREATE UNIQUE INDEX DB_TABLE_PREFIXThumbnailImage_99259 ON DB_TABLE_PREFIXThumbnailImage(DB_COLUMN_PREFIXfileName);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ThumbnailImage', 1, 1);

## oracle
# A_ThumbnailImage_1.0
UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='ThumbnailImage' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

# ThumbnailImage
CREATE TABLE DB_TABLE_PREFIXThumbnailImage(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXfileName VARCHAR2(128) NOT NULL,
 DB_COLUMN_PREFIXmimeType VARCHAR2(128),
 DB_COLUMN_PREFIXsize INTEGER,
 DB_COLUMN_PREFIXwidth INTEGER,
 DB_COLUMN_PREFIXheight INTEGER,
 DB_COLUMN_PREFIXitemMimeTypes VARCHAR2(128)
);

ALTER TABLE DB_TABLE_PREFIXThumbnailImage
 ADD PRIMARY KEY (DB_COLUMN_PREFIXid)
 ADD UNIQUE (DB_COLUMN_PREFIXfileName)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('ThumbnailImage', 1, 1);

