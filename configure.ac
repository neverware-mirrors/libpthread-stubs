AC_INIT([libpthread-stubs],
        0.3,
        [xcb@lists.freedesktop.org])
AC_CONFIG_SRCDIR([pthread-stubs.pc.in])
AM_INIT_AUTOMAKE([foreign dist-bzip2])

AC_CONFIG_HEADERS([config.h])

AC_PROG_LIBTOOL
AC_PROG_CC


dnl Detection code for compilers supporting the __attribute__((weak, alias))
dnl feature. Original code present in unieject's repository
dnl Diego Pettenò <flameeyes@gentoo.org>
ac_save_CFLAGS="$CFLAGS"
CFLAGS="$CFLAGS -Werror"
AC_CACHE_CHECK([if compiler supports __attribute__((weak, alias))],
	[cc_cv_attribute_alias],
	[AC_COMPILE_IFELSE([
		void other_function(void *foo) { }
		void some_function(void *foo) __attribute__((weak, alias("other_function")));
		],
		[cc_cv_attribute_alias=yes],
		[cc_cv_attribute_alias=no])
	])
CFLAGS="$ac_save_CFLAGS"
if test "x$cc_cv_attribute_alias" = "xyes"; then
	AC_DEFINE([SUPPORT_ATTRIBUTE_ALIAS], 1, [Define this if the compiler supports the alias attribute])
fi

dnl Grab the list of functions to test for from our template file.
m4_define([funclist], [])
m4_define([alias], [m4_if([$1],[na],[], [m4_append([funclist], [$3 ])])])
m4_divert_push([KILL])
m4_include([list.m4])
m4_divert_pop([KILL])

dnl Check which functions we need to provide aliases for.
PKG_CONFIG_LIBS=
AC_CHECK_FUNCS(funclist, [], [PKG_CONFIG_LIBS='-L${libdir} -lpthread-stubs'])

AC_SUBST([PKG_CONFIG_LIBS])
AM_CONDITIONAL(BUILD_LIB, test "x$PKG_CONFIG_LIBS" != x)

AC_CONFIG_FILES([Makefile pthread-stubs.pc])
AC_OUTPUT
