Where should ticks be for a given plot?
====

## How to use
Clone this repository, then run this.

    ghc tick.hs
    ./tick [minimum data value] [maximum data value] [desired tick count]

You can also use the Python version, but it only supports zero as the minimum
data value.

    ./tick.py [max data value] [desired tick count] 

For example, to choose about eight ticks for data whose maximum is 234234.

    ./tick.py 234234 8
    [0.0, 50000.0, 100000.0, 150000.0, 200000.0, 250000.0]

Or if it's 0.8080841

    python2 tick.py 0.8080841 9
    [0.0, 0.1, 0.2, 0.30000000000000004, 0.4, 0.5, 0.6000000000000001, 0.7000000000000001, 0.8]

Here are some more examples.

    for max in $(seq 0 100); do echo -n $max:\  && python2 ./tick.py $max 5; done
    0: [0]
    1: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
    2: [0.0, 0.5, 1.0, 1.5, 2.0]
    3: [0.0, 1.0, 2.0, 3.0]
    4: [0.0, 1.0, 2.0, 3.0, 4.0]
    5: [0.0, 1.0, 2.0, 3.0, 4.0, 5.0]
    6: [0.0, 2.0, 4.0, 6.0]
    7: [0.0, 2.0, 4.0, 6.0, 8.0]
    8: [0.0, 2.0, 4.0, 6.0, 8.0]
    9: [0.0, 2.0, 4.0, 6.0, 8.0]
    10: [0.0, 2.0, 4.0, 6.0, 8.0, 10.0]
    11: [0.0, 2.0, 4.0, 6.0, 8.0, 10.0]
    12: [0.0, 5.0, 10.0, 15.0]
    13: [0.0, 5.0, 10.0, 15.0]
    14: [0.0, 5.0, 10.0, 15.0]
    15: [0.0, 5.0, 10.0, 15.0]
    16: [0.0, 5.0, 10.0, 15.0, 20.0]
    17: [0.0, 5.0, 10.0, 15.0, 20.0]
    18: [0.0, 5.0, 10.0, 15.0, 20.0]
    19: [0.0, 5.0, 10.0, 15.0, 20.0]
    20: [0.0, 5.0, 10.0, 15.0, 20.0]
    21: [0.0, 5.0, 10.0, 15.0, 20.0]
    22: [0.0, 5.0, 10.0, 15.0, 20.0]
    23: [0.0, 5.0, 10.0, 15.0, 20.0]
    24: [0.0, 5.0, 10.0, 15.0, 20.0]
    25: [0.0, 5.0, 10.0, 15.0, 20.0, 25.0]
    26: [0.0, 5.0, 10.0, 15.0, 20.0, 25.0]
    27: [0.0, 5.0, 10.0, 15.0, 20.0, 25.0]
    28: [0.0, 5.0, 10.0, 15.0, 20.0, 25.0]
    29: [0.0, 5.0, 10.0, 15.0, 20.0, 25.0]
    30: [0.0, 10.0, 20.0, 30.0]
    31: [0.0, 10.0, 20.0, 30.0]
    32: [0.0, 10.0, 20.0, 30.0]
    33: [0.0, 10.0, 20.0, 30.0]
    34: [0.0, 10.0, 20.0, 30.0]
    35: [0.0, 10.0, 20.0, 30.0]
    36: [0.0, 10.0, 20.0, 30.0]
    37: [0.0, 10.0, 20.0, 30.0]
    38: [0.0, 10.0, 20.0, 30.0]
    39: [0.0, 10.0, 20.0, 30.0]
    40: [0.0, 10.0, 20.0, 30.0, 40.0]
    41: [0.0, 10.0, 20.0, 30.0, 40.0]
    42: [0.0, 10.0, 20.0, 30.0, 40.0]
    43: [0.0, 10.0, 20.0, 30.0, 40.0]
    44: [0.0, 10.0, 20.0, 30.0, 40.0]
    45: [0.0, 10.0, 20.0, 30.0, 40.0]
    46: [0.0, 10.0, 20.0, 30.0, 40.0]
    47: [0.0, 10.0, 20.0, 30.0, 40.0]
    48: [0.0, 10.0, 20.0, 30.0, 40.0]
    49: [0.0, 10.0, 20.0, 30.0, 40.0]
    50: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    51: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    52: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    53: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    54: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    55: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    56: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    57: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    58: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    59: [0.0, 10.0, 20.0, 30.0, 40.0, 50.0]
    60: [0.0, 20.0, 40.0, 60.0]
    61: [0.0, 20.0, 40.0, 60.0]
    62: [0.0, 20.0, 40.0, 60.0]
    63: [0.0, 20.0, 40.0, 60.0]
    64: [0.0, 20.0, 40.0, 60.0]
    65: [0.0, 20.0, 40.0, 60.0]
    66: [0.0, 20.0, 40.0, 60.0]
    67: [0.0, 20.0, 40.0, 60.0]
    68: [0.0, 20.0, 40.0, 60.0]
    69: [0.0, 20.0, 40.0, 60.0]
    70: [0.0, 20.0, 40.0, 60.0, 80.0]
    71: [0.0, 20.0, 40.0, 60.0, 80.0]
    72: [0.0, 20.0, 40.0, 60.0, 80.0]
    73: [0.0, 20.0, 40.0, 60.0, 80.0]
    74: [0.0, 20.0, 40.0, 60.0, 80.0]
    75: [0.0, 20.0, 40.0, 60.0, 80.0]
    76: [0.0, 20.0, 40.0, 60.0, 80.0]
    77: [0.0, 20.0, 40.0, 60.0, 80.0]
    78: [0.0, 20.0, 40.0, 60.0, 80.0]
    79: [0.0, 20.0, 40.0, 60.0, 80.0]
    80: [0.0, 20.0, 40.0, 60.0, 80.0]
    81: [0.0, 20.0, 40.0, 60.0, 80.0]
    82: [0.0, 20.0, 40.0, 60.0, 80.0]
    83: [0.0, 20.0, 40.0, 60.0, 80.0]
    84: [0.0, 20.0, 40.0, 60.0, 80.0]
    85: [0.0, 20.0, 40.0, 60.0, 80.0]
    86: [0.0, 20.0, 40.0, 60.0, 80.0]
    87: [0.0, 20.0, 40.0, 60.0, 80.0]
    88: [0.0, 20.0, 40.0, 60.0, 80.0]
    89: [0.0, 20.0, 40.0, 60.0, 80.0]
    90: [0.0, 20.0, 40.0, 60.0, 80.0]
    91: [0.0, 20.0, 40.0, 60.0, 80.0]
    92: [0.0, 20.0, 40.0, 60.0, 80.0]
    93: [0.0, 20.0, 40.0, 60.0, 80.0]
    94: [0.0, 20.0, 40.0, 60.0, 80.0]
    95: [0.0, 20.0, 40.0, 60.0, 80.0]
    96: [0.0, 20.0, 40.0, 60.0, 80.0]
    97: [0.0, 20.0, 40.0, 60.0, 80.0]
    98: [0.0, 20.0, 40.0, 60.0, 80.0]
    99: [0.0, 20.0, 40.0, 60.0, 80.0]
    100: [0.0, 20.0, 40.0, 60.0, 80.0, 100.0]

