#
#	$Id$
#
# Global Makefile
#

ALL_TARGETS=host-local

.include "../../mk/prefs.mk"

SWIFTCFLAGS+=-I/usr/local/include/swiftfsm
LDFLAGS+=-L/usr/local/lib

.include "../../mk/mipal.mk"
