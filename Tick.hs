module Tick
( ticks
, ticks'
, fromDistance
, idealDistance
, prevDistance
, nextDistance
) where
import System.Environment
import Data.List.Split

-- Distances in scientific notation
type Distance = (Float, Int)

-- Function that converts one interval to another interval
type Transformer = Distance -> Distance

-- Given the current tick mark, find the next tick mark.
nextTickAbstract :: Transformer -> Transformer -> Float -> Distance -> Distance
nextTickAbstract fn fn' distance currentTick = fn $ (fn' currentTick) + distance

-- The ideal interval if humans could read weird numbers, given the difference
-- between the highest and lowest data values
idealDistanceAbstract :: Transformer -> Transformer -> Float -> Float -> Int -> Distance
idealDistanceAbstract fn fn' dataMin dataMax nticks = fn $ toDistance $ dataRange / (fromIntegral nticks)
  where
    dataRange = (fn' dataMax) - (fn' dataMin)

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

-- The interval as one number
fromDistance :: Distance -> Float
fromDistance (significand, magnitude) = (significand) * 10 ^^ magnitude

toDistance :: Float -> Distance
toDistance interval = (interval / (10 ^^ magnitude), magnitude)
  where
    magnitude = floor $ logBase 10 interval

intervalFloor :: Distance -> Float -> Float
intervalFloor interval number = i * (fromIntegral (floor ( number / i ))) 
  where i = fromDistance interval

ticks' :: [Float] -> Float -> Float -> Int -> [Float]
ticks' soFar dataMax interval nticks
  | ((last soFar) >= dataMax) && (length soFar > nticks) = tail soFar
  | ((last soFar) >= dataMax) = soFar
  | ((last soFar) + interval > dataMax) && ((length soFar) > nticks) = tail soFar
  | ((last soFar) + interval > dataMax) && ((length soFar) == nticks) = soFar
  | otherwise = ticks' (soFar ++ [((last soFar) + interval)]) dataMax interval nticks

ticks :: Float -> Float -> Int -> [Float]
ticks dataMin dataMax nticks
  | prevError <= nextError = ticks' [start] dataMax prev nticks'
  | otherwise = ticks' [start] dataMax next nticks'
    where
      nticks' = max 2 nticks
      nsteps = nticks' - 1
      ideal = idealDistance (dataMax - dataMin) nsteps
      nsteps' = (fromIntegral nsteps)
      prev = fromDistance $ prevDistance ideal
      next = fromDistance $ nextDistance ideal
      prevError = abs ((prev * nsteps') - dataMax)
      nextError = abs ((next * nsteps') - dataMax)
      start = intervalFloor (prevDistance ideal) dataMin


ticksFromArgs abc = ticks a b c
  where
    a = read (last $ take 1 abc) :: Float
    b = read (last $ take 2 abc) :: Float
    c = read (last $ take 3 abc) :: Int


main = do
  args <- getArgs
  putStrLn $ show $ ticksFromArgs $ take 3 args
