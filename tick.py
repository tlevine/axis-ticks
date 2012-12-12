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
    return [float(i)/10 for i in inflated]

def try_many(maxvalue):
    stardardized_maxvalue = maxvalue / 10**math.floor(math.log(maxvalue))
    options = []
    for series in [1, 2, 5]:
        for roundfn in [math.floor, round, math.ceil]:
            options.append(ticks(series, standardized_maxvalue, roundfn))
            options.append(ticks10(series, standardized_maxvalue, roundfn))

    option_maxticks = {option[-1]:option for option in enumerate(options)}
    return option_maxticks[max(option_maxticks.keys())]

if __name__ == '__main__':
    import sys
