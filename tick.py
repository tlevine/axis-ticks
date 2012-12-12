#!/usr/bin/env python
import math

def ticks(base, nticks, maxvalue):
    '''Place tick marks given a max tick number.
    The location is termined by an exponent base
    and by the number of ticks.'''
    toptick = round(base ** round(math.log(maxvalue, base)))
    interval = int(toptick / nticks)
    return range(0, int(interval * nticks), interval)

if __name__ == '__main__':
    import sys
    print ticks(*map(float, sys.argv[1:]))
