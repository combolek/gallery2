
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editting it by hand would be a bad idea.  If 
    -- you want to do something productive, fix the style sheet so that it
    -- formats the SQL attractively.
    --

    CREATE TABLE g2_GalleryGroup (
  
    g_id
      int(11)
    
    NOT NULL
  
    ,
  
    g_groupType
      int(11)
    
    ,
  
    g_groupName
      varchar(
      
          32
        
      )
    
    , 
  
    UNIQUE KEY (
    g_groupName
    )
    
    , 
  
    INDEX (
    g_id
    )
    
      ,
    
    INDEX (
    g_groupName
    )
    
    ) TYPE=MyISAM;

    INSERT INTO g2_Schema (
      g_name,
      g_major,
      g_minor
      ) VALUES (
      'GalleryGroup',
      1,
      0
      );

  