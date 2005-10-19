## mysql
# RewriteMap
CREATE TABLE DB_TABLE_PREFIXRewriteMap(
 DB_COLUMN_PREFIXpattern varchar(255) NOT NULL,
 DB_COLUMN_PREFIXmodule varchar(32) NOT NULL,
 DB_COLUMN_PREFIXruleId int(11) NOT NULL,
 DB_COLUMN_PREFIXmatch varchar(128),
 PRIMARY KEY(DB_COLUMN_PREFIXpattern)
) TYPE=DB_TABLE_TYPE;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('RewriteMap', 1, 0);

## postgres
# RewriteMap
CREATE TABLE DB_TABLE_PREFIXRewriteMap(
 DB_COLUMN_PREFIXpattern VARCHAR(255) NOT NULL,
 DB_COLUMN_PREFIXmodule VARCHAR(32) NOT NULL,
 DB_COLUMN_PREFIXruleId INTEGER NOT NULL,
 DB_COLUMN_PREFIXmatch VARCHAR(128)
);

ALTER TABLE DB_TABLE_PREFIXRewriteMap ADD PRIMARY KEY (DB_COLUMN_PREFIXpattern);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('RewriteMap', 1, 0);

## oracle
# RewriteMap
CREATE TABLE DB_TABLE_PREFIXRewriteMap(
 DB_COLUMN_PREFIXpattern VARCHAR2(255) NOT NULL,
 DB_COLUMN_PREFIXmodule VARCHAR2(32) NOT NULL,
 DB_COLUMN_PREFIXruleId INTEGER NOT NULL,
 DB_COLUMN_PREFIXmatch VARCHAR2(128)
);

ALTER TABLE DB_TABLE_PREFIXRewriteMap
 ADD PRIMARY KEY (DB_COLUMN_PREFIXpattern)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('RewriteMap', 1, 0);

## db2
# RewriteMap
CREATE TABLE DB_TABLE_PREFIXRewriteMap(
 DB_COLUMN_PREFIXpattern VARCHAR(255) NOT NULL,
 DB_COLUMN_PREFIXmodule VARCHAR(32) NOT NULL,
 DB_COLUMN_PREFIXruleId INTEGER NOT NULL,
 DB_COLUMN_PREFIXmatch VARCHAR(128)
);

ALTER TABLE DB_TABLE_PREFIXRewriteMap ADD PRIMARY KEY (DB_COLUMN_PREFIXpattern);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('RewriteMap', 1, 0);

