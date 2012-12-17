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

main :: IO ()
main = do
  let foo = floorBase 3 7
  let bar = factor10 234
  putStrLn $ show foo
  putStrLn $ show bar
