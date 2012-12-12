Where should ticks be for a given plot?
====

## How to use
Clone this repository, then run this.

    ./tick.py [max data value] [desired tick count] 

For example, to choose about eight ticks for data whose maximum is 234234.

    ./tick.py 234234 8

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
number of tick marks is closed to the desired number..

Finally, add the order of magnitude back.
