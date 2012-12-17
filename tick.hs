-- Given a round function, a base to round to, round a sharp value.
snap :: (RealFrac a, Integral b) => (a -> b) -> b -> b -> b
snap direction base sharp = (direction ( (fromIntegral sharp) / (fromIntegral base) ) ) * base

-- Convert a number into a significand and a power of 10.
factor :: (Floating a, RealFrac a) => a-> (a, a)
factor number = (significand, magnitude)
  where
    magnitude = 10 ^ (floor ( logBase 10 number ))
    significand = number / magnitude

main :: IO ()
main = do
  --let foo = snap ceiling 3 7
  let foo = factor 234
  putStrLn $ show foo
