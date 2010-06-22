pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = pthread-stubs.pc

if BUILD_LIB
stubs.c: list.m4 stubs.c.m4
	m4 -P -I $(srcdir) stubs.c.m4 > $@

lib_LTLIBRARIES = libpthread-stubs.la
nodist_libpthread_stubs_la_SOURCES = stubs.c
CLEANFILES = stubs.c
endif
EXTRA_libpthread_stubs_la_SOURCES = stubs.c.m4
