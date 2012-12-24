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

intervalFloor :: Interval -> Float -> Float
intervalFloor interval number = i * ( fromIntegral (floor ( number * i )))
  where i = fromInterval interval

-- Assuming dataMin of zero and positive dataMax
ticks' :: [Float] -> Float -> Float -> Int -> [Float]
ticks' soFar dataMax interval nticks
  | ((last soFar) >= dataMax) && ((length soFar) > nticks) = tail soFar
  | ((last soFar) + interval > dataMax) && ((length soFar) >= nticks) = soFar
  | otherwise = ticks' (soFar ++ [((last soFar) + interval)]) dataMax interval nticks

ticks :: Float -> Float -> Int -> [Float]
ticks dataMin dataMax nticks
  | prevError <= nextError = ticks' [start] dataMax prev nticks'
  | otherwise = ticks' [start] dataMax next nticks'
    where
      nticks' = max 2 nticks
      nsteps = nticks' - 1
      ideal = idealInterval (dataMax - dataMin) nsteps
      nsteps' = (fromIntegral nsteps)
      prev = fromInterval $ prevInterval ideal
      next = fromInterval $ nextInterval ideal
      prevError = abs ((prev * nsteps') - dataMax)
      nextError = abs ((next * nsteps') - dataMax)
      start = intervalFloor (prevInterval ideal) dataMin

test = do
  putStrLn $ show $ fromInterval $ prevInterval (6, 2)
  putStrLn $ show $ fromInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ prevInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 324 8
  putStrLn $ show $ ticks' [0] 324 50 8

main = do
--putStrLn $ show $ [1..20]
--putStrLn $ show $ fmap (\ x -> length (ticks 0 324 x)) [1..20]
--putStrLn "The sequences:"
--putStrLn $ show $ fmap (ticks 0 324) [1..20]

-- Should be 20
  putStrLn $ show $ intervalFloor (2, 10) 23

  putStrLn $ show $ [1..20]
  putStrLn $ show $ fmap (\ x -> length (ticks 0 324 x)) [1..20]
  putStrLn $ show $ fmap (ticks 0 324) [1..20]

  putStrLn $ show $ fmap (ticks 3 824) [1..10]
