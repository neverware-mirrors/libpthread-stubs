m4_divert(-1)m4_dnl -*- c -*-
m4_changequote(`[',`]')
m4_changecom()

m4_define([upcase], [m4_translit([$*], [a-z], [A-Z])])

m4_define([alias], [m4_dnl
#ifndef upcase(HAVE_[$3])
#define upcase(NEED_[$1]_STUB)
# ifdef SUPPORT_ATTRIBUTE_ALIAS
[$2] [$3]() __attribute__ ((weak, [alias] ("__pthread_[$1]_stub")));
# else
#  pragma weak [$3] = __pthread_[$1]_stub
# endif
#endif
])

m4_divert(0)m4_dnl
/* Copyright (C) 2006 Diego Pettenò
 * Copyright (C) 2010 M Joonas Pihlaja
 * Inspired by libX11 code copyright (c) 1995 David E. Wexelblat.
 *
 * This is an automatically created file from stubs.c.m4.  Do not edit.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
 */

#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include "config.h"

m4_include([list.m4])

#ifdef NEED_ZERO_STUB
static int __pthread_zero_stub()
{
    return 0;
}
#endif

#ifdef NEED_ABORT_STUB
static int __pthread_abort_stub()
{
    abort();
}
#endif

#ifdef NEED_SELF_STUB
static pthread_t __pthread_self_stub(void)
{
    pthread_t th;

    memset(&th, 0, sizeof (th));
    return th;
}
#endif

#ifdef NEED_EQUAL_STUB
static int __pthread_equal_stub(pthread_t t1, pthread_t t2)
{
    return 1;
}
#endif

#ifdef NEED_EXIT_STUB
static void __pthread_exit_stub(void *ret)
{
    exit(EXIT_SUCCESS);
}
#endif
