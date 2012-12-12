#!/usr/bin/env python
import math

def ticks(series, maxvalue, roundfn):
    '''Use the `series` modules to generate a range for the `maxvalue`.
    Use the `roundfn` for rounding.'''
    imaxvalue = int(maxvalue)

    remainder = float(imaxvalue % series)

    # Approximate range aximum
    floor_maxtick = int(imaxvalue - remainder)

    # Adjust by rounding
    adjustment = series * roundfn(remainder / series)

    return range(0, series + int(floor_maxtick + adjustment), series)

def ticks10(series, maxvalue, roundfn):
    '''Run the `ticks` function on the maxvalue times ten, and return the
    returned series times ten.'''
    inflated = ticks(series, maxvalue * 10, roundfn)
    return [i/10 for i in inflated]

if __name__ == '__main__':
    import sys
