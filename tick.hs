import Control.Applicative

-- Given a round function, a base to round to, round a sharp value.
snap :: (RealFrac a, Integral b) => (a -> b) -> b -> b -> b
snap direction base sharp = (direction ( (fromIntegral sharp) / (fromIntegral base) ) ) * base

-- Convenience functions
floorBase = snap floor
roundBase = snap round
ceilingBase = snap ceiling

-- Convert a number into a significand and a power of 10.
factorBase :: (Floating a, RealFrac a) => a -> a -> (a, a)
factorBase base number = (significand * base, magnitude / base)
  where
    magnitude = 10 ^ (floor ( logBase 10 number ))
    significand = number / magnitude

-- Convenience functions
factor1 = factorBase 1
factor10 = factorBase 10

-- Given an interval, a maximum tick value and a list of ticks, finish the ticks.
seqTicks' :: (Ord a, Num a) => a -> a -> [a] -> [a]
seqTicks' interval tickMax ticksSoFar
  | l >= tickMax = ticksSoFar
  | otherwise = seqTicks' interval tickMax $ ticksSoFar ++ [l + interval]
  where
    l = last ticksSoFar

-- Given an interval, a minimum tick value and a maximum tick value, finish the ticks.
seqTicks :: (Ord a, Num a) => a -> a -> a -> [a]
seqTicks interval tickMin tickMax = seqTicks' interval tickMax [tickMin]

makeTick ::(RealFrac a, Integral b) => b -> b -> (a -> b) -> a -> b
makeTick scale base rounding value = (snap rounding base $ (round significand)) * magnitude
  where
    (significand, magnitude) = factorBase scale value

-- Given the data range, select all of the possible tick ranges.
--rangeOptions :: (Num a) => a -> a -> [(a, a)]
--rangeOptions dataMin dataMax = makeRange <$> [1, 10] <*> [1, 2, 5] <*> [floor, ceiling]
--  where
--    makeRange scale base rounding dataRange = (makeTick' dataMin, makeTick' dataMax)
--      where
--        makeTick' = makeTick scale base rounding


-- Ticks from zero
ticks0 :: (Num a, Integral b) => a -> b -> [a]
ticks0 dataMax nticks = [3]
--where
--  (significand1, magnitude1) = factor1 dataMax
--  (significand10, magnitude10) = factor10 dataMax
--  a = floorBase 1 $ significand1
--  b = floorBase 2 $ significand1
--  c = floorBase 5 $ significand1
--  d = floorBase 1 $ significand10
--  e = floorBase 2 $ significand10
--  f = floorBase 5 $ significand10
--  g = ceilingBase 1 $ significand1
--  h = ceilingBase 2 $ significand1
--  i = ceilingBase 5 $ significand1
--  j = ceilingBase 1 $ significand10
--  k = ceilingBase 2 $ significand10
--  l = ceilingBase 5 $ significand10

-- How far from ideal is the tick mark?
distance dataMin dataMax tickSequence = ((head tickSequence) - dataMin) ^ 2 + ((last tickSequence) - dataMax) ^ 2

main :: IO ()
main = do
  -- let foo = floorBase 3 7
  -- let bar = factor10 234
  --putStrLn $ show bar

  let foo = makeTick 1 2 floor 839
  --let foo = rangeOptions 3.8 58.8
  --putStrLn $ show foo
  putStrLn $ show 3
