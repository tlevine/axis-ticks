-- Given a round function, a base to round to, round a sharp value.
-- snap :: Integral a => (b -> a) -> a -> a -> a
-- snap direction base sharp = (direction ( sharp / base )) * base

snap :: Int -> Int -> Int
snap base sharp = ( ( sharp `div` base )) * base

snapTest :: Int -> Int -> Int
snapTest 3 5 = 6
snapTest 5 6 = 5
snapTest 3 10 = 0
snapTest _ _ = 0

main :: IO ()
main = do
  --putStrLn $ show $ snap ceiling 4 7
  let foo = snap 3 5
  putStrLn $ show foo
