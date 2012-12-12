Where should ticks be for a given plot?
====

## How to use
Clone this repository, then run this.

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
