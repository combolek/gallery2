## mysql
# GalleryLinkItem
CREATE TABLE DB_TABLE_PREFIXLinkItem(
 DB_COLUMN_PREFIXid int(11) NOT NULL,
 DB_COLUMN_PREFIXlink varchar(128) NOT NULL,
 PRIMARY KEY(DB_COLUMN_PREFIXid)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('LinkItem', 1, 0);

## postgres
# GalleryLinkItem
CREATE TABLE DB_TABLE_PREFIXLinkItem(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXlink VARCHAR(128) NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXLinkItem ADD PRIMARY KEY (DB_COLUMN_PREFIXid);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('LinkItem', 1, 0);

## oracle
# GalleryLinkItem
CREATE TABLE DB_TABLE_PREFIXLinkItem(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXlink VARCHAR2(128) NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXLinkItem
 ADD PRIMARY KEY (DB_COLUMN_PREFIXid)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('LinkItem', 1, 0);

## db2
# GalleryLinkItem
CREATE TABLE DB_TABLE_PREFIXLinkItem(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXlink VARCHAR(128) NOT NULL
);

ALTER TABLE DB_TABLE_PREFIXLinkItem ADD PRIMARY KEY (DB_COLUMN_PREFIXid);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('LinkItem', 1, 0);

