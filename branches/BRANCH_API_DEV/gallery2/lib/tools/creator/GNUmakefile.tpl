{if $makefileType == 'classes'}
all:
	if [ -d interfaces ]; then cd interfaces && $(MAKE) -$(MAKEFLAGS); fi
	cd GalleryStorage/DatabaseStorage/schema && $(MAKE) -$(MAKEFLAGS)

%:
	if [ -d interfaces ]; then cd interfaces && $(MAKE) -$(MAKEFLAGS) $@; fi
	cd GalleryStorage/DatabaseStorage/schema && $(MAKE) -$(MAKEFLAGS) $@
{else}
include ../../../../../../modules/core/classes/GalleryStorage/DatabaseStorage/schema/GNUmakefile
{/if}


