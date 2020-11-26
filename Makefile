#
#	$Id$
#
# Global Makefile
#

ALL_TARGETS=host-local

.include "../../mk/prefs.mk"

SPECIFIC_CFLAGS=-I${GUNAO_DIR}/posix -I${GUNAO_DIR}/posix/gusimplewhiteboard
SWIFTCFLAGS+=-I/usr/local/include/swiftfsm
LDFLAGS+=-L/usr/local/lib

.include "../../mk/mipal.mk"
