
-----------------------------------------------------------------------------
-- item
-----------------------------------------------------------------------------

DROP TABLE [item];


CREATE TABLE [item]
(
	[id] INTEGER  NOT NULL PRIMARY KEY,
	[Name] VARCHAR(45)  NOT NULL,
	[Path] VARCHAR(45)  NOT NULL,
	[hasChildren] INTEGER default 0 NOT NULL,
	[parent_id] INTEGER,
	[isAlbum] INTEGER default 0 NOT NULL
);

-- SQLite does not support foreign keys; this is just for reference
-- FOREIGN KEY ([parent_id]) REFERENCES item ([id])
