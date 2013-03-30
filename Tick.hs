-- module Tick
-- ( ticks
-- , ticks'
-- , fromDistance
-- , idealDistance
-- , prevDistance
-- , nextDistance
-- ) where

import Notation
import Distance
import Next

ticksAbstract :: Transformer -> Transformer -> Float -> Float -> Int -> [Float]
ticksAbstract fn fn' dataMin dataMax nTicks =
  where
    d  = idealDistanceAbstract fn fn' dataMin dataMax $ max 2 nTicks
    firstTick = prevTickAbstract fn fn' d dataMin

{-
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
-}


ticksFromArgs abc = ticks a b c
  where
    a = read (last $ take 1 abc) :: Float
    b = read (last $ take 2 abc) :: Float
    c = read (last $ take 3 abc) :: Int


main = do
  args <- getArgs
  putStrLn $ show $ ticksFromArgs $ take 3 args