## Brainstorm

Let's start with just knowledge of the maximum value.

### Number bases
Why not just use the maximum value? People are used to special number bases.

* **1s** 1, 2, 3, 4, 5
* **2s** 2, 4, 6, 8, 10
* **5s** 5, 10, 15, 20
* **10s** 10, 20, 30, 40

Hmm these are interesting because 1s are like 10s, just with different
numbers of zeroes, and **2s** * **5s** = **10s**

### How many ticks per plot
Only so many ticks fit on a plot. Maybe 10?

### Maximum value
How can we handle when the maximum value not is convenient? Let's group that
into

1. Add a tick above the maximum value.
2. Don't add a tick above the maximum value.

How far from the maximum value is acceptable? Maybe one tenth of the plot?
One fifth? Maybe it's different depending on whether it's up or down?

### Can we limit the number bases?
The max number dictates the order of magnitude of the ticks, but how do we
choose whether to use **1s**, **2s** or **5s**. Maybe it's fine to always
use **1s**. Hmm what are the extreme situations.

If the max number is 120, counting by **1s** is fine up to 120. But it's
not fine if the max number is 180 or 200. What should we do here? So we
can't limit number bases to just **1s**.

## Idea
First, express the maximum value in scientific notation. Work only with the
part that's not an exponent of ten; add that part back in at the end.

Second, propose a few tick ranges based on the number bases. Choose the one
for which the max tick is close to the maximum data value and for which the
number of tick marks is close to the desired number..

Finally, add the order of magnitude back.

