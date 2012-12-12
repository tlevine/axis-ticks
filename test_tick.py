import nose.tools as n
from tick import *
from math import ceil, floor

def test_1s_round():
    o = ticks(1, 3, round)
    e = [0, 1, 2, 3]
    n.assert_equal(o, e)

def test_2s_floor():
    o = ticks(1, 3, floor)
    e = [0, 2]
    n.assert_equal(o, e)

def test_2s_round():
    o = ticks(2, 3, round)
    e = [0, 2, 4]
    n.assert_equal(o, e)

def test_2s_ceil():
    o = ticks(2, 3, ceil)
    e = [0, 2, 4]
    n.assert_equal(o, e)

def test_5s_floor():
    o = ticks(5, 22, floor)
    e = [0, 5, 10, 15, 20]
    n.assert_equal(o, e)

def test_5s_round():
    o = ticks(5, 22, round)
    e = [0, 5, 10, 15, 20, 25]
    n.assert_equal(o, e)

def test_5s_ceil():
    o = ticks(5, 22, ceil)
    e = [0, 5, 10, 15, 20, 25]
    n.assert_equal(o, e)
