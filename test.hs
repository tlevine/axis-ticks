import Tick
main = do
  putStrLn $ show $ fromInterval $ prevInterval (6, 2)
  putStrLn $ show $ fromInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ prevInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 8.1234 4
  putStrLn $ show $ fromInterval $ nextInterval $ idealInterval 324 8
  putStrLn $ show $ ticks' [0] 324 50 8

