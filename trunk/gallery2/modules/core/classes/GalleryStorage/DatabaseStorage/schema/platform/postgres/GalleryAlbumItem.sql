
    -- This file was automatically generated from an XSL template, which is
    -- why it looks so ugly.  Editing it by hand would be a bad idea.
    --

    CREATE TABLE DB_TABLE_PREFIXGalleryAlbumItem (
  DB_COLUMN_PREFIXid
      INTEGER
    
    NOT NULL
  
    );

  
    CREATE INDEX GalleryAlbumItem_id 
    ON DB_TABLE_PREFIXGalleryAlbumItem
    (DB_COLUMN_PREFIXid);

  

    INSERT INTO DB_TABLE_PREFIXSchema (
      DB_COLUMN_PREFIXname,
      DB_COLUMN_PREFIXmajor,
      DB_COLUMN_PREFIXminor
      ) VALUES (
      'GalleryAlbumItem',
      1,
      0
      );

  