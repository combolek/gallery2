#!/bin/sh
if [ "$1" = ok ]; then
  echo "+=============================================================================+"
  echo "| gallery-contrib has migrated to Subversion; (CVS commit to CVSROOT allowed) |"
  echo "+=============================================================================+"
  exit
fi

echo "*******************************************************************"
echo "* gallery-contrib has migrated to Subversion; CVS commit blocked! *"
echo "*******************************************************************"
exit 1

