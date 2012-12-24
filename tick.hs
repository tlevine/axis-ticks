-- The interval in scientific notation
type Interval = (Int, Int)

prevInterval :: Interval -> Interval
prevInterval (significand, magnitude)
  | significand == 5 = (2, magnitude)
  | significand == 2 = (1, magnitude)
  | significand == 1 = (5, magnitude - 1)

main = do
  putStrLn $ show $ prevInterval (5, -3)
