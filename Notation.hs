module Notation ( Distance
                , Transformer
                , fromDistance
                , toDistance
) where



-- This can't be the right way to do it.
-- makeOperator :: (a -> a) -> (Distance -> Distance -> Distance)
-- makeOperator operator = \d1 d2 -> (toDistance $ (fromDistance d1) `operator` (fromDistance d2))

-- Distances in scientific notation
type Distance = (Float, Int)

-- Function that converts one distance to another distance
type Transformer = Distance -> Distance

-- Distance converters
fromDistance :: Distance -> Float
fromDistance (significand, magnitude) = (significand) * 10 ^^ magnitude

toDistance :: Float -> Distance
toDistance distance = (distance / (10 ^^ magnitude), magnitude)
  where
    magnitude = floor $ logBase 10 distance
