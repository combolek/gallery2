
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editing it by hand would be a bad idea.
    --

    CREATE TABLE DB_TABLE_PREFIXViewCountMap (
  DB_COLUMN_PREFIXitemId
      INTEGER
    
      ,
    DB_COLUMN_PREFIXviewCount
      INTEGER
    
    );

  
    CREATE UNIQUE INDEX ViewCountMap_itemId 
    ON DB_TABLE_PREFIXViewCountMap
    (DB_COLUMN_PREFIXitemId);

  

    INSERT INTO DB_TABLE_PREFIXSchema (
      DB_COLUMN_PREFIXname,
      DB_COLUMN_PREFIXmajor,
      DB_COLUMN_PREFIXminor
      ) VALUES (
      'ViewCountMap',
      1,
      0
      );

  