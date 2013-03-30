module Distance where

-- The ideal distance if humans could read weird numbers, given the difference
-- between the highest and lowest data values
idealDistanceAbstract :: Transformer -> Transformer -> Float -> Float -> Int -> Distance
idealDistanceAbstract fn fn' dataMin dataMax nTicks = fn $ toDistance $ dataRange / (fromIntegral nTicks)
  where
    dataRange = (fn' dataMax) - (fn' dataMin)

-- Round, human-readable distances
prevDistance :: Distance -> Distance
prevDistance (significand, magnitude)
  | significand > 5 = (5, magnitude)
  | significand > 4 = (4, magnitude)
  | significand > 2 = (2, magnitude)
  | significand > 1 = (1, magnitude)
  | otherwise = (5, magnitude - 1) 

nextDistance :: Distance -> Distance
nextDistance (significand, magnitude)
  | significand < 1 = (1, magnitude)
  | significand < 2 = (2, magnitude)
  | significand < 4 = (4, magnitude)
  | significand < 5 = (5, magnitude)
  | otherwise = (1, magnitude + 1)
