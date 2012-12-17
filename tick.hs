-- Given a round function, a base to round to, round a sharp value.
snap :: (RealFrac a, Integral b) => (a -> b) -> b -> b -> b
snap direction base sharp = (direction ( (fromIntegral sharp) / (fromIntegral base) ) ) * base

main :: IO ()
main = do
  let foo = snap ceiling 3 7
  putStrLn $ show foo