## More ideas
R seems to do this pretty well. Actually, it seems quite similar to mine.
But the algorithm is somewhat mysterious; I wonder how it works.
`plot` calls something equivalent `axTicks`.

	axTicks
	function (side, axp = NULL, usr = NULL, log = NULL, nintLog = NULL) 
	{
		if (!(side <- as.integer(side)) %in% 1L:4L) 
		    stop("'side' must be in {1:4}")
		is.x <- side%%2 == 1
		XY <- function(ch) paste0(if (is.x) 
		    "x"
		else "y", ch)
		if (is.null(axp)) 
		    axp <- par(XY("axp"))
		else if (!is.numeric(axp) || length(axp) != 3) 
		    stop("invalid 'axp'")
		if (is.null(log)) 
		    log <- par(XY("log"))
		else if (!is.logical(log) || any(is.na(log))) 
		    stop("invalid 'log'")
		if (log && axp[3L] > 0) {
		    if (!any((iC <- as.integer(axp[3L])) == 1L:3L)) 
		        stop("invalid positive 'axp[3]'")
		    if (is.null(usr)) 
		        usr <- par("usr")[if (is.x) 
		            1:2
		        else 3:4]
		    else if (!is.numeric(usr) || length(usr) != 2) 
		        stop("invalid 'usr'")
		    if (is.null(nintLog)) 
		        nintLog <- par("lab")[2L - is.x]
		    if (is.finite(nintLog)) {
		        axisTicks(usr, log = log, axp = axp, nint = nintLog)
		    }
		    else {
		        if (needSort <- is.unsorted(usr)) {
		            usr <- usr[2:1]
		            axp <- axp[2:1]
		        }
		        else axp <- axp[1:2]
		        ii <- round(log10(axp))
		        x10 <- 10^((ii[1L] - (iC >= 2L)):ii[2L])
		        r <- switch(iC, x10, c(outer(c(1, 5), x10))[-1L], 
		            c(outer(c(1, 2, 5), x10))[-1L])
		        if (needSort) 
		            r <- rev(r)
		        r[usr[1L] <= log10(r) & log10(r) <= usr[2L]]
		    }
		}
		else {
		    seq.int(axp[1L], axp[2L], length.out = 1L + abs(axp[3L]))
		}
	}
	<bytecode: 0x1699bb0>
	<environment: namespace:graphics>

which calls `axisTicks`

	axisTicks
	function (usr, log, axp = NULL, nint = 5) 
	{
		if (is.null(axp)) 
		    axp <- unlist(.axisPars(usr, log = log, nintLog = nint), 
		        use.names = FALSE)
		.Call(R_CreateAtVector, axp, if (log) 10^usr else usr, nint, 
		    log)
	}
	<bytecode: 0x1f11c20>
	<environment: namespace:grDevices>

which calls `R_CreateAtVector` (in C) and `.axisPars`. `.axisPars` calls
`R_GAxisPars` (in C).

	.axisPars
	function (usr, log = FALSE, nintLog = 5) 
	{
		.Call(R_GAxisPars, usr, log, nintLog)
	}
	<bytecode: 0x1f14620>
	<environment: namespace:grDevices>

