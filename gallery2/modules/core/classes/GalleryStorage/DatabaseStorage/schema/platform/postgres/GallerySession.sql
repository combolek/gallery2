
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editing it by hand would be a bad idea.
    --

    CREATE TABLE DB_TABLE_PREFIXSession (
  DB_COLUMN_PREFIXsessionId
      VARCHAR(
      
          128
        
      )
    
      ,
    DB_COLUMN_PREFIXkey
      VARCHAR(
      
          32
        
      )
    
      ,
    DB_COLUMN_PREFIXvalue
      TEXT
    
    );

  
    CREATE INDEX Session_sessionId 
    ON DB_TABLE_PREFIXSession
    (DB_COLUMN_PREFIXsessionId);

  
    CREATE INDEX Session_key 
    ON DB_TABLE_PREFIXSession
    (DB_COLUMN_PREFIXkey);

  

    INSERT INTO DB_TABLE_PREFIXSchema (
      DB_COLUMN_PREFIXname,
      DB_COLUMN_PREFIXmajor,
      DB_COLUMN_PREFIXminor
      ) VALUES (
      'Session',
      1,
      0
      );

  