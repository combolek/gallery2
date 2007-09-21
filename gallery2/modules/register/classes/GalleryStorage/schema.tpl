## mysql
# GalleryPendingUser
CREATE TABLE DB_TABLE_PREFIXPendingUser(
 DB_COLUMN_PREFIXid int(11) NOT NULL,
 DB_COLUMN_PREFIXuserName varchar(32) NOT NULL,
 DB_COLUMN_PREFIXfullName varchar(128),
 DB_COLUMN_PREFIXhashedPassword varchar(128),
 DB_COLUMN_PREFIXemail varchar(128),
 DB_COLUMN_PREFIXlanguage varchar(128),
 DB_COLUMN_PREFIXregistrationKey varchar(32),
 PRIMARY KEY(DB_COLUMN_PREFIXid),
 UNIQUE (DB_COLUMN_PREFIXuserName)
) DB_TABLE_TYPE
/*!40100 DEFAULT CHARACTER SET utf8 */;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PendingUser', 1, 0);

## postgres
# GalleryPendingUser
CREATE TABLE DB_TABLE_PREFIXPendingUser(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXuserName VARCHAR(32) NOT NULL,
 DB_COLUMN_PREFIXfullName VARCHAR(128),
 DB_COLUMN_PREFIXhashedPassword VARCHAR(128),
 DB_COLUMN_PREFIXemail VARCHAR(128),
 DB_COLUMN_PREFIXlanguage VARCHAR(128),
 DB_COLUMN_PREFIXregistrationKey VARCHAR(32)
);

ALTER TABLE DB_TABLE_PREFIXPendingUser ADD PRIMARY KEY (DB_COLUMN_PREFIXid);

CREATE UNIQUE INDEX DB_TABLE_PREFIXPendingUser_16233 ON DB_TABLE_PREFIXPendingUser(DB_COLUMN_PREFIXuserName);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PendingUser', 1, 0);

## oracle
# GalleryPendingUser
CREATE TABLE DB_TABLE_PREFIXPendingUser(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXuserName VARCHAR2(32) NOT NULL,
 DB_COLUMN_PREFIXfullName VARCHAR2(128),
 DB_COLUMN_PREFIXhashedPassword VARCHAR2(128),
 DB_COLUMN_PREFIXemail VARCHAR2(128),
 DB_COLUMN_PREFIXlanguage VARCHAR2(128),
 DB_COLUMN_PREFIXregistrationKey VARCHAR2(32)
);

ALTER TABLE DB_TABLE_PREFIXPendingUser
 ADD PRIMARY KEY (DB_COLUMN_PREFIXid)
 ADD UNIQUE (DB_COLUMN_PREFIXuserName)
;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PendingUser', 1, 0);

## db2
# GalleryPendingUser
CREATE TABLE DB_TABLE_PREFIXPendingUser(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXuserName VARCHAR(32) NOT NULL,
 DB_COLUMN_PREFIXfullName VARCHAR(128),
 DB_COLUMN_PREFIXhashedPassword VARCHAR(128),
 DB_COLUMN_PREFIXemail VARCHAR(128),
 DB_COLUMN_PREFIXlanguage VARCHAR(128),
 DB_COLUMN_PREFIXregistrationKey VARCHAR(32)
);

ALTER TABLE DB_TABLE_PREFIXPendingUser ADD PRIMARY KEY (DB_COLUMN_PREFIXid);

CREATE UNIQUE INDEX DB_TABLE_PREFIXPendi55_16233  
 ON DB_TABLE_PREFIXPendingUser(DB_COLUMN_PREFIXuserName);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PendingUser', 1, 0);

## mssql
# GalleryPendingUser
CREATE TABLE DB_TABLE_PREFIXPendingUser(
 DB_COLUMN_PREFIXid INT NOT NULL,
 DB_COLUMN_PREFIXuserName NVARCHAR(32) NOT NULL,
 DB_COLUMN_PREFIXfullName NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXhashedPassword NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXemail NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXlanguage NVARCHAR(128) NULL,
 DB_COLUMN_PREFIXregistrationKey NVARCHAR(32) NULL
);

ALTER TABLE DB_TABLE_PREFIXPendingUser ADD PRIMARY KEY (DB_COLUMN_PREFIXid);

CREATE UNIQUE INDEX DB_TABLE_PREFIXPendingUser_16233 ON DB_TABLE_PREFIXPendingUser(DB_COLUMN_PREFIXuserName);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PendingUser', 1, 0);

## sqlite
# GalleryPendingUser
CREATE TABLE DB_TABLE_PREFIXPendingUser(
 DB_COLUMN_PREFIXid INTEGER NOT NULL,
 DB_COLUMN_PREFIXuserName TEXT NOT NULL,
 DB_COLUMN_PREFIXfullName TEXT,
 DB_COLUMN_PREFIXhashedPassword TEXT,
 DB_COLUMN_PREFIXemail TEXT,
 DB_COLUMN_PREFIXlanguage TEXT,
 DB_COLUMN_PREFIXregistrationKey TEXT
);

CREATE UNIQUE INDEX DB_TABLE_PREFIXPendingUser_pkey ON DB_TABLE_PREFIXPendingUser(DB_COLUMN_PREFIXid);

CREATE UNIQUE INDEX DB_TABLE_PREFIXPendingUser_16233 ON DB_TABLE_PREFIXPendingUser(DB_COLUMN_PREFIXuserName);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('PendingUser', 1, 0);

