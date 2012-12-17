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
ticks' :: (Ord a, Num a) => a -> a -> [a] -> [a]
ticks' interval tickMax ticksSoFar
  | l >= tickMax = ticksSoFar
  | otherwise = ticks' interval tickMax $ ticksSoFar ++ [l + interval]
  where
    l = last ticksSoFar

-- Given an interval, a maximum tick value and a list of ticks, finish the ticks.
ticks :: (Ord a, Num a) => a -> a -> a -> [a]
ticks interval tickMin tickMax = ticks' interval tickMax [tickMin]

main :: IO ()
main = do
  -- let foo = floorBase 3 7
  -- let bar = factor10 234
  --putStrLn $ show bar

  let foo = ticks 3 0 23
  putStrLn $ show foo
