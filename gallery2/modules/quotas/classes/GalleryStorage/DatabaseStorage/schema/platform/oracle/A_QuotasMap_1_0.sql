ALTER TABLE DB_TABLE_PREFIXQuotasMap
  MODIFY (DB_COLUMN_PREFIXuserOrGroupId INTEGER NOT NULL)
  ADD PRIMARY KEY(DB_COLUMN_PREFIXuserOrGroupId)
;
DROP INDEX DB_TABLE_PREFIXQuotasMap_48775;
UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='QuotasMap' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;

