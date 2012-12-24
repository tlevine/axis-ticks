-- Traverse intervals in scientific notation
type Interval = (Float, Int)

prevInterval :: Interval -> Interval
prevInterval (significand, magnitude)
  | significand > 5 = (2, magnitude)
  | significand > 2 = (1, magnitude)
  | significand > 1 = (5, magnitude - 1)

nextInterval :: Interval -> Interval
nextInterval (significand, magnitude)
  | significand > 5 = (1, magnitude + 1)
  | significand > 2 = (5, magnitude)
  | significand > 1 = (2, magnitude)

-- The interval as one number
showInterval :: Interval -> Float
showInterval (significand, magnitude) = (significand) * 10 ^^ magnitude

-- The ideal interval if humans could read weird numbers
idealInterval :: Float -> Interval

main = do
  putStrLn $ show $ showInterval $ prevInterval (5, 2)
