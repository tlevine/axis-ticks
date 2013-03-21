-- module Tick
-- ( ticks
-- , ticks'
-- , fromDistance
-- , idealDistance
-- , prevDistance
-- , nextDistance
-- ) where

-- Distances in scientific notation
type Distance = (Float, Int)

-- Function that converts one distance to another distance
type Transformer = Distance -> Distance

-- Distance converters
fromDistance :: Distance -> Float
fromDistance (significand, magnitude) = (significand) * 10 ^^ magnitude

toDistance :: Float -> Distance
toDistance distance = (distance / (10 ^^ magnitude), magnitude)
  where
    magnitude = floor $ logBase 10 distance

-- Given the current tick mark, find the next tick mark.
nextTickAbstract :: Transformer -> Transformer -> Distance -> Float -> Distance
nextTickAbstract fn fn' distance currentTick = fn $ (fn' currentTick) + distance

-- The ideal distance if humans could read weird numbers, given the difference
-- between the highest and lowest data values
idealDistanceAbstract :: Transformer -> Transformer -> Float -> Float -> Int -> Distance
idealDistanceAbstract fn fn' dataMin dataMax nTicks = fn $ toDistance $ dataRange / (fromIntegral nTicks)
  where
    dataRange = (fn' dataMax) - (fn' dataMin)

nextTickPoly power d currentTick = (currentTick ^^ (1 / power) + d) ^^ power






-- Round distances
prevDistance :: Distance -> Distance
prevDistance (significand, magnitude)
  | significand > 5 = (5, magnitude)
  | significand > 4 = (4, magnitude)
  | significand > 2 = (2, magnitude)
  | significand > 1 = (1, magnitude)
  | otherwise = (5, magnitude - 1) 

nextDistance :: Distance -> Distance
nextDistance (significand, magnitude)
  | significand < 1 = (1, magnitude)
  | significand < 2 = (2, magnitude)
  | significand < 4 = (4, magnitude)
  | significand < 5 = (5, magnitude)
  | otherwise = (1, magnitude + 1)

ticksAbstract :: Transformer -> Transformer -> Float -> Float -> Int -> [Float]
ticksAbstract fn fn' dataMin dataMax nTicks =
  where
    d = idealDistanceAbstract fn fn' dataMin dataMax $ max 2 nTicks
    firstTick = nextTickAbstract fn fn' (nextDistance d) xxx

distanceFloor :: Distance -> Float -> Float
distanceFloor distance number = i * (fromIntegral (floor ( number / i ))) 
  where i = fromDistance distance

ticks' :: [Float] -> Float -> Float -> Int -> [Float]
ticks' soFar dataMax distance nTicks
  | ((last soFar) >= dataMax) && (length soFar > nTicks) = tail soFar
  | ((last soFar) >= dataMax) = soFar
  | ((last soFar) + distance > dataMax) && ((length soFar) > nTicks) = tail soFar
  | ((last soFar) + distance > dataMax) && ((length soFar) == nTicks) = soFar
  | otherwise = ticks' (soFar ++ [((last soFar) + distance)]) dataMax distance nTicks

ticks :: Float -> Float -> Int -> [Float]
ticks dataMin dataMax nTicks
  | prevError <= nextError = ticks' [start] dataMax prev nTicks'
  | otherwise = ticks' [start] dataMax next nTicks'
    where
      nTicks' = max 2 nTicks
      nsteps = nTicks' - 1
      ideal = idealDistance (dataMax - dataMin) nsteps
      nsteps' = (fromIntegral nsteps)
      prev = fromDistance $ prevDistance ideal
      next = fromDistance $ nextDistance ideal
      prevError = abs ((prev * nsteps') - dataMax)
      nextError = abs ((next * nsteps') - dataMax)
      start = distanceFloor (prevDistance ideal) dataMin


ticksFromArgs abc = ticks a b c
  where
    a = read (last $ take 1 abc) :: Float
    b = read (last $ take 2 abc) :: Float
    c = read (last $ take 3 abc) :: Int


main = do
  args <- getArgs
  putStrLn $ show $ ticksFromArgs $ take 3 args
