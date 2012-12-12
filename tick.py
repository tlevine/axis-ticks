#!/usr/bin/env python
import math

def ticks(base, nticks, maxvalue):
    '''Place tick marks given a max tick number.
    The location is termined by an exponent base
    and by the number of ticks.'''
    toptick = base ** round(math.log(maxvalue, base))
    return range(0, toptick, toptick/5)

if __name__ == '__main__':
    import sys
    ticks(*sys.argv[1:])
