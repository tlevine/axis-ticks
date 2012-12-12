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

def _best_option_with_n_ticks(nticks, option_closeness, options):
    for o in sorted(zip(option_closeness, options)):
        if len(o[1]) == nticks:
            return o[1]
    else:
        return None

def try_many(maxvalue, nticks, try_above = True, try_below = True):
    'I take the maximum of the data and the maximum acceptable ticks.'
    magnitude = 10**math.floor(math.log(maxvalue, 10))
    standardized_maxvalue = maxvalue / magnitude
    options = []

    # Generate the options
    for series in [1, 2, 5]:
        for roundfn in [math.floor, round, math.ceil]:
            options.append(ticks(series, standardized_maxvalue, roundfn))
            options.append(ticks10(series, standardized_maxvalue, roundfn))

    # Find the one whose max tick is closest
    option_closeness = [abs(option[-1] - standardized_maxvalue) for option in options]

    # Find the one closest to the desired number of ticks.
    adjustment = 0
    while True:
        up = _best_option_with_n_ticks(nticks + adjustment, option_closeness, options)
        down = _best_option_with_n_ticks(nticks - adjustment, option_closeness, options)
        if try_above and up:
            standardized_best = up
        elif try_below and down:
            standardized_best = down
        else:
            adjustment += 1
            continue
        break

    return [i * magnitude for i in standardized_best]

if __name__ == '__main__':
    import sys
    usage = 'Usage: %s [max data value] [desired tick count]' % sys.argv[0]

    try:
        args = map(float, sys.argv[1:])
    except:
        print(usage)
        exit(1)

    if len(args) != 2:
        print(usage)
        exit(1)

    print(try_many(*args))
