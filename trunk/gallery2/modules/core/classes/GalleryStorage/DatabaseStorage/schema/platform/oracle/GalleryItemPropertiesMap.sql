
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editing it by hand would be a bad idea.
    --

    CREATE TABLE DB_TABLE_PREFIXItemPropertiesMap (
  DB_COLUMN_PREFIXitemId
      INTEGER
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXkey
      VARCHAR2(
      
          128
        
      )
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXvalue
      VARCHAR2(4000)
    
    );

  

    INSERT INTO DB_TABLE_PREFIXSchema (
      DB_COLUMN_PREFIXname,
      DB_COLUMN_PREFIXmajor,
      DB_COLUMN_PREFIXminor
      ) VALUES (
      'ItemPropertiesMap',
      1,
      0
      );

  