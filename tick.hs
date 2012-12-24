-- The interval in scientific notation
type Interval = (Int, Int)

prevInterval :: Interval -> Interval
prevInterval (significand, magnitude)
  | significand == 5 = (2, magnitude)
  | significand == 2 = (1, magnitude)
  | significand == 1 = (5, magnitude - 1)

nextInterval :: Interval -> Interval
nextInterval (significand, magnitude)
  | significand == 5 = (1, magnitude + 1)
  | significand == 2 = (5, magnitude)
  | significand == 1 = (2, magnitude)

showInterval :: Interval -> Float
showInterval (significand, magnitude) = (fromIntegral significand) * 10 ^^ magnitude

main = do
  putStrLn $ show $ showInterval $ prevInterval (5, 2)
