#!/bin/sh
# $Id$
#
#note: requires xgettext version 0.12.1 or greater

echo '# $Id$' > gallery.pot.tmp
cat copyright.txt >> gallery.pot.tmp

xgettext --files-from=filelist -LPHP --keyword=_ --no-wrap --msgid-bugs-address="gallery-translations@lists.sourceforge.net" -o - | tail +7 >> gallery.pot.tmp

diff -I '^"POT-Creation' gallery.pot gallery.pot.tmp > /dev/null || {
	echo "There were changes ..."
	mv gallery.pot.tmp gallery.pot
}
rm gallery.pot.tmp 2>/dev/null
