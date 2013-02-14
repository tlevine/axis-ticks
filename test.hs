import Tick
import Test.QuickCheck

test1 = do
  putStrLn $ show $ fromInterval $ prevInterval (6, 2)
  putStrLn $ show $ fromInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ prevInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 324 8
  putStrLn $ show $ ticks' [0] 324 50 8

test2 = do
--putStrLn $ show $ [1..20]
--putStrLn $ show $ fmap (\ x -> length (ticks 0 324 x)) [1..20]
--putStrLn "The sequences:"
--putStrLn $ show $ fmap (ticks 0 324) [1..20]

-- Should be 20
--putStrLn $ show $ intervalFloor (2, 1) 23

  putStrLn $ show $ [1..20]
  putStrLn $ show $ fmap (\ x -> length (ticks 3 3824 x)) [1..20]
  putStrLn $ show $ fmap (ticks 3 3824) [1..10]

--putStrLn $ show $ fmap (ticks 2 824) [1..10]


main = do
  quickCheck (\n -> length ((ticks 3 n) [1..100]) == n)
