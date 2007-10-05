## mysql
# R_NotificationEvents_1.0
DROP TABLE DB_TABLE_PREFIXNotificationEvents;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationEvents';

# R_NotificationMethods_1.0
DROP TABLE DB_TABLE_PREFIXNotificationMethods;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationMethods';

# R_NotificationSubscriptions_1.0
DROP TABLE DB_TABLE_PREFIXNotificationSubscriptions;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationSubscriptions';

# SubscriptionMap
CREATE TABLE DB_TABLE_PREFIXSubscriptionMap(
 DB_COLUMN_PREFIXuserId int(11) NOT NULL,
 DB_COLUMN_PREFIXitemId int(11) NOT NULL,
 DB_COLUMN_PREFIXnotificationName varchar(128) NOT NULL,
 DB_COLUMN_PREFIXhandlerName varchar(128) NOT NULL,
 INDEX DB_TABLE_PREFIXSubscriptionMap_25141(DB_COLUMN_PREFIXnotificationName),
 INDEX DB_TABLE_PREFIXSubscriptionMap_76924(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemId)
) DB_TABLE_TYPE
/*!40100 DEFAULT CHARACTER SET utf8 */;

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('SubscriptionMap', 1, 0);

## postgres
# R_NotificationEvents_1.0
DROP TABLE DB_TABLE_PREFIXNotificationEvents;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationEvents';

# R_NotificationMethods_1.0
DROP TABLE DB_TABLE_PREFIXNotificationMethods;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationMethods';

# R_NotificationSubscriptions_1.0
DROP TABLE DB_TABLE_PREFIXNotificationSubscriptions;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationSubscriptions';

# SubscriptionMap
CREATE TABLE DB_TABLE_PREFIXSubscriptionMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXnotificationName VARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXhandlerName VARCHAR(128) NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_25141 ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXnotificationName);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_76924 ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('SubscriptionMap', 1, 0);

## oracle
# R_NotificationEvents_1.0
DROP TABLE DB_TABLE_PREFIXNotificationEvents;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationEvents';

# R_NotificationMethods_1.0
DROP TABLE DB_TABLE_PREFIXNotificationMethods;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationMethods';

# R_NotificationSubscriptions_1.0
DROP TABLE DB_TABLE_PREFIXNotificationSubscriptions;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationSubscriptions';

# SubscriptionMap
CREATE TABLE DB_TABLE_PREFIXSubscriptionMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXnotificationName VARCHAR2(128) NOT NULL,
 DB_COLUMN_PREFIXhandlerName VARCHAR2(128) NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_25141
   ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXnotificationName);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_76924
   ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('SubscriptionMap', 1, 0);

## db2
# R_NotificationEvents_1.0
DROP TABLE DB_TABLE_PREFIXNotificationEvents;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationEvents';

# R_NotificationMethods_1.0
DROP TABLE DB_TABLE_PREFIXNotificationMethods;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationMethods';

# R_NotificationSubscriptions_1.0
DROP TABLE DB_TABLE_PREFIXNotificationSubscriptions;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationSubscriptions';

# SubscriptionMap
CREATE TABLE DB_TABLE_PREFIXSubscriptionMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXnotificationName VARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXhandlerName VARCHAR(128) NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXSubsc73_25141
   ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXnotificationName);

CREATE INDEX DB_TABLE_PREFIXSubsc73_76924
   ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('SubscriptionMap', 1, 0);

## mssql
# R_NotificationEvents_1.0
DROP TABLE DB_TABLE_PREFIXNotificationEvents;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationEvents';

# R_NotificationMethods_1.0
DROP TABLE DB_TABLE_PREFIXNotificationMethods;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationMethods';

# R_NotificationSubscriptions_1.0
DROP TABLE DB_TABLE_PREFIXNotificationSubscriptions;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationSubscriptions';

# SubscriptionMap
CREATE TABLE DB_TABLE_PREFIXSubscriptionMap(
 DB_COLUMN_PREFIXuserId INT NOT NULL,
 DB_COLUMN_PREFIXitemId INT NOT NULL,
 DB_COLUMN_PREFIXnotificationName NVARCHAR(128) NOT NULL,
 DB_COLUMN_PREFIXhandlerName NVARCHAR(128) NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_25141 ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXnotificationName);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_76924 ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('SubscriptionMap', 1, 0);

## sqlite
# R_NotificationEvents_1.0
DROP TABLE DB_TABLE_PREFIXNotificationEvents;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationEvents';

# R_NotificationMethods_1.0
DROP TABLE DB_TABLE_PREFIXNotificationMethods;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationMethods';

# R_NotificationSubscriptions_1.0
DROP TABLE DB_TABLE_PREFIXNotificationSubscriptions;

DELETE FROM DB_TABLE_PREFIXSchema WHERE DB_COLUMN_PREFIXname='NotificationSubscriptions';

# SubscriptionMap
CREATE TABLE DB_TABLE_PREFIXSubscriptionMap(
 DB_COLUMN_PREFIXuserId INTEGER NOT NULL,
 DB_COLUMN_PREFIXitemId INTEGER NOT NULL,
 DB_COLUMN_PREFIXnotificationName TEXT NOT NULL,
 DB_COLUMN_PREFIXhandlerName TEXT NOT NULL
);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_25141 ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXnotificationName);

CREATE INDEX DB_TABLE_PREFIXSubscriptionMap_76924 ON DB_TABLE_PREFIXSubscriptionMap(DB_COLUMN_PREFIXuserId, DB_COLUMN_PREFIXitemId);

INSERT INTO DB_TABLE_PREFIXSchema (
 DB_COLUMN_PREFIXname,
 DB_COLUMN_PREFIXmajor,
 DB_COLUMN_PREFIXminor
) VALUES('SubscriptionMap', 1, 0);

