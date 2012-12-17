-- Given a round function, a base to round to, round a sharp value.
snap :: (RealFrac a, Integral b) => (a -> b) -> b -> b -> b
snap direction base sharp = (direction ( (fromIntegral sharp) / (fromIntegral base) ) ) * base

-- Convert a number into a significand and a power of 10.
factor (Num a, Integral b) => a -> (b, b)
factor _ = (3, 1000)

main :: IO ()
main = do
  --let foo = snap ceiling 3 7
  let foo = factor 234
  putStrLn $ show foo
