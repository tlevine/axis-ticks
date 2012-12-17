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

main :: IO ()
main = do
  -- let foo = floorBase 3 7
  -- let bar = factor10 234
  --putStrLn $ show bar

  let foo = seqTicks 3 0 23
  putStrLn $ show foo