Both of these C functions are in
[`axis_scales.c`](https://svn.r-project.org/R/trunk/src/library/grDevices/src/axis_scales.c).

    /*
     *  R : A Computer Language for Statistical Data Analysis
     *  Copyright (C) 2004-11   The R Core Team.
     *
     *  This program is free software; you can redistribute it and/or modify
     *  it under the terms of the GNU General Public License as published by
     *  the Free Software Foundation; either version 2 of the License, or
     *  (at your option) any later version.
     *
     *  This program is distributed in the hope that it will be useful,
     *  but WITHOUT ANY WARRANTY; without even the implied warranty of
     *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
     *  GNU General Public License for more details.
     *
     *  You should have received a copy of the GNU General Public License
     *  along with this program; if not, a copy is available at
     *  http://www.r-project.org/Licenses/
     */

    #ifdef HAVE_CONFIG_H
    #include <config.h>
    #endif
    
    #include <R.h>
    #include <Rinternals.h>
    #include <R_ext/GraphicsEngine.h>
     
    #include "grDevices.h"

    SEXP R_CreateAtVector(SEXP axp, SEXP usr, SEXP nint, SEXP is_log)
    {
        int nint_v = asInteger(nint);
        Rboolean logflag = asLogical(is_log);

        axp = coerceVector(axp, REALSXP);
        usr = coerceVector(usr, REALSXP);
        if(LENGTH(axp) != 3) error(_("'%s' must be numeric of length %d"), "axp", 3);
        if(LENGTH(usr) != 2) error(_("'%s' must be numeric of length %d"), "usr", 2);

        return CreateAtVector(REAL(axp), REAL(usr), nint_v, logflag);
        // -> ../../../main/plot.c
    }

    SEXP R_GAxisPars(SEXP usr, SEXP is_log, SEXP nintLog)
    {
        Rboolean logflag = asLogical(is_log);
        int n = asInteger(nintLog);// will be changed on output ..
        double min, max;
        const char *nms[] = {"axp", "n", ""};
        SEXP axp, ans;

        usr = coerceVector(usr, REALSXP);
        if(LENGTH(usr) != 2) error(_("'%s' must be numeric of length %d"), "usr", 2);
        min = REAL(usr)[0];
        max = REAL(usr)[1];

        GAxisPars(&min, &max, &n, logflag, 0);// axis = 0 :<==> do not warn.. [TODO!]
        // -> ../../../main/graphics.c

        PROTECT(ans = mkNamed(VECSXP, nms));
        SET_VECTOR_ELT(ans, 0, (axp = allocVector(REALSXP, 2)));// protected
        SET_VECTOR_ELT(ans, 1, ScalarInteger(n));
        REAL(axp)[0] = min;
        REAL(axp)[1] = max;

        UNPROTECT(1);
        return ans;
    }

The plotting code is intertwined with the tick decision code, so reading this
is a bit unpleasant. This section of `axTicks` looks like the interesting bit.

    if (needSort <- is.unsorted(usr)) {
        usr <- usr[2:1]
        axp <- axp[2:1]
    }
    else axp <- axp[1:2]
    ii <- round(log10(axp))
    x10 <- 10^((ii[1L] - (iC >= 2L)):ii[2L])
    r <- switch(iC, x10, c(outer(c(1, 5), x10))[-1L], 
        c(outer(c(1, 2, 5), x10))[-1L])
    if (needSort) 
        r <- rev(r)
    r[usr[1L] <= log10(r) & log10(r) <= usr[2L]]

From the `axTicks` documentation,

		 axp: numeric vector of length three, defaulting to ‘par("xaxp")’
		      or ‘par("yaxp")’ depending on the ‘side’ argument
		      (‘par("xaxp")’ if ‘side’ is 1 or 3, ‘par("yaxp")’ if side is
		      2 or 4).

		 usr: numeric vector of length two giving user coordinate limits,
		      defaulting to the relevant portion of ‘par("usr")’
		      (‘par("usr")[1:2]’ or ‘par("usr")[3:4]’ for ‘side’ in (1,3)
		      or (2,4) respectively).

		 log: logical indicating if log coordinates are active; defaults to
		      ‘par("xlog")’ or ‘par("ylog")’ depending on ‘side’.

	 nintLog: (only used when ‘log’ is true): approximate (lower bound for
		      the) number of tick intervals; defaults to ‘par("lab")[j]’
		      where ‘j’ is 1 or 2 depending on ‘side’.  Set this to ‘Inf’
		      if you want the same behavior as in earlier R versions (than
		      2.14.x).

I dunno how `axp` and `usr` interact, but it looks like the function cares more
about `axp`; here's what the `?par` help says.

     ‘xaxp’ A vector of the form ‘c(x1, x2, n)’ giving the coordinates
          of the extreme tick marks and the number of intervals between
          tick-marks when ‘par("xlog")’ is false.  Otherwise, when
          _log_ coordinates are active, the three values have a
          different meaning: For a small range, ‘n’ is _negative_, and
          the ticks are as in the linear case, otherwise, ‘n’ is in
          ‘1:3’, specifying a case number, and ‘x1’ and ‘x2’ are the
          lowest and highest power of 10 inside the user coordinates,
          ‘10 ^ par("usr")[1:2]’. (The ‘"usr"’ coordinates are
          log10-transformed here!)

          n=1 will produce tick marks at 10^j for integer j,

          n=2 gives marks k 10^j with k in {1,5},

          n=3 gives marks k 10^j with k in {1,2,5}.

          See ‘axTicks()’ for a pure R implementation of this.

          This parameter is reset when a user coordinate system is set
          up, for example by starting a new page or by calling
          ‘plot.window’ or setting ‘par("usr")’: ‘n’ is taken from
          ‘par("lab")’.  It affects the default behaviour of subsequent
          calls to ‘axis’ for sides 1 or 3.

That sounds like same algorithm as the one I happened to write.

I don't know where this `iC` comes from, but I think this is the important bit
of the code: First, make sure `axp` is ordered properly. Then separate the order
of magnitude.

    ii <- round(log10(axp))
    x10 <- 10^((ii[1L] - (iC >= 2L)):ii[2L])

It looks like that `iC` variable is the `n` that is referenced in the `par`
documentation. If it's 1, we get the ticks at 10^j (`x10`), if it's 2, we
get the version for k in {1,5}, and if it's 3, we get it for k in {1, 2, 5}.

    r <- switch(iC, x10, c(outer(c(1, 5), x10))[-1L], 
        c(outer(c(1, 2, 5), x10))[-1L])

And then `r` is subset somehow.

    r[usr[1L] <= log10(r) & log10(r) <= usr[2L]]

And then I went to sleep.
