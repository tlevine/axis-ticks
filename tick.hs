-- Traverse intervals in scientific notation
type Interval = (Float, Int)

prevInterval :: Interval -> Interval
prevInterval (significand, magnitude)
  | significand > 5 = (5, magnitude)
  | significand > 2 = (2, magnitude)
  | significand > 1 = (1, magnitude)
  | otherwise = (5, magnitude - 1) 

nextInterval :: Interval -> Interval
nextInterval (significand, magnitude)
  | significand < 1 = (1, magnitude)
  | significand < 2 = (2, magnitude)
  | significand < 5 = (5, magnitude)
  | otherwise = (1, magnitude + 1)

-- The interval as one number
showInterval :: Interval -> Float
showInterval (significand, magnitude) = (significand) * 10 ^^ magnitude

-- The ideal interval if humans could read weird numbers, given the difference
-- between the highest and lowest data values
idealInterval :: Float -> Int -> Interval
idealInterval dataRange nticks = (width / (10 ^^ magnitude), magnitude)
  where
    width = dataRange / (fromIntegral nticks)
    magnitude = floor $ logBase 10 width

main = do
  putStrLn $ show $ showInterval $ prevInterval (6, 2)
  putStrLn $ show $ showInterval $ idealInterval 8.1234 4
  putStrLn $ show $ showInterval $ prevInterval $ idealInterval 8.1234 4
  putStrLn $ show $ showInterval $ nextInterval $ idealInterval 8.1234 4
