
      DROP INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627;
    
      CREATE INDEX DB_TABLE_PREFIXImageBlockCacheMap_1627
      ON DB_TABLE_PREFIXImageBlockCacheMap
      (DB_COLUMN_PREFIXuserId
	,
      DB_COLUMN_PREFIXitemType);
    

    UPDATE DB_TABLE_PREFIXSchema
      SET DB_COLUMN_PREFIXmajor=1,
	  DB_COLUMN_PREFIXminor=1
      WHERE DB_COLUMN_PREFIXname='ImageBlockCacheMap' AND
	  DB_COLUMN_PREFIXmajor=1 AND
	  DB_COLUMN_PREFIXminor=0;
  