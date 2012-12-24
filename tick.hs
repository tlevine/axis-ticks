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
fromInterval :: Interval -> Float
fromInterval (significand, magnitude) = (significand) * 10 ^^ magnitude

toInterval :: Float -> Interval
toInterval interval = (interval / (10 ^^ magnitude), magnitude)
  where
    magnitude = floor $ logBase 10 interval

-- The ideal interval if humans could read weird numbers, given the difference
-- between the highest and lowest data values
idealInterval :: Float -> Int -> Interval
idealInterval dataRange nticks = toInterval $ dataRange / (fromIntegral nticks)

-- Assuming dataMin of zero and positive dataMax
ticks' :: [Float] -> Float -> Float -> [Float]
ticks' soFar dataMax interval
  | (last soFar) >= dataMax = soFar
  | otherwise = ticks' (soFar ++ [((last soFar) + interval)]) dataMax interval

ticks :: Float -> Float -> Int -> [Float]
--ticks dataMin dataMax nticks = ticks' [(fromIntegral (floor dataMin))] dataMax (fromInterval prev)
ticks dataMin dataMax nticks = ticks' [dataMin] dataMax (fromInterval next)
  where
    ideal = idealInterval (dataMax - dataMin) nticks
    prev = prevInterval ideal
    next = nextInterval ideal

main = do
  putStrLn $ show $ fromInterval $ prevInterval (6, 2)
  putStrLn $ show $ fromInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ prevInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 324 8
  putStrLn $ show $ ticks' [0] 324 50
  putStrLn $ show $ ticks 0 324 8
