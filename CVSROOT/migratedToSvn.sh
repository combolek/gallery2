#!/bin/sh
if [ "$1" = ok ]; then
  echo "+=====================================================================+"
  echo "| gallery has migrated to Subversion; (CVS commit to CVSROOT allowed) |"
  echo "+=====================================================================+"
  exit
fi

echo "***********************************************************"
echo "* gallery has migrated to Subversion; CVS commit blocked! *"
echo "***********************************************************"
exit 1

