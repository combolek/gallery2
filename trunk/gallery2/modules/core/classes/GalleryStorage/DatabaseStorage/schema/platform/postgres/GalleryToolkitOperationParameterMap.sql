
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editing it by hand would be a bad idea.
    --

    CREATE TABLE DB_TABLE_PREFIXTkOperationParameterMap (
  DB_COLUMN_PREFIXoperationName
      VARCHAR(
      
          128
        
      )
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXposition
      INTEGER
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXtype
      VARCHAR(
      
          128
        
      )
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXdescription
      VARCHAR(
      
          255
        
      )
    
    );

  
    CREATE INDEX TkOperationParameterMap_operationName 
    ON DB_TABLE_PREFIXTkOperationParameterMap
    (DB_COLUMN_PREFIXoperationName);

  

    INSERT INTO DB_TABLE_PREFIXSchema (
      DB_COLUMN_PREFIXname,
      DB_COLUMN_PREFIXmajor,
      DB_COLUMN_PREFIXminor
      ) VALUES (
      'TkOperationParameterMap',
      1,
      0
      );

  