pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = pthread-stubs.pc

if BUILD_LIB
stubs.c: list.m4 stubs.c.m4
	m4 -P stubs.c.m4 > $@

lib_LTLIBRARIES = libpthread-stubs.la
libpthread_stubs_la_SOURCES = stubs.c
endif
