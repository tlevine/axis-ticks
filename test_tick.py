import nose.tools as n
from tick import *

def tick_range_1s_round0(maxtick):
    o = tick_range_1s_round0(3.2)
    e = [0]
    n.assert_list_equal(o, e)

    o = tick_range_1s_round0(5.2)
    e = [0, 1]
    n.assert_list_equal(o, e)

def tick_range_1s_round1(maxtick):
    o = tick_range_1s_round1(3.2)
    e = [0, 1, 2, 3]
    n.assert_list_equal(o, e)

def tick_range_2s_round0(maxtick):
    # Treating it as 0.3
    o = tick_range_1s_round0(3.2)
    e = [0, 1, 2, 3]
    n.assert_list_equal(o, e)

def tick_range_2s_round1(maxtick):
    # Treating it as 3
    o = tick_range_1s_round1(3.2)
    e = [0, 1, 2, 3]
    n.assert_list_equal(o, e)
