
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editing it by hand would be a bad idea.
    --

    CREATE TABLE DB_TABLE_PREFIXToolkitOperationParameterMap (
  DB_COLUMN_PREFIXoperationName
      VARCHAR2(
      
          128
        
      )
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXposition
      INTEGER
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXtype
      VARCHAR2(
      
          128
        
      )
    
    NOT NULL
  
      ,
    DB_COLUMN_PREFIXdescription
      VARCHAR2(
      
          255
        
      )
    
    );

  
    CREATE INDEX ToolkitOperationParameterMap_operationName 
    ON DB_TABLE_PREFIXToolkitOperationParameterMap
    (DB_COLUMN_PREFIXoperationName);

  

    INSERT INTO DB_TABLE_PREFIXSchema (
      DB_COLUMN_PREFIXname,
      DB_COLUMN_PREFIXmajor,
      DB_COLUMN_PREFIXminor
      ) VALUES (
      'ToolkitOperationParameterMap',
      1,
      0
      );

  