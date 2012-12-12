#!/usr/bin/env python
import math

def tick_range_1s_round1(maxtick):
    top = int(maxtick * 10)
    inflatedrange = range(0, top, 10)
    return [i/10 for i in inflatedrange]

def tick_range_1s_round0(maxtick):
    top = int(maxtick * 10 ** 0)
    inflatedrange = range(0, top, 10)
    return [i/10 for i in inflatedrange]

if __name__ == '__main__':
    import sys
