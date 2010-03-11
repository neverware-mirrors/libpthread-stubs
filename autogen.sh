#! /bin/sh

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

ORIGDIR=`pwd`
cd $srcdir

m4 -P stubs.c.m4 >stubs.c

autoreconf -v --install || exit 1
cd $ORIGDIR || exit $?

$srcdir/configure --enable-maintainer-mode "$@"
