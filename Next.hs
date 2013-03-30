module Next where

import Distance

-- Find the tick mark below the current point.
-- This ONLY WORKS FOR LINEAR scales.
tickFloorLinear :: Distance -> Float -> Float
tickFloorLinear distance number = i * (fromIntegral (floor ( number / i ))) 
  where
    i = fromDistance distance

-- Given the current tick mark, find the next tick mark.
nextTickAbstract :: Transformer -> Transformer -> Distance -> Float -> Distance
nextTickAbstract fn fn' distance currentTick = fn $ (fn' currentTickFloored) + distance
  where
    currentTickFloored = tickFloorLinear distance $ fn currentTick

-- Given the current tick mark, find the previous tick mark.
prevTickAbstract :: Transformer -> Transformer -> Distance -> Float -> Distance
prevTickAbstract fn fn' distance = nextTickAbstract fn fn' (-distance)

-- Inspiration
nextTickPoly power d currentTick = (currentTick ^^ (1 / power) + d) ^^ power

nextTickSqrt      = nextTickPoly (1/2)
nextTickLinear    = nextTickPoly 1
nextTickQuadratic = nextTickPoly 2
nextTickCubic     = nextTickPoly 3

nextTickExp base d currentTick = base ^^ ((logBase base currentTick) + d)
nextTickLog base d currentTick = logBase base ((base ^^ currentTick) + d)
