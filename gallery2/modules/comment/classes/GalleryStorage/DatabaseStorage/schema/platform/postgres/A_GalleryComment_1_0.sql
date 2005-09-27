DROP INDEX DB_TABLE_PREFIXComment_95610;

CREATE INDEX DB_TABLE_PREFIXComment_95610 ON DB_TABLE_PREFIXComment(DB_COLUMN_PREFIXdate);

UPDATE DB_TABLE_PREFIXSchema
  SET DB_COLUMN_PREFIXmajor=1, DB_COLUMN_PREFIXminor=1
  WHERE DB_COLUMN_PREFIXname='Comment' AND DB_COLUMN_PREFIXmajor=1 AND DB_COLUMN_PREFIXminor=0;


